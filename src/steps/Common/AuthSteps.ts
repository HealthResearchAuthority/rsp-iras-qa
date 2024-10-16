import { createBdd } from 'playwright-bdd';
import { test } from '../../hooks/CustomFixtures';

const { When, Then } = createBdd(test);

When('I login to the application as the {string}', async ({ loginPage }, user: string) => {
  await loginPage.loginWithUserCreds(user);
});
Then('I click on the next button in the login page', async ({ loginPage }) => {
  await loginPage.clickOnNextButton();
});

Then('I will store the {string} authentication state', async ({ commonItemsPage }, user: string) => {
  await commonItemsPage.storeAuthState(user);
});
