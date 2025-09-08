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
          await createUserProfilePage.setUniqueEmail(uniqueEmail);
          const filePath = path.resolve(pathToTestDataJson);
          await createUserProfilePage.updateUniqueEmailTestDataJson(filePath, uniqueEmail);
          const locator: Locator = createUserProfilePage[key];
          await locator.fill(uniqueEmail);
        } else if (key === 'review_body_checkbox') {
          await commonItemsPage.selectCheckboxUserProfileReviewBody(dataset, createUserProfilePage);
        } else {
          await commonItemsPage.fillUIComponent(dataset, key, createUserProfilePage);
        }
      }
    }
  }
);

When(
  'I fill the new user profile page using {string} for field validation',
  async ({ createUserProfilePage, commonItemsPage, userListReviewBodyPage }, datasetName: string) => {
    const dataset = createUserProfilePage.createUserProfilePageTestData.Create_User_Profile[datasetName];
    const isDuplicateEmail = datasetName.startsWith('Duplicate_Email_');
    for (const key in dataset) {
      if (Object.prototype.hasOwnProperty.call(dataset, key)) {
        if (isDuplicateEmail && key === 'email_address_text') {
          const locator = createUserProfilePage[key];
          const [email] = await userListReviewBodyPage.getUserEmail();
          const searchKey = await userListReviewBodyPage.getSearchKey();
          const uniqueEmail = await createUserProfilePage.getUniqueEmail();
          const valueToFill = email || searchKey || uniqueEmail;
          if (valueToFill) {
            await locator.fill(valueToFill);
          }
        } else if (key === 'review_body_checkbox') {
          await commonItemsPage.selectCheckboxUserProfileReviewBody(dataset, createUserProfilePage);
        } else {
          await commonItemsPage.fillUIComponent(dataset, key, createUserProfilePage);
        }
      }
    }
  }
);

Then(
  'I clear the previously entered values on the add a new user profile page for {string} when the role is selected as applicant or system administrator',
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
  'I uncheck the previously selected checkboxes on the add a new user profile page for {string} for the role is selected as study-wide reviewer or team manager or workflow co-ordinator',
  async ({ createUserProfilePage, commonItemsPage, editUserProfilePage }, datasetName: string) => {
    const dataset = createUserProfilePage.createUserProfilePageTestData.Create_User_Profile[datasetName];
    const selectedCheckboxCount = (await editUserProfilePage.getCheckedCheckboxLabels()).length;
    if (
      dataset['role_checkbox'].includes('Study-wide reviewer') ||
      dataset['role_checkbox'].includes('Team manager') ||
      dataset['role_checkbox'].includes('Workflow co-ordinator') ||
      selectedCheckboxCount > 0
    ) {
      await commonItemsPage.clearCheckboxesUserProfile(dataset, 'country_checkbox', createUserProfilePage);
      await commonItemsPage.clearCheckboxesUserProfile(dataset, 'review_body_checkbox', createUserProfilePage);
      await commonItemsPage.clearCheckboxesUserProfile(dataset, 'role_checkbox', createUserProfilePage);
    }
  }
);

Then(
  'I clear the previously entered values on the add a new user profile page for {string} for {string}',
  async ({ createUserProfilePage, commonItemsPage }, datasetName: string, datasetValName: string) => {
    const dataset = createUserProfilePage.createUserProfilePageTestData.Create_User_Profile[datasetName];
    if (datasetValName === 'Role_TM_SWR_WFC') {
      for (const key in dataset) {
        if (key !== 'country_checkbox' && key !== 'review_body_checkbox') {
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
    let fieldValActual: string | boolean;
    for (const key in dataset) {
      if (Object.prototype.hasOwnProperty.call(dataset, key)) {
        if (key === 'review_body_checkbox') {
          fieldValActual = await createUserProfilePage.getSelectedCheckboxCreateUserReviewBody(
            dataset,
            createUserProfilePage
          );
        } else {
          fieldValActual = await createUserProfilePage.getSelectedValuesCreateUser(dataset, key, createUserProfilePage);
        }
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
  'the {string} should not be available on the add a new user profile page',
  async ({ createUserProfilePage }, removedLink: string) => {
    const labelKey = removedLink.replace(/(_Dropdown|_Checkbox)$/, '_label').toLowerCase();
    const labelToCheck = createUserProfilePage[labelKey];
    if (labelToCheck) {
      await expect(labelToCheck).not.toBeVisible();
    } else {
      throw new Error(`${labelKey} is not a valid locator on the createUserProfilePage object`);
    }
  }
);

Then(
  'I retrieve the list of review bodies displayed in the add a new user profile page',
  async ({ createUserProfilePage, commonItemsPage }) => {
    const actualList = await commonItemsPage.getLabelsFromCheckboxes(createUserProfilePage.review_body_checkbox);
    await createUserProfilePage.setReviewBodies(actualList);
  }
);

Then(
  'I can see the review body field in the add a new user profile page should contain all currently enabled review bodies from the manage review bodies page',
  async ({ createUserProfilePage, manageReviewBodiesPage }) => {
    const actualList = await createUserProfilePage.getReviewBodies();
    const expectedList = await manageReviewBodiesPage.getOrgNamesListFromUI();
    const count = expectedList.length;
    expect(actualList.slice(0, count)).toEqual(expectedList);
  }
);

Then(
  'I can see the role dropdown on the add a new user profile page contains the expected roles in alphabetical order',
  async ({ createUserProfilePage, commonItemsPage }) => {
    const expectedList = createUserProfilePage.createUserProfilePageTestData.Create_User_Profile_Page['role_checkbox'];
    const actualList = await commonItemsPage.getLabelsFromCheckboxes(createUserProfilePage.role_checkbox);
    expect(actualList).toEqual(expectedList);
  }
);

Then(
  'I can see the country checkbox on the add a new user profile page contains the expected countries in alphabetical order',
  async ({ createUserProfilePage, commonItemsPage }) => {
    const expectedList =
      createUserProfilePage.createUserProfilePageTestData.Create_User_Profile_Page['country_checkbox'];
    const actualList = await commonItemsPage.getLabelsFromCheckboxes(createUserProfilePage.country_checkbox);
    expect(actualList).toEqual(expectedList);
  }
);

Then(
  'the {string} should be available on the add a new user profile page',
  async ({ createUserProfilePage }, removedLink: string) => {
    const labelKey = removedLink.replace(/(_Dropdown|_Checkbox)$/, '_label').toLowerCase();
    const labelToCheck = createUserProfilePage[labelKey];
    if (labelToCheck) {
      await expect(labelToCheck).toBeVisible();
    }
  }
);
