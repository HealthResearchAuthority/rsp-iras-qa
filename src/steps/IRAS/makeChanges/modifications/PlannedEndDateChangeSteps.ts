import { createBdd } from 'playwright-bdd';
import { expect, test } from '../../../../hooks/CustomFixtures';

const { Then } = createBdd(test);

Then(
  'I fill the planned project end date modifications page with {string}',
  async ({ commonItemsPage, plannedEndDateChangePage }, datasetName: string) => {
    const dataset = plannedEndDateChangePage.plannedEndDateChangePageTestData[datasetName];
    for (const key in dataset) {
      if (Object.hasOwn(dataset, key)) {
        await commonItemsPage.fillUIComponent(dataset, key, plannedEndDateChangePage);
      }
    }
  }
);

Then(
  'I validate {string} and {string} displayed on planned project end date modifications page for {string}',
  async (
    { commonItemsPage, plannedEndDateChangePage },
    errorMessageFieldDatasetName: string,
    errorMessageSummaryDatasetName: string,
    invalidFieldsDatasetName: string
  ) => {
    const errorMessageFieldDataset =
      plannedEndDateChangePage.plannedEndDateChangePageTestData[errorMessageFieldDatasetName];
    const errorMessageSummaryDataset =
      plannedEndDateChangePage.plannedEndDateChangePageTestData[errorMessageSummaryDatasetName];
    const invalidFieldsDataset = plannedEndDateChangePage.plannedEndDateChangePageTestData[invalidFieldsDatasetName];
    for (const key in invalidFieldsDataset) {
      if (Object.hasOwn(invalidFieldsDataset, key)) {
        await commonItemsPage.validateErrorMessage(
          errorMessageFieldDataset,
          errorMessageSummaryDataset,
          key,
          plannedEndDateChangePage
        );
      }
    }
  }
);

Then('I fill todays date in planned project end date for modifications', async ({ plannedEndDateChangePage }) => {
  const todayDate = new Date();
  await plannedEndDateChangePage.planned_project_end_day_text.fill(todayDate.getDate().toString());
  await plannedEndDateChangePage.planned_project_end_month_dropdown.selectOption(
    todayDate.toLocaleString('en-US', { month: 'long' })
  );
  await plannedEndDateChangePage.planned_project_end_year_text.fill(todayDate.getFullYear().toString());
});

Then(
  'I validate the ui labels for planned project end date page in modifications using {string} dataset',
  async ({ plannedEndDateChangePage, projectDetailsTitlePage }, datasetName) => {
    const dataset = projectDetailsTitlePage.projectDetailsTitlePageTestData[datasetName];
    const currentPlannedEndDateExpected =
      dataset.planned_project_end_day_text +
      ' ' +
      dataset.planned_project_end_month_dropdown +
      ' ' +
      dataset.planned_project_end_year_text;
    const plannedEndDateHintLabelExpected =
      plannedEndDateChangePage.plannedEndDateChangePageTestData.Label_Texts.planned_project_end_date_hint_label;
    await expect
      .soft(plannedEndDateChangePage.current_planned_end_date_label.getByText(currentPlannedEndDateExpected))
      .toBeVisible();
    expect
      .soft(await plannedEndDateChangePage.planned_end_date_hint_label.textContent())
      .toBe(plannedEndDateHintLabelExpected);
  }
);

Then(
  'I can see previously saved values for {string} displayed on the change to planned end date page',
  async ({ commonItemsPage, plannedEndDateChangePage }, datasetName: string) => {
    const dataset = plannedEndDateChangePage.plannedEndDateChangePageTestData[datasetName];
    for (const key in dataset) {
      if (Object.hasOwn(dataset, key)) {
        await commonItemsPage.validateUIComponentValues(dataset, key, plannedEndDateChangePage);
      }
    }
  }
);
