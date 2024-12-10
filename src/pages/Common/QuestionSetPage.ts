import { expect, Locator, Page } from '@playwright/test';
import * as excel from 'exceljs';
import * as qsetExcelJSONConfigTestData from '../../resources/test_data/iras/question_set/qset_excel_json_config_data.json';
import fs from 'fs';
import ProjectFilterPage from '../IRAS/questionSet/ProjectFilterPage';
import ProjectDetailsPage from '../IRAS/questionSet/ProjectDetailsPage';
import StudentPage from '../IRAS/questionSet/StudentPage';
import DevicesPage from '../IRAS/questionSet/DevicesPage';
import TissuePage from '../IRAS/questionSet/TissuePage';
import AdultsLackingCapacityPage from '../IRAS/questionSet/AdultsLackingCapacityPage';
import ChildrenPage from '../IRAS/questionSet/ChildrenPage';
import BookingPage from '../IRAS/questionSet/BookingPage';

//Declare Page Objects
export default class QuestionSetPage {
  readonly page: Page;
  readonly qsetExcelJSONConfigTestData: typeof qsetExcelJSONConfigTestData;
  readonly qSetFieldNameLabel: Locator;

  //Initialize Page Objects
  constructor(page: Page) {
    this.page = page;
    this.qsetExcelJSONConfigTestData = qsetExcelJSONConfigTestData;

    //Locators
    this.qSetFieldNameLabel = page.locator(
      'label[class="govuk-label govuk-label--s" ], legend[class="govuk-fieldset__legend govuk-fieldset__legend--s" ]'
    );
  }

  //Page Methods
  async storeQSetExcelDataToMemory(sheetName: string, extractingColumnName: string): Promise<JSON> {
    const qSetExcelData: JSON = {} as JSON;
    const excelFilePath = this.qsetExcelJSONConfigTestData.Excel_Properties['file_path'];
    const uniqueIDColumnName = this.qsetExcelJSONConfigTestData.Excel_Properties['qset_unique_id_column_name'];
    const sectionColumnName = this.qsetExcelJSONConfigTestData.Excel_Properties['qset_section_column_name'];
    const columnHeaderIndex = this.qsetExcelJSONConfigTestData.Excel_Properties['qset_column_header_index'];
    const workbook = new excel.Workbook();
    await workbook.xlsx.readFile(excelFilePath).then(function () {
      const worksheet = workbook.getWorksheet(sheetName);
      let uniqueIDColumnIndex: number;
      let sectionColumnIndex: number;
      let extractingColumnIndex: number;
      worksheet?.getRow(columnHeaderIndex).eachCell((cell, colNumber) => {
        if (cell.value === uniqueIDColumnName) {
          uniqueIDColumnIndex = colNumber;
        } else if (cell.value === sectionColumnName) {
          sectionColumnIndex = colNumber;
        } else if (cell.value === extractingColumnName) {
          extractingColumnIndex = colNumber;
        }
      });
      worksheet?.eachRow({ includeEmpty: false }, function (row) {
        if (row.getCell(sectionColumnIndex).value !== 'n/a' && row.getCell(sectionColumnIndex).value !== 'Section') {
          qSetExcelData[row.getCell(sectionColumnIndex).value + '_' + row.getCell(uniqueIDColumnIndex).value] =
            row.getCell(extractingColumnIndex).value;
        }
      });
    });
    return qSetExcelData;
  }

  async getParentNodesQSetJSON(rootNodeCriteria: string): Promise<Map<string, string>> {
    const rootNodeMap = new Map<string, string>();
    if (rootNodeCriteria === 'question set field labels') {
      rootNodeMap.set('jsonParentNode', this.qsetExcelJSONConfigTestData.JSON_Properties['parent_node_field_label']);
    }
    return rootNodeMap;
  }

