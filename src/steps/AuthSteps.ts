import { createBdd } from 'playwright-bdd';
import { test } from '../hooks/CustomFixtures';

const { Given, When, Then } = createBdd(test);

Given('I am on the Login Page', async ({ tasksPage, loginPage }) => {
    await tasksPage.goto();
    await loginPage.assertOnLoginPage();
});

When('I login as {string} User', async ({ loginPage }, user: string) => {
    await loginPage.loginWithUserCreds(user);
});

Then('I will store the {string} users Authentication State', async ({ commonItemsPage }, user: string) => {
    await commonItemsPage.storeAuthState(user);
});
