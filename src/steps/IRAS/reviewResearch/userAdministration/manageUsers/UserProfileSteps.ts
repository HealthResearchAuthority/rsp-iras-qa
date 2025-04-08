import { createBdd } from 'playwright-bdd';
import { test } from '../../../../../hooks/CustomFixtures';

const { Then, When } = createBdd(test);

Then('I can see the view user profile details page', async ({ userProfilePage }) => {
  await userProfilePage.assertOnUserProfilePage();
});

Then(
  'I can see the user profile {string} is updated in user profile page',
  async ({ commonItemsPage, editUserProfilePage, userProfilePage }, datasetName: string) => {
    const dataset = editUserProfilePage.editUserProfilePageTestData[datasetName];
    for (const key in dataset) {
      if (Object.prototype.hasOwnProperty.call(dataset, key)) {
        await commonItemsPage.validateUIComponentValues(dataset, key, userProfilePage);
      }
    }
  }
);

When(
  'I click the {string} change link for {string} on the user profile page',
  async ({ userProfilePage }, editUserFieldName: string, userRole: string) => {
    await userProfilePage.clickOnChangeUserProfileDetails(editUserFieldName, userRole);
  }
);

Then('I can see the user profile page', async ({ userProfilePage }) => {
  await userProfilePage.assertOnUserProfilePage();
});
