import { createBdd } from 'playwright-bdd';
import { expect, test } from '../../../../../hooks/CustomFixtures';
import { confirmStringNotNull } from '../../../../../utils/UtilFunctions';
const { Then } = createBdd(test);

Then(
  'I can see the check and set up a sponsor organisation profile page with details matching the rts response received',
  async ({ checkSetupSponsorOrganisationPage, rtsPage }) => {
    await checkSetupSponsorOrganisationPage.assertOnCheckSetupSponsorOrganisationPage();
    const organisationName = await checkSetupSponsorOrganisationPage.organisation_name_value.innerText();
    expect.soft(organisationName.trim()).toBe(rtsPage.rtsResponseListRecord[0].name);
    const countryName = await checkSetupSponsorOrganisationPage.country_value.innerText();
    expect.soft(countryName.trim()).toBe(rtsPage.rtsResponseListRecord[0].country);
    await checkSetupSponsorOrganisationPage.setOrgName(
      confirmStringNotNull(await checkSetupSponsorOrganisationPage.organisation_name_value.textContent())
    );
    await checkSetupSponsorOrganisationPage.setCountry(
      confirmStringNotNull(await checkSetupSponsorOrganisationPage.country_value.textContent())
    );
  }
);

Then(
  'I keep note of the organisation name for sponsor organisation setup',
  async ({ checkSetupSponsorOrganisationPage }) => {
    await checkSetupSponsorOrganisationPage.setOrgName(
      confirmStringNotNull(await checkSetupSponsorOrganisationPage.organisation_name_value.textContent())
    );
  }
);
