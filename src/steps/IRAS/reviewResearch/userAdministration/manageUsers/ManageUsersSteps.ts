import { createBdd } from 'playwright-bdd';
import { test } from '../../../../../hooks/CustomFixtures';
import * as fse from 'fs-extra';
import path from 'path';
const pathToTestDataJson =
  './src/resources/test_data/iras/reviewResearch/userAdministration/manageUsers/pages/create_user_profile_page_data.json';

const { When, Then } = createBdd(test);

Then('I can see the Manage users list page', async ({ manageUsersPage }) => {
  //update
  await manageUsersPage.assertOnManageUsersPage();
});

Then(
  'I can see the list is sorted by default in the alphabetical order of the {string}',
  async ({ manageUsersPage }, fieldName: string) => {
    let fieldNameIndex: number = 0;
    if (fieldName === 'First Name') {
      fieldNameIndex = 0;
    }
    await manageUsersPage.checkAlphabeticalSorting(fieldNameIndex);
  }
);

When(
  'I can see the newly created user record should be present in the list for {string} with {string} status in the manage user page',
  async ({ manageUsersPage, createUserProfilePage }, datasetName: string, userStatus: string) => {
    const dataset = createUserProfilePage.createUserProfilePageData.Create_User_Profile[datasetName];
    const userFirstName = dataset.first_name_text;
    const userLastName = dataset.last_name_text;
    const filePath = path.resolve(pathToTestDataJson);
    const data = await fse.readJson(filePath);
    const userEmail = data.Create_User_Profile.email_address_unique;
    await manageUsersPage.findUserProfile(userFirstName, userLastName, userEmail, userStatus);
  }
);
