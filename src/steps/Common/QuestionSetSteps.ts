import { createBdd } from 'playwright-bdd';
import { test } from '../../hooks/CustomFixtures';
const { Then } = createBdd(test);

Then(
  'I generate the list of expected values to validate {string} for {string}',
  async ({ questionSetPage }, columnToExtract: string, pageName: string) => {
    let columnName: string = '';
    let excelValuesJSON: JSON;
    const sheetName = await questionSetPage.getExcelSheetName(pageName);
    const sectionsMap = new Map<string, string>();
    const sections = await questionSetPage.getQSetSectionNames(pageName);
    const jsonPath = questionSetPage.qsetExcelJSONConfigTestData.JSON_Properties['json_path'];
    const parentNodesJSONMap = await questionSetPage.getParentNodesQSetJSON(columnToExtract);
    const rootParentNode = await questionSetPage.getRootParentNodeNameJSON(pageName);
    parentNodesJSONMap.set('jsonRootParentNode', rootParentNode);
    Object.entries(sections).forEach(([key, value]) => {
      sectionsMap.set(key, value);
    });
    if (columnToExtract === 'question set field labels') {
      columnName = questionSetPage.qsetExcelJSONConfigTestData.Excel_Properties['qset_field_label_column_name'];
    }
    excelValuesJSON = await questionSetPage.storeQSetExcelDataToMemory(sheetName, columnName);
    excelValuesJSON = await questionSetPage.seperateQSetDataBySections(excelValuesJSON, sectionsMap);
    await questionSetPage.writeExtractedDataFromMemoryToJSON(excelValuesJSON, jsonPath, parentNodesJSONMap);
  }
);

Then(
  'I validate the {string} in application are as expected from the values received from excel for {string}',
  async ({ questionSetPage }, criteria: string, pageName: string) => {
    const jsonPath = questionSetPage.qsetExcelJSONConfigTestData.JSON_Properties['json_path'];
    const rootParentNode = await questionSetPage.getRootParentNodeNameJSON(pageName);
    const parentNodesMap = await questionSetPage.getParentNodesQSetJSON(criteria);
    parentNodesMap.set('jsonRootParentNode', rootParentNode);
    await questionSetPage.validateFieldLabelForQSet(pageName, jsonPath, parentNodesMap);
  }
);
