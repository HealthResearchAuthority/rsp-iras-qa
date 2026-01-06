import { createBdd } from 'playwright-bdd';
import { test } from '../../../hooks/CustomFixtures';
//import { Locator } from '@playwright/test';
//import MyOrgSponsorOrgProfilePage from '../../../pages/IRAS/makeChanges/MyOrgSponsorOrgProfilePage';

const { Then } = createBdd(test);

Then(
  'I can see the sponsor organisation profile page from my organisations',
  async ({ myOrgSponsorOrgProfilePage, checkSetupSponsorOrganisationPage }) => {
    const expSponOrgName = await checkSetupSponsorOrganisationPage.getOrgName();
    await myOrgSponsorOrgProfilePage.assertOnMyOrgSponsorOrgProfilePage(expSponOrgName);
  }
);
