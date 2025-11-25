import { createBdd } from 'playwright-bdd';
import { test, expect } from '../../../../hooks/CustomFixtures';

const { Given, When, Then } = createBdd(test);

Given(
  'I can see the read only one login details for my {string} account',
  async ({ profileCommonPage }, user: string) => {
    const dataset = profileCommonPage.profileCommonPageTestData.Users;
    await expect
      .soft(profileCommonPage.email_address_value)
      .toHaveText(dataset[user].One_Login_Details.email_address_value);
    await expect.soft(profileCommonPage.telephone_value).toHaveText(dataset[user].One_Login_Details.telephone_value);
    await expect.soft(profileCommonPage.settings_email_address_change_link).toBeHidden();
    await expect.soft(profileCommonPage.check_email_address_change_link).toBeHidden();
    await expect.soft(profileCommonPage.settings_telephone_change_link).toBeHidden();
    await expect.soft(profileCommonPage.check_telephone_change_link).toBeHidden();
  }
);

When('I can see the profile details for my {string} account', async ({ profileCommonPage }, user: string) => {
  const dataset = profileCommonPage.profileCommonPageTestData.Users;
  await expect.soft(profileCommonPage.title_value).toHaveText(dataset[user].Profile_Details.title_value);
  await expect.soft(profileCommonPage.first_name_value).toHaveText(dataset[user].Profile_Details.first_name_value);
  await expect.soft(profileCommonPage.last_name_value).toHaveText(dataset[user].Profile_Details.last_name_value);
  await expect.soft(profileCommonPage.job_title_value).toHaveText(dataset[user].Profile_Details.job_title_value);
  await expect.soft(profileCommonPage.organisation_value).toHaveText(dataset[user].Profile_Details.organisation_value);
});

When('I can see the account {string} notification', async ({ profileCommonPage }, action: string) => {
  await expect.soft(profileCommonPage.success_notification_title).toBeVisible();
  if (action.toLowerCase() == 'created') {
    await expect.soft(profileCommonPage.success_notification_created_message).toBeVisible();
  } else {
    await expect.soft(profileCommonPage.success_notification_updated_message).toBeVisible();
  }
});

Then(
  'I click the change link against {string} on the profile settings page',
  async ({ profileCommonPage, commonItemsPage }, fieldKey: string) => {
    const changeLink = await commonItemsPage.getChangeLink(fieldKey, profileCommonPage);
    await changeLink.click();
  }
);

Then(
  'I click the change link against {string} on the check your profile page',
  async ({ profileCommonPage, commonItemsPage }, fieldKey: string) => {
    const changeLink = await commonItemsPage.getChangeLink(fieldKey, profileCommonPage);
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

Then(
  'I fill the edit your profile page with {string} details',
  async ({ commonItemsPage, editYourProfilePage }, datasetName: string) => {
    const dataset = editYourProfilePage.editYourProfilePageTestData.Users[datasetName].Profile_Details;
    for (const key in dataset) {
      if (Object.hasOwn(dataset, key)) {
        await commonItemsPage.fillUIComponent(dataset, key, editYourProfilePage);
      }
    }
  }
);
