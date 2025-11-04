import { expect, Locator, Page } from '@playwright/test';
import * as profileCommonPageTestData from '../../../../resources/test_data/iras/reviewResearch/profileManagement/profile_common_page_data.json';
import * as linkTextData from '../../../../resources/test_data/common/link_text_data.json';

//Declare Page Objects
export default class ProfileCommonPage {
  readonly page: Page;
  readonly profileCommonPageTestData: typeof profileCommonPageTestData;
  readonly linkTextData: typeof linkTextData;
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
  readonly email_address_label: Locator;
  readonly email_address_row: Locator;
  readonly email_address_value: Locator;
  readonly settings_email_address_change_link: Locator;
  readonly check_email_address_change_link: Locator;
  readonly telephone_label: Locator;
  readonly telephone_row: Locator;
  readonly telephone_value: Locator;
  readonly settings_telephone_change_link: Locator;
  readonly check_telephone_change_link: Locator;
  readonly title_label: Locator;
  readonly title_row: Locator;
  readonly title_value: Locator;
  readonly settings_title_change_link: Locator;
  readonly check_title_change_link: Locator;
  readonly first_name_label: Locator;
  readonly first_name_row: Locator;
  readonly first_name_value: Locator;
  readonly settings_first_name_change_link: Locator;
  readonly check_first_name_change_link: Locator;
  readonly last_name_label: Locator;
  readonly last_name_row: Locator;
  readonly last_name_value: Locator;
  readonly settings_last_name_change_link: Locator;
  readonly check_last_name_change_link: Locator;
  readonly job_title_label: Locator;
  readonly job_title_row: Locator;
  readonly job_title_value: Locator;
  readonly settings_job_title_change_link: Locator;
  readonly check_job_title_change_link: Locator;
  readonly organisation_label: Locator;
  readonly organisation_row: Locator;
  readonly organisation_value: Locator;
  readonly settings_organisation_change_link: Locator;
  readonly check_organisation_change_link: Locator;

  //Initialize Page Objects
  constructor(page: Page) {
    this.page = page;
    this.profileCommonPageTestData = profileCommonPageTestData;
    this.linkTextData = linkTextData;

    //Locators
    this.rowSelector = '.govuk-table__row';
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
    this.email_address_label = this.page
      .getByRole('cell')
      .getByText(this.profileCommonPageTestData.Profile_Common_Page.email_address_label, {
        exact: true,
      });
    this.email_address_row = this.page.locator(this.rowSelector, { has: this.email_address_label });
    this.email_address_value = this.email_address_row.getByRole('cell').nth(1);
    this.settings_email_address_change_link = this.email_address_row
      .getByRole('link')
      .getByText(this.linkTextData.Profile_Common_Page.Change);
    this.check_email_address_change_link = this.email_address_row
      .getByRole('button')
      .getByText(this.linkTextData.Profile_Common_Page.Change);
    this.telephone_label = this.page
      .getByRole('cell')
      .getByText(this.profileCommonPageTestData.Profile_Common_Page.telephone_label, {
        exact: true,
      });
    this.telephone_row = this.page.locator(this.rowSelector, { has: this.telephone_label });
    this.telephone_value = this.telephone_row.getByRole('cell').nth(1);
    this.settings_telephone_change_link = this.telephone_row
      .getByRole('link')
      .getByText(this.linkTextData.Profile_Common_Page.Change);
    this.check_telephone_change_link = this.telephone_row
      .getByRole('button')
      .getByText(this.linkTextData.Profile_Common_Page.Change);
    this.title_label = this.page
      .getByRole('cell')
      .getByText(this.profileCommonPageTestData.Profile_Common_Page.title_label, {
        exact: true,
      });
    this.title_row = this.page.locator(this.rowSelector, { has: this.title_label });
    this.title_value = this.page.locator('td', { has: this.page.getByTestId('Title') });
    this.settings_title_change_link = this.title_row
      .getByRole('link')
      .getByText(this.linkTextData.Profile_Common_Page.Change);
    this.check_title_change_link = this.title_row
      .getByRole('button')
      .getByText(this.linkTextData.Profile_Common_Page.Change);
    this.first_name_label = this.page
      .getByRole('cell')
      .getByText(this.profileCommonPageTestData.Profile_Common_Page.first_name_label, {
        exact: true,
      });
    this.first_name_row = this.page.locator(this.rowSelector, { has: this.first_name_label });
    this.first_name_value = this.page.locator('td', { has: this.page.getByTestId('GivenName') });
    this.settings_first_name_change_link = this.first_name_row
      .getByRole('link')
      .getByText(this.linkTextData.Profile_Common_Page.Change);
    this.check_first_name_change_link = this.first_name_row
      .getByRole('button')
      .getByText(this.linkTextData.Profile_Common_Page.Change);
    this.last_name_label = this.page
      .getByRole('cell')
      .getByText(this.profileCommonPageTestData.Profile_Common_Page.last_name_label, {
        exact: true,
      });
    this.last_name_row = this.page.locator(this.rowSelector, { has: this.last_name_label });
    this.last_name_value = this.page.locator('td', { has: this.page.getByTestId('FamilyName') });
    this.settings_last_name_change_link = this.last_name_row
      .getByRole('link')
      .getByText(this.linkTextData.Profile_Common_Page.Change);
    this.check_last_name_change_link = this.last_name_row
      .getByRole('button')
      .getByText(this.linkTextData.Profile_Common_Page.Change);
    this.job_title_label = this.page
      .getByRole('cell')
      .getByText(this.profileCommonPageTestData.Profile_Common_Page.job_title_label, {
        exact: true,
      });
    this.job_title_row = this.page.locator(this.rowSelector, { has: this.job_title_label });
    this.job_title_value = this.page.locator('td', { has: this.page.getByTestId('JobTitle') });
    this.settings_job_title_change_link = this.job_title_row
      .getByRole('link')
      .getByText(this.linkTextData.Profile_Common_Page.Change);
    this.check_job_title_change_link = this.job_title_row
      .getByRole('button')
      .getByText(this.linkTextData.Profile_Common_Page.Change);
    this.organisation_label = this.page
      .getByRole('cell')
      .getByText(this.profileCommonPageTestData.Profile_Common_Page.organisation_label, {
        exact: true,
      });
    this.organisation_row = this.page.locator(this.rowSelector, { has: this.organisation_label });
    this.organisation_value = this.page.locator('td', { has: this.page.getByTestId('Organisation') });
    this.settings_organisation_change_link = this.organisation_row
      .getByRole('link')
      .getByText(this.linkTextData.Profile_Common_Page.Change);
    this.check_organisation_change_link = this.organisation_row
      .getByRole('button')
      .getByText(this.linkTextData.Profile_Common_Page.Change);
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
