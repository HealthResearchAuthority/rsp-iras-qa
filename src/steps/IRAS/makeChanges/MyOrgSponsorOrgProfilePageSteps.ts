import { createBdd } from 'playwright-bdd';
import { test } from '../../../hooks/CustomFixtures';

const { Then } = createBdd(test);

Then(
  'I can see the sponsor organisation profile page from my organisations',
  async ({ myOrgSponsorOrgProfilePage, checkSetupSponsorOrganisationPage }) => {
    const expSponOrgName = await checkSetupSponsorOrganisationPage.getOrgName();
    await myOrgSponsorOrgProfilePage.assertOnMyOrgSponsorOrgProfilePage(expSponOrgName);
  }
);
