import { expect, Locator, Page } from '@playwright/test';
import * as projectDetailsTitlePageTestData from '../../../resources/test_data/iras/make_changes/project_details_title_data.json';

//Declare Page Objects
export default class ProjectDetailsTitlePage {
  readonly page: Page;
  readonly projectDetailsTitlePageTestData: typeof projectDetailsTitlePageTestData;
  readonly pageHeading: Locator;
  readonly short_project_title_textbox_label: Locator;
  readonly provide_project_title_textbox_label: Locator;
  readonly short_project_title_text: Locator;
  readonly planned_end_date_textbox_label: Locator;
  readonly planned_end_date_hint_label: Locator;
  readonly day_textbox_label: Locator;
  readonly month_dropdown_label: Locator;
  readonly year_textbox_label: Locator;
  readonly planned_project_end_day_text: Locator;
  readonly planned_project_end_month_dropdown: Locator;
  readonly planned_project_end_year_text: Locator;
  readonly short_project_title_text_summary_error_label: Locator;
  readonly planned_project_end_day_text_summary_error_label: Locator;
  readonly planned_project_end_month_dropdown_summary_error_label: Locator;
  readonly planned_project_end_year_text_summary_error_label: Locator;

  //Initialize Page Objects
  constructor(page: Page) {
    this.page = page;
    this.projectDetailsTitlePageTestData = projectDetailsTitlePageTestData;

    //Locators
    this.pageHeading = this.page.getByTestId('title');
    this.short_project_title_textbox_label = this.page.getByText(
      this.projectDetailsTitlePageTestData.Label_Texts.short_project_title_textbox_label
    );
    this.provide_project_title_textbox_label = this.page.locator('#short-project-title-hint p');
    this.short_project_title_text = this.page.getByTestId('IQA0002_Text');
    this.planned_end_date_textbox_label = this.page.locator('label[for="Questions[1].AnswerText"]');
    this.planned_end_date_hint_label = this.page.getByTestId('Questions[1]_AnswerText-hint').locator('p');
    this.day_textbox_label = this.page.locator('label[for="Questions[1].Day"]');
    this.month_dropdown_label = this.page.locator('label[for="Questions[1].Month"]');
    this.year_textbox_label = this.page.locator('label[for="Questions[1].Year"]');
    this.planned_project_end_day_text = this.page.getByTestId('Questions[1].Day');
    this.planned_project_end_month_dropdown = this.page.getByTestId('Questions[1].Month');
    this.planned_project_end_year_text = this.page.getByTestId('Questions[1].Year');
    this.short_project_title_text_summary_error_label = this.page.locator('a[href="#Questions[0].AnswerText"]');
    this.planned_project_end_day_text_summary_error_label =
      this.planned_project_end_month_dropdown_summary_error_label =
      this.planned_project_end_year_text_summary_error_label =
        this.page.locator('a[href="#Questions[1].AnswerText"]');
  }

  //Page Methods
  async assertOnProjectDetailsTitlePage() {
    await expect(this.pageHeading).toBeVisible();
    await expect(this.pageHeading).toHaveText(this.projectDetailsTitlePageTestData.Project_Details_Title_Page.heading);
  }
}
