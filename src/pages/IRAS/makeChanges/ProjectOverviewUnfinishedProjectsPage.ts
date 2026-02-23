import { expect, Locator, Page } from '@playwright/test';
import * as projectOverviewUnfinishedProjectsPageTestData from '../../../resources/test_data/iras/make_changes/project_overview_unfinished_projects_page_data.json';

//Declare Page Objects
export default class ProjectOverviewUnfinishedProjectsPage {
  readonly page: Page;
  readonly projectOverviewUnfinishedProjectsPageTestData: typeof projectOverviewUnfinishedProjectsPageTestData;
  readonly pageHeading: Locator;
  readonly project_short_title_text: Locator;
  readonly irasid_text: Locator;
  readonly status_text: Locator;

  //Initialize Page Objects
  constructor(page: Page) {
    this.page = page;
    this.projectOverviewUnfinishedProjectsPageTestData = projectOverviewUnfinishedProjectsPageTestData;
    this.project_short_title_text = this.page.locator('div.govuk-inset-text p').nth(1);
    this.irasid_text = this.page.locator('div.govuk-inset-text p').first();
    this.status_text = this.page.locator('.govuk-tag--blue:visible');

    //Locators
    this.pageHeading = this.page
      .getByRole('heading')
      .getByText(this.projectOverviewUnfinishedProjectsPageTestData.Project_Overview_Page.heading);
  }

  //Page Methods
  async assertOnProjectOverviewUnfinishedProjectsPage() {
    await expect(this.pageHeading).toBeVisible();
  }
}
