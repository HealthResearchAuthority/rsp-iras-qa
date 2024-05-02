import { createBdd } from 'playwright-bdd';
import { expect, test } from '../hooks/CustomFixtures';
import { DataTable } from '@cucumber/cucumber';
import { getValuesFromDataset } from '../utils/UtilFunctions';

const { Given, When, Then } = createBdd(test);

Given('I have navigated to the tasks page', async ({ tasksPage }, dataMap: DataTable) => {
    let pageMapValue = dataMap.hashes()[0]["Page"];
    await tasksPage.goto();
    await tasksPage.assertOnTasksPage(pageMapValue);
});

Given('I can see the tasks page using {string} dataset', async ({ tasksPage }, dataset) => {
    console.log(tasksPage.testJSON[dataset].header);
    await tasksPage.assertOnTasksPage(dataset);
});

When('I view the tasks table', async ({ tasksPage }) => {
    await expect(tasksPage.taskTable).toBeVisible()
});

Then('I see all projects that are assigned to the user using {string} dataset', async ({ tasksPage }, dataset) => {
    const expectedValues = getValuesFromDataset(tasksPage.testJSON, dataset);
    const actualValues = await tasksPage.getUserTaskValues();
    expect(actualValues).toMatchObject(expectedValues);
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

Then('I can see the project details page', async ({ projectDetailsPage }) => {
    await projectDetailsPage.assertOnProjectDetailsPage();
});

Then('the page title contains the projects task id using {string} dataset', async ({ projectDetailsPage }, dataset) => {
    await projectDetailsPage.validatePageTitle(dataset);
});

When('I select my personal tasks from the banner options', async ({ commonItemsPage }) => {
    await commonItemsPage.bannerMyTasks.click();
    await commonItemsPage.bannerMyPersonalTasks.click();
});