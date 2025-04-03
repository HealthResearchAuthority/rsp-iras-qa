import { createBdd } from 'playwright-bdd';
import { test } from '../../../../../hooks/CustomFixtures';

const { Then, When } = createBdd(test);

Then('I can see the view user profile details page', async ({ userProfilePage }) => {
  await userProfilePage.assertOnUserProfilePage();
});

Then(
  'I can see the {string} ui labels on the user profile page',
  async ({ commonItemsPage, userProfilePage }, datasetName: string) => {
    const dataset = userProfilePage.userProfilePageData[datasetName];
    for (const key in dataset) {
      if (Object.prototype.hasOwnProperty.call(dataset, key)) {
        await commonItemsPage.validateUILabels(dataset, key, userProfilePage);
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
