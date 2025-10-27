import { createBdd } from 'playwright-bdd';
import { test, expect } from '../../../../hooks/CustomFixtures';

const { Given, When, Then } = createBdd(test);

Given(
  'I can see the read only one login details for my {string} account',
  async ({ profileSettingsPage }, user: string) => {
    const dataset = profileSettingsPage.profileSettingsPageTestData.Users;
    await expect
      .soft(profileSettingsPage.email_address_value)
      .toHaveText(dataset[user].One_Login_Details.email_address_value);
    await expect.soft(profileSettingsPage.telephone_value).toHaveText(dataset[user].One_Login_Details.telephone_value);
    await expect.soft(profileSettingsPage.email_address_change_link).toBeHidden();
    await expect.soft(profileSettingsPage.telephone_change_link).toBeHidden();
  }
);

When('I can see the profile details for my {string} account', async ({ profileSettingsPage }, user: string) => {
  const dataset = profileSettingsPage.profileSettingsPageTestData.Users;
  await expect.soft(profileSettingsPage.title_value).toHaveText(dataset[user].Profile_Details.title_value);
  await expect.soft(profileSettingsPage.first_name_value).toHaveText(dataset[user].Profile_Details.first_name_value);
  await expect.soft(profileSettingsPage.last_name_value).toHaveText(dataset[user].Profile_Details.last_name_value);
  await expect.soft(profileSettingsPage.job_title_value).toHaveText(dataset[user].Profile_Details.job_title_value);
  await expect
    .soft(profileSettingsPage.organisation_value)
    .toHaveText(dataset[user].Profile_Details.organisation_value);
});

Then(
  'I click the change link against {string} on the profile settings page',
  async ({ profileSettingsPage, commonItemsPage }, fieldKey: string) => {
    const changeLink = await commonItemsPage.getChangeLink(fieldKey, profileSettingsPage);
    await changeLink.click();
  }
);

Then(
  'I fill the complete profile page with {string} details',
  async ({ commonItemsPage, completeYourProfilePage }, datasetName: string) => {
    const dataset = completeYourProfilePage.completeYourProfilePageTestData.Users[datasetName].Profile_Details;
    for (const key in dataset) {
      if (Object.hasOwn(dataset, key)) {
        await commonItemsPage.fillUIComponent(dataset, key, completeYourProfilePage);
      }
    }
  }
);
