import { createBdd } from 'playwright-bdd';
import { test, expect } from '../../../../../hooks/CustomFixtures';

const { Then, When } = createBdd(test);

Then('I can see the view user profile details page', async ({ userProfilePage }) => {
  await userProfilePage.assertOnUserProfilePage();
});

Then(
  'I can see the user profile {string} is updated with the edited data {string}',
  async ({ userProfilePage, editUserProfilePage }, editFieldName: string, datesetName: string) => {
    const dataset = editUserProfilePage.editUserProfilePageTestData[datesetName];
    const actualValue = await userProfilePage.getUserProfileValue(editFieldName);
    const expectedValue = dataset[editFieldName];
    expect(actualValue?.trim()).toBe(expectedValue);
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
