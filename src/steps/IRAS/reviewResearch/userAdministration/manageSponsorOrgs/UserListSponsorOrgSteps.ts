import { createBdd } from 'playwright-bdd';
import { expect, test } from '../../../../../hooks/CustomFixtures';
const { Then } = createBdd(test);

Then(
  'I can see the user added successful message on sponsor organisation user list page',
  async ({ userListSponsorOrganisationPage, commonItemsPage }) => {
    await expect
      .soft(userListSponsorOrganisationPage.user_added_to_sponsor_organisation_success_message_header_text)
      .toBeVisible();
    await expect
      .soft(userListSponsorOrganisationPage.user_added_to_sponsor_organisation__success_message_text)
      .toBeVisible();
    expect
      .soft(
        await userListSponsorOrganisationPage.information_alert_banner.evaluate((e: any) =>
          getComputedStyle(e).getPropertyValue('border-color')
        )
      )
      .toBe(commonItemsPage.commonTestData.rgb_green_color);
    expect
      .soft(
        await userListSponsorOrganisationPage.information_alert_banner.evaluate((e: any) =>
          getComputedStyle(e).getPropertyValue('background-color')
        )
      )
      .toBe(commonItemsPage.commonTestData.rgb_green_color);
  }
);

Then(
  'I can see the user in the selected sponsor organisation disabled successful message on sponsor organisation user list page',
  async ({ userListSponsorOrganisationPage, commonItemsPage }) => {
    await expect
      .soft(userListSponsorOrganisationPage.user_in_sponsor_organisation_disabled_success_message_header_text)
      .toBeVisible();
    await expect
      .soft(userListSponsorOrganisationPage.user_in_sponsor_organisation_disabled_success_message_text)
      .toBeVisible();
    expect
      .soft(
        await userListSponsorOrganisationPage.information_alert_banner.evaluate((e: any) =>
          getComputedStyle(e).getPropertyValue('border-color')
        )
      )
      .toBe(commonItemsPage.commonTestData.rgb_green_color);
    expect
      .soft(
        await userListSponsorOrganisationPage.information_alert_banner.evaluate((e: any) =>
          getComputedStyle(e).getPropertyValue('background-color')
        )
      )
      .toBe(commonItemsPage.commonTestData.rgb_green_color);
  }
);

Then(
  'I can see the user in the selected sponsor organisation enabled successful message on sponsor organisation user list page',
  async ({ userListSponsorOrganisationPage, commonItemsPage }) => {
    await expect
      .soft(userListSponsorOrganisationPage.user_in_sponsor_organisation_enabled_success_message_header_text)
      .toBeVisible();
    await expect
      .soft(userListSponsorOrganisationPage.user_in_sponsor_organisation_enabled_success_message_text)
      .toBeVisible();
    expect
      .soft(
        await userListSponsorOrganisationPage.information_alert_banner.evaluate((e: any) =>
          getComputedStyle(e).getPropertyValue('border-color')
        )
      )
      .toBe(commonItemsPage.commonTestData.rgb_green_color);
    expect
      .soft(
        await userListSponsorOrganisationPage.information_alert_banner.evaluate((e: any) =>
          getComputedStyle(e).getPropertyValue('background-color')
        )
      )
      .toBe(commonItemsPage.commonTestData.rgb_green_color);
  }
);
