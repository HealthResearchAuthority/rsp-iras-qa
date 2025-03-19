import { expect, Locator, Page } from '@playwright/test';
import * as createUserProfilePageData from '../../../../../resources/test_data/iras/reviewResearch/userAdministration/manageUsers/pages/create_user_profile_page_data.json';
import * as buttonTextData from '../../../../../resources/test_data/common/button_text_data.json';

//Declare Page Objects
export default class CreateUserProfilePage {
  readonly page: Page;
  readonly createUserProfilePageData: typeof createUserProfilePageData;
  readonly buttonTextData: typeof buttonTextData;
  readonly pageHeading: Locator;
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
  readonly continue_button: Locator;

  //Initialize Page Objects
  constructor(page: Page) {
    this.page = page;
    this.createUserProfilePageData = createUserProfilePageData;

    //Locators
    this.pageHeading = this.page.locator('.govuk-heading-l');
    this.title_label = this.page.locator('[class="govuk-label"][for="Title"] b');
    this.title_text = this.page.getByTestId('Title');
    this.first_name_label = this.page.locator('[class="govuk-label"][for="FirstName"] b');
    this.first_name_text = this.page.getByTestId('FirstName');
    this.last_name_label = this.page.locator('[class="govuk-label"][for="LastName"] b');
    this.last_name_text = this.page.getByTestId('LastName');
    this.email_address_label = this.page.locator('[class="govuk-label"][for="Email"] b');
    this.email_address_text = this.page.getByTestId('Email');
    this.telephone_label = this.page.locator('[class="govuk-label"][for="Telephone"] b');
    this.telephone_text = this.page.getByTestId('Telephone');
    this.organisation_label = this.page.locator('[class="govuk-label"][for="Organisation"] b');
    this.organisation_text = this.page.getByTestId('Organisation');
    this.job_title_label = this.page.locator('[class="govuk-label"][for="JobTitle"] b');
    this.job_title_text = this.page.getByTestId('JobTitle');
    this.role_label = this.page.locator('[class="govuk-label"][for="Role"] b');
    this.role_dropdown = this.page.getByTestId('Role');
    this.role_label = this.page.locator('[class="govuk-label"][for="Role"] b');
    this.role_dropdown = this.page.getByTestId('Role');
    this.committee_label = this.page.locator('[class="govuk-label"][for="Committee"] b');
    this.committee_dropdown = this.page.getByTestId('Committee');
    this.country_label = this.page.locator('[class="govuk-label"][for="Country"] b');
    this.country_checkbox = this.page.getByTestId('Country');
    this.access_required_label = this.page.locator('[class="govuk-label"][for="AccessRequired"] b');
    this.access_required_checkbox = this.page.getByTestId('AccessRequired');
    this.review_body_label = this.page.locator('[class="govuk-label"][for="ReviewBody"] b');
    this.review_body_dropdown = this.page.getByTestId('ReviewBody');
    this.continue_button = this.page.locator('.govuk-button[type="submit"]');
  }

  //Page Methods
  async goto() {
    await this.page.goto('');
  }

  async assertOnCreateUserProfilePage() {
    await expect(this.pageHeading).toBeVisible();
    await expect(this.pageHeading).toHaveText(this.createUserProfilePageData.Create_User_Profile_Page.heading);
    await expect(this.title_label).toHaveText(this.createUserProfilePageData.Create_User_Profile_Page.title_label);
    await expect(this.first_name_label).toHaveText(
      this.createUserProfilePageData.Create_User_Profile_Page.first_name_label
    );
    await expect(this.last_name_label).toHaveText(
      this.createUserProfilePageData.Create_User_Profile_Page.last_name_label
    );
    await expect(this.email_address_label).toHaveText(
      this.createUserProfilePageData.Create_User_Profile_Page.email_address_label
    );
    await expect(this.telephone_label).toHaveText(
      this.createUserProfilePageData.Create_User_Profile_Page.telephone_label
    );
    await expect(this.organisation_label).toHaveText(
      this.createUserProfilePageData.Create_User_Profile_Page.organisation_label
    );
    await expect(this.job_title_label).toHaveText(
      this.createUserProfilePageData.Create_User_Profile_Page.job_title_label
    );
    await expect(this.role_label).toHaveText(this.createUserProfilePageData.Create_User_Profile_Page.role_label);
    await expect(this.continue_button).toHaveText(
      this.createUserProfilePageData.Create_User_Profile_Page.continue_button
    );
  }
}
