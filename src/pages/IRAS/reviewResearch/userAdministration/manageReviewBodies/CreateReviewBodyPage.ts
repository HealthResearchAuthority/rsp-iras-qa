import { expect, Locator, Page } from '@playwright/test';
import * as createReviewBodyPageData from '../../../../../resources/test_data/iras/reviewResearch/userAdministration/manageReviewBodies/create_review_body_page_data.json';
import * as buttonTextData from '../../../../../resources/test_data/common/button_text_data.json';

//Declare Page Objects
export default class CreateReviewBodyPage {
  readonly page: Page;
  readonly createReviewBodyPageData: typeof createReviewBodyPageData;
  readonly buttonTextData: typeof buttonTextData;
  private _unique_org_name: string;
  readonly page_heading: Locator;
  readonly validation_error: Locator;
  readonly char_count_error: Locator;
  readonly organisation_name_text: Locator;
  readonly organisation_name_error: Locator;
  readonly email_address_text: Locator;
  readonly email_address_error: Locator;
  readonly description_text: Locator;
  readonly description_error: Locator;
  readonly description_reason_error: Locator;
  readonly continueBtn: Locator;
  readonly country_fieldset: Locator;
  readonly country_checkbox: Locator;
  readonly country_error: Locator;

  //Initialize Page Objects
  constructor(page: Page) {
    this.page = page;
    this.createReviewBodyPageData = createReviewBodyPageData;
    this.buttonTextData = buttonTextData;
    this._unique_org_name = '';

    //Locators
    this.page_heading = this.page
      .getByRole('heading')
      .getByText(this.createReviewBodyPageData.Create_Review_Body_Page.page_heading);
    this.validation_error = this.page.locator('.govuk-error-message');
    this.char_count_error = this.page.locator('.govuk-character-count__message');
    this.organisation_name_text = this.page.getByLabel(
      this.createReviewBodyPageData.Create_Review_Body_Page.organisation_name_label,
      { exact: true }
    );
    this.organisation_name_error = this.organisation_name_text.locator('..').locator(this.validation_error);
    this.country_fieldset = this.page.getByRole('group', {
      name: this.createReviewBodyPageData.Create_Review_Body_Page.country_label,
      exact: true,
    });
    this.country_checkbox = this.country_fieldset.getByRole('checkbox');
    this.country_error = this.country_fieldset.locator(this.validation_error);
    this.email_address_text = this.page.getByLabel(
      this.createReviewBodyPageData.Create_Review_Body_Page.email_address_label,
      { exact: true }
    );
    this.email_address_error = this.email_address_text.locator('..').locator(this.validation_error);
    this.description_text = this.page.getByLabel(
      this.createReviewBodyPageData.Create_Review_Body_Page.description_label
    );
    this.description_error = this.description_text.locator('..').locator(this.validation_error).first();
    this.description_reason_error = this.description_text.locator('..').locator(this.char_count_error);
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

  //Getters & Setters for Private Variables
  async getUniqueOrgName(): Promise<string> {
    return this._unique_org_name;
  }

  async setUniqueOrgName(value: string): Promise<void> {
    this._unique_org_name = value;
  }
}
