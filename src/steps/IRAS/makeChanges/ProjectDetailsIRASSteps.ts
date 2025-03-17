import { createBdd } from 'playwright-bdd';
import { expect, test } from '../../../hooks/CustomFixtures';

const { Then } = createBdd(test);

Then(
  'I can see the {string} on the project details title page',
  async ({ projectDetailsTitlePage }, datasetName: string) => {
    const dataset = projectDetailsTitlePage.projectDetailsTitlePageTestData[datasetName];
    expect(await projectDetailsTitlePage.shortProjectTitleTextBoxLabel.textContent()).toBe(
      dataset.short_project_title_textbox_label
    );
    expect(await projectDetailsTitlePage.plannedEndDateLabel.textContent()).toBe(
      dataset.planned_end_date_textbox_label
    );
    expect(await projectDetailsTitlePage.plannedEndDateDayLabel.textContent()).toBe(dataset.day_textbox_label);
    expect(await projectDetailsTitlePage.plannedEndDateMonthLabel.textContent()).toBe(dataset.month_textbox_label);
    expect(await projectDetailsTitlePage.plannedEndDateYearLabel.textContent()).toBe(dataset.year_textbox_label);
  }
);

Then(
  'I fill the project details title page with {string}',
  async ({ projectDetailsTitlePage }, datasetName: string) => {
    const dataset = projectDetailsTitlePage.projectDetailsTitlePageTestData[datasetName];
    await projectDetailsTitlePage.shortProjectTitleTextBox.fill(dataset.short_project_title);
    await projectDetailsTitlePage.plannedEndDateTextBox.fill(dataset.planned_project_end_date);
  }
);

Then(
  'I can see {string} displayed on the project details title page',
  async ({ projectDetailsTitlePage }, datasetName: string) => {
    const dataset = projectDetailsTitlePage.projectDetailsTitlePageTestData[datasetName];
    expect(await projectDetailsTitlePage.shortProjectTitleTextBox.textContent()).toBe(dataset.short_project_title);
    expect(await projectDetailsTitlePage.plannedEndDateTextBox.textContent()).toBe(dataset.planned_project_end_date);
  }
);
