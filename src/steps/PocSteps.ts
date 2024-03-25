import { createBdd } from 'playwright-bdd';
import { test } from '../hooks/CustomFixtures';
import { DataTable } from '@cucumber/cucumber';

const { Given, When, Then } = createBdd(test);

Given('I have navigated to the Tasks Page', async ({ tasksPage }) => {
    await tasksPage.goto();
    await tasksPage.assertOnTasksPage();
});

Given('I can see the Tasks Page', async ({ tasksPage }) => {
    await tasksPage.assertOnTasksPage();
});

When('I View the Tasks Table', async ({ tasksPage }) => {
    await tasksPage.assertTasksTablePresent();
});

Then('I see all projects that are assigned to the POC user', async ({ tasksPage }, data: DataTable) => {
    const expectedRowValues = data.rows();
    await tasksPage.assertUserTasksPresent(expectedRowValues);
});

Then('I click anywhere on the {string} project row', async ({ tasksPage }, project: string) => {
    switch (project.toLowerCase()) {
        case 'prepare':
            await tasksPage.taskTableTopBodyRow.click();
            break;
        default:
            throw new Error(`${project} is not a valid option`);
    }
});

Then('I can see the Project Details Page', async ({ projectDetailsPage }) => {
    await projectDetailsPage.assertOnProjectDetailsPage();
});

Then('the page title contains the Projects Task ID - {string}', async ({ projectDetailsPage }, taskId: string) => {
    await projectDetailsPage.assertPageTitle(taskId);
});

When('I select My Personal Tasks from the Banner Options', async ({ commonItemsPage }) => {
    await commonItemsPage.bannerMyTasks.click();
    await commonItemsPage.bannerMyPersonalTasks.click();
});