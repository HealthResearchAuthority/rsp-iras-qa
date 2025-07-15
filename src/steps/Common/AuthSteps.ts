import { createBdd } from 'playwright-bdd';
import { test } from '../../hooks/CustomFixtures';
import { connect } from '../../utils/DbConfig';

const { When, Then } = createBdd(test);

When('I login to the application as the {string}', async ({ loginPage }, user: string) => {
  await loginPage.page.pause();
  await connect();
  await loginPage.page.pause();
  await loginPage.loginWithUserCreds(user);
});

Then('I will store the {string} authentication state', async ({ commonItemsPage }, user: string) => {
  await commonItemsPage.storeAuthState(user);
});
