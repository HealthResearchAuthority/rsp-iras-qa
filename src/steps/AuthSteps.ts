import { createBdd } from 'playwright-bdd';
import { test } from '../hooks/CustomFixtures';
import { DataTable } from '@cucumber/cucumber';

const { Given, When, Then } = createBdd(test);

Given('I am on the login page', async ({ tasksPage, loginPage }, dataMap: DataTable) => {
    let pageMapValue = dataMap.hashes()[0]["Page"];
    await tasksPage.goto();
    await loginPage.assertOnLoginPage(pageMapValue);
});

When('I login to the application using {string} dataset', async ({ loginPage }, dataset) => {
    await loginPage.loginWithUserCreds(dataset);
});

Then('I will store the users authentication state using {string} dataset', async ({ commonItemsPage }, dataset) => {
    await commonItemsPage.storeAuthState(dataset);
});
