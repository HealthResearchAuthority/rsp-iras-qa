import { expect, Locator, Page } from '@playwright/test';
import * as closeProjectPageTestData from '../../../resources/test_data/iras/make_changes/close_project_data.json';

//Declare Page Objects
export default class CloseProjectPage {
  readonly page: Page;
  readonly closeProjectPageTestData: typeof closeProjectPageTestData;
  readonly pageHeading: Locator;
  readonly close_project_date_formgroup: Locator;
  readonly close_project_actual_project_closure_date_day_textbox: Locator;
  readonly close_project_actual_project_closure_date_month_dropdown: Locator;
  readonly close_project_actual_project_closure_date_year_textbox: Locator;
  readonly close_project_actual_project_closure_date_hint_label: Locator;
  readonly close_project_now_send_to_sponsor_label: Locator;
  readonly close_project_now_send_to_sponsor_hint_label: Locator;

  //Initialize Page Objects
  constructor(page: Page) {
    this.page = page;
    this.closeProjectPageTestData = closeProjectPageTestData;

    //Locators
    this.pageHeading = this.page.getByRole('heading', {
      name: closeProjectPageTestData.Close_Project_Page.heading,
    });
    this.close_project_date_formgroup = this.page
      .getByText(this.closeProjectPageTestData.Close_Project_Page.close_project_planned_project_end_date_label)
      .locator('..');
    this.close_project_actual_project_closure_date_day_textbox = this.close_project_date_formgroup
      .getByText(this.closeProjectPageTestData.Close_Project_Page.close_project_actual_project_closure_date_day_label)
      .locator('..')
      .getByRole('textbox');
    this.close_project_actual_project_closure_date_month_dropdown = this.close_project_date_formgroup
      .getByText(this.closeProjectPageTestData.Close_Project_Page.close_project_actual_project_closure_date_month_label)
      .locator('..')
      .getByRole('combobox');
    this.close_project_actual_project_closure_date_year_textbox = this.close_project_date_formgroup
      .getByText(this.closeProjectPageTestData.Close_Project_Page.close_project_actual_project_closure_date_year_label)
      .locator('..')
      .getByRole('textbox');
    this.close_project_actual_project_closure_date_hint_label = this.page
      .getByTestId('Questions[1]_AnswerText-hint')
      .locator('p');
    this.close_project_now_send_to_sponsor_label = this.page
      .getByTestId('Questions[1].AnswerText')
      .locator('legend')
      .first();
    this.close_project_now_send_to_sponsor_hint_label = this.page.locator(
      'div[aria-hidden="true"].govuk-character-count__message'
    );
  }

  //Page Methods
  async assertOnCloseProjectPage() {
    await expect(this.pageHeading).toBeVisible();
  }
}
