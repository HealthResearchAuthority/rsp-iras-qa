import { expect, Locator, Page } from '@playwright/test';
import * as homePageTestData from '../../resources/test_data/iras/home_page_data.json';

//Declare Page Objects
export default class TasksPage {
  readonly page: Page;
  readonly homePageTestData: typeof homePageTestData;
  readonly pageHeadingCaption: Locator;
  readonly pageHeading: Locator;

  //Initialize Page Objects
  constructor(page: Page) {
    this.page = page;
    this.homePageTestData = homePageTestData;

    //Locators
    this.pageHeadingCaption = page.getByText(this.homePageTestData.Home_Page.heading_caption);
    this.pageHeading = page.getByText(this.homePageTestData.Home_Page.heading);
  }

  //Page Methods
  async goto() {
    await this.page.goto('');
  }

  async assertOnHomePage() {
    expect(await this.page.title()).toBe(this.homePageTestData.Home_Page.title);
    await expect(this.pageHeadingCaption).toBeVisible();
    await expect(this.pageHeading).toBeVisible();
  }
}
