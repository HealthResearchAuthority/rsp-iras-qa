import { expect, Locator, Page } from '@playwright/test';
import * as editUserProfilePageTestData from '../../../../../resources/test_data/iras/reviewResearch/userAdministration/manageUsers/edit_user_profile_page_data.json';
import * as buttonTextData from '../../../../../resources/test_data/common/button_text_data.json';

//Declare Page Objects
export default class EditUserProfilePage {
  readonly page: Page;
  readonly editUserProfilePageTestData: typeof editUserProfilePageTestData;
  readonly buttonTextData: typeof buttonTextData;
  readonly page_heading: Locator;
  readonly title_text: Locator;
  readonly first_name_text: Locator;
  readonly last_name_text: Locator;
  readonly email_address_text: Locator;
  readonly telephone_text: Locator;
  readonly organisation_text: Locator;
  readonly job_title_text: Locator;
  readonly role_dropdown_label: Locator;
  readonly role_dropdown: Locator;
  readonly committee_dropdown: Locator;
  readonly country_checkbox: Locator;
  readonly access_required_checkbox: Locator;
  readonly review_body_dropdown: Locator;
  readonly continue_button: Locator;
  readonly selected_dropdown: Locator;
  readonly save_button: Locator;

  //Initialize Page Objects
  constructor(page: Page) {
    this.page = page;
    this.editUserProfilePageTestData = editUserProfilePageTestData;

    //Locators
    this.page_heading = this.page
      .getByRole('heading')
      .getByText(this.editUserProfilePageTestData.Edit_User_Profile_Page.page_heading);
    this.title_text = this.page.getByLabel('Title', { exact: true });
    this.first_name_text = this.page.getByLabel('First name', { exact: true });
    this.last_name_text = this.page.getByLabel('Last name', { exact: true });
    this.email_address_text = this.page.getByLabel('Email address', { exact: true });
    this.telephone_text = this.page.getByLabel('Telephone', { exact: true });
    this.organisation_text = this.page.getByLabel('Organisation', { exact: true });
    this.job_title_text = this.page.getByLabel('Job title', { exact: true });
    this.role_dropdown = this.page.getByLabel('Role', { exact: true });
    this.committee_dropdown = this.page.getByLabel('Committee', { exact: true });
    this.country_checkbox = this.page.locator('[name="Country"][type="checkbox"]');
    this.access_required_checkbox = this.page.locator('[name="AccessRequired"][type="checkbox"]');
    this.review_body_dropdown = this.page.getByLabel('Review body', { exact: true });
    this.continue_button = this.page.locator('.govuk-button[type="submit"]');
    this.selected_dropdown = this.page.locator('select option[selected=selected]');
    this.save_button = this.page.locator('.govuk-button[type="submit"]');
  }

  async assertOnEditUserProfilePage() {
    await expect(this.page_heading).toBeVisible();
  }

  async clearOptionalFields() {
    await this.title_text.clear();
    await this.telephone_text.clear();
    await this.organisation_text.clear();
    await this.job_title_text.clear();
    const isCountrySelected = await this.country_checkbox.isChecked();
    if (isCountrySelected) {
      this.country_checkbox.uncheck();
    }
  }

  async removeUserProfileMandatoryFields(userEditField: string) {
    if (userEditField == 'first_name_text') {
      await this.first_name_text.clear();
    } else if (userEditField == 'last_name_text') {
      await this.last_name_text.clear();
    } else if (userEditField == 'email_address_text') {
      await this.email_address_text.clear();
    }
  }
}
