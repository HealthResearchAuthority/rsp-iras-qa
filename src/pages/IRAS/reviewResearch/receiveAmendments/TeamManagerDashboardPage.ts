import { expect, Locator, Page } from '@playwright/test';
import * as teamManagerDashBoardPageTestData from '../../../../resources/test_data/iras/reviewResearch/receiveAmendments/team_manager_dashboard_page_data.json';
import * as searchFilterResultsData from '../../../../resources/test_data/common/search_filter_results_data.json';

//Declare Page Objects
export default class TeamManagerDashboardPage {
  readonly page: Page;
  readonly teamManagerDashBoardPageTestData: typeof teamManagerDashBoardPageTestData;
  readonly searchFilterResultsData: typeof searchFilterResultsData;
  private _modification_record: string[];
  readonly short_project_title_column_label: Locator;
  readonly modification_id_column_label: Locator;
  readonly date_submitted_column_label: Locator;
  readonly days_since_submission_column_label: Locator;
  readonly studywide_reveiwer_column_label: Locator;
  readonly status_column_label: Locator;
  readonly page_heading: Locator;
  readonly page_description: Locator;
  readonly modification_button_label: Locator;
  readonly modification_checkbox: Locator;
  readonly results_table: Locator;

  //Initialize Page Objects
  constructor(page: Page) {
    this.page = page;
    this.teamManagerDashBoardPageTestData = teamManagerDashBoardPageTestData;
    this.searchFilterResultsData = searchFilterResultsData;
    this._modification_record = [];

    //Locators
    this.short_project_title_column_label = this.page
      .getByRole('button')
      .getByText(this.teamManagerDashBoardPageTestData.Column_Label_Texts.short_project_title_column_label, {
        exact: true,
      });
    this.modification_id_column_label = this.page
      .getByRole('button')
      .getByText(this.teamManagerDashBoardPageTestData.Column_Label_Texts.modification_id_column_label, {
        exact: true,
      });
    this.date_submitted_column_label = this.page
      .getByRole('button')
      .getByText(this.teamManagerDashBoardPageTestData.Column_Label_Texts.date_submitted_column_label, {
        exact: true,
      });
    this.days_since_submission_column_label = this.page
      .getByRole('button')
      .getByText(this.teamManagerDashBoardPageTestData.Column_Label_Texts.days_since_submission_column_label, {
        exact: true,
      });
    this.studywide_reveiwer_column_label = this.page
      .getByRole('button')
      .getByText(this.teamManagerDashBoardPageTestData.Column_Label_Texts.studywide_reveiwer_column_label, {
        exact: true,
      });
    this.status_column_label = this.page
      .getByRole('button')
      .getByText(this.teamManagerDashBoardPageTestData.Column_Label_Texts.status_column_label, {
        exact: true,
      });
    this.page_heading = this.page.getByTestId('title');
    this.page_description = this.page
      .getByRole('paragraph')
      .getByText(this.teamManagerDashBoardPageTestData.Team_Manager_Dashboard_Page.page_description);
    this.modification_checkbox = this.page.locator('input[name="selectedModificationIds"][type="checkbox"]');
    this.results_table = this.page.getByTestId('modificationsTasklistTable');
  }

  //Getters & Setters for Private Variables

  async getSelectedModifications(): Promise<string[]> {
    return this._modification_record;
  }

  async setSelectedModifications(value: string[]): Promise<void> {
    this._modification_record = value;
  }

  //Page Methods
  async goto() {
    await this.page.goto('modificationstasklist/index');
  }

  async assertOnTeamManagerDashboardPage() {
    await expect(this.page_heading).toBeVisible();
    expect.soft(await this.page.title()).toBe(this.teamManagerDashBoardPageTestData.Team_Manager_Dashboard_Page.title);
  }
}
