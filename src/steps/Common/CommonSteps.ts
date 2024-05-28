import { createBdd } from 'playwright-bdd';
import { test } from '../../hooks/CustomFixtures';

const { Given, When, Then } = createBdd(test);

Given('I have navigated to the {string}', async ({ tasksPage, loginPage }, page: string) => {
    switch (page) {
        case 'Login_Page':
            await tasksPage.goto();
            await loginPage.assertOnLoginPage(page);
            break;
        case 'Tasks_Page':
            await tasksPage.goto();
            await tasksPage.assertOnTasksPage();
            break;
        default:
            throw new Error(`${page} is not a valid option`);
    }
});

When('I can see the {string}', async ({ tasksPage }, page: string) => {
    switch (page) {
        case 'Tasks_Page':
            await tasksPage.assertOnTasksPage();
            break;
        default:
            throw new Error(`${page} is not a valid option`);
    }
});

When('I do something {string}', async ({ }, testType: string) => {
    console.log(testType + ' test action');
});

Then('I see something {string}', async ({ tasksPage }, testType: string) => {
    console.log(testType + ' test assertion');
});
