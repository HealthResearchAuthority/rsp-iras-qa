import { createBdd } from 'playwright-bdd';
import { expect, test } from '../../../hooks/CustomFixtures';

const { Given, Then } = createBdd(test);

Then(
  'I can see the sponsor organisation profile page from my organisations',
  async ({ myOrgSponsorOrgProfilePage }) => {
    const expSponOrgName = await myOrgSponsorOrgProfilePage.getOrgName();
    await myOrgSponsorOrgProfilePage.assertOnMyOrgSponsorOrgProfilePage(expSponOrgName);
  }
);

Given('the {string} tab is active and underlined', async ({ myOrgSponsorOrgProfilePage }, tabName: string) => {
  const tabText = myOrgSponsorOrgProfilePage.linkTextData.My_Organisations_Sponsor_Org_Profile_Page[tabName];
  await expect.soft(myOrgSponsorOrgProfilePage.activeTab).toBeVisible();
  await expect.soft(myOrgSponsorOrgProfilePage.activeTab).toHaveCount(1);
  await expect.soft(myOrgSponsorOrgProfilePage.activeTab).toHaveText(tabText);
});
