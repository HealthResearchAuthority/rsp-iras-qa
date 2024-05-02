import { createBdd } from 'playwright-bdd';
import { test } from '../hooks/CustomFixtures';

const { When, Then } = createBdd(test);

When('I login to the application as the {string}', async ({ loginPage }, user: string) => {
    await loginPage.loginWithUserCreds(user);
});

Then('I will store the {string} Authentication State', async ({ commonItemsPage }, user: string) => {
    await commonItemsPage.storeAuthState(user);
});
