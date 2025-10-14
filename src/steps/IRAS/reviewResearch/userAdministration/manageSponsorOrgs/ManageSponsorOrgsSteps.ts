import { createBdd } from 'playwright-bdd';
import { test, expect } from '../../../../../hooks/CustomFixtures';
const { When, Then } = createBdd(test);

When(
  'I can see the {string} should be present in the list with {string} status in the manage sponsor organisation page',
  async ({ manageSponsorOrganisationPage, checkSetupSponsorOrganisationPage }, inputType: string, status: string) => {
    const sponsorOrgStatus = await manageSponsorOrganisationPage.getSponsorStatus(status);
    const sponsorOrgName = await manageSponsorOrganisationPage.getSponsorOrgName(
      inputType,
      checkSetupSponsorOrganisationPage
    );
    // await manageReviewBodiesPage.goto(
    //   manageReviewBodiesPage.manageReviewBodiesPageData.Manage_Review_Body_Page.enlarged_page_size,
    //   reviewBodyName
    // );
    const foundRecords = await manageSponsorOrganisationPage.findSponsorOrg(sponsorOrgName, sponsorOrgStatus);
    expect(foundRecords).toBeDefined();
    expect(foundRecords).toHaveCount(1);
    await manageSponsorOrganisationPage.setSponsorOrgRow(foundRecords);
  }
);

Then(
  'I can see the sponsor organisation added successful message on manage sponsor organisation page',
  async ({ manageSponsorOrganisationPage, commonItemsPage }) => {
    await expect
      .soft(manageSponsorOrganisationPage.sponsor_organisation_added_success_message_header_text)
      .toBeVisible();
    await expect.soft(manageSponsorOrganisationPage.sponsor_organisation_added_success_message_text).toBeVisible();
    expect
      .soft(
        await manageSponsorOrganisationPage.information_alert_banner.evaluate((e: any) =>
          getComputedStyle(e).getPropertyValue('border-color')
        )
      )
      .toBe(commonItemsPage.commonTestData.rgb_green_color);
    expect
      .soft(
        await manageSponsorOrganisationPage.information_alert_banner.evaluate((e: any) =>
          getComputedStyle(e).getPropertyValue('background-color')
        )
      )
      .toBe(commonItemsPage.commonTestData.rgb_green_color);
  }
);
