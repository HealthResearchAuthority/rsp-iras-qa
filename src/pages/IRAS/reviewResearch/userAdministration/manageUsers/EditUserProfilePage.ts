import { expect, Locator, Page } from '@playwright/test';
import * as editUserProfilePageTestData from '../../../../../resources/test_data/iras/reviewResearch/userAdministration/manageUsers/edit_user_profile_page_data.json';
import * as buttonTextData from '../../../../../resources/test_data/common/button_text_data.json';

//Declare Page Objects
export default class EditUserProfilePage {
  readonly page: Page;
  readonly editUserProfilePageTestData: typeof editUserProfilePageTestData;
  readonly buttonTextData: typeof buttonTextData;
  readonly page_heading: Locator;
  readonly title_label: Locator;
  readonly title_text: Locator;
  readonly first_name_label: Locator;
  readonly first_name_text: Locator;
  readonly last_name_label: Locator;
  readonly last_name_text: Locator;
  readonly email_address_label: Locator;
  readonly email_address_text: Locator;
  readonly telephone_label: Locator;
  readonly telephone_text: Locator;
  readonly organisation_label: Locator;
  readonly organisation_text: Locator;
  readonly job_title_label: Locator;
  readonly job_title_text: Locator;
  readonly role_label: Locator;
  readonly role_dropdown: Locator;
  readonly committee_label: Locator;
  readonly committee_dropdown: Locator;
  readonly country_label: Locator;
  readonly country_checkbox: Locator;
  readonly access_required_label: Locator;
  readonly access_required_checkbox: Locator;
  readonly review_body_label: Locator;
  readonly review_body_dropdown: Locator;
  readonly save_button: Locator;

  //Initialize Page Objects
  constructor(page: Page) {
    this.page = page;
    this.editUserProfilePageTestData = editUserProfilePageTestData;

    //Locators
    this.page_heading = this.page
      .getByRole('heading')
      .getByText(this.editUserProfilePageTestData.Edit_User_Profile_Page.page_heading);
    // this.title_label = this.page.locator('[class="govuk-label"][for="Title"] b');
    // this.title_text = this.page.getByTestId('Title');
    // this.first_name_label = this.page.locator('[class="govuk-label"][for="FirstName"] b');
    // this.first_name_text = this.page.getByTestId('FirstName');
    // this.last_name_label = this.page.locator('[class="govuk-label"][for="LastName"] b');
    // this.last_name_text = this.page.getByTestId('LastName');
    // this.email_address_label = this.page.locator('[class="govuk-label"][for="Email"] b');
    // this.email_address_text = this.page.getByTestId('Email');
    // this.telephone_label = this.page.locator('[class="govuk-label"][for="Telephone"] b');
    // this.telephone_text = this.page.getByTestId('Telephone');
    // this.organisation_label = this.page.locator('[class="govuk-label"][for="Organisation"] b');
    // this.organisation_text = this.page.getByTestId('Organisation');
    // this.job_title_label = this.page.locator('[class="govuk-label"][for="JobTitle"] b');
    // this.job_title_text = this.page.getByTestId('JobTitle');
    // this.role_label = this.page.locator('[class="govuk-label"][for="Role"] b');
    // this.role_dropdown = this.page.getByTestId('Role');
    // this.role_label = this.page.locator('[class="govuk-label"][for="Role"] b');
    // this.role_dropdown = this.page.getByTestId('Role');
    // this.committee_label = this.page.locator('[class="govuk-label"][for="Committee"] b');
    // this.committee_dropdown = this.page.getByTestId('Committee');
    // this.country_label = this.page.locator('[class="govuk-label"][for="Country"] b');
    // this.country_checkbox = this.page.locator('[name="Country"][type="checkbox"]');
    // this.access_required_label = this.page.locator('[class="govuk-label"][for="AccessRequired"] b');
    // this.access_required_checkbox = this.page.locator('[name="AccessRequired"][type="checkbox"]');
    // this.review_body_label = this.page.locator('[class="govuk-label"][for="ReviewBody"] b');
    // this.review_body_dropdown = this.page.getByTestId('ReviewBody');
    // this.save_button = this.page.locator('.govuk-button[type="submit"]');
  }

  async assertOnEditUserProfilePage() {
    await expect(this.page_heading).toBeVisible();
  }

  // async clearOptionalFields() {
  //   await this.title_text.clear();
  //   await this.telephone_text.clear();
  //   await this.organisation_text.clear();
  //   await this.job_title_text.clear();
  //   const isCountrySelected = await this.country_checkbox.isChecked();
  //   if (isCountrySelected) {
  //     this.country_checkbox.uncheck();
  //   }
  // }
}
