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
  readonly country_label: Locator;
  readonly access_required_label: Locator;

  //Initialize Page Objects
  constructor(page: Page) {
    this.page = page;
    this.editUserProfilePageTestData = editUserProfilePageTestData;

    //Locators
    const labels = this.editUserProfilePageTestData.Edit_User_Profile_Page;
    this.page_heading = this.page.getByRole('heading').getByText(labels.page_heading);
    this.title_text = this.getByExactLabel(labels.title_label);
    this.first_name_text = this.getByExactLabel(labels.first_name_label);
    this.last_name_text = this.getByExactLabel(labels.last_name_label);
    this.email_address_text = this.getByExactLabel(labels.email_address_label);
    this.telephone_text = this.getByExactLabel(labels.telephone_label);
    this.organisation_text = this.getByExactLabel(labels.organisation_label);
    this.job_title_text = this.getByExactLabel(labels.job_title_label);
    this.committee_dropdown = this.getByExactLabel(labels.committee_label);
    this.review_body_dropdown = this.getByExactLabel(labels.review_body_label);
    const { label: role_label, fieldset: role_fieldset } = this.getFieldsetByLabelText(labels.role_label);
    this.role_label = role_label;
    this.role_fieldset = role_fieldset;
    this.role_checkbox = role_fieldset.getByRole('checkbox');
    const { label: country_label, fieldset: country_fieldset } = this.getFieldsetByLabelText(labels.country_label);
    this.country_label = country_label;
    this.country_fieldset = country_fieldset;
    this.country_checkbox = country_fieldset.getByRole('checkbox');
    const { label: access_required_label, fieldset: access_required_fieldset } = this.getFieldsetByLabelText(
      labels.access_required_label
    );
    this.access_required_label = access_required_label;
    this.access_required_fieldset = access_required_fieldset;
    this.access_required_checkbox = access_required_fieldset.getByRole('checkbox');
  }

  private getByExactLabel(labelText: string) {
    return this.page.getByLabel(labelText, { exact: true });
  }

  private getFieldsetByLabelText(labelText: string) {
    const label = this.page.locator('.govuk-label').getByText(labelText, { exact: true });
    const fieldset = this.page.locator('.govuk-form-group', { has: label });
    return { label, fieldset };
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

  async getCheckedCheckboxLabels() {
    const checkboxes = this.page.getByRole('checkbox');
    const count = await checkboxes.count();
    const checkedLabels: string[] = [];
    for (let i = 0; i < count; i++) {
      const checkbox = checkboxes.nth(i);
      const isChecked = await checkbox.isChecked();
      if (isChecked) {
        const id = await checkbox.getAttribute('id');
        const label = await this.page.locator(`label[for="${id}"]`).textContent();
        checkedLabels.push(label?.trim() || '');
      }
    }
    return checkedLabels;
  }
}