  async writeExtractedDataFromMemoryToJSON(
    extractedValuesInMemory: JSON,
    testDataJSONPath: string,
    jsonParentNodesMap: Map<string, string>
  ) {
    const jsonRootParentNode: any = jsonParentNodesMap.get('jsonRootParentNode');
    const jsonParentNode: any = jsonParentNodesMap.get('jsonParentNode');
    const createNewJSONObject = () => {
      const newJSONObjectData = {
        [jsonRootParentNode]: {
          [jsonParentNode]: {},
        },
      };
      const firstNode = newJSONObjectData[jsonRootParentNode];
      firstNode[jsonParentNode] = extractedValuesInMemory;
      return newJSONObjectData;
    };
    const writeToJSONFile = (readJSONFile: JSON) => {
      fs.writeFileSync(testDataJSONPath, JSON.stringify(readJSONFile, null, 2));
    };
    if (!fs.existsSync(testDataJSONPath) || fs.statSync(testDataJSONPath).size == 0) {
      fs.writeFileSync(testDataJSONPath, JSON.stringify(createNewJSONObject(), null, 2));
    } else {
      const readJSONFile = await JSON.parse(fs.readFileSync(testDataJSONPath, 'utf8'));
      if (Object.prototype.hasOwnProperty.call(readJSONFile, jsonRootParentNode)) {
        const rootParentNodeValues = readJSONFile[jsonRootParentNode];
        rootParentNodeValues[jsonParentNode] = extractedValuesInMemory;
        writeToJSONFile(readJSONFile);
      } else {
        const newJSONObjectChildData = {
          [jsonParentNode]: extractedValuesInMemory,
        };
        readJSONFile[jsonRootParentNode] = newJSONObjectChildData;
        writeToJSONFile(readJSONFile);
      }
    }
  }

  async seperateQSetDataBySections(extractedValuesInMemory: JSON, sectionsMap: Map<string, string>): Promise<JSON> {
    const sectionBasedJSON: JSON = {} as JSON;
    const extractedDataKeySet: string[] = [];
    const sectionMapKeySet = Array.from(sectionsMap.keys());
    sectionsMap.forEach((sectionsMapValue: string, sectionsMapKey: string) => {
      const keyValueDataJSON: JSON = {} as JSON;
      Object.entries(extractedValuesInMemory).forEach(([jsonKey, jsonValue]) => {
        const sectionName = jsonKey.replace(/_.*/, '');
        const uniqueID = jsonKey.replace(/[^_]*_/, '');
        extractedDataKeySet.push(sectionName);
        if (sectionsMapKey === sectionName) {
          keyValueDataJSON[uniqueID] = jsonValue;
        }
      });
      if (extractedDataKeySet.includes(sectionsMapKey)) {
        sectionBasedJSON[sectionsMapValue] = keyValueDataJSON;
      }
    });
    for await (const extractedDataKey of extractedDataKeySet) {
      expect(sectionMapKeySet).toContainEqual(extractedDataKey);
    }
    return sectionBasedJSON;
  }

  async validateFieldLabelForQSet(pageName: string, jsonPath: string, parentNodesMap: Map<string, string>) {
    const jsonTestData = await JSON.parse(fs.readFileSync(jsonPath, 'utf8'));
    const jsonRootParentNode: any = parentNodesMap.get('jsonRootParentNode');
    const jsonParentNode: any = parentNodesMap.get('jsonParentNode');
    const firstNodeJSONData = jsonTestData[jsonRootParentNode];
    const expectedJSONData = firstNodeJSONData[jsonParentNode];
    for (const jsonKey in expectedJSONData) {
      const sectionLocator = await this.getSectionLocator(pageName, jsonKey);
      const actualValuesLocatorList = await sectionLocator.locator(this.qSetFieldNameLabel).all();
      const actualValuesFromUIArray: string[] = [];
      const expectedValuesArray: string[] = [];
      for (const locator of actualValuesLocatorList) {
        const value: any = await locator.textContent();
        actualValuesFromUIArray.push(value);
      }
      const expectedValueInnerJSON = expectedJSONData[jsonKey];
      for (const expectedValueKey in expectedValueInnerJSON) {
        if (!expectedValueKey.startsWith('IQG')) {
          expectedValuesArray.push(expectedValueInnerJSON[expectedValueKey]);
        }
      }
      expectedValuesArray.forEach((expectedValue: string, index) => {
        const actualValue: string = actualValuesFromUIArray[index];
        expect(actualValue).toContain(expectedValue);
      });
    }
  }

