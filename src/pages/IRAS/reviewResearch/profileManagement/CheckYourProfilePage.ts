import { expect, Locator, Page } from '@playwright/test';
import * as checkYourProfilePageTestData from '../../../../resources/test_data/iras/reviewResearch/profileManagement/check_your_profile_page_data.json';

//Declare Page Objects
export default class CheckYourProfilePage {
  readonly page: Page;
  readonly checkYourProfilePageTestData: typeof checkYourProfilePageTestData;
  readonly page_heading: Locator;
  readonly page_guidance_text: Locator;

  //Initialize Page Objects
  constructor(page: Page) {
    this.page = page;
    this.checkYourProfilePageTestData = checkYourProfilePageTestData;

    //Locators
    this.page_heading = this.page
      .getByRole('heading')
      .getByText(this.checkYourProfilePageTestData.Check_Your_Profile_Page.page_heading);
    this.page_guidance_text = this.page
      .getByRole('paragraph')
      .getByText(this.checkYourProfilePageTestData.Check_Your_Profile_Page.page_guidance_text);
  }

  //Page Methods

  async assertOnCheckProfilePage() {
    await expect.soft(this.page_heading).toBeVisible();
    await expect.soft(this.page_guidance_text).toBeVisible();
  }
}
