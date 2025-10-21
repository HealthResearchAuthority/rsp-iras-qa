import { expect, Locator, Page } from '@playwright/test';
import * as editYourProfilePageTestData from '../../../../resources/test_data/iras/reviewResearch/profileManagement/edit_your_profile_page_data.json';
import * as buttonTextData from '../../../../resources/test_data/common/button_text_data.json';
import * as linkTextData from '../../../../resources/test_data/common/link_text_data.json';

//Declare Page Objects
export default class EditYourProfilePage {
  readonly page: Page;
  readonly editYourProfilePageTestData: typeof editYourProfilePageTestData;
  readonly buttonTextData: typeof buttonTextData;
  readonly linkTextData: typeof linkTextData;
  readonly page_heading: Locator;
  readonly make_change_content: Locator;
  readonly make_change_header: Locator;
  readonly make_change_prefix: Locator;
  readonly make_change_suffix: Locator;
  readonly one_login_header: Locator;
  readonly profile_details_header: Locator;

  //Initialize Page Objects
  constructor(page: Page) {
    this.page = page;
    this.editYourProfilePageTestData = editYourProfilePageTestData;
    this.buttonTextData = buttonTextData;
    this.linkTextData = linkTextData;

    //Locators
    this.page_heading = this.page
      .getByRole('heading')
      .getByText(this.editYourProfilePageTestData.Edit_Your_Profile_Page.page_heading);
    this.make_change_content = this.page
      .locator('.govuk-grid-column-two-thirds')
      .locator('.govuk-notification-banner__content');
    this.make_change_header = this.make_change_content
      .getByRole('heading')
      .getByText(this.editYourProfilePageTestData.Edit_Your_Profile_Page.make_change_header);
    this.make_change_prefix = this.make_change_content
      .getByRole('paragraph')
      .getByText(this.editYourProfilePageTestData.Edit_Your_Profile_Page.make_change_prefix);
    this.make_change_suffix = this.make_change_content
      .getByRole('paragraph')
      .getByText(this.editYourProfilePageTestData.Edit_Your_Profile_Page.make_change_suffix);
    this.one_login_header = this.page
      .getByRole('heading')
      .getByText(this.editYourProfilePageTestData.Edit_Your_Profile_Page.one_login_header, { exact: true });
    this.profile_details_header = this.page
      .getByRole('heading')
      .getByText(this.editYourProfilePageTestData.Edit_Your_Profile_Page.profile_details_header);
  }

  //Page Methods
  async goto() {
    await this.page.goto('/profileandsettings/editprofile');
  }

  async assertOnEditProfilePage() {
    await expect.soft(this.page_heading).toBeVisible();
    await expect.soft(this.make_change_header).toBeVisible();
    await expect.soft(this.make_change_prefix).toBeVisible();
    await expect.soft(this.make_change_suffix).toBeVisible();
    await expect.soft(this.one_login_header).toBeVisible();
    await expect.soft(this.profile_details_header).toBeVisible();
  }
}
