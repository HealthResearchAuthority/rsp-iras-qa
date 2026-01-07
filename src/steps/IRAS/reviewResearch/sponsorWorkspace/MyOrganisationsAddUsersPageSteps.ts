import { createBdd } from 'playwright-bdd';
import { test } from '../../../../hooks/CustomFixtures';
const { Then } = createBdd(test);

Then(
  'I navigate to the add user page for the selected sponsor organisation {string}',
  async ({ mySponsorOrgUsersPage, commonItemsPage }, sponsorOrg: string) => {
    await mySponsorOrgUsersPage.assertOnMySponsorOrgAddUsersPage(sponsorOrg, commonItemsPage);
  }
);
