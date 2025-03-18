import { createBdd } from 'playwright-bdd';
import { test } from '../../../../../hooks/CustomFixtures';

const { Then } = createBdd(test);

Then('I can see the Manage users list page', async ({ manageUsersPage }) => {
  //update
  await manageUsersPage.assertOnManageUsersPage();
});
