import { expect, Locator, Page } from '@playwright/test';
import * as commonTestData from '../../resources/test_data/common/common_data.json';

//Declare Page Objects
export default class AccessDeniedPage {
  readonly page: Page;
  readonly commonTestData: typeof commonTestData;
  readonly pageHeading: Locator;
  readonly projectGuidanceText: Locator;

  //Initialize Page Objects
  constructor(page: Page) {
    this.page = page;
    this.commonTestData = commonTestData;

    //Locators
    this.pageHeading = this.page.getByRole('heading').getByText(this.commonTestData.heading);
    this.projectGuidanceText = this.page.getByRole('paragraph').getByText(this.commonTestData.guidance_text);
  }

  //Page Methods
  async goto() {
    await this.page.goto('');
  }

  async assertOnAccessDeniedPage() {
    await expect(this.pageHeading).toBeVisible();
    await expect(this.projectGuidanceText).toBeVisible();
  }
}
