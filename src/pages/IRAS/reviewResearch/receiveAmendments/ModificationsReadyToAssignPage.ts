import { expect, Locator, Page } from '@playwright/test';
import * as modificationsReadyToAssignPageTestData from '../../../../resources/test_data/iras/reviewResearch/receiveAmendments/modifications_ready_to_assign_page_data.json';
import * as searchFilterResultsData from '../../../../resources/test_data/common/search_filter_results_data.json';

//Declare Page Objects
export default class ModificationsReadyToAssignPage {
  readonly page: Page;
  readonly modificationsReadyToAssignPageTestData: typeof modificationsReadyToAssignPageTestData;
  readonly searchFilterResultsData: typeof searchFilterResultsData;
  private _modification_record: string;
  readonly modifications_tasklist_link: Locator;
  readonly short_project_title_column_label: Locator;
  readonly modification_id_column_label: Locator;
  readonly date_submitted_column_label: Locator;
  readonly days_since_submission_column_label: Locator;
  readonly checkall_modification_checkbox: Locator;
  readonly page_heading: Locator;
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
  readonly iras_id_search_text: Locator;
  readonly study_wide_reviewer_text: Locator;

  //Initialize Page Objects
  constructor(page: Page) {
    this.page = page;
    this.modificationsReadyToAssignPageTestData = modificationsReadyToAssignPageTestData;
    this.searchFilterResultsData = searchFilterResultsData;
    this._modification_record = '';

    //Locators
    this.modifications_tasklist_link = this.page.locator('.govuk-heading-s govuk-link hra-card-heading__link');
    this.short_project_title_column_label = this.page
      .getByRole('button')
      .getByText(this.modificationsReadyToAssignPageTestData.Column_Label_Texts.short_project_title_column_label, {
        exact: true,
      });
    this.modification_id_column_label = this.page
      .getByRole('button')
      .getByText(this.modificationsReadyToAssignPageTestData.Column_Label_Texts.modification_id_column_label, {
        exact: true,
      });
    this.date_submitted_column_label = this.page
      .getByRole('button')
      .getByText(this.modificationsReadyToAssignPageTestData.Column_Label_Texts.date_submitted_column_label, {
        exact: true,
      });
    this.days_since_submission_column_label = this.page
      .getByRole('button')
      .getByText(this.modificationsReadyToAssignPageTestData.Column_Label_Texts.days_since_submission_column_label, {
        exact: true,
      });
    this.search_input_text = this.page.getByTestId('Search_IrasId');
    this.checkall_modification_checkbox = this.page.getByTestId('select-all-modifications');
    this.page_heading = this.page.getByTestId('title');
    this.page_description = this.page
      .getByRole('paragraph')
      .getByText(this.modificationsReadyToAssignPageTestData.Modifications_Ready_To_Assign_Page.page_description);
    this.advanced_filter_label = this.page.getByRole('button', {
      name: this.modificationsReadyToAssignPageTestData.Modifications_Ready_To_Assign_Page.advanced_filter_label,
    });
    this.date_from_filter_input = this.page.getByTestId('Search_FromDate_date');
    this.day_from_text = this.date_from_filter_input.getByLabel(
      this.modificationsReadyToAssignPageTestData.Filter_Labels.day_from_label
    );
    this.month_from_dropdown = this.date_from_filter_input.getByLabel(
      this.modificationsReadyToAssignPageTestData.Filter_Labels.month_from_label
    );
    this.year_from_text = this.date_from_filter_input.getByLabel(
      this.modificationsReadyToAssignPageTestData.Filter_Labels.year_from_label
    );
    this.date_to_filter_input = this.page.getByTestId('Search_ToDate_date');
    this.day_to_text = this.date_to_filter_input.getByLabel(
      this.modificationsReadyToAssignPageTestData.Filter_Labels.day_to_label
    );
    this.month_to_dropdown = this.date_to_filter_input.getByLabel(
      this.modificationsReadyToAssignPageTestData.Filter_Labels.month_to_label
    );
    this.year_to_text = this.date_to_filter_input.getByLabel(
      this.modificationsReadyToAssignPageTestData.Filter_Labels.year_to_label
    );
    this.days_since_submission_from_text = this.page.getByTestId('Search.FromDaysSinceSubmission');
    this.days_since_submission_to_text = this.page.getByTestId('Search.ToDaysSinceSubmission');
    // this.short_project_title_text = this.page.getByLabel(
    //   this.modificationsReadyToAssignPageTestData.Filter_Labels.short_project_title_label
    // );
    this.short_project_title_text = this.page.locator('input[name="Search.ShortProjectTitle"]'); //workaround use above after fix
    this.search_button_label = this.page.getByText('Search');
    this.modification_checkbox = this.page.locator('input[name="selectedModificationIds"][type="checkbox"]');
    this.results_table = this.page.getByTestId('modificationsTasklistTable');
    this.iras_id_search_text = this.page.getByLabel(
      this.modificationsReadyToAssignPageTestData.Modifications_Ready_To_Assign_Page.iras_id_search_box_label,
      { exact: true }
    );
    this.study_wide_reviewer_text = this.page.locator('input[name="Search.ReviewerName"]'); //workaround use above after fix
  }

  //Getters & Setters for Private Variables

  async getSelectedModifications(): Promise<string> {
    return this._modification_record;
  }

  async setSelectedModifications(value: string): Promise<void> {
    this._modification_record = value;
  }

  //Page Methods
  async goto() {
    await this.page.goto('modificationstasklist/index');
  }

  async assertOnModificationsReadyToAssignPage() {
    await expect(this.page_heading).toBeVisible();
    expect
      .soft(await this.page.title())
      .toBe(this.modificationsReadyToAssignPageTestData.Modifications_Ready_To_Assign_Page.title);
  }
}
