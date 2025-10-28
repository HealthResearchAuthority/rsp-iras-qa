import { expect, Locator, Page } from '@playwright/test';
import * as profileSettingsPageTestData from '../../../../resources/test_data/iras/reviewResearch/profileManagement/profile_settings_page_data.json';
import * as linkTextData from '../../../../resources/test_data/common/link_text_data.json';

//Declare Page Objects
export default class ProfileSettingsPage {
  readonly page: Page;
  readonly profileSettingsPageTestData: typeof profileSettingsPageTestData;
  readonly linkTextData: typeof linkTextData;
  readonly rowSelector: string;
  readonly page_heading: Locator;
  readonly email_address_label: Locator;
  readonly email_address_row: Locator;
  readonly email_address_value: Locator;
  readonly email_address_change_link: Locator;
  readonly telephone_label: Locator;
  readonly telephone_row: Locator;
  readonly telephone_value: Locator;
  readonly telephone_change_link: Locator;
  readonly title_label: Locator;
  readonly title_row: Locator;
  readonly title_value: Locator;
  readonly title_change_link: Locator;
  readonly first_name_label: Locator;
  readonly first_name_row: Locator;
  readonly first_name_value: Locator;
  readonly first_name_change_link: Locator;
  readonly last_name_label: Locator;
  readonly last_name_row: Locator;
  readonly last_name_value: Locator;
  readonly last_name_change_link: Locator;
  readonly job_title_label: Locator;
  readonly job_title_row: Locator;
  readonly job_title_value: Locator;
  readonly job_title_change_link: Locator;
  readonly organisation_label: Locator;
  readonly organisation_row: Locator;
  readonly organisation_value: Locator;
  readonly organisation_change_link: Locator;

  //Initialize Page Objects
  constructor(page: Page) {
    this.page = page;
    this.profileSettingsPageTestData = profileSettingsPageTestData;
    this.linkTextData = linkTextData;
    this.rowSelector = '.govuk-table__row';

    //Locators
    this.page_heading = this.page
      .getByRole('heading')
      .getByText(this.profileSettingsPageTestData.Profile_Settings_Page.page_heading);
    this.email_address_label = this.page
      .getByRole('cell')
      .getByText(this.profileSettingsPageTestData.Profile_Settings_Page.email_address_label, {
        exact: true,
      });
    this.email_address_row = this.page.locator(this.rowSelector, { has: this.email_address_label });
    this.email_address_value = this.email_address_row.getByRole('cell').nth(1);
    this.email_address_change_link = this.email_address_row
      .getByRole('link')
      .getByText(this.linkTextData.Profile_Settings_Page.Change);
    this.telephone_label = this.page
      .getByRole('cell')
      .getByText(this.profileSettingsPageTestData.Profile_Settings_Page.telephone_label, {
        exact: true,
      });
    this.telephone_row = this.page.locator(this.rowSelector, { has: this.telephone_label });
    this.telephone_value = this.telephone_row.getByRole('cell').nth(1);
    this.telephone_change_link = this.telephone_row
      .getByRole('link')
      .getByText(this.linkTextData.Profile_Settings_Page.Change);
    this.title_label = this.page
      .getByRole('cell')
      .getByText(this.profileSettingsPageTestData.Profile_Settings_Page.title_label, {
        exact: true,
      });
    this.title_row = this.page.locator(this.rowSelector, { has: this.title_label });
    this.title_value = this.page.locator('td', { has: this.page.getByTestId('Title') });
    this.title_change_link = this.title_row.getByRole('link').getByText(this.linkTextData.Profile_Settings_Page.Change);
    this.first_name_label = this.page
      .getByRole('cell')
      .getByText(this.profileSettingsPageTestData.Profile_Settings_Page.first_name_label, {
        exact: true,
      });
    this.first_name_row = this.page.locator(this.rowSelector, { has: this.first_name_label });
    this.first_name_value = this.page.locator('td', { has: this.page.getByTestId('GivenName') });
    this.first_name_change_link = this.first_name_row
      .getByRole('link')
      .getByText(this.linkTextData.Profile_Settings_Page.Change);
    this.last_name_label = this.page
      .getByRole('cell')
      .getByText(this.profileSettingsPageTestData.Profile_Settings_Page.last_name_label, {
        exact: true,
      });
    this.last_name_row = this.page.locator(this.rowSelector, { has: this.last_name_label });
    this.last_name_value = this.page.locator('td', { has: this.page.getByTestId('FamilyName') });
    this.last_name_change_link = this.last_name_row
      .getByRole('link')
      .getByText(this.linkTextData.Profile_Settings_Page.Change);
    this.job_title_label = this.page
      .getByRole('cell')
      .getByText(this.profileSettingsPageTestData.Profile_Settings_Page.job_title_label, {
        exact: true,
      });
    this.job_title_row = this.page.locator(this.rowSelector, { has: this.job_title_label });
    this.job_title_value = this.page.locator('td', { has: this.page.getByTestId('JobTitle') });
    this.job_title_change_link = this.job_title_row
      .getByRole('link')
      .getByText(this.linkTextData.Profile_Settings_Page.Change);
    this.organisation_label = this.page
      .getByRole('cell')
      .getByText(this.profileSettingsPageTestData.Profile_Settings_Page.organisation_label, {
        exact: true,
      });
    this.organisation_row = this.page.locator(this.rowSelector, { has: this.organisation_label });
    this.organisation_value = this.page.locator('td', { has: this.page.getByTestId('Organisation') });
    this.organisation_change_link = this.organisation_row
      .getByRole('link')
      .getByText(this.linkTextData.Profile_Settings_Page.Change);
  }

  //Page Methods
  async goto() {
    await this.page.goto('/profileandsettings');
  }

  async assertOnProfileSettingsPage() {
    await expect.soft(this.page_heading).toBeVisible();
  }
}
