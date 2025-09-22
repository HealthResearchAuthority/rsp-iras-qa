import { expect, Locator, Page } from '@playwright/test';
import * as excel from 'exceljs';
import * as qsetExcelJSONConfigTestData from '../../resources/test_data/iras/question_set/qset_excel_json_config_data.json';
import * as fs from 'node:fs';
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
  readonly radioCheckboxLabel: string;

  //Initialize Page Objects
  constructor(page: Page) {
    this.page = page;
    this.qsetExcelJSONConfigTestData = qsetExcelJSONConfigTestData;

    //Locators
    this.qSetFieldNameLabel = page.locator(
      'label[class="govuk-label govuk-label--s" ], legend[class="govuk-fieldset__legend govuk-fieldset__legend--s" ]'
    );
    this.radioCheckboxLabel = "//label[contains(@for,'%s')]";
  }

  //Page Methods
  async storeQSetExcelDataToMemory(sheetName: string, columnToExtract: string): Promise<JSON> {
    let qSetExcelData: JSON = {} as JSON;
    let columnName: string = '';
    const sectionNameSet = new Set<string>();
    const excelFilePath = this.qsetExcelJSONConfigTestData.Excel_Properties['file_path'];
    const uniqueIDColumnName = this.qsetExcelJSONConfigTestData.Excel_Properties['qset_unique_id_column_name'];
    const sectionColumnName = this.qsetExcelJSONConfigTestData.Excel_Properties['qset_section_column_name'];
    const columnHeaderIndex = this.qsetExcelJSONConfigTestData.Excel_Properties['qset_column_header_index'];
    const questionNumberColumnName = this.qsetExcelJSONConfigTestData.Excel_Properties['question_number_column_name'];
    const uiDisplaySequenceColumnName =
      this.qsetExcelJSONConfigTestData.Excel_Properties['ui_display_sequence_column_name'];
    if (columnToExtract === 'question set field labels') {
      columnName = this.qsetExcelJSONConfigTestData.Excel_Properties['qset_field_label_column_name'];
    } else if (columnToExtract === 'radio and checkbox labels') {
      columnName = this.qsetExcelJSONConfigTestData.Excel_Properties['qset_radio_checkbox_label_column_name'];
    }
    const workbook = new excel.Workbook();
    await workbook.xlsx.readFile(excelFilePath).then(function () {
      const worksheet = workbook.getWorksheet(sheetName);
      let uniqueIDColumnIndex: number;
      let sectionColumnIndex: number;
      let extractingColumnIndex: number;
      let questionNumberColumnIndex: number;
      let uiDisplaySequenceColumnIndex: number;
      worksheet?.getRow(columnHeaderIndex).eachCell((cell, colNumber) => {
        if (cell.value === uniqueIDColumnName) {
          uniqueIDColumnIndex = colNumber;
        } else if (cell.value === sectionColumnName) {
          sectionColumnIndex = colNumber;
        } else if (cell.value === columnName) {
          extractingColumnIndex = colNumber;
        } else if (cell.value === questionNumberColumnName) {
          questionNumberColumnIndex = colNumber;
        } else if (cell.value === uiDisplaySequenceColumnName) {
          uiDisplaySequenceColumnIndex = colNumber;
        }
      });
      worksheet?.eachRow({ includeEmpty: false }, function (row) {
        if (row.getCell(sectionColumnIndex).value !== 'n/a' && row.getCell(sectionColumnIndex).value !== 'Section') {
          if (
            columnToExtract === 'question set field labels' &&
            row.getCell(questionNumberColumnIndex).value !== 'n/a'
          ) {
            qSetExcelData[row.getCell(sectionColumnIndex).value + '_' + row.getCell(uniqueIDColumnIndex).value] =
              row.getCell(questionNumberColumnIndex).value + '. ' + row.getCell(extractingColumnIndex).value;
          } else {
            qSetExcelData[row.getCell(sectionColumnIndex).value + '_' + row.getCell(uniqueIDColumnIndex).value] =
              row.getCell(extractingColumnIndex).value;
          }
        }
      });
      if (columnToExtract === 'question set field labels') {
        const orderedQSetExcelData: JSON = {} as JSON;
        Object.entries(qSetExcelData).forEach(([jsonKey]) => {
          const sectionName = jsonKey.replace(/_.*/, '');
          sectionNameSet.add(sectionName);
        });
        sectionNameSet.forEach(function (value) {
          let uiDisplaySequenceDataMap = new Map<string, number>();
          worksheet?.eachRow({ includeEmpty: false }, function (row) {
            if (
              row.getCell(sectionColumnIndex).value === value &&
              row.getCell(sectionColumnIndex).value !== 'n/a' &&
              row.getCell(sectionColumnIndex).value !== 'Section'
            ) {
              uiDisplaySequenceDataMap.set(
                row.getCell(sectionColumnIndex).value + '_' + row.getCell(uniqueIDColumnIndex).value,
                Number(row.getCell(uiDisplaySequenceColumnIndex).value)
              );
            }
          });
          uiDisplaySequenceDataMap = new Map([...uiDisplaySequenceDataMap.entries()].sort((a, b) => a[1] - b[1]));
          uiDisplaySequenceDataMap.forEach((value: number, key: string) => {
            orderedQSetExcelData[key] = qSetExcelData[key];
          });
        });
        qSetExcelData = orderedQSetExcelData;
      }
    });
    return qSetExcelData;
  }

  async getParentNodesQSetJSON(rootNodeCriteria: string): Promise<Map<string, string>> {
    const rootNodeMap = new Map<string, string>();
    if (rootNodeCriteria === 'question set field labels') {
      rootNodeMap.set('jsonParentNode', this.qsetExcelJSONConfigTestData.JSON_Properties['parent_node_field_label']);
    } else if (rootNodeCriteria === 'radio and checkbox labels') {
      rootNodeMap.set(
        'jsonParentNode',
        this.qsetExcelJSONConfigTestData.JSON_Properties['parent_node_radio_checkbox_label']
      );
    }
    return rootNodeMap;
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

  async getRadioCheckboxLabelsToMemory(extractedValuesInMemory: JSON): Promise<JSON> {
    const excelFilePath = qsetExcelJSONConfigTestData.Excel_Properties['file_path'];
    const optionSheetName = qsetExcelJSONConfigTestData.Excel_Properties['option_label_sheet_name'];
    const optionIDColumnName = qsetExcelJSONConfigTestData.Excel_Properties['option_id_column_name'];
    const optionTextColumnName = qsetExcelJSONConfigTestData.Excel_Properties['option_text_column_name'];
    const columnHeaderIndex = this.qsetExcelJSONConfigTestData.Excel_Properties['qset_column_header_index'];
    const workbook = new excel.Workbook();
    for (const sectionKey in extractedValuesInMemory) {
      const radioCheckboxValueMap = extractedValuesInMemory[sectionKey];
      for (const radioCheckboxKey in radioCheckboxValueMap) {
        const radioCheckboxValue = radioCheckboxValueMap[radioCheckboxKey];
        if (
          radioCheckboxValue !== null &&
          radioCheckboxValue !== 'Text' &&
          radioCheckboxValue !== 'Date' &&
          radioCheckboxValue !== 'n/a' &&
          radioCheckboxValue !== 'Email'
        ) {
          const radioValuesKeyArray = radioCheckboxValue.split(',');
          await workbook.xlsx.readFile(excelFilePath).then(function () {
            const worksheet = workbook.getWorksheet(optionSheetName);
            let optionIDColumnIndex: number;
            let optionTextColumnIndex: number;
            worksheet?.getRow(columnHeaderIndex).eachCell((cell: excel.Cell, colNumber: number) => {
              if (cell.value === optionIDColumnName) {
                optionIDColumnIndex = colNumber;
              } else if (cell.value === optionTextColumnName) {
                optionTextColumnIndex = colNumber;
              }
            });
            const radioCheckboxValueArray: any[] = [];
            for (const radioCheckboxKey in radioValuesKeyArray) {
              worksheet?.eachRow({ includeEmpty: false }, function (row: excel.Row) {
                if (row.getCell(optionIDColumnIndex).value === radioValuesKeyArray[radioCheckboxKey]) {
                  radioCheckboxValueArray.push(row.getCell(optionTextColumnIndex).value);
                }
              });
            }
            radioCheckboxValueMap[radioCheckboxKey] = radioCheckboxValueArray;
          });
        }
      }
    }
    return extractedValuesInMemory;
  }

  async validateRadioCheckboxLabelForQSet(pageName: string, jsonPath: string, parentNodesMap: Map<string, string>) {
    const jsonTestData = await JSON.parse(fs.readFileSync(jsonPath, 'utf8'));
    const jsonRootParentNode: any = parentNodesMap.get('jsonRootParentNode');
    const jsonParentNode: any = parentNodesMap.get('jsonParentNode');
    const firstNodeJSONData = jsonTestData[jsonRootParentNode];
    const expectedJSONData = firstNodeJSONData[jsonParentNode];
    for (const jsonSectionKey in expectedJSONData) {
      const expectedValueInnerJSON = expectedJSONData[jsonSectionKey];
      for (const expectedValueKey in expectedValueInnerJSON) {
        if (
          expectedValueInnerJSON[expectedValueKey] !== null &&
          expectedValueInnerJSON[expectedValueKey] !== 'Text' &&
          expectedValueInnerJSON[expectedValueKey] !== 'Date' &&
          expectedValueInnerJSON[expectedValueKey] !== 'n/a' &&
          expectedValueInnerJSON[expectedValueKey] !== 'Email'
        ) {
          const radioCheckboxLocator: Locator = this.page.locator(
            this.radioCheckboxLabel.replace('%s', expectedValueKey)
          );
          const actualValuesLocatorList = await radioCheckboxLocator.all();
          const actualValuesFromUIArray: string[] = [];
          for (const locator of actualValuesLocatorList) {
            const value: any = await locator.textContent();
            actualValuesFromUIArray.push(value);
          }
          const expectedValuesArray = expectedValueInnerJSON[expectedValueKey];
          expectedValuesArray.forEach((expectedValue: string, index: number) => {
            const actualValue: string = actualValuesFromUIArray[index];
            expect(actualValue).toContain(expectedValue);
          });
        }
      }
    }
  }
}
