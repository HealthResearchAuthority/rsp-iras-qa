import { createBdd } from 'playwright-bdd';
import { expect, test } from '../../../hooks/CustomFixtures';
import { confirmStringNotNull } from '../../../utils/UtilFunctions';

const { Then } = createBdd(test);

Then('I can see the project overview save for later page', async ({ projectOverviewSaveForLaterPage }) => {
  await projectOverviewSaveForLaterPage.assertOnProjectOverviewSaveForLaterPage();
});

Then(
  'I can see the short project title on project overview save for later page for {string}',
  async ({ projectDetailsTitlePage, projectOverviewSaveForLaterPage }, datasetName: string) => {
    const dataset = projectDetailsTitlePage.projectDetailsTitlePageTestData[datasetName];
    const expectedProjectTitle = dataset.short_project_title_text;
    const actualProjectTitle = confirmStringNotNull(
      await projectOverviewSaveForLaterPage.project_short_title_label.textContent()
    );
    expect(actualProjectTitle).toBe(expectedProjectTitle);
  }
);
