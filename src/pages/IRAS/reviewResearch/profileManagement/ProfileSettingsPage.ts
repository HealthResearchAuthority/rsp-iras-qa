import { expect, Locator, Page } from '@playwright/test';
import * as profileSettingsPageTestData from '../../../../resources/test_data/iras/reviewResearch/profileManagement/profile_settings_page_data.json';

//Declare Page Objects
export default class ProfileSettingsPage {
  readonly page: Page;
  readonly profileSettingsPageTestData: typeof profileSettingsPageTestData;
  readonly page_heading: Locator;

  //Initialize Page Objects
  constructor(page: Page) {
    this.page = page;
    this.profileSettingsPageTestData = profileSettingsPageTestData;

    //Locators
    this.page_heading = this.page
      .getByRole('heading')
      .getByText(this.profileSettingsPageTestData.Profile_Settings_Page.page_heading);
  }

  //Page Methods
  async goto() {
    await this.page.goto('/profileandsettings');
  }

  async assertOnProfileSettingsPage() {
    await expect.soft(this.page_heading).toBeVisible();
  }
}
