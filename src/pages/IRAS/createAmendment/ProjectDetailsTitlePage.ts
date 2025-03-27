import { expect, Locator, Page } from '@playwright/test';
import * as projectDetailsTitlePageTestData from '../../../resources/test_data/iras/make_changes/project_details_title_data.json';

//Declare Page Objects
export default class ProjectDetailsTitlePage {
  readonly page: Page;
  readonly projectDetailsTitlePageTestData: typeof projectDetailsTitlePageTestData;
  readonly pageHeading: Locator;
  readonly short_project_title_textbox_label: Locator;
  readonly short_project_title_text: Locator;
  readonly planned_end_date_textbox_label: Locator;
  readonly planned_end_date_hint_label: Locator;
  readonly day_textbox_label: Locator;
  readonly month_textbox_label: Locator;
  readonly year_textbox_label: Locator;
  readonly planned_project_end_day_text: Locator;
  readonly planned_project_end_month_text: Locator;
  readonly planned_project_end_year_text: Locator;

  //Initialize Page Objects
  constructor(page: Page) {
    this.page = page;
    this.projectDetailsTitlePageTestData = projectDetailsTitlePageTestData;

    //Locators
    this.pageHeading = this.page.getByTestId('title');
    this.short_project_title_textbox_label = this.page.locator('label[for="IQA0002_Text"]');
    this.short_project_title_text = this.page.getByTestId('IQA0002_Text');
    this.planned_end_date_textbox_label = this.page.locator('label[for="IQA0003_Text"]');
    this.planned_end_date_hint_label = this.page
      .locator('label[for="IQA0003_Text"]')
      .locator('..')
      .locator('..')
      .locator('div[id="rule-hint"]');
    this.day_textbox_label = this.page.locator('label[for="Questions_1_Day"]');
    this.month_textbox_label = this.page.locator('label[for="Questions_1_Month"]');
    this.year_textbox_label = this.page.locator('label[for="Questions_1_Year"]');
    this.planned_project_end_day_text = this.page.getByTestId('Questions_1_Day');
    this.planned_project_end_month_text = this.page.getByTestId('Questions_1_Month');
    this.planned_project_end_year_text = this.page.getByTestId('Questions_1_Year');
  }

  //Page Methods
  async assertOnProjectDetailsTitlePage() {
    await expect(this.pageHeading).toBeVisible();
    await expect(this.pageHeading).toHaveText(this.projectDetailsTitlePageTestData.Project_Details_Title_Page.heading);
  }
}
