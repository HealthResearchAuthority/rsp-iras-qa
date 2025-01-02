import { createBdd } from 'playwright-bdd';
import { test } from '../../../hooks/CustomFixtures';
const { Then } = createBdd(test);
let testdata_output: any;
let testdata_output_faker: any;

Then(
  'I generate {string} test data for {string}',
  async ({ generateUserAttributesPage, questionSetPage }, typeofdata: string, fieldName: string) => {
    const [jsonPath, jsonPath_faker] = generateUserAttributesPage.getJSONpath();
    const [forename_valid, surname_valid, telephone_valid, title_valid, email_valid, pattern_invalid] =
      generateUserAttributesPage.getRegexforFieldsfromJSONconfig(typeofdata, fieldName);
    [testdata_output, testdata_output_faker] = generateUserAttributesPage.generateTestDataEmail(
      email_valid,
      fieldName,
      typeofdata,
      pattern_invalid
    );
    [testdata_output, testdata_output_faker] = generateUserAttributesPage.generateTestDataForename(
      forename_valid,
      fieldName,
      typeofdata,
      pattern_invalid
    );
    [testdata_output, testdata_output_faker] = generateUserAttributesPage.generateTestDataSurname(
      surname_valid,
      fieldName,
      typeofdata,
      pattern_invalid
    );
    [testdata_output, testdata_output_faker] = generateUserAttributesPage.generateTestDataTelephone(
      telephone_valid,
      fieldName,
      typeofdata,
      pattern_invalid
    );
    [testdata_output, testdata_output_faker] = generateUserAttributesPage.generateTestDataTitle(
      title_valid,
      fieldName,
      typeofdata,
      pattern_invalid
    );
    const parentNodesJSONMap = new Map<string, string>();
    parentNodesJSONMap.set('jsonRootParentNode', fieldName);
    parentNodesJSONMap.set('jsonParentNode', typeofdata);
    await questionSetPage.writeExtractedDataFromMemoryToJSON(testdata_output, jsonPath, parentNodesJSONMap);
    await questionSetPage.writeExtractedDataFromMemoryToJSON(testdata_output_faker, jsonPath_faker, parentNodesJSONMap);
  }
);
