import { expect, Locator, Page } from '@playwright/test';
import * as profileCommonPageTestData from '../../../../resources/test_data/iras/reviewResearch/profileManagement/profile_common_page_data.json';

//Declare Page Objects
export default class ProfileCommonPage {
  readonly page: Page;
  readonly profileCommonPageTestData: typeof profileCommonPageTestData;
  readonly rowSelector: string;
  readonly make_change_content: Locator;
  readonly make_change_header: Locator;
  readonly make_change_prefix: Locator;
  readonly make_change_suffix: Locator;
  readonly one_login_header: Locator;
  readonly profile_details_header: Locator;
  readonly success_notification_title: Locator;
  readonly success_notification_container: Locator;
  readonly success_notification_created_message: Locator;
  readonly success_notification_updated_message: Locator;

  //Initialize Page Objects
  constructor(page: Page) {
    this.page = page;
    this.profileCommonPageTestData = profileCommonPageTestData;
    this.rowSelector = '.govuk-table__row';

    //Locators
    this.make_change_content = this.page
      .locator('.govuk-grid-column-two-thirds')
      .locator('.govuk-notification-banner__content');
    this.make_change_header = this.make_change_content
      .getByRole('heading')
      .getByText(this.profileCommonPageTestData.Profile_Common_Page.make_change_header);
    this.make_change_prefix = this.make_change_content
      .getByRole('paragraph')
      .getByText(this.profileCommonPageTestData.Profile_Common_Page.make_change_prefix);
    this.make_change_suffix = this.make_change_content
      .getByRole('paragraph')
      .getByText(this.profileCommonPageTestData.Profile_Common_Page.make_change_suffix);
    this.one_login_header = this.page
      .getByRole('heading')
      .getByText(this.profileCommonPageTestData.Profile_Common_Page.one_login_header, { exact: true });
    this.profile_details_header = this.page
      .getByRole('heading')
      .getByText(this.profileCommonPageTestData.Profile_Common_Page.profile_details_header);
    this.success_notification_title = this.page
      .getByTestId('govuk-notification-banner-title')
      .getByText(this.profileCommonPageTestData.Profile_Common_Page.success_notification_title);
    this.success_notification_container = this.page.locator('.govuk-notification-banner--success', {
      has: this.success_notification_title,
    });
    this.success_notification_created_message = this.success_notification_container
      .getByRole('heading')
      .getByText(this.profileCommonPageTestData.Profile_Common_Page.success_notification_created_message);
    this.success_notification_updated_message = this.success_notification_container
      .getByRole('heading')
      .getByText(this.profileCommonPageTestData.Profile_Common_Page.success_notification_updated_message);
  }

  //Page Methods
  async assertCommonProfilePageItems() {
    await expect.soft(this.make_change_header).toBeVisible();
    await expect.soft(this.make_change_prefix).toBeVisible();
    await expect.soft(this.make_change_suffix).toBeVisible();
    await expect.soft(this.one_login_header).toBeVisible();
    await expect.soft(this.profile_details_header).toBeVisible();
  }
}
