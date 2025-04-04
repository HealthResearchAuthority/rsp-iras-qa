import { expect, Locator, Page } from '@playwright/test';
import * as createReviewBodyPageData from '../../../../../resources/test_data/iras/reviewResearch/userAdministration/manageReviewBodies/pages/create_review_body_page_data.json';
import * as buttonTextData from '../../../../../resources/test_data/common/button_text_data.json';

//Declare Page Objects
export default class CreateReviewBodyPage {
  readonly page: Page;
  readonly createReviewBodyPageData: typeof createReviewBodyPageData;
  readonly buttonTextData: typeof buttonTextData;
  readonly page_heading: Locator;
  readonly organisation_name_text: Locator;
  readonly organisationNameError: Locator;
  // readonly country_label: Locator;
  readonly countryVal: Locator;
  readonly countryError: Locator;
  readonly countryOption1Lbl: Locator;
  readonly countryOption2Lbl: Locator;
  readonly countryOption3Lbl: Locator;
  readonly countryOption4Lbl: Locator;
  readonly emailAddressLbl: Locator;
  readonly email_address_text: Locator;
  readonly emailAddressError: Locator;
  readonly descriptionLbl: Locator;
  readonly description_text: Locator;
  readonly continueBtn: Locator;
  readonly country_fieldset: Locator;
  readonly country_checkbox: Locator;

  //Initialize Page Objects
  constructor(page: Page) {
    this.page = page;
    this.createReviewBodyPageData = createReviewBodyPageData;
    this.buttonTextData = buttonTextData;

    //Locators
    this.page_heading = this.page
      .getByRole('heading')
      .getByText(this.createReviewBodyPageData.Create_Review_Body_Page.page_heading);
    this.organisation_name_text = this.page.getByLabel(
      this.createReviewBodyPageData.Create_Review_Body_Page.organisation_name_label,
      { exact: true }
    );
    this.organisationNameError = this.page.getByTestId('Name').locator('label'); // update
    this.country_fieldset = this.page.getByRole('group', {
      name: this.createReviewBodyPageData.Create_Review_Body_Page.country_label,
      exact: true,
    });
    this.country_checkbox = this.country_fieldset.getByRole('checkbox');
    this.countryError = this.page.getByTestId('app-name'); // update
    this.email_address_text = this.page.getByLabel(
      this.createReviewBodyPageData.Create_Review_Body_Page.email_address_label,
      { exact: true }
    );
    this.emailAddressError = this.page.getByTestId('app-description'); // update
    this.description_text = this.page.getByLabel(
      this.createReviewBodyPageData.Create_Review_Body_Page.description_label
    );
    this.continueBtn = this.page
      .getByRole('button')
      .getByText(this.buttonTextData.Create_Review_Body_Page.Continue, { exact: true });
  }

  //Page Methods
  async goto() {
    await this.page.goto('reviewbody/create');
  }

  async assertOnCreateReviewbodyPage() {
    await expect(this.page_heading).toBeVisible();
  }

  async checkErrorMessageOrganisationName() {
    await expect(this.organisationNameError).toBeVisible();
    await expect(this.organisationNameError).toHaveText(
      this.createReviewBodyPageData.Create_Review_Body['Validation'].error_message
    );
  }

  async checkErrorMessageCountry() {
    await expect(this.countryError).toBeVisible();
    await expect(this.countryError).toHaveText(
      this.createReviewBodyPageData.Create_Review_Body['Validation'].error_message
    );
  }

  async checkErrorMessageEmailAddress() {
    await expect(this.emailAddressError).toBeVisible();
    await expect(this.emailAddressError).toHaveText(
      this.createReviewBodyPageData.Create_Review_Body['Validation'].error_message
    );
  }
}
