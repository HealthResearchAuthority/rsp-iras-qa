import { createBdd } from 'playwright-bdd';
import { test } from '../../../../../hooks/CustomFixtures';
import path from 'path';
const pathToTestDataJson =
  './src/resources/test_data/iras/reviewResearch/userAdministration/manageUsers/pages/create_user_profile_page_data.json';

const { When, Then } = createBdd(test);

When(
  'I fill the new user profile page using {string}',
  async ({ createUserProfilePage, commonItemsPage }, datasetName: string) => {
    const dataset = createUserProfilePage.createUserProfilePageData.Create_User_Profile[datasetName];
    let uniqueEmail: any;
    for (const key in dataset) {
      if (Object.prototype.hasOwnProperty.call(dataset, key)) {
        if (key === 'email_address_text') {
          const prefix = createUserProfilePage.createUserProfilePageData.Create_User_Profile.email_address_prefix;
          uniqueEmail = await commonItemsPage.generateUniqueEmail(dataset[key], prefix);
          dataset[key] = uniqueEmail;
          const filePath = path.resolve(pathToTestDataJson);
          await commonItemsPage.updateUniqueEmailTestDataJson(filePath, uniqueEmail);
        }
        await commonItemsPage.fillUIComponent(dataset, key, createUserProfilePage);
      }
    }
  }
);

Then(
  'I clear the previously entered values on the add a new user profile page for {string}',
  async ({ createUserProfilePage, commonItemsPage }, datasetName: string) => {
    const dataset = createUserProfilePage.createUserProfilePageData.Create_User_Profile[datasetName];
    for (const key in dataset) {
      if (Object.prototype.hasOwnProperty.call(dataset, key)) {
        await commonItemsPage.clearUIComponent(dataset, key, createUserProfilePage);
      }
    }
  }
);

Then('I can see the add a new user profile page', async ({ createUserProfilePage }) => {
  //update
  await createUserProfilePage.assertOnCreateUserProfilePage();
});

Then(
  'I can see previously filled values in the new user profile page for {string} displayed on the add a new user profile page',
  async ({ commonItemsPage, createUserProfilePage }, datasetName: string) => {
    const dataset = createUserProfilePage.createUserProfilePageData.Create_User_Profile[datasetName];
    for (const key in dataset) {
      if (Object.prototype.hasOwnProperty.call(dataset, key)) {
        await commonItemsPage.validateSelectedValuesCreateUser(dataset, key, createUserProfilePage);
      }
    }
  }
);

Then(
  'I can see the {string} ui labels on the add a new user profile page for {string}',
  async ({ commonItemsPage, createUserProfilePage }, datasetName: string, datasetValName: string) => {
    const datasetVal = createUserProfilePage.createUserProfilePageData.Create_User_Profile[datasetValName];
    if (datasetValName === 'Role_Operations') {
      for (const key in datasetVal) {
        await commonItemsPage.fillUIComponent(datasetVal, key, createUserProfilePage);
      }
    }
    const dataset = createUserProfilePage.createUserProfilePageData.Create_User_Profile[datasetName];
    for (const key in dataset) {
      if (Object.prototype.hasOwnProperty.call(dataset, key)) {
        await commonItemsPage.validateUILabels(dataset, key, createUserProfilePage);
      }
    }
  }
);

Then(
  'I validate {string} displayed on create user profile page for {string}',
  async (
    { commonItemsPage, createUserProfilePage },
    errorMessageFieldDatasetName: string,
    invalidFieldsDatasetName: string
  ) => {
    const errorMessageFieldDataset = createUserProfilePage.createUserProfilePageData[errorMessageFieldDatasetName];
    const invalidFieldsDataset = createUserProfilePage.createUserProfilePageData[invalidFieldsDatasetName];
    for (const key in invalidFieldsDataset) {
      if (Object.prototype.hasOwnProperty.call(invalidFieldsDataset, key)) {
        await commonItemsPage.validateFieldErrorMessage(errorMessageFieldDataset, key, createUserProfilePage);
      }
    }
  }
);
