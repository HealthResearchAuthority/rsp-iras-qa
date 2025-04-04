import { createBdd } from 'playwright-bdd';
import { expect, test } from '../../../../../hooks/CustomFixtures';

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
        const labelValue = await commonItemsPage.getUiLabel(dataset, key, userProfilePage);
        expect(labelValue).toBe(dataset[key]);
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
