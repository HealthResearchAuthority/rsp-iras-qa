import { createBdd } from 'playwright-bdd';
import { test } from '../../../hooks/CustomFixtures';
const { Then } = createBdd(test);
let testdata_output: any;
let testdata_output_faker: any;
let count: string;
let minLength: string;
let maxLength: string;
Then(
  'I generate {string} test data for {string}',
  async ({ generateUserAttributesPage, questionSetPage }, typeofdata: string, fieldName: string) => {
    const [jsonPath, jsonPath_faker] = generateUserAttributesPage.getJSONpath();
    const [forename_valid, surname_valid, telephone_valid, title_valid, email_valid, pattern_invalid] =
      generateUserAttributesPage.getRegexforFieldsfromJSONconfig(typeofdata, fieldName);

    if (fieldName == 'Email' && typeofdata == 'Valid') {
      count = generateUserAttributesPage.userProfileGeneratedataConfig.valid_data.Email['count'];
      minLength = generateUserAttributesPage.userProfileGeneratedataConfig.valid_data.Email['minLength'];
      maxLength = generateUserAttributesPage.userProfileGeneratedataConfig.valid_data.Email['maxLength'];
      const pattern_valid = email_valid;
      [testdata_output, testdata_output_faker] = generateUserAttributesPage.generateValidData(
        pattern_valid,
        fieldName,
        Number(count),
        Number(minLength),
        Number(maxLength)
      );
    } else if (fieldName == 'Email' && typeofdata == 'Invalid') {
      count = generateUserAttributesPage.userProfileGeneratedataConfig.invalid_data.Email['count'];
      const pattern_valid = email_valid;
      [testdata_output, testdata_output_faker] = generateUserAttributesPage.generateInvalidData(
        pattern_invalid,
        pattern_valid,
        fieldName,
        Number(count)
      );
    } else if (fieldName == 'Forename' && typeofdata == 'Valid') {
      count = generateUserAttributesPage.userProfileGeneratedataConfig.valid_data.Forename['count'];
      minLength = generateUserAttributesPage.userProfileGeneratedataConfig.valid_data.Forename['minLength'];
      maxLength = generateUserAttributesPage.userProfileGeneratedataConfig.valid_data.Forename['maxLength'];
      const pattern_valid = forename_valid;
      [testdata_output, testdata_output_faker] = generateUserAttributesPage.generateValidData(
        pattern_valid,
        fieldName,
        Number(count),
        Number(minLength),
        Number(maxLength)
      );
    } else if (fieldName == 'Forename' && typeofdata == 'Invalid') {
      const pattern_valid = forename_valid;
      [testdata_output, testdata_output_faker] = generateUserAttributesPage.generateInvalidData(
        pattern_invalid,
        pattern_valid,
        fieldName,
        Number(count)
      );
    } else if (fieldName == 'Surname' && typeofdata == 'Valid') {
      count = generateUserAttributesPage.userProfileGeneratedataConfig.valid_data.Surname['count'];
      minLength = generateUserAttributesPage.userProfileGeneratedataConfig.valid_data.Surname['minLength'];
      maxLength = generateUserAttributesPage.userProfileGeneratedataConfig.valid_data.Surname['maxLength'];
      const pattern_valid = surname_valid;
      [testdata_output, testdata_output_faker] = generateUserAttributesPage.generateValidData(
        pattern_valid,
        fieldName,
        Number(count),
        Number(minLength),
        Number(maxLength)
      );
    } else if (fieldName == 'Surname' && typeofdata == 'Invalid') {
      const pattern_valid = surname_valid;
      [testdata_output, testdata_output_faker] = generateUserAttributesPage.generateInvalidData(
        pattern_invalid,
        pattern_valid,
        fieldName,
        Number(count)
      );
    } else if (fieldName == 'Telephone' && typeofdata == 'Valid') {
      count = generateUserAttributesPage.userProfileGeneratedataConfig.valid_data.Telephone['count'];
      minLength = generateUserAttributesPage.userProfileGeneratedataConfig.valid_data.Telephone['minLength'];
      maxLength = generateUserAttributesPage.userProfileGeneratedataConfig.valid_data.Telephone['maxLength'];
      const pattern_valid = telephone_valid;
      [testdata_output, testdata_output_faker] = generateUserAttributesPage.generateValidData(
        pattern_valid,
        fieldName,
        Number(count),
        Number(minLength),
        Number(maxLength)
      );
    } else if (fieldName == 'Telephone' && typeofdata == 'Invalid') {
      const pattern_valid = telephone_valid;
      [testdata_output, testdata_output_faker] = generateUserAttributesPage.generateInvalidData(
        pattern_invalid,
        pattern_valid,
        fieldName,
        Number(count)
      );
    } else if (fieldName == 'Title' && typeofdata == 'Valid') {
      count = generateUserAttributesPage.userProfileGeneratedataConfig.valid_data.Title['count'];
      minLength = generateUserAttributesPage.userProfileGeneratedataConfig.valid_data.Title['minLength'];
      maxLength = generateUserAttributesPage.userProfileGeneratedataConfig.valid_data.Title['maxLength'];
      const pattern_valid = title_valid;
      [testdata_output, testdata_output_faker] = generateUserAttributesPage.generateValidData(
        pattern_valid,
        fieldName,
        Number(count),
        Number(minLength),
        Number(maxLength)
      );
    } else if (fieldName == 'Title' && typeofdata == 'Invalid') {
      const pattern_valid = title_valid;
      [testdata_output, testdata_output_faker] = generateUserAttributesPage.generateInvalidData(
        pattern_invalid,
        pattern_valid,
        fieldName,
        Number(count)
      );
    }
    const parentNodesJSONMap = new Map<string, string>();
    parentNodesJSONMap.set('jsonRootParentNode', fieldName);
    parentNodesJSONMap.set('jsonParentNode', typeofdata);
    await questionSetPage.writeExtractedDataFromMemoryToJSON(testdata_output, jsonPath, parentNodesJSONMap);
    await questionSetPage.writeExtractedDataFromMemoryToJSON(testdata_output_faker, jsonPath_faker, parentNodesJSONMap);
  }
);
