import { createBdd } from 'playwright-bdd';
import { test } from '../../../../../hooks/CustomFixtures';

const { Then } = createBdd(test);

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
