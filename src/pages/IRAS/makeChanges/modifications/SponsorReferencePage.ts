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
  readonly sponsor_modification_date_hint_label: Locator;
  readonly sponsor_modification_date_label: Locator;
  readonly characters_remaining_label: Locator;

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
    this.sponsor_modification_date_formgroup = this.page
      .getByText(this.sponsorReferencePageTestData.Sponsor_Reference_Page.sponsor_modification_reference_date_label)
      .locator('..');
    this.sponsor_modification_date_day_textbox = this.sponsor_modification_date_formgroup
      .getByText(this.sponsorReferencePageTestData.Sponsor_Reference_Page.sponsor_modification_date_day_label)
      .locator('..')
      .getByRole('textbox');
    this.sponsor_modification_date_month_dropdown = this.sponsor_modification_date_formgroup
      .getByText(this.sponsorReferencePageTestData.Sponsor_Reference_Page.sponsor_modification_date_month_label)
      .locator('..')
      .getByRole('combobox');
    this.sponsor_modification_date_year_textbox = this.sponsor_modification_date_formgroup
      .getByText(this.sponsorReferencePageTestData.Sponsor_Reference_Page.sponsor_modification_date_year_label)
      .locator('..')
      .getByRole('textbox');
    this.sponsor_summary_textbox = this.page
      .getByText(this.sponsorReferencePageTestData.Sponsor_Reference_Page.sponsor_summary_label)
      .locator('..')
      .getByRole('textbox');
    this.sponsor_modification_date_hint_label = this.page.getByTestId('Questions[1]_AnswerText-hint').locator('p');
    this.sponsor_modification_date_label = this.page.getByTestId('Questions[1].AnswerText').locator('legend').first();
    this.characters_remaining_label = this.page.locator(
      '.govuk-character-count__message.govuk-character-count__status'
    );
  }

  //Page Methods
  async assertOnSponsorReferencePage() {
    await expect(this.pageHeading).toBeVisible();
  }
}
