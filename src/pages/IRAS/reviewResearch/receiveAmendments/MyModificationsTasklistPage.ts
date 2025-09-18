import { expect, Locator, Page } from '@playwright/test';
import * as myModificationsTasklistPageTestData from '../../../../resources/test_data/iras/reviewResearch/receiveAmendments/my_modifications_tasklist_page_data.json';
import * as searchFilterResultsData from '../../../../resources/test_data/common/search_filter_results_data.json';

//Declare Page Objects
export default class MyModificationsTasklistPage {
  readonly page: Page;
  readonly myModificationsTasklistPageTestData: typeof myModificationsTasklistPageTestData;
  readonly searchFilterResultsData: typeof searchFilterResultsData;
  readonly page_heading: Locator;
  readonly short_project_title_column_label: Locator;
  readonly modification_id_column_label: Locator;
  readonly date_submitted_column_label: Locator;
  readonly days_since_submission_column_label: Locator;
  readonly status_column_label: Locator;
  readonly checkall_modification_checkbox: Locator;
  readonly page_description: Locator;
  readonly modification_button_label: Locator;
  readonly search_input_text: Locator;
  readonly advanced_filter_label: Locator;
  readonly date_from_filter_input: Locator;
  readonly day_from_text: Locator;
  readonly month_from_dropdown: Locator;
  readonly year_from_text: Locator;
  readonly date_to_filter_input: Locator;
  readonly day_to_text: Locator;
  readonly month_to_dropdown: Locator;
  readonly year_to_text: Locator;
  readonly days_since_submission_from_text: Locator;
  readonly days_since_submission_to_text: Locator;
  readonly short_project_title_text: Locator;
  readonly search_button_label: Locator;
  readonly modification_checkbox: Locator;
  readonly results_table: Locator;

  //Initialize Page Objects
  constructor(page: Page) {
    this.page = page;
    this.myModificationsTasklistPageTestData = myModificationsTasklistPageTestData;
    this.searchFilterResultsData = searchFilterResultsData;

    //Locators
    this.page_heading = this.page
      .getByRole('heading')
      .getByText(this.myModificationsTasklistPageTestData.My_Modifications_Tasklist_Page.page_heading);
    this.short_project_title_column_label = this.page
      .getByRole('button')
      .getByText(this.myModificationsTasklistPageTestData.Column.short_project_title_column_label, {
        exact: true,
      });
    this.modification_id_column_label = this.page
      .getByRole('button')
      .getByText(this.myModificationsTasklistPageTestData.Column.modification_id_column_label, {
        exact: true,
      });
    this.date_submitted_column_label = this.page
      .getByRole('button')
      .getByText(this.myModificationsTasklistPageTestData.Column.date_submitted_column_label, {
        exact: true,
      });
    this.days_since_submission_column_label = this.page
      .getByRole('button')
      .getByText(this.myModificationsTasklistPageTestData.Column.days_since_submission_column_label, {
        exact: true,
      });
    this.status_column_label = this.page
      .getByRole('button')
      .getByText(this.myModificationsTasklistPageTestData.Column.status_column_label, {
        exact: true,
      });
    this.search_input_text = this.page.getByTestId('Search_IrasId');
    this.checkall_modification_checkbox = this.page.getByTestId('select-all-modifications');
    this.advanced_filter_label = this.page.getByRole('button', {
      name: this.myModificationsTasklistPageTestData.My_Modifications_Tasklist_Page.advanced_filter_label,
    });
    this.date_from_filter_input = this.page.getByTestId('Search_FromDate_date');
    this.day_from_text = this.date_from_filter_input.getByLabel(
      this.myModificationsTasklistPageTestData.Filter_Labels.day_from_label
    );
    this.month_from_dropdown = this.date_from_filter_input.getByLabel(
      this.myModificationsTasklistPageTestData.Filter_Labels.month_from_label
    );
    this.year_from_text = this.date_from_filter_input.getByLabel(
      this.myModificationsTasklistPageTestData.Filter_Labels.year_from_label
    );
    this.date_to_filter_input = this.page.getByTestId('Search_ToDate_date');
    this.day_to_text = this.date_to_filter_input.getByLabel(
      this.myModificationsTasklistPageTestData.Filter_Labels.day_to_label
    );
    this.month_to_dropdown = this.date_to_filter_input.getByLabel(
      this.myModificationsTasklistPageTestData.Filter_Labels.month_to_label
    );
    this.year_to_text = this.date_to_filter_input.getByLabel(
      this.myModificationsTasklistPageTestData.Filter_Labels.year_to_label
    );
    this.days_since_submission_from_text = this.page.getByTestId('Search_FromDaysSinceSubmission');
    this.days_since_submission_to_text = this.page.getByTestId('Search_ToDaysSinceSubmission');
    // this.short_project_title_text = this.page.getByLabel(
    //   this.myModificationsTasklistPageTestData.Filter_Labels.short_project_title_label
    // );
    this.short_project_title_text = this.page.locator('input[name="Search.ShortProjectTitle"]'); //workaround use above after fix
    this.search_button_label = this.page.getByText('Search');
    this.modification_checkbox = this.page.locator('input[name="selectedModificationIds"][type="checkbox"]');
    this.results_table = this.page.getByTestId('myTasklistTable');
  }

  //Page Methods
  async goto() {
    await this.page.goto('mytasklist/index');
  }

  async assertOnMyModificationsTasklistPage() {
    await expect(this.page_heading).toBeVisible();
    await expect.soft(this.page_description).toBeVisible(); //Not visible due to CMS issue
    await expect(this.results_table).toBeVisible();
    expect(await this.page.title()).toBe(this.myModificationsTasklistPageTestData.My_Modifications_Tasklist_Page.title);
  }
}
