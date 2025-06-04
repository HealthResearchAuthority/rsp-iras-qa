import { expect, Locator, Page } from '@playwright/test';
import * as editReviewBodyPageData from '../../../../../resources/test_data/iras/reviewResearch/userAdministration/manageReviewBodies/edit_review_body_page_data.json';
import * as buttonTextData from '../../../../../resources/test_data/common/button_text_data.json';
import { confirmStringNotNull } from '../../../../../utils/UtilFunctions';

//Declare Page Objects
export default class EditReviewBodyPage {
  readonly page: Page;
  readonly editReviewBodyPageData: typeof editReviewBodyPageData;
  readonly buttonTextData: typeof buttonTextData;
  private _unique_org_name: string;
  readonly page_heading: Locator;
  readonly validation_error: Locator;
  readonly organisation_name_text: Locator;
  readonly organisation_name_error: Locator;
  readonly email_address_text: Locator;
  readonly email_address_error: Locator;
  readonly description_text: Locator;
  readonly description_error: Locator;
  readonly save_button: Locator;
  readonly country_fieldset: Locator;
  readonly country_checkbox: Locator;
  readonly country_error: Locator;
  readonly country_label: Locator;

  //Initialize Page Objects
  constructor(page: Page) {
    this.page = page;
    this.editReviewBodyPageData = editReviewBodyPageData;
    this.buttonTextData = buttonTextData;
    this._unique_org_name = '';

    //Locators
    this.page_heading = this.page
      .getByRole('heading')
      .getByText(this.editReviewBodyPageData.Edit_Review_Body_Page.page_heading);
    this.validation_error = this.page.locator('.field-validation-error');
    this.organisation_name_text = this.page.getByLabel(
      this.editReviewBodyPageData.Edit_Review_Body_Page.organisation_name_label,
      { exact: true }
    );
    this.organisation_name_error = this.organisation_name_text.locator('..').locator(this.validation_error);
    this.country_label = this.page
      .locator('.govuk-label')
      .getByText(this.editReviewBodyPageData.Edit_Review_Body_Page.country_label, { exact: true });
    this.country_fieldset = this.page.locator('.govuk-form-group', { has: this.country_label });
    this.country_checkbox = this.country_fieldset.getByRole('checkbox');
    this.country_error = this.country_fieldset.locator(this.validation_error);
    this.email_address_text = this.page.getByLabel(
      this.editReviewBodyPageData.Edit_Review_Body_Page.email_address_label,
      { exact: true }
    );
    this.email_address_error = this.email_address_text.locator('..').locator(this.validation_error);
    this.description_text = this.page.getByLabel(this.editReviewBodyPageData.Edit_Review_Body_Page.description_label);
    this.description_error = this.description_text.locator('..').locator(this.validation_error);
    this.save_button = this.page
      .getByRole('button')
      .getByText(this.buttonTextData.Edit_Review_Body_Page.Save, { exact: true });
  }

  //Page Methods
  async goto() {
    await this.page.goto('reviewbody/create');
  }

  async assertOnEditReviewbodyPage() {
    await expect(this.page_heading).toBeVisible();
  }

  async getCheckedValues(): Promise<string[]> {
    const actualCheckedValues: string[] = [];
    for (let index = 0; index < (await this.country_checkbox.count()); index++) {
      if (await this.country_checkbox.nth(index).isChecked()) {
        const checkedValue = confirmStringNotNull(
          await this.country_checkbox.nth(index).locator('..').locator('label').textContent()
        );
        actualCheckedValues.push(checkedValue);
      }
    }
    return actualCheckedValues;
  }

  //Getters & Setters for Private Variables
  async getUniqueOrgName(): Promise<string> {
    return this._unique_org_name;
  }

  async setUniqueOrgName(value: string): Promise<void> {
    this._unique_org_name = value;
  }
}
