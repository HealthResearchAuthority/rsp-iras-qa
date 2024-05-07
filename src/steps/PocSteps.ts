import { createBdd } from 'playwright-bdd';
import { expect, test } from '../hooks/CustomFixtures';
import { getValuesFromTestDataset } from '../utils/UtilFunctions';

const { Given, When, Then } = createBdd(test);

Given('I view the tasks table', async ({ tasksPage }) => {
    await expect(tasksPage.taskTable).toBeVisible();
});

Then('I see all projects that are assigned to the {string}', async ({ tasksPage }, dataset: string) => {
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

Then('I verify that the page title contains the projects task id in the {string}', async ({ projectDetailsPage }, dataset: string) => {
    const pageTitle = projectDetailsPage.projectDetailsPageTestData[dataset].task_id;
    expect((await projectDetailsPage.page.title()).endsWith(pageTitle)).toBeTruthy();
});

When('I select my personal tasks from the banner options', async ({ commonItemsPage }) => {
    await commonItemsPage.bannerMyTasks.click();
    await commonItemsPage.bannerMyPersonalTasks.click();
});

When('I do something', async ({ }) => {
    //PLACEHOLDER
});

Then('The JIRA Tag will be on the report', async ({ }) => {
    //PLACEHOLDER

});

Then('The JIRA Tags will also be on the report', async ({ }) => {
    //PLACEHOLDER

});