import { createBdd } from 'playwright-bdd';
import { test } from '../../../../../hooks/CustomFixtures';

const { When, Then } = createBdd(test);

Then('I can see the Manage users list page', async ({ manageUsersPage }) => {
  //update
  await manageUsersPage.assertOnManageUsersPage();
});

Then(
  'I can see the list is sorted by default in the alphabetical order of the {string}',
  async ({ manageUsersPage }, fieldName: string) => {
    //update
    // const dataset = createUserProfilePage.createUserProfilePageData.Create_User_Profile[datasetName];
    let fieldNameIndex: number = 0;
    if (fieldName === 'First Name') {
      fieldNameIndex = 0;
    }
    await manageUsersPage.checkAlphabeticalSorting(fieldNameIndex);
  }
);

When(
  'I can see the newly created user record should be present in the list for {string} with {string} status in the manage user page',
  async ({ manageUsersPage, editUserProfilePage }, datasetName: string, userStatus: string) => {
    const dataset = editUserProfilePage.editUserProfilePageData[datasetName];
    const userFirstName = dataset.first_name_text;
    const userLastName = dataset.last_name_text;
    const userEmail = dataset.email_address_text;
    await manageUsersPage.findUserProfile(userFirstName, userLastName, userEmail, userStatus);
  }
);
