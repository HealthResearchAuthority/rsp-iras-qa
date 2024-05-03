import { expect, Locator, Page } from '@playwright/test';
import * as projectDetailsPageTestData from "../resources/test_data/iras/project_details_page_data.json";

//Declare Page Objects
export default class ProjectDetailsPage {
  readonly page: Page;
  readonly projectDetailsPageTestData: typeof projectDetailsPageTestData;
  readonly contentHeader: Locator;

  //Initialize Page Objects
  constructor(page: Page) {
    this.page = page;
    this.projectDetailsPageTestData = projectDetailsPageTestData;

    //Locators
    this.contentHeader = page.locator('h2[class="header-title"]', {hasText: 'Project Contents'});
  }

  //Page Methods
  async assertOnProjectDetailsPage() {
    await expect(this.contentHeader).toBeVisible();
  }
}
