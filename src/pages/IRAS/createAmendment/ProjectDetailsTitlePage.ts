import { expect, Locator, Page } from '@playwright/test';
import * as projectDetailsTitlePageTestData from '../../../resources/test_data/iras/make_changes/project_details_title_data.json';

//Declare Page Objects
export default class ProjectDetailsTitlePage {
  readonly page: Page;
  readonly projectDetailsTitlePageTestData: typeof projectDetailsTitlePageTestData;
  readonly pageHeading: Locator;
  readonly shortProjectTitleTextBoxLabel: Locator;
  readonly shortProjectTitleHintLabel: Locator;
  readonly short_project_title_text: Locator;
  readonly plannedEndDateLabel: Locator;
  readonly plannedEndDateHintLabel: Locator;
  readonly plannedEndDateDayLabel: Locator;
  readonly plannedEndDateMonthLabel: Locator;
  readonly plannedEndDateYearLabel: Locator;
  readonly planned_project_end_day_text: Locator;
  readonly planned_project_end_month_text: Locator;
  readonly planned_project_end_year_text: Locator;

  //Initialize Page Objects
  constructor(page: Page) {
    this.page = page;
    this.projectDetailsTitlePageTestData = projectDetailsTitlePageTestData;

    //Locators
    this.pageHeading = this.page.getByTestId('title');
    this.shortProjectTitleTextBoxLabel = this.page.locator('label[for="IQA0002_Text"]');
    this.shortProjectTitleHintLabel = this.page
      .locator('label[for="IQA0002_Text"]')
      .locator('..')
      .locator('..')
      .locator('div[id="rule-hint"]');
    this.short_project_title_text = this.page.getByTestId('IQA0002_Text');
    this.plannedEndDateLabel = this.page.locator('label[for="IQA0003_Text"]');
    this.plannedEndDateHintLabel = this.page
      .locator('label[for="IQA0003_Text"]')
      .locator('..')
      .locator('..')
      .locator('div[id="rule-hint"]');
    this.plannedEndDateDayLabel = this.page.locator('label[for="Questions_1_Day"]');
    this.plannedEndDateMonthLabel = this.page.locator('label[for="Questions_1_Month"]');
    this.plannedEndDateYearLabel = this.page.locator('label[for="Questions_1_Year"]');
    this.planned_project_end_day_text = this.page.getByTestId('Questions_1_Day');
    this.planned_project_end_month_text = this.page.getByTestId('Questions_1_Month');
    this.planned_project_end_year_text = this.page.getByTestId('Questions_1_Year');
  }

  async assertOnProjectDetailsTitlePage() {
    await expect(this.pageHeading).toBeVisible();
    await expect(this.pageHeading).toHaveText(this.projectDetailsTitlePageTestData.Project_Details_Title_Page.heading);
  }
}
