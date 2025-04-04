import { createBdd } from 'playwright-bdd';
import { expect, test } from '../../../../../hooks/CustomFixtures';
import path from 'path';
import * as fse from 'fs-extra';
import { Locator } from 'playwright';
import { generateUniqueEmail } from '../../../../../utils/UtilFunctions';
const pathToTestDataJson =
  './src/resources/test_data/iras/reviewResearch/userAdministration/manageUsers/create_user_profile_page_data.json';

const { When, Then } = createBdd(test);

When(
  'I fill the new user profile page using {string}',
  async ({ createUserProfilePage, commonItemsPage }, datasetName: string) => {
    const dataset = createUserProfilePage.createUserProfilePageTestData.Create_User_Profile[datasetName];
    for (const key in dataset) {
      if (Object.prototype.hasOwnProperty.call(dataset, key)) {
        if (key === 'email_address_text') {
          const prefix = createUserProfilePage.createUserProfilePageTestData.Create_User_Profile.email_address_prefix;
          const uniqueEmail = await generateUniqueEmail(dataset[key], prefix);
          const filePath = path.resolve(pathToTestDataJson);
          await createUserProfilePage.updateUniqueEmailTestDataJson(filePath, uniqueEmail);
          const locator: Locator = createUserProfilePage[key];
          await locator.fill(uniqueEmail);
        } else {
          await commonItemsPage.fillUIComponent(dataset, key, createUserProfilePage);
        }
      }
    }
  }
);

When(
  'I fill the new user profile page using {string} for field validation',
  async ({ createUserProfilePage, commonItemsPage }, datasetName: string) => {
    const dataset = createUserProfilePage.createUserProfilePageTestData.Create_User_Profile[datasetName];
    for (const key in dataset) {
      if (Object.prototype.hasOwnProperty.call(dataset, key)) {
        await commonItemsPage.fillUIComponent(dataset, key, createUserProfilePage);
      }
    }
  }
);

Then(
  'I clear the previously entered values on the add a new user profile page for {string}',
  async ({ createUserProfilePage, commonItemsPage }, datasetName: string) => {
    const dataset = createUserProfilePage.createUserProfilePageTestData.Create_User_Profile[datasetName];
    for (const key in dataset) {
      if (Object.prototype.hasOwnProperty.call(dataset, key)) {
        await commonItemsPage.clearUIComponent(dataset, key, createUserProfilePage);
      }
    }
  }
);

Then('I can see the add a new user profile page', async ({ createUserProfilePage }) => {
  await createUserProfilePage.assertOnCreateUserProfilePage();
});

Then(
  'I can see previously filled values in the new user profile page for {string} displayed on the add a new user profile page',
  async ({ createUserProfilePage }, datasetName: string) => {
    const dataset = createUserProfilePage.createUserProfilePageTestData.Create_User_Profile[datasetName];
    for (const key in dataset) {
      if (Object.prototype.hasOwnProperty.call(dataset, key)) {
        const fieldValActual: string | boolean = await createUserProfilePage.getSelectedValuesCreateUser(
          dataset,
          key,
          createUserProfilePage
        );
        if (typeof fieldValActual == 'string') {
          if (key === 'email_address_text') {
            const filePath = path.resolve(pathToTestDataJson);
            const data = await fse.readJson(filePath);
            expect(fieldValActual).toBe(data.Create_User_Profile.email_address_unique);
          } else {
            expect(fieldValActual).toBe(dataset[key]);
          }
        } else if (typeof fieldValActual == 'boolean') {
          expect(fieldValActual).toBeTruthy();
        }
      }
    }
  }
);

Then(
  'I can see the {string} ui labels on the add a new user profile page for {string}',
  async ({ commonItemsPage, createUserProfilePage }, datasetName: string, datasetValName: string) => {
    const datasetVal = createUserProfilePage.createUserProfilePageTestData.Create_User_Profile[datasetValName];
    const dataset = createUserProfilePage.createUserProfilePageTestData.Create_User_Profile[datasetName];
    if (datasetValName === 'Role_Operations') {
      for (const key in datasetVal) {
        await commonItemsPage.fillUIComponent(datasetVal, key, createUserProfilePage);
      }
      for (const key in dataset) {
        if (Object.prototype.hasOwnProperty.call(dataset, key)) {
          const labelVal = await commonItemsPage.getUiLabel(dataset, key, createUserProfilePage);
          expect(labelVal).toBe(dataset[key]);
        }
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
    const errorMessageFieldDataset = createUserProfilePage.createUserProfilePageTestData[errorMessageFieldDatasetName];
    const invalidFieldsDataset =
      createUserProfilePage.createUserProfilePageTestData.Create_User_Profile[invalidFieldsDatasetName];
    for (const key in invalidFieldsDataset) {
      if (Object.prototype.hasOwnProperty.call(invalidFieldsDataset, key)) {
        const locatorVal: Locator = await commonItemsPage.getFieldErrorMessage(
          errorMessageFieldDataset,
          key,
          createUserProfilePage
        );
        await expect(locatorVal).toHaveText(errorMessageFieldDataset[key]);
      }
    }
  }
);
