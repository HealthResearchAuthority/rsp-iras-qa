import { expect, Locator, Page } from '@playwright/test';
import * as projectOverviewPageTestData from '../../../resources/test_data/iras/make_changes/project_overview_page_data.json';

//Declare Page Objects
export default class ProjectOverviewPage {
  readonly page: Page;
  readonly projectOverviewPageTestData: typeof projectOverviewPageTestData;
  readonly pageHeading: Locator;
  readonly project_details_hint_label: Locator;
  readonly project_details_link: Locator;
  readonly project_short_title_label: Locator;

  //Initialize Page Objects
  constructor(page: Page) {
    this.page = page;
    this.projectOverviewPageTestData = projectOverviewPageTestData;

    //Locators
    this.pageHeading = this.page
      .getByRole('heading')
      .getByText(this.projectOverviewPageTestData.Project_Overview_Page.heading);
    this.project_details_hint_label = this.page
      .getByRole('heading')
      .getByText(this.projectOverviewPageTestData.Project_Overview_Page.project_details_hint_label);
    this.project_details_link = this.page
      .getByRole('heading')
      .getByText(this.projectOverviewPageTestData.Project_Overview_Page.project_details_link);
    this.project_short_title_label = this.page.locator('.govuk-caption-l');
  }

  //Page Methods

  async assertOnProjectOverviewPage() {
    await expect(this.pageHeading).toBeVisible();
  }
}
