import { expect, Locator, Page } from '@playwright/test';
import * as userProfilePageTestData from '../../../../../resources/test_data/iras/reviewResearch/userAdministration/manageUsers/user_profile_page_data.json';
import * as buttonTextData from '../../../../../resources/test_data/common/button_text_data.json';

//Declare Page Objects
export default class UserProfilePage {
  readonly page: Page;
  readonly userProfilePageTestData: typeof userProfilePageTestData;
  readonly buttonTextData: typeof buttonTextData;
  readonly page_heading: Locator;
  readonly first_change_link: Locator;
  readonly disable_header_label: Locator;
  readonly disable_hint_label: Locator;
  readonly enable_header_label: Locator;
  readonly enable_hint_label: Locator;

  //Initialize Page Objects
  constructor(page: Page) {
    this.page = page;
    this.userProfilePageTestData = userProfilePageTestData;

    //Locators
    this.page_heading = this.page
      .getByRole('heading')
      .getByText(this.userProfilePageTestData.User_Profile_Page.page_heading);
    this.first_change_link = this.page.getByRole('link').getByText('Change').first();
    this.disable_header_label = this.enable_header_label = this.page.locator('h2[class="govuk-heading-m"]');
    this.disable_hint_label = this.enable_hint_label = this.page.locator('div[class="govuk-hint"]');
  }

  async assertOnUserProfilePage() {
    await expect(this.page_heading).toBeVisible();
  }
}
