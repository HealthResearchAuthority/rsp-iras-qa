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
  readonly role_label: Locator;
  readonly role_fieldset: Locator;
  readonly role_checkbox: Locator;
  readonly committee_dropdown: Locator;
  readonly country_fieldset: Locator;
  readonly country_checkbox: Locator;
  readonly access_required_fieldset: Locator;
  readonly access_required_checkbox: Locator;
  readonly review_body_dropdown: Locator;

  //Initialize Page Objects
  constructor(page: Page) {
    this.page = page;
    this.editUserProfilePageTestData = editUserProfilePageTestData;

    //Locators
    this.page_heading = this.page
      .getByRole('heading')
      .getByText(this.editUserProfilePageTestData.Edit_User_Profile_Page.page_heading);
    this.title_text = this.page.getByLabel(this.editUserProfilePageTestData.Edit_User_Profile_Page.title_label, {
      exact: true,
    });
    this.first_name_text = this.page.getByLabel(
      this.editUserProfilePageTestData.Edit_User_Profile_Page.first_name_label,
      {
        exact: true,
      }
    );
    this.last_name_text = this.page.getByLabel(
      this.editUserProfilePageTestData.Edit_User_Profile_Page.last_name_label,
      {
        exact: true,
      }
    );
    this.email_address_text = this.page.getByLabel(
      this.editUserProfilePageTestData.Edit_User_Profile_Page.email_address_label,
      {
        exact: true,
      }
    );
    this.telephone_text = this.page.getByLabel(
      this.editUserProfilePageTestData.Edit_User_Profile_Page.telephone_label,
      {
        exact: true,
      }
    );
    this.organisation_text = this.page.getByLabel(
      this.editUserProfilePageTestData.Edit_User_Profile_Page.organisation_label,
      {
        exact: true,
      }
    );
    this.job_title_text = this.page.getByLabel(
      this.editUserProfilePageTestData.Edit_User_Profile_Page.job_title_label,
      {
        exact: true,
      }
    );
    this.role_label = this.page
      .locator('.govuk-label')
      .getByText(this.editUserProfilePageTestData.Edit_User_Profile_Page.role_label, { exact: true });
    this.role_fieldset = this.page.locator('.govuk-form-group', { has: this.role_label });
    this.role_checkbox = this.role_fieldset.getByRole('checkbox');
    this.committee_dropdown = this.page.getByLabel(
      this.editUserProfilePageTestData.Edit_User_Profile_Page.committee_label,
      { exact: true }
    );
    this.country_fieldset = this.page.getByRole('group', {
      name: this.editUserProfilePageTestData.Edit_User_Profile_Page.country_label,
      exact: true,
    });
    this.country_checkbox = this.country_fieldset.getByRole('checkbox');
    this.access_required_fieldset = this.page.getByRole('group', {
      name: this.editUserProfilePageTestData.Edit_User_Profile_Page.access_required_label,
      exact: true,
    });
    this.access_required_checkbox = this.access_required_fieldset.getByRole('checkbox');
    this.review_body_dropdown = this.page.getByLabel(
      this.editUserProfilePageTestData.Edit_User_Profile_Page.review_body_label,
      {
        exact: true,
      }
    );
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
