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
    const dataset =
      setupNewSponsorOrganisationPage.setupNewSponsorOrganisationPageTestData.Setup_New_Sponsor_Organisation[
        datasetName
      ];
    const expectedCountryValue = await checkSetupSponsorOrganisationPage.getCountry();
    await sponsorOrganisationProfilePage.assertOnSponsorOrganisationProfilePage();
    if (datasetName.startsWith('Sponsor_Organisation_')) {
      await expect(sponsorOrganisationProfilePage.organisation_name_value).toHaveText(
        await setupNewSponsorOrganisationPage.getUniqueOrgName()
      );
      await expect(sponsorOrganisationProfilePage.page_heading).toHaveText(
        sponsorOrganisationProfilePage.sponsorOrgProfilePageTestData.Sponsor_Organisation_Profile_Page
          .heading_prefix_label + (await setupNewSponsorOrganisationPage.getUniqueOrgName())
      );
    } else {
      await expect(sponsorOrganisationProfilePage.organisation_name_value).toHaveText(dataset.organisation_name_text);
      await expect(sponsorOrganisationProfilePage.page_heading).toHaveText(dataset.organisation_name_text);
    }
    await expect(sponsorOrganisationProfilePage.country_value).toHaveText(expectedCountryValue);
  }
);
