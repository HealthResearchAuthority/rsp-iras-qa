import { createBdd } from 'playwright-bdd';
import { test } from '../../../../hooks/CustomFixtures';
const { Then } = createBdd(test);

Then(
  'I navigate to the add user page for the selected sponsor organisation {string}',
  async ({ mySponsorOrgAddUserPage }, sponsorOrg: string) => {
    await mySponsorOrgAddUserPage.assertOnMySponsorOrgAddUsersPage(sponsorOrg);
  }
);
