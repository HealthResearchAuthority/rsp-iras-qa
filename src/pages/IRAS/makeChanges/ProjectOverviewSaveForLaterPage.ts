import { expect, Locator, Page } from '@playwright/test';
import * as projectOverviewSaveForLaterPageTestData from '../../../resources/test_data/iras/make_changes/project_overview_save_for_later_page_data.json';

//Declare Page Objects
export default class ProjectOverviewSaveForLaterPage {
  readonly page: Page;
  readonly projectOverviewSaveForLaterPageTestData: typeof projectOverviewSaveForLaterPageTestData;
  readonly pageHeading: Locator;
  readonly project_details_hint_label: Locator;
  readonly project_details_link: Locator;
  readonly project_short_title_label: Locator;

  //Initialize Page Objects
  constructor(page: Page) {
    this.page = page;
    this.projectOverviewSaveForLaterPageTestData = projectOverviewSaveForLaterPageTestData;

    //Locators
    this.pageHeading = this.page
      .getByRole('heading')
      .getByText(this.projectOverviewSaveForLaterPageTestData.Project_Overview_Save_For_Later_Page.heading);
    this.project_details_hint_label = this.page
      .getByRole('heading')
      .getByText(
        this.projectOverviewSaveForLaterPageTestData.Project_Overview_Save_For_Later_Page.project_details_hint_label
      );
    this.project_details_link = this.page
      .getByRole('heading')
      .getByText(
        this.projectOverviewSaveForLaterPageTestData.Project_Overview_Save_For_Later_Page.project_details_link
      );
    this.project_short_title_label = this.page.locator('.govuk-caption-xl');
  }

  //Page Methods

  async assertOnProjectOverviewSaveForLaterPage() {
    await expect(this.pageHeading).toBeVisible();
  }
}
