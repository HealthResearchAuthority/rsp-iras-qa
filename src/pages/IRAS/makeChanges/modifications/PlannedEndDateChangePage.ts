import { Locator, Page } from '@playwright/test';
import * as plannedEndDateChangePageTestData from '../../../../resources/test_data/iras/make_changes/modifications/planned_end_date_change_data.json';
import CommonItemsPage from '../../../Common/CommonItemsPage';

//Declare Page Objects
export default class PlannedEndDateChangePage {
  readonly page: Page;
  readonly plannedEndDateChangePageTestData: typeof plannedEndDateChangePageTestData;
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
    this.plannedEndDateChangePageTestData = plannedEndDateChangePageTestData;

    //Locators
    this.planned_project_end_day_text = this.page
      .getByText(this.plannedEndDateChangePageTestData.Label_Texts.new_planned_project_end_date_label)
      .locator('..')
      .getByText(this.plannedEndDateChangePageTestData.Label_Texts.planned_project_end_date_day_label);
    this.planned_project_end_month_dropdown = this.page
      .getByText(this.plannedEndDateChangePageTestData.Label_Texts.new_planned_project_end_date_label)
      .locator('..')
      .getByTestId('Questions[0].Month');
    this.planned_project_end_year_text = this.page
      .getByText(this.plannedEndDateChangePageTestData.Label_Texts.new_planned_project_end_date_label)
      .locator('..')
      .getByText(this.plannedEndDateChangePageTestData.Label_Texts.planned_project_end_date_year_label);
    this.planned_project_end_day_text_summary_error_label =
      this.planned_project_end_month_dropdown_summary_error_label =
      this.planned_project_end_year_text_summary_error_label =
        this.page.locator('a[href="#Questions[0].AnswerText"]');
    this.current_planned_end_date_label = this.page
      .getByText(this.plannedEndDateChangePageTestData.Label_Texts.current_planned_end_date_label)
      .locator('..');
    this.planned_end_date_hint_label = this.page.getByTestId('NewPlannedEndDate_Date-hint');
  }

  //Page Methods
  async fillPlannedProjectEndDateModificationsPage(dataset: any, action: string) {
    const commonItemsPage = new CommonItemsPage(this.page);
    for (const key in dataset) {
      if (Object.hasOwn(dataset, key)) {
        if (
          key === 'planned_project_end_day_text' ||
          key === 'planned_project_end_month_dropdown' ||
          key === 'planned_project_end_year_text'
        ) {
          await commonItemsPage.fillUIComponent(dataset, key, this);
        }
      }
    }
    if (action === 'create') {
      await commonItemsPage.clickButton('Modifications_Page', 'Save_Continue');
    } else {
      await commonItemsPage.clickButton('Review_Changes_Planned_End_Date_Page', 'Save_Changes');
    }
  }
}
