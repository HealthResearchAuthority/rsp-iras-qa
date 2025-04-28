import { createBdd } from 'playwright-bdd';
import { expect, test } from '../../../../../hooks/CustomFixtures';
import path from 'path';
import { Locator } from 'playwright/test';
import { generateUniqueEmail, returnDataFromJSON } from '../../../../../utils/UtilFunctions';
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
  'I clear the previously entered values on the add a new user profile page for {string} for role is not selected as operations',
  async ({ createUserProfilePage, commonItemsPage }, datasetName: string) => {
    const dataset = createUserProfilePage.createUserProfilePageTestData.Create_User_Profile[datasetName];
    for (const key in dataset) {
      if (Object.prototype.hasOwnProperty.call(dataset, key)) {
        await commonItemsPage.clearUIComponent(dataset, key, createUserProfilePage);
      }
    }
  }
);

Then(
  'I uncheck the previously selected checkboxes on the add a new user profile page for {string} for the role is selected as operations',
  async ({ createUserProfilePage, commonItemsPage }, datasetName: string) => {
    const dataset = createUserProfilePage.createUserProfilePageTestData.Create_User_Profile[datasetName];
    for (const key in dataset) {
      if (key === 'country_checkbox' || key === 'access_required_checkbox') {
        if (Object.prototype.hasOwnProperty.call(dataset, key)) {
          await commonItemsPage.clearUIComponent(dataset, key, createUserProfilePage);
        }
      }
    }
  }
);

Then(
  'I clear the previously entered values on the add a new user profile page for {string} for {string}',
  async ({ createUserProfilePage, commonItemsPage }, datasetName: string, datasetValName: string) => {
    const dataset = createUserProfilePage.createUserProfilePageTestData.Create_User_Profile[datasetName];
    if (datasetValName === 'Role_Operations') {
      for (const key in dataset) {
        if (key !== 'country_checkbox' && key !== 'access_required_checkbox') {
          if (Object.prototype.hasOwnProperty.call(dataset, key)) {
            await commonItemsPage.clearUIComponent(dataset, key, createUserProfilePage);
          }
        }
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
            const data = await returnDataFromJSON();
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
  'I validate {string} displayed on create user profile page',
  async ({ commonItemsPage, createUserProfilePage }, errorMessageFieldAndSummaryDatasetName: string) => {
    const errorMessageFieldDataset =
      createUserProfilePage.createUserProfilePageTestData[errorMessageFieldAndSummaryDatasetName];
    await expect(commonItemsPage.errorMessageSummaryLabel).toBeVisible();
    const allSummaryErrorExpectedValues = Object.values(errorMessageFieldDataset);
    const summaryErrorActualValues = await commonItemsPage.getSummaryErrorMessages();
    expect(summaryErrorActualValues).toEqual(allSummaryErrorExpectedValues);
    for (const key in errorMessageFieldDataset) {
      if (Object.prototype.hasOwnProperty.call(errorMessageFieldDataset, key)) {
        const fieldErrorMessagesActualValues = await commonItemsPage.getFieldErrorMessages(key, createUserProfilePage);
        expect(fieldErrorMessagesActualValues).toEqual(errorMessageFieldDataset[key]);
        const element = await commonItemsPage.checkViewport(errorMessageFieldDataset, key, createUserProfilePage);
        expect(element).toBeInViewport();
      }
    }
  }
);
