import { expect, Locator, Page } from '@playwright/test';
import * as createReviewBodyPageData from '../../../../../resources/test_data/iras/reviewResearch/userAdministration/manageReviewBodies/pages/create_review_body_page_data.json';
import * as buttonTextData from '../../../../../resources/test_data/common/button_text_data.json';

//Declare Page Objects
export default class CreateReviewBodyPage {
  readonly page: Page;
  readonly createReviewBodyPageData: typeof createReviewBodyPageData;
  readonly buttonTextData: typeof buttonTextData;
  readonly pageHeading: Locator;
  readonly organisationNameLbl: Locator;
  readonly organisationNameVal: Locator;
  readonly organisationNameError: Locator;
  readonly countryLbl: Locator;
  readonly countryVal: Locator;
  readonly countryError: Locator;
  readonly countryOption1Lbl: Locator;
  readonly countryOption2Lbl: Locator;
  readonly countryOption3Lbl: Locator;
  readonly countryOption4Lbl: Locator;
  readonly emailAddressLbl: Locator;
  readonly emailAddressVal: Locator;
  readonly emailAddressError: Locator;
  readonly descriptionLbl: Locator;
  readonly descriptionVal: Locator;
  readonly completeBtn: Locator;

  //Initialize Page Objects
  constructor(page: Page) {
    this.page = page;
    this.createReviewBodyPageData = createReviewBodyPageData;

    //Locators
    this.pageHeading = this.page.getByTestId('title'); // update
    this.organisationNameLbl = this.page.getByTestId('Name').locator('label'); // update
    this.organisationNameVal = this.page.getByTestId('Name').locator('label'); // update
    this.organisationNameError = this.page.getByTestId('Name').locator('label'); // update
    this.countryLbl = this.page.getByTestId('app-name'); // update
    this.countryVal = this.page.getByTestId('app-name'); // update selected country here
    this.countryError = this.page.getByTestId('app-name'); // update
    this.countryOption1Lbl = this.page.getByTestId('Description').locator('label'); // update
    this.countryOption2Lbl = this.page.getByTestId('app-description'); // update
    this.countryOption3Lbl = this.page.getByTestId('app-description'); // update
    this.countryOption4Lbl = this.page.getByTestId('app-description'); // update
    this.emailAddressLbl = this.page.getByTestId('app-description'); // update
    this.emailAddressVal = this.page.getByTestId('app-description'); // update
    this.emailAddressError = this.page.getByTestId('app-description'); // update
    this.descriptionLbl = this.page.getByTestId('app-description'); // update
    this.descriptionVal = this.page.getByTestId('app-description'); // update
    this.completeBtn = this.page
      .locator('.gem-c-button')
      .and(this.page.getByText(this.buttonTextData.Create_Review_Body_Page.Complete, { exact: true }));
  }

  //Page Methods
  async goto() {
    await this.page.goto('application/startnewapplication'); //update
  }

  async assertOnCreateReviewbodyPage() {
    await expect(this.pageHeading).toBeVisible();
    await expect(this.pageHeading).toHaveText(this.createReviewBodyPageData.Create_Review_Body_Page.heading);
    await expect(this.organisationNameLbl).toHaveText(
      this.createReviewBodyPageData.Create_Review_Body_Page.organisation_name_label
    );
    await expect(this.countryLbl).toHaveText(this.createReviewBodyPageData.Create_Review_Body_Page.country_label);
    await expect(this.countryOption1Lbl).toHaveText(
      this.createReviewBodyPageData.Create_Review_Body_Page.country_option1_label
    );
    await expect(this.countryOption2Lbl).toHaveText(
      this.createReviewBodyPageData.Create_Review_Body_Page.country_option2_label
    );
    await expect(this.countryOption3Lbl).toHaveText(
      this.createReviewBodyPageData.Create_Review_Body_Page.country_option3_label
    );
    await expect(this.countryOption4Lbl).toHaveText(
      this.createReviewBodyPageData.Create_Review_Body_Page.country_option4_label
    );
    await expect(this.emailAddressLbl).toHaveText(
      this.createReviewBodyPageData.Create_Review_Body_Page.email_address_label
    );
    await expect(this.descriptionLbl).toHaveText(
      this.createReviewBodyPageData.Create_Review_Body_Page.description_label
    );
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
