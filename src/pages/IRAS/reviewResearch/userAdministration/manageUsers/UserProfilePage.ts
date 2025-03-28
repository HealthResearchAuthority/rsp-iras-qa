import { expect, Locator, Page } from '@playwright/test';
import * as userProfilePageData from '../../../../../resources/test_data/iras/reviewResearch/userAdministration/manageUsers/pages/user_profile_page_data.json';
import * as buttonTextData from '../../../../../resources/test_data/common/button_text_data.json';

//Declare Page Objects
export default class UserProfilePage {
  readonly page: Page;
  readonly userProfilePageData: typeof userProfilePageData;
  readonly buttonTextData: typeof buttonTextData;
  readonly page_heading: Locator;
  readonly first_change_link: Locator;

  //Initialize Page Objects
  constructor(page: Page) {
    this.page = page;
    this.userProfilePageData = userProfilePageData;

    //Locators
    this.page_heading = this.page.locator('.govuk-heading-l');
    this.first_change_link = this.page.locator('(//a[@class="govuk-link" and text()="Change"])[1]');
  }

  async assertOnUserProfilePage() {
    await expect(this.page_heading).toBeVisible();
    await expect(this.page_heading).toContainText(new RegExp(userProfilePageData.User_Profile_Page.page_heading));
  }
}
