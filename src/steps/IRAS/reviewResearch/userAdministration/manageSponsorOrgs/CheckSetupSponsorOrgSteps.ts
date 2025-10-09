import { createBdd } from 'playwright-bdd';
import { expect, test } from '../../../../../hooks/CustomFixtures';
const { Then } = createBdd(test);

Then(
  'I can see the check and set up a sponsor organisation profile page for {string}',
  async ({ checkSetupSponsorOrganisationPage, setupNewSponsorOrganisationPage }, datasetName: string) => {
    const dataset =
      setupNewSponsorOrganisationPage.setupNewSponsorOrganisationPageTestData.Setup_New_Sponsor_Organisation[
        datasetName
      ];
    const expectedCountryValues: string = dataset.country_checkbox.toString();

    await checkSetupSponsorOrganisationPage.assertOnCheckSetupSponsorOrganisationPage();
    if (datasetName.startsWith('Valid_')) {
      await expect(checkSetupSponsorOrganisationPage.organisation_name_value).toHaveText(
        await setupNewSponsorOrganisationPage.getUniqueOrgName()
      );
    } else {
      await expect(checkSetupSponsorOrganisationPage.organisation_name_value).toHaveText(
        dataset.organisation_name_text
      );
    }
    await expect(checkSetupSponsorOrganisationPage.country_value).toHaveText(
      expectedCountryValues.replaceAll(',', ', ')
    );
  }
);