  async getSectionLocator(pageName: string, sectionName: string): Promise<Locator> {
    let sectionLocator: any;
    switch (pageName) {
      case 'project filter': {
        sectionLocator = new ProjectFilterPage(this.page).getQSetSectionLocator(sectionName);
        break;
      }
      case 'project details': {
        sectionLocator = new ProjectDetailsPage(this.page).getQSetSectionLocator(sectionName);
        break;
      }
      case 'student': {
        sectionLocator = new StudentPage(this.page).getQSetSectionLocator(sectionName);
        break;
      }
      case 'devices': {
        sectionLocator = new DevicesPage(this.page).getQSetSectionLocator(sectionName);
        break;
      }
      case 'tissue': {
        sectionLocator = new TissuePage(this.page).getQSetSectionLocator(sectionName);
        break;
      }
      case 'adults lacking capacity': {
        sectionLocator = new AdultsLackingCapacityPage(this.page).getQSetSectionLocator(sectionName);
        break;
      }
      case 'children': {
        sectionLocator = new ChildrenPage(this.page).getQSetSectionLocator(sectionName);
        break;
      }
      case 'booking': {
        sectionLocator = new BookingPage(this.page).getQSetSectionLocator(sectionName);
        break;
      }
      default: {
        throw new Error(`${pageName} is not defined`);
      }
    }
    return sectionLocator;
  }

  async getExcelSheetName(pageName: string): Promise<string> {
    let sheetName: any;
    if (pageName === 'project filter') {
      sheetName = this.qsetExcelJSONConfigTestData.Project_Filter_Page['sheet_name'];
    } else if (pageName === 'project details') {
      sheetName = this.qsetExcelJSONConfigTestData.Project_Details_Page['sheet_name'];
    } else if (pageName === 'student') {
      sheetName = this.qsetExcelJSONConfigTestData.Student['sheet_name'];
    } else if (pageName === 'devices') {
      sheetName = this.qsetExcelJSONConfigTestData.Devices['sheet_name'];
    } else if (pageName === 'tissue') {
      sheetName = this.qsetExcelJSONConfigTestData.Tissue['sheet_name'];
    } else if (pageName === 'adults lacking capacity') {
      sheetName = this.qsetExcelJSONConfigTestData.Adults_Lacking_Page['sheet_name'];
    } else if (pageName === 'children') {
      sheetName = this.qsetExcelJSONConfigTestData.Children['sheet_name'];
    } else if (pageName === 'booking') {
      sheetName = this.qsetExcelJSONConfigTestData.Booking['sheet_name'];
    }
    return sheetName;
  }

  async getQSetSectionNames(pageName: string): Promise<Array<string>> {
    let sectionsMap: any;
    if (pageName === 'project filter') {
      sectionsMap = this.qsetExcelJSONConfigTestData.Project_Filter_Page['sections'];
    } else if (pageName === 'project details') {
      sectionsMap = this.qsetExcelJSONConfigTestData.Project_Details_Page['sections'];
    } else if (pageName === 'student') {
      sectionsMap = this.qsetExcelJSONConfigTestData.Student['sections'];
    } else if (pageName === 'devices') {
      sectionsMap = this.qsetExcelJSONConfigTestData.Devices['sections'];
    } else if (pageName === 'tissue') {
      sectionsMap = this.qsetExcelJSONConfigTestData.Tissue['sections'];
    } else if (pageName === 'adults lacking capacity') {
      sectionsMap = this.qsetExcelJSONConfigTestData.Adults_Lacking_Page['sections'];
    } else if (pageName === 'children') {
      sectionsMap = this.qsetExcelJSONConfigTestData.Children['sections'];
    } else if (pageName === 'booking') {
      sectionsMap = this.qsetExcelJSONConfigTestData.Booking['sections'];
    }
    return sectionsMap;
  }

  async getRootParentNodeNameJSON(pageName: string): Promise<string> {
    let rootParentNode: any;
    if (pageName === 'project filter') {
      rootParentNode = this.qsetExcelJSONConfigTestData.Project_Filter_Page['root_parent_node'];
    } else if (pageName === 'project details') {
      rootParentNode = this.qsetExcelJSONConfigTestData.Project_Details_Page['root_parent_node'];
    } else if (pageName === 'student') {
      rootParentNode = this.qsetExcelJSONConfigTestData.Student['root_parent_node'];
    } else if (pageName === 'devices') {
      rootParentNode = this.qsetExcelJSONConfigTestData.Devices['root_parent_node'];
    } else if (pageName === 'tissue') {
      rootParentNode = this.qsetExcelJSONConfigTestData.Tissue['root_parent_node'];
    } else if (pageName === 'adults lacking capacity') {
      rootParentNode = this.qsetExcelJSONConfigTestData.Adults_Lacking_Page['root_parent_node'];
    } else if (pageName === 'children') {
      rootParentNode = this.qsetExcelJSONConfigTestData.Children['root_parent_node'];
    } else if (pageName === 'booking') {
      rootParentNode = this.qsetExcelJSONConfigTestData.Booking['root_parent_node'];
    }
    return rootParentNode;
  }
}
