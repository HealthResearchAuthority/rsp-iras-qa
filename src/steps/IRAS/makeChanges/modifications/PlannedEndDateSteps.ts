import { createBdd } from 'playwright-bdd';
import { expect, test } from '../../../../hooks/CustomFixtures';

const { Then } = createBdd(test);

Then(
  'I fill the planned project end date modifications page with {string}',
  async ({ commonItemsPage, plannedEndDatePage }, datasetName: string) => {
    const dataset = plannedEndDatePage.plannedEndDatePageTestData[datasetName];
    for (const key in dataset) {
      if (Object.hasOwn(dataset, key)) {
        await commonItemsPage.fillUIComponent(dataset, key, plannedEndDatePage);
      }
    }
  }
);

Then(
  'I validate {string} and {string} displayed on planned project end date modifications page for {string}',
  async (
    { commonItemsPage, plannedEndDatePage },
    errorMessageFieldDatasetName: string,
    errorMessageSummaryDatasetName: string,
    invalidFieldsDatasetName: string
  ) => {
    const errorMessageFieldDataset = plannedEndDatePage.plannedEndDatePageTestData[errorMessageFieldDatasetName];
    const errorMessageSummaryDataset = plannedEndDatePage.plannedEndDatePageTestData[errorMessageSummaryDatasetName];
    const invalidFieldsDataset = plannedEndDatePage.plannedEndDatePageTestData[invalidFieldsDatasetName];
    for (const key in invalidFieldsDataset) {
      if (Object.hasOwn(invalidFieldsDataset, key)) {
        await commonItemsPage.validateErrorMessage(
          errorMessageFieldDataset,
          errorMessageSummaryDataset,
          key,
          plannedEndDatePage
        );
      }
    }
  }
);

Then('I fill todays date in planned project end date for modifications', async ({ plannedEndDatePage }) => {
  const todayDate = new Date();
  await plannedEndDatePage.planned_project_end_day_text.fill(todayDate.getDate().toString());
  await plannedEndDatePage.planned_project_end_month_dropdown.selectOption(
    todayDate.toLocaleString('en-US', { month: 'long' })
  );
  await plannedEndDatePage.planned_project_end_year_text.fill(todayDate.getFullYear().toString());
});

Then(
  'I validate the ui labels for planned project end date page in modifications using {string} dataset',
  async ({ plannedEndDatePage, projectDetailsTitlePage }, datasetName) => {
    const dataset = projectDetailsTitlePage.projectDetailsTitlePageTestData[datasetName];
    const currentPlannedEndDateExpected =
      dataset.planned_project_end_day_text +
      ' ' +
      dataset.planned_project_end_month_dropdown +
      ' ' +
      dataset.planned_project_end_year_text;
    const plannedEndDateHintLabelExpected =
      plannedEndDatePage.plannedEndDatePageTestData.Label_Texts.planned_project_end_date_hint_label;
    await expect(
      plannedEndDatePage.current_planned_end_date_label.getByText(currentPlannedEndDateExpected)
    ).toBeVisible();
    expect(await plannedEndDatePage.planned_end_date_hint_label.textContent()).toBe(plannedEndDateHintLabelExpected);
  }
);
