import { createBdd } from 'playwright-bdd';
import { test } from '../../../../../hooks/CustomFixtures';
const { Then, When } = createBdd(test);

Then('I can see the Manage users list page', async ({ manageUsersPage }) => {
  await manageUsersPage.assertOnManageUsersPage();
});

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

When(
  'I search and click on view edit link for {string} user with {string} status from the manage user page',
  async ({ manageUsersPage }, datasetName: string, userStatus: string) => {
    const dataset = manageUsersPage.manageUsersPageData[datasetName];
    const userFirstName = dataset.first_name_text;
    const userLastName = dataset.last_name_text;
    const userEmail = dataset.email_address_text;
    await manageUsersPage.searchAndClickUserProfile(userFirstName, userLastName, userEmail, userStatus);
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
