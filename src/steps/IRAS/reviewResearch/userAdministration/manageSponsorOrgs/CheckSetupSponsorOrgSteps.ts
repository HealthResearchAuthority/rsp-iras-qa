import { createBdd } from 'playwright-bdd';
import { expect, test } from '../../../../../hooks/CustomFixtures';
import { confirmStringNotNull } from '../../../../../utils/UtilFunctions';
const { Then } = createBdd(test);

Then(
  'I can see the check and set up a sponsor organisation profile page for {string}',
  async ({ checkSetupSponsorOrganisationPage, setupNewSponsorOrganisationPage }, datasetName: string) => {
    const dataset =
      setupNewSponsorOrganisationPage.setupNewSponsorOrganisationPageTestData.Setup_New_Sponsor_Organisation[
        datasetName
      ];
    await checkSetupSponsorOrganisationPage.assertOnCheckSetupSponsorOrganisationPage();
    const organisationName = await checkSetupSponsorOrganisationPage.organisation_name_value.innerText();
    if (datasetName.startsWith('Sponsor_Organisation_')) {
      expect.soft(organisationName.trim()).toBe(await setupNewSponsorOrganisationPage.getUniqueOrgName());
      // await expect
      //   .soft(checkSetupSponsorOrganisationPage.organisation_name_value)
      //   .toHaveText(await setupNewSponsorOrganisationPage.getUniqueOrgName());
    } else {
      expect.soft(organisationName.trim()).toBe(dataset.organisation_name_text);
      // await expect
      //   .soft(checkSetupSponsorOrganisationPage.organisation_name_value)
      //   .toHaveText(dataset.organisation_name_text);
    }
    await checkSetupSponsorOrganisationPage.setOrgName(
      confirmStringNotNull(await checkSetupSponsorOrganisationPage.organisation_name_value.textContent())
    );
    await checkSetupSponsorOrganisationPage.setCountries(
      confirmStringNotNull(await checkSetupSponsorOrganisationPage.country_value.textContent()).split(', ')
    );
  }
);
