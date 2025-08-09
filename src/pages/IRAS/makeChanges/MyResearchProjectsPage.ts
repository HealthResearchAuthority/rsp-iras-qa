import { expect, Locator, Page } from '@playwright/test';
import * as myResearchProjectsPageTestData from '../../../resources/test_data/iras/make_changes/my_research_projects_data.json';

//Declare Page Objects
export default class MyResearchProjectsPage {
  readonly page: Page;
  readonly myResearchProjectsPageTestData: typeof myResearchProjectsPageTestData;
  readonly page_heading: Locator;
  readonly no_projects_available_label: Locator;
  readonly add_project_record_button_label: Locator;
  readonly project_search_button_label: Locator;
  readonly advanced_filter_label: Locator;
  readonly short_project_title_link: Locator;
  readonly iras_id_title: Locator;
  readonly date_added_title: Locator;
  readonly status_title: Locator;

  //Initialize Page Objects
  constructor(page: Page) {
    this.page = page;
    this.myResearchProjectsPageTestData = myResearchProjectsPageTestData;

    //Locators
    this.page_heading = this.page
      .getByRole('heading')
      .getByText(this.myResearchProjectsPageTestData.My_Research_Projects_Page.heading, { exact: true });
    this.no_projects_available_label = this.page
      .locator('p[class="govuk-body"]')
      .getByText(this.myResearchProjectsPageTestData.Label_Texts.no_projects);
    this.add_project_record_button_label = this.page.getByRole('link', { name: 'Add project' });
    this.project_search_button_label = this.page.getByRole('button', {
      name: this.myResearchProjectsPageTestData.My_Research_Projects_Page.search,
      exact: true,
    });
    this.advanced_filter_label = this.page.getByRole('button', {
      name: this.myResearchProjectsPageTestData.My_Research_Projects_Page.advanced_filter_label,
    });
  }

  //Page Methods
  async goto() {
    await this.page.goto('/application/welcome/');
  }

  async assertOnMyResearchProjectsPage() {
    await expect(this.pageHeading).toBeVisible();
    await expect(this.btnCreateProjectRecord).toBeVisible();
    await expect(this.noProjectsAvailableLabel).toBeVisible();
  }
}
