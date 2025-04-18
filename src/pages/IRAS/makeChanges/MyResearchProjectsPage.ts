import { expect, Locator, Page } from '@playwright/test';
import * as myResearchProjectsPageTestData from '../../../resources/test_data/iras/make_changes/my_research_projects_data.json';

//Declare Page Objects
export default class MyResearchProjectsPage {
  readonly page: Page;
  readonly myResearchProjectsPageTestData: typeof myResearchProjectsPageTestData;
  readonly pageHeading: Locator;
  readonly noProjectsAvailableLabel: Locator;

  //Initialize Page Objects
  constructor(page: Page) {
    this.page = page;
    this.myResearchProjectsPageTestData = myResearchProjectsPageTestData;

    //Locators
    this.pageHeading = this.page.getByTestId('title');
    this.noProjectsAvailableLabel = this.page.locator('p[class="govuk-body"]').nth(0);
  }

  //Page Methods
  async goto() {
    await this.page.goto('');
  }

  async assertOnMyResearchProjectsPage() {
    await expect(this.pageHeading).toBeVisible();
    await expect(this.pageHeading).toHaveText(this.myResearchProjectsPageTestData.My_Research_Projects_Page.heading);
  }
}
