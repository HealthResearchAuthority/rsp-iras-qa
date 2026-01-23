import { createBdd } from 'playwright-bdd';
import { expect, test } from '../../../../../hooks/CustomFixtures';
const { Then } = createBdd(test);

Then(
  'I can see the {string} successful message on sponsor organisation user list page',
  async (
    { userListSponsorOrganisationPage, commonItemsPage, myOrganisationsUserProfilePage },
    activityName: string
  ) => {
    const enabledStatus = commonItemsPage.commonTestData.enabled_status;
    const disabledStatus = commonItemsPage.commonTestData.disabled_status;
    await expect.soft(commonItemsPage.success_message_header_text).toBeVisible();
    switch (activityName) {
      case 'user added':
        await expect
          .soft(userListSponsorOrganisationPage.user_added_to_sponsor_organisation_success_message_text)
          .toBeVisible();
        await myOrganisationsUserProfilePage.setStatus(enabledStatus);
        break;
      case 'user in the selected sponsor organisation disabled':
        await expect
          .soft(userListSponsorOrganisationPage.user_in_sponsor_organisation_disabled_success_message_text)
          .toBeVisible();
        await myOrganisationsUserProfilePage.setStatus(disabledStatus);
        break;
      case 'user in the selected sponsor organisation enabled':
        await expect
          .soft(userListSponsorOrganisationPage.user_in_sponsor_organisation_enabled_success_message_text)
          .toBeVisible();
        await myOrganisationsUserProfilePage.setStatus(enabledStatus);

        break;
      default:
        throw new Error(`${activityName} is not a valid option`);
    }
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
