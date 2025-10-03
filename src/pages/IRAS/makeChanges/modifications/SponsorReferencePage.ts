import { expect, Locator, Page } from '@playwright/test';
import * as sponsorReferencePageTestData from '../../../../resources/test_data/iras/make_changes/modifications/sponsor_reference_data.json';

//Declare Page Objects
export default class SponsorReferencePage {
  readonly page: Page;
  readonly sponsorReferencePageTestData: typeof sponsorReferencePageTestData;
  readonly pageHeading: Locator;
  readonly sponsor_modification_reference_textbox: Locator;
  readonly sponsor_summary_textbox: Locator;
  readonly sponsor_modification_date_formgroup: Locator;
  readonly sponsor_modification_date_day_textbox: Locator;
  readonly sponsor_modification_date_month_dropdown: Locator;
  readonly sponsor_modification_date_year_textbox: Locator;

  //Initialize Page Objects
  constructor(page: Page) {
    this.page = page;
    this.sponsorReferencePageTestData = sponsorReferencePageTestData;

    //Locators
    this.pageHeading = this.page.getByRole('heading', {
      name: sponsorReferencePageTestData.Sponsor_Reference_Page.heading,
    });
    this.sponsor_modification_reference_textbox = this.page
      .locator('.govuk-form-group')
      .locator('.govuk-form-group', {
        has: this.page.getByText(
          this.sponsorReferencePageTestData.Sponsor_Reference_Page.sponsor_modification_reference_label
        ),
      })
      .getByRole('textbox');
    this.sponsor_modification_date_formgroup = this.page.locator('.govuk-form-group').locator('.govuk-form-group', {
      has: this.page.getByText(
        this.sponsorReferencePageTestData.Sponsor_Reference_Page.sponsor_modification_reference_date_label
      ),
    });
    this.sponsor_modification_date_day_textbox = this.sponsor_modification_date_formgroup
      .locator('.govuk-form-group', {
        has: this.page.getByText(
          this.sponsorReferencePageTestData.Sponsor_Reference_Page.sponsor_modification_date_day_label
        ),
      })
      .getByRole('textbox');
    this.sponsor_modification_date_month_dropdown = this.sponsor_modification_date_formgroup
      .locator('.govuk-form-group', {
        has: this.page.getByText(
          this.sponsorReferencePageTestData.Sponsor_Reference_Page.sponsor_modification_date_month_label
        ),
      })
      .getByRole('combobox');
    this.sponsor_modification_date_year_textbox = this.sponsor_modification_date_formgroup
      .locator('.govuk-form-group', {
        has: this.page.getByText(
          this.sponsorReferencePageTestData.Sponsor_Reference_Page.sponsor_modification_date_year_label
        ),
      })
      .getByRole('textbox');
    this.sponsor_summary_textbox = this.page
      .locator('.govuk-form-group')
      .locator('.govuk-form-group', {
        has: this.page.getByText(this.sponsorReferencePageTestData.Sponsor_Reference_Page.sponsor_summary_label),
      })
      .getByRole('textbox');
  }

  //Page Methods
  async assertOnSponsorReferencePage() {
    await expect(this.pageHeading).toBeVisible();
  }
}
