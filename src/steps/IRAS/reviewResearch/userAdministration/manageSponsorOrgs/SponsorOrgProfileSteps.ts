import { createBdd } from 'playwright-bdd';
import { expect, test } from '../../../../../hooks/CustomFixtures';
import { confirmStringNotNull } from '../../../../../utils/UtilFunctions';

const { When, Then } = createBdd(test);

Then('I can see the sponsor organisation profile page', async ({ sponsorOrganisationProfilePage }) => {
  await sponsorOrganisationProfilePage.assertOnSponsorOrganisationProfilePage();
  await sponsorOrganisationProfilePage.setOrgName(
    confirmStringNotNull(await sponsorOrganisationProfilePage.organisation_name_value.textContent())
  );
  await sponsorOrganisationProfilePage.setCountries(
    confirmStringNotNull(await sponsorOrganisationProfilePage.country_value.textContent()).split(', ')
  );
  await sponsorOrganisationProfilePage.setLastUpdatedDate(
    confirmStringNotNull(await sponsorOrganisationProfilePage.last_updated_value.textContent())
  );
});

When(
  'I now see the sponsor organisation profile page with the selected {string}',
  async (
    { setupNewSponsorOrganisationPage, sponsorOrganisationProfilePage, checkSetupSponsorOrganisationPage },
    datasetName: string
  ) => {
    await sponsorOrganisationProfilePage.assertOnSponsorOrganisationProfilePage();
    if (datasetName.startsWith('Sponsor_Organisation_')) {
      await expect
        .soft(sponsorOrganisationProfilePage.organisation_name_value)
        .toHaveText(await checkSetupSponsorOrganisationPage.getOrgName());
      await expect
        .soft(sponsorOrganisationProfilePage.page_heading)
        .toHaveText(
          sponsorOrganisationProfilePage.sponsorOrgProfilePageTestData.Sponsor_Organisation_Profile_Page
            .heading_prefix_label + (await checkSetupSponsorOrganisationPage.getOrgName())
        );
      const expectedCountryValue = await checkSetupSponsorOrganisationPage.getCountry();
      await expect.soft(sponsorOrganisationProfilePage.country_value).toHaveText(expectedCountryValue);
      const expectedLastUpdatedValue = await sponsorOrganisationProfilePage.getLastUpdatedDate();
      await expect.soft(sponsorOrganisationProfilePage.last_updated_value).toHaveText(expectedLastUpdatedValue);
    } else {
      const dataset =
        setupNewSponsorOrganisationPage.setupNewSponsorOrganisationPageTestData.Existing_Sponsor_Organisation[
          datasetName
        ];
      await expect
        .soft(sponsorOrganisationProfilePage.organisation_name_value)
        .toHaveText(dataset.sponsor_organisation_text);
      await expect
        .soft(sponsorOrganisationProfilePage.page_heading)
        .toHaveText(
          sponsorOrganisationProfilePage.sponsorOrgProfilePageTestData.Sponsor_Organisation_Profile_Page
            .heading_prefix_label + dataset.sponsor_organisation_text
        );
    }
  }
);

Then(
  'I can see the user record should be available with {string} status in {string}',
  async ({ commonItemsPage, myOrganisationsUserProfilePage }, expectedStatus: string, pageKey: string) => {
    if (pageKey === 'organisation profile users page') {
      const actualStatus = (await commonItemsPage.users_sponsor_org_status_value_first_row.innerText()).trim();
      expect.soft(actualStatus).toBe(expectedStatus);
    } else if (pageKey === 'My_Organisations_User_Profile_Page') {
      const actualStatus = (await myOrganisationsUserProfilePage.status_value.innerText()).trim();
      expect.soft(actualStatus).toBe(expectedStatus);
    }
  }
);
