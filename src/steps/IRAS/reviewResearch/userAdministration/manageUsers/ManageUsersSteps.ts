import { createBdd } from 'playwright-bdd';
import { test } from '../../../../../hooks/CustomFixtures';

const { Then, When } = createBdd(test);

Then('I can see the Manage users list page', async ({ manageUsersPage }) => {
  //update
  await manageUsersPage.assertOnManageUsersPage();
});
Then(
  'I can see the list is sorted by default in the alphabetical order of the First Name and I can see the newly created user record should be present in the list for {string}',
  async ({ manageUsersPage, createUserProfilePage }, datasetName: string) => {
    //update
    const dataset = createUserProfilePage.createUserProfilePageData.Create_User_Profile[datasetName];
    await manageUsersPage.checkAlphabeticalSorting(dataset);
  }
);

Then('I can see the view user profile details page for {string} user', async ({ userProfilePage }, userStatus) => {
  //update
  await userProfilePage.assertOnUserProfilePage(userStatus);
});

When(
  'I search and click on View_edit link for {string} user with {string} status from the manage user page',
  async ({ manageUsersPage, editUserProfilePage }, datasetName: string, userStatus: string) => {
    const dataset = editUserProfilePage.editUserProfilePageData[datasetName];
    const userFirstName = dataset.first_name_text;
    const userLastName = dataset.last_name_text;
    const userEmail = dataset.email_address_text;
    await manageUsersPage.findUserProfile(userFirstName, userLastName, userEmail, userStatus);
  }
);

When(
  'I click the {string} change link for {string} on the user profile page',
  async ({ userProfilePage }, editUserFieldName: string, userRole: string) => {
    await userProfilePage.clickOnChangeUserProfileDetails(editUserFieldName, userRole);
  }
);

// When('I can see the edit user profile page', async ({ editUserProfilePage }) => {
//   await editUserProfilePage.assertOnEditUserProfilePage;
// });

//I update user profile '<Edit_User_Profile_Fields>' on 'Edit_User_Profile_Page'

When(
  'I update user profile {string} on {string}',
  async ({ commonItemsPage, editUserProfilePage }, datasetName: string) => {
    const dataset = editUserProfilePage.editUserProfilePageData[datasetName];
    for (const key in dataset) {
      if (Object.prototype.hasOwnProperty.call(dataset, key)) {
        await commonItemsPage.fillUIComponent(dataset, key, editUserProfilePage);
      }
    }
  }
);

Then(
  'I can see the user profile {string} is updated in user profile page',
  async ({ commonItemsPage, editUserProfilePage, userProfilePage }, datasetName: string) => {
    const dataset = editUserProfilePage.editUserProfilePageData[datasetName];
    for (const key in dataset) {
      if (Object.prototype.hasOwnProperty.call(dataset, key)) {
        await commonItemsPage.validateUIComponentValues(dataset, key, userProfilePage);
      }
    }
  }
);
