import { createBdd } from 'playwright-bdd';
import { expect, test } from '../../../hooks/CustomFixtures';
import { confirmStringNotNull } from '../../../utils/UtilFunctions';

const { Then } = createBdd(test);

Then('I can see the project overview page', async ({ projectOverviewPage }) => {
  await projectOverviewPage.assertOnProjectOverviewPage();
});

Then(
  'I can see the short project title on project overview page for {string}',
  async ({ projectDetailsTitlePage, projectOverviewPage }, datasetName: string) => {
    const dataset = projectDetailsTitlePage.projectDetailsTitlePageTestData[datasetName];
    const expectedProjectTitle = dataset.short_project_title_text;
    const actualProjectTitle = confirmStringNotNull(await projectOverviewPage.project_short_title_label.textContent());
    expect(actualProjectTitle).toBe(expectedProjectTitle);
  }
);

Then(
  'I can see the modification progress saved successful message on project overview page',
  async ({ projectOverviewPage }) => {
    expect(projectOverviewPage.modification_saved_success_message_text).toBeVisible();
  }
);
