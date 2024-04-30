import { expect, Locator, Page } from '@playwright/test';
import * as projectDetailsPageTestData from "../test_data/iras/project_details_page.json";

let projectDetailsPageTestDataMap = new Map(Object.entries(projectDetailsPageTestData));

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

  async validatePageTitle(dataset) {
    let pageTitle = (<any>projectDetailsPageTestDataMap).get(dataset)?.task_id;
    expect((await this.page.title()).endsWith(pageTitle)).toBeTruthy();
  }
}
