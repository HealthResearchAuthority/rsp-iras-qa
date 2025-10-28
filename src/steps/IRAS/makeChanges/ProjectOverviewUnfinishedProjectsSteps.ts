import { createBdd } from 'playwright-bdd';
import { expect, test } from '../../../hooks/CustomFixtures';
import { confirmStringNotNull } from '../../../utils/UtilFunctions';

const { Then } = createBdd(test);

Then(
  'I can see the project overview for unfinished projects page',
  async ({ projectOverviewUnfinishedProjectsPage }) => {
    await projectOverviewUnfinishedProjectsPage.assertOnProjectOverviewUnfinishedProjectsPage();
  }
);

Then(
  'I can validate the ui fields on project overview unfinished projects page with {string}',
  async (
    { projectDetailsIRASPage, projectDetailsTitlePage, projectOverviewUnfinishedProjectsPage },
    datasetName: string
  ) => {
    const dataset = projectDetailsTitlePage.projectDetailsTitlePageTestData[datasetName];
    const expectedProjectTitle = dataset.short_project_title_text;
    const expectedIrasId = await projectDetailsIRASPage.getUniqueIrasId();
    if (dataset.short_project_title_text) {
      const projectTitle = confirmStringNotNull(
        await projectOverviewUnfinishedProjectsPage.project_short_title_text.textContent()
      );
      const actualProjectTitle = projectTitle
        .replace(
          projectOverviewUnfinishedProjectsPage.projectOverviewUnfinishedProjectsPageTestData.Project_Overview_Page
            .short_project_title_label,
          ''
        )
        .trim();
      expect(actualProjectTitle).toBe(expectedProjectTitle);
    }
    const iIrasIdText = confirmStringNotNull(await projectOverviewUnfinishedProjectsPage.irasid_text.textContent());
    const statusText = confirmStringNotNull(await projectOverviewUnfinishedProjectsPage.status_text.textContent());
    const actualIrasIdText = iIrasIdText
      .replace(
        projectOverviewUnfinishedProjectsPage.projectOverviewUnfinishedProjectsPageTestData.Project_Overview_Page
          .irasid_label,
        ''
      )
      .trim();
    expect(actualIrasIdText).toBe(expectedIrasId);
    expect(statusText).toBe(
      projectOverviewUnfinishedProjectsPage.projectOverviewUnfinishedProjectsPageTestData.Project_Overview_Page
        .status_label
    );
  }
);

Then(
  'I can see the project status as {string} on the project overview for unfinished project page',
  async ({ projectOverviewUnfinishedProjectsPage, createProjectRecordPage }, datasetName: string) => {
    const dataset = createProjectRecordPage.createProjectRecordPageTestData[datasetName];
    const expectedStatus = dataset.status;
    const actualStatus = confirmStringNotNull(await projectOverviewUnfinishedProjectsPage.status_text.textContent());
    expect.soft(actualStatus).toBe(expectedStatus);
  }
);

Then(
  'I validate the iras id displayed on the project overview unfinished projects page',
  async ({ projectDetailsIRASPage, projectOverviewUnfinishedProjectsPage }) => {
    const expectedIrasId = await projectDetailsIRASPage.getUniqueIrasId();
    const iIrasIdText = confirmStringNotNull(await projectOverviewUnfinishedProjectsPage.irasid_text.textContent());
    const actualIrasIdText = iIrasIdText
      .replace(
        projectOverviewUnfinishedProjectsPage.projectOverviewUnfinishedProjectsPageTestData.Project_Overview_Page
          .irasid_label,
        ''
      )
      .trim();
    expect(actualIrasIdText).toBe(expectedIrasId);
  }
);
