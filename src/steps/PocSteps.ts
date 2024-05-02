import { createBdd } from 'playwright-bdd';
import { expect, test } from '../hooks/CustomFixtures';
import { getValuesFromTestDataset } from '../utils/UtilFunctions';

const { Given, When, Then } = createBdd(test);

Given('I view the tasks table', async ({ tasksPage }) => {
    await expect(tasksPage.taskTable).toBeVisible();
});

Then('I see all projects that are assigned to the user using {string} dataset', async ({ tasksPage }, dataset) => {
    const expectedValues = getValuesFromTestDataset(tasksPage.tasksPageTestData, dataset);
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