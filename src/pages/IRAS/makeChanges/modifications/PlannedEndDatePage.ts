import { Locator, Page } from '@playwright/test';
import * as plannedEndDatePageTestData from '../../../../resources/test_data/iras/make_changes/modifications/planned_end_date_data.json';

//Declare Page Objects
export default class PlannedEndDatePage {
  readonly page: Page;
  readonly plannedEndDatePageTestData: typeof plannedEndDatePageTestData;
  readonly planned_project_end_day_text: Locator;
  readonly planned_project_end_month_dropdown: Locator;
  readonly planned_project_end_year_text: Locator;
  readonly planned_project_end_day_text_summary_error_label: Locator;
  readonly planned_project_end_month_dropdown_summary_error_label: Locator;
  readonly planned_project_end_year_text_summary_error_label: Locator;
  readonly current_planned_end_date_label: Locator;
  readonly planned_end_date_hint_label: Locator;

  //Initialize Page Objects
  constructor(page: Page) {
    this.page = page;
    this.plannedEndDatePageTestData = plannedEndDatePageTestData;

    //Locators
    this.planned_project_end_day_text = this.page
      .getByText(this.plannedEndDatePageTestData.Label_Texts.new_planned_project_end_date_label)
      .locator('..')
      .getByText(this.plannedEndDatePageTestData.Label_Texts.planned_project_end_date_day_label);
    this.planned_project_end_month_dropdown = this.page
      .getByText(this.plannedEndDatePageTestData.Label_Texts.new_planned_project_end_date_label)
      .locator('..')
      .getByTestId('NewPlannedEndDate.Month');
    this.planned_project_end_year_text = this.page
      .getByText(this.plannedEndDatePageTestData.Label_Texts.new_planned_project_end_date_label)
      .locator('..')
      .getByText(this.plannedEndDatePageTestData.Label_Texts.planned_project_end_date_year_label);
    this.planned_project_end_day_text_summary_error_label =
      this.planned_project_end_month_dropdown_summary_error_label =
      this.planned_project_end_year_text_summary_error_label =
        this.page.locator('a[href="#NewPlannedEndDate.Date"]');
    this.current_planned_end_date_label = this.page
      .getByText(this.plannedEndDatePageTestData.Label_Texts.current_planned_end_date_label)
      .locator('..');
    this.planned_end_date_hint_label = this.page.getByTestId('NewPlannedEndDate_Date-hint');
  }

  //Page Methods
}
