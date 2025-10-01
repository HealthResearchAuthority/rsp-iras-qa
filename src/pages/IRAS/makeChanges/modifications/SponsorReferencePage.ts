import { expect, Locator, Page } from '@playwright/test';
import * as sponsorReferencePageTestData from '../../../../resources/test_data/iras/make_changes/modifications/sponsor_reference_data.json';

//Declare Page Objects
export default class SponsorReferencePage {
  readonly page: Page;
  readonly sponsorReferencePageTestData: typeof sponsorReferencePageTestData;
  readonly pageHeading: Locator;
  readonly sponsor_modification_reference_textbox: Locator;
  readonly sponsor_summary_textbox: Locator;
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
    this.sponsor_modification_reference_textbox = this.page.getByLabel(
      this.sponsorReferencePageTestData.Sponsor_Reference_Page.sponsor_modification_reference_label,
      {
        exact: true,
      }
    );
    this.sponsor_modification_date_day_textbox = this.page.getByLabel(
      this.sponsorReferencePageTestData.Sponsor_Reference_Page.sponsor_modification_date_day_label,
      {
        exact: true,
      }
    );
    this.sponsor_modification_date_month_dropdown = this.page.getByLabel(
      this.sponsorReferencePageTestData.Sponsor_Reference_Page.sponsor_modification_date_month_label,
      {
        exact: true,
      }
    );
    this.sponsor_modification_date_year_textbox = this.page.getByLabel(
      this.sponsorReferencePageTestData.Sponsor_Reference_Page.sponsor_modification_date_year_label,
      {
        exact: true,
      }
    );
    this.sponsor_summary_textbox = this.page.getByLabel(
      this.sponsorReferencePageTestData.Sponsor_Reference_Page.sponsor_summary_label,
      {
        exact: true,
      }
    );
  }

  //Page Methods
  async assertOnSponsorReferencePage() {
    await expect(this.pageHeading).toBeVisible();
  }
}
