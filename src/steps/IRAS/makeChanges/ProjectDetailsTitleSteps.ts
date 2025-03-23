import { createBdd } from 'playwright-bdd';
import { expect, test } from '../../../hooks/CustomFixtures';

const { Then } = createBdd(test);

Then('I can see the project details title page', async ({ projectDetailsTitlePage }) => {
  await projectDetailsTitlePage.assertOnProjectDetailsTitlePage();
});

Then(
  'I can see the {string} ui labels on the project details title page',
  async ({ projectDetailsTitlePage }, datasetName: string) => {
    const dataset = projectDetailsTitlePage.projectDetailsTitlePageTestData[datasetName];
    expect((await projectDetailsTitlePage.shortProjectTitleTextBoxLabel.textContent())?.trim()).toBe(
      dataset.short_project_title_textbox_label
    );
    expect((await projectDetailsTitlePage.plannedEndDateLabel.textContent())?.trim()).toBe(
      dataset.planned_end_date_textbox_label
    );
    expect((await projectDetailsTitlePage.plannedEndDateHintLabel.textContent())?.trim()).toBe(
      dataset.planned_end_date_hint_label
    );
    expect(await projectDetailsTitlePage.plannedEndDateDayLabel.textContent()).toBe(dataset.day_textbox_label);
    expect(await projectDetailsTitlePage.plannedEndDateMonthLabel.textContent()).toBe(dataset.month_textbox_label);
    expect(await projectDetailsTitlePage.plannedEndDateYearLabel.textContent()).toBe(dataset.year_textbox_label);
  }
);

Then(
  'I fill the project details title page with {string}',
  async ({ commonItemsPage, projectDetailsTitlePage }, datasetName: string) => {
    const dataset = projectDetailsTitlePage.projectDetailsTitlePageTestData[datasetName];
    for (const key in dataset) {
      if (Object.prototype.hasOwnProperty.call(dataset, key)) {
        await commonItemsPage.fillUIComponent(dataset, key, projectDetailsTitlePage);
      }
    }
  }
);

Then(
  'I fill todays date for planned project end date in project details title page',
  async ({ projectDetailsTitlePage }) => {
    const todayDate = new Date();
    await projectDetailsTitlePage.planned_project_end_day_text.fill(todayDate.getDate().toString());
    await projectDetailsTitlePage.planned_project_end_month_text.fill((todayDate.getMonth() + 1).toString());
    await projectDetailsTitlePage.planned_project_end_year_text.fill(todayDate.getFullYear().toString());
  }
);

Then(
  'I can see previously saved values for {string} displayed on the project details title page',
  async ({ commonItemsPage, projectDetailsTitlePage }, datasetName: string) => {
    const dataset = projectDetailsTitlePage.projectDetailsTitlePageTestData[datasetName];
    for (const key in dataset) {
      if (Object.prototype.hasOwnProperty.call(dataset, key)) {
        await commonItemsPage.validateUIComponentValues(dataset, key, projectDetailsTitlePage);
      }
    }
  }
);

Then(
  'I validate {string} and {string} displayed on project details title page for {string}',
  async (
    { commonItemsPage, projectDetailsTitlePage },
    errorMessageFieldDatasetName: string,
    errorMessageSummaryDatasetName: string,
    invalidFieldsDatasetName: string
  ) => {
    const errorMessageFieldDataset =
      projectDetailsTitlePage.projectDetailsTitlePageTestData[errorMessageFieldDatasetName];
    const errorMessageSummaryDataset =
      projectDetailsTitlePage.projectDetailsTitlePageTestData[errorMessageSummaryDatasetName];
    const invalidFieldsDataset = projectDetailsTitlePage.projectDetailsTitlePageTestData[invalidFieldsDatasetName];
    for (const key in invalidFieldsDataset) {
      if (Object.prototype.hasOwnProperty.call(invalidFieldsDataset, key)) {
        await commonItemsPage.validateErrorMessage(
          errorMessageFieldDataset,
          errorMessageSummaryDataset,
          key,
          projectDetailsTitlePage
        );
      }
    }
  }
);
