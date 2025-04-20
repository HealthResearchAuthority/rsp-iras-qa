import { createBdd } from 'playwright-bdd';
import { expect, test } from '../../../../../hooks/CustomFixtures';
import * as fse from 'fs-extra';
import path from 'path';
const pathToTestDataJson =
  './src/resources/test_data/iras/reviewResearch/userAdministration/manageUsers/create_user_profile_page_data.json';

const { When, Then } = createBdd(test);

Then(
  'I can see the list is sorted by default in the alphabetical order of the {string}',
  async ({ manageUsersPage }, sortField: string) => {
    let actualList: string[];
    switch (sortField.toLowerCase()) {
      case 'first name':
        actualList = await manageUsersPage.getFirstNamesListFromUI();
        break;
      default:
        throw new Error(`${sortField} is not a valid option`);
    }
    const sortedList = [...actualList].sort((a, b) => a.localeCompare(b, 'en', { sensitivity: 'base' }));
    expect(actualList).toEqual(sortedList);
  }
);

When(
  'I update user profile {string} on {string}',
  async ({ commonItemsPage, editUserProfilePage }, datasetName: string) => {
    const dataset = editUserProfilePage.editUserProfilePageTestData[datasetName];
    for (const key in dataset) {
      if (Object.prototype.hasOwnProperty.call(dataset, key)) {
        await commonItemsPage.fillUIComponent(dataset, key, editUserProfilePage);
      }
    }
  }
);

When(
  'I can see the newly created user record should be present in the list for {string} with {string} status in the manage user page',
  async ({ manageUsersPage, createUserProfilePage }, datasetName: string, userStatus: string) => {
    //this step should be updated to explicitly search for the record using the search functionality is developed
    const dataset = createUserProfilePage.createUserProfilePageTestData.Create_User_Profile[datasetName];
    const userFirstName = dataset.first_name_text;
    const userLastName = dataset.last_name_text;
    const filePath = path.resolve(pathToTestDataJson);
    const data = await fse.readJson(filePath);
    const userEmail = data.Create_User_Profile.email_address_unique;
    await manageUsersPage.goto(manageUsersPage.manageUsersPageTestData.Manage_Users_Page.enlarged_page_size);
    const foundRecords = await manageUsersPage.findUserProfile(userFirstName, userLastName, userEmail, userStatus);
    expect(foundRecords).toBeDefined();
    expect(foundRecords).toHaveCount(1);
  }
);

When(
  'I search and click on view edit link for existing {string} user with {string} status from the manage user page',
  async ({ manageUsersPage }, datasetName: string, userStatus: string) => {
    const dataset = manageUsersPage.manageUsersPageTestData[datasetName];
    const userFirstName = dataset.first_name_text;
    const userLastName = dataset.last_name_text;
    const userEmail = dataset.email_address_text;
    await manageUsersPage.goto(manageUsersPage.manageUsersPageTestData.Manage_Users_Page.enlarged_page_size);
    //change searchAndClick to findUserProfile, test and then remove searchAndClick method
    // await manageUsersPage.searchAndClickUserProfile(userFirstName, userLastName, userEmail, userStatus);
    const foundRecord = await manageUsersPage.findUserProfile(userFirstName, userLastName, userEmail, userStatus);
    await foundRecord.locator(manageUsersPage.view_edit_link).click();
  }
);

When(
  'I search and click on view edit link for unique {string} user with {string} status from the manage user page',
  async ({ manageUsersPage, createUserProfilePage }, datasetName: string, userStatus: string) => {
    const dataset = createUserProfilePage.createUserProfilePageTestData.Create_User_Profile[datasetName];
    const userFirstName = dataset.first_name_text;
    const userLastName = dataset.last_name_text;
    const filePath = path.resolve(pathToTestDataJson);
    const data = await fse.readJson(filePath);
    const userEmail = data.Create_User_Profile.email_address_unique;
    await manageUsersPage.goto(manageUsersPage.manageUsersPageTestData.Manage_Users_Page.enlarged_page_size);
    //change searchAndClick to findUserProfile, test and then remove searchAndClick
    // await manageUsersPage.searchAndClickUserProfile(userFirstName, userLastName, userEmail, userStatus);
    const foundRecord = await manageUsersPage.findUserProfile(userFirstName, userLastName, userEmail, userStatus);
    await foundRecord.locator(manageUsersPage.view_edit_link).click();
  }
);

Then(
  'I can see the {string} ui labels on the manage users list page',
  async ({ commonItemsPage, manageUsersPage }, datasetName: string) => {
    const dataset = manageUsersPage.manageUsersPageTestData.Manage_Users_Page[datasetName];
    for (const key in dataset) {
      if (Object.prototype.hasOwnProperty.call(dataset, key)) {
        const labelVal = await commonItemsPage.getUiLabel(key, manageUsersPage);
        expect(labelVal).toBe(dataset[key]);
      }
    }
  }
);

Then(
  'I select a {string} User to View and Edit which is {string}',
  async ({ manageUsersPage }, userNamePrefix: string, status: string) => {
    let statusText: string;
    if (status.toLowerCase() == 'active') {
      statusText = manageUsersPage.manageUsersPageTestData.Manage_Users_Page.enabled_status;
    } else {
      statusText = manageUsersPage.manageUsersPageTestData.Manage_Users_Page.disabled_status;
    }
    await manageUsersPage.goto(manageUsersPage.manageUsersPageTestData.Manage_Users_Page.enlarged_page_size);
    const selectedReviewBodyRow = await manageUsersPage.getRowByUserNameStatus(userNamePrefix, false, statusText);
    await selectedReviewBodyRow.locator(manageUsersPage.view_edit_link).click();
  }
);
