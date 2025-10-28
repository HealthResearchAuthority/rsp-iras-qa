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
