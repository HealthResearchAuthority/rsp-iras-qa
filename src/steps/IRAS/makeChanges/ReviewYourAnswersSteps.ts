import { createBdd } from 'playwright-bdd';
import { expect, test } from '../../../hooks/CustomFixtures';
import { convertDate, confirmStringNotNull } from '../../../utils/UtilFunctions';

const { Then } = createBdd(test);

Then('I can see the review your answers page', async ({ reviewYourAnswersPage }) => {
  await reviewYourAnswersPage.assertOnReviewYourAnswersPage();
});

Then(
  'I can validate the field values of {string} page {string} page and {string} page',
  async (
    {
      commonItemsPage,
      reviewYourAnswersPage,
      projectDetailsIRASPage,
      projectDetailsTitlePage,
      chiefInvestigatorPage,
      reseachLocationsPage,
    },
    datasetNameProjectTitle: string,
    datasetNameKeyRoles: string,
    datasetNameResearchLocations: string
  ) => {
    const datasetProjectTitle = projectDetailsTitlePage.projectDetailsTitlePageTestData[datasetNameProjectTitle];
    const datasetKeyRoles = chiefInvestigatorPage.chiefInvestigatorPageTestData[datasetNameKeyRoles];
    const datasetResearchLoctions = reseachLocationsPage.researchLocationsPageTestData[datasetNameResearchLocations];
    const irasIdRunTime = await projectDetailsIRASPage.getUniqueIrasId();
    expect(confirmStringNotNull(await reviewYourAnswersPage.iras_id_text.textContent())).toBe(irasIdRunTime);
    for (const key in datasetProjectTitle) {
      if (Object.hasOwn(datasetProjectTitle, key)) {
        if (
          key == 'planned_project_end_day_text' ||
          key == 'planned_project_end_month_dropdown' ||
          key == 'planned_project_end_year_text'
        ) {
          const projectEndDateFormatted = await convertDate(
            datasetProjectTitle.planned_project_end_day_text,
            datasetProjectTitle.planned_project_end_month_dropdown,
            datasetProjectTitle.planned_project_end_year_text
          );
          expect(await reviewYourAnswersPage.getPlannedProjectEndDate()).toBe(projectEndDateFormatted);
        } else {
          await commonItemsPage.validateUIComponentValues(datasetProjectTitle, key, reviewYourAnswersPage);
        }
      }
    }
    for (const key in datasetKeyRoles) {
      if (Object.hasOwn(datasetKeyRoles, key)) {
        await commonItemsPage.validateUIComponentValues(datasetKeyRoles, key, reviewYourAnswersPage);
      }
    }

    for (const key in datasetResearchLoctions) {
      if (Object.hasOwn(datasetResearchLoctions, key)) {
        await commonItemsPage.validateUIComponentValues(datasetResearchLoctions, key, reviewYourAnswersPage);
      }
    }
  }
);

Then(
  'I can see enter link for all the incomplete fields {string}',
  async ({ commonItemsPage, reviewYourAnswersPage }, datasetName: string) => {
    const dataset = reviewYourAnswersPage.reviewYourAnswersPageTestData[datasetName];
    for (const key in dataset) {
      if (Object.hasOwn(dataset, key)) {
        await commonItemsPage.validateUIComponentValues(dataset, key, reviewYourAnswersPage);
      }
    }
  }
);

Then(
  'I click the change link {string} on review your answers page',
  async ({ reviewYourAnswersPage }, changeLink: string) => {
    await reviewYourAnswersPage.clickChangeLinks(changeLink);
  }
);

Then(
  'I click the enter link {string} on review your answers page',
  async ({ reviewYourAnswersPage }, enterLink: string) => {
    await reviewYourAnswersPage.clickEnterLinks(enterLink);
  }
);
