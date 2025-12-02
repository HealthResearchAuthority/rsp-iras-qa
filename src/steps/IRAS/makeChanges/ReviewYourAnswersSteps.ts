import { createBdd } from 'playwright-bdd';
import { expect, test } from '../../../hooks/CustomFixtures';
import { convertDate, confirmStringNotNull, removeUnwantedWhitespace } from '../../../utils/UtilFunctions';

const { Then } = createBdd(test);

Then('I can see the review your answers page', async ({ reviewYourAnswersPage }) => {
  await reviewYourAnswersPage.assertOnReviewYourAnswersPage();
});

Then(
  'I can validate the field values of {string} page {string} page {string} and {string} page',
  async (
    {
      commonItemsPage,
      reviewYourAnswersPage,
      projectDetailsIRASPage,
      projectDetailsTitlePage,
      chiefInvestigatorPage,
      researchLocationsPage,
      projectIdentifiersPage,
      confirmProjectDetailsPage,
    },
    datasetNameProjectTitle: string,
    datasetNameChiefInvestigator: string,
    datasetNameResearchLocations: string,
    datasetNameProjectIdentifier: string
  ) => {
    const datasetProjectTitle = projectDetailsTitlePage.projectDetailsTitlePageTestData[datasetNameProjectTitle];
    const datasetChiefInvestigator = chiefInvestigatorPage.chiefInvestigatorPageTestData[datasetNameChiefInvestigator];
    const datasetResearchLoctions = researchLocationsPage.researchLocationsPageTestData[datasetNameResearchLocations];
    const datasetProjectIdentifier =
      projectIdentifiersPage.projectIdentifiersPageTestData[datasetNameProjectIdentifier];
    const irasIdRunTime = await projectDetailsIRASPage.getUniqueIrasId();
    expect(confirmStringNotNull(await reviewYourAnswersPage.iras_id_text.textContent())).toBe(irasIdRunTime);
    const expectedShortProjectTitle = (await projectDetailsIRASPage.getShortProjectTitle()).trimEnd();
    const actualShortProjectTitle = confirmStringNotNull(
      (await confirmProjectDetailsPage.short_project_title_row.textContent())
        ?.replaceAll(/[’‘]/g, "'")
        .replaceAll(/[“”]/g, '"')
    );
    const actualShortProjectTitleUpdated = await removeUnwantedWhitespace(
      actualShortProjectTitle
        .replace(confirmProjectDetailsPage.confirmProjectDetailsPageTestData.Label_Texts.short_project_label, '')
        .trim()
    );
    const expectedFullProjectTitle = (await projectDetailsIRASPage.getFullProjectTitle()).trimEnd();
    const actualFullProjectTitle = confirmStringNotNull(
      (await confirmProjectDetailsPage.full_project_title_row.textContent())
        ?.replaceAll(/[’‘]/g, "'")
        .replaceAll(/[“”]/g, '"')
    );
    const actualFullProjectTitleUpdated = await removeUnwantedWhitespace(
      actualFullProjectTitle
        .replace(confirmProjectDetailsPage.confirmProjectDetailsPageTestData.Label_Texts.full_project_label, '')
        .trim()
    );
    expect.soft(actualShortProjectTitleUpdated).toBe(expectedShortProjectTitle);
    expect.soft(actualFullProjectTitleUpdated).toBe(expectedFullProjectTitle);
    for (const key in datasetProjectTitle) {
      if (Object.hasOwn(datasetProjectTitle, key)) {
        if (
          key == 'planned_project_end_day_text' ||
          key == 'planned_project_end_month_dropdown' ||
          key == 'planned_project_end_year_text'
        ) {
          const day = datasetProjectTitle.planned_project_end_day_text;
          if (!day) break;
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
    for (const key in datasetChiefInvestigator) {
      if (Object.hasOwn(datasetChiefInvestigator, key)) {
        await commonItemsPage.validateUIComponentValues(datasetChiefInvestigator, key, reviewYourAnswersPage);
      }
    }

    for (const key in datasetResearchLoctions) {
      if (Object.hasOwn(datasetResearchLoctions, key)) {
        await commonItemsPage.validateUIComponentValues(datasetResearchLoctions, key, reviewYourAnswersPage);
      }
    }

    for (const key in datasetProjectIdentifier) {
      if (Object.hasOwn(datasetProjectIdentifier, key)) {
        await commonItemsPage.validateUIComponentValues(datasetProjectIdentifier, key, reviewYourAnswersPage);
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
