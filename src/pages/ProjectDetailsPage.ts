import { expect, Locator, Page } from '@playwright/test';

//Declare Page Objects
export default class ProjectDetailsPage {
  readonly page: Page;
  readonly contentHeader: Locator;

  //Initialize Page Objects
  constructor(page: Page) {
    this.page = page;

    //Locators
    this.contentHeader = page.locator('h2[class="header-title"]', {hasText: 'Project Contents'});
  }

  //Page Methods
  async assertOnProjectDetailsPage() {
    await expect(this.contentHeader).toBeVisible();
  }
}
