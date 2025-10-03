import { expect, Locator, Page } from '@playwright/test';
import * as sponsorReferencePageTestData from '../../../../resources/test_data/iras/make_changes/modifications/sponsor_reference_data.json';

//Declare Page Objects
export default class SponsorReferencePage {
  readonly page: Page;
  readonly sponsorReferencePageTestData: typeof sponsorReferencePageTestData;
  readonly pageHeading: Locator;
  readonly reviewAllChangesHeading: Locator;
  readonly sponsor_modification_reference_textbox: Locator;
  readonly sponsor_summary_textbox: Locator;
  readonly sponsor_modification_date_day_textbox: Locator;
  readonly sponsor_modification_date_month_dropdown: Locator;
  readonly sponsor_modification_date_year_textbox: Locator;
  readonly sponsor_modification_date_label: Locator;
  readonly sponsor_modification_date_hint_label: Locator;
  //Initialize Page Objects
  constructor(page: Page) {
    this.page = page;
    this.sponsorReferencePageTestData = sponsorReferencePageTestData;

    //Locators
    this.pageHeading = this.page.getByRole('heading', {
      name: sponsorReferencePageTestData.Sponsor_Reference_Page.heading,
    });

    this.reviewAllChangesHeading = this.page.getByRole('heading', {
      name: sponsorReferencePageTestData.Review_All_Changes_Page.heading,
    });

    this.sponsor_modification_reference_textbox = this.page.getByTestId('IQA505_Text');

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
    this.sponsor_summary_textbox = this.page.getByTestId('IQA507_Text');
    this.sponsor_modification_date_label = this.page.locator('//*[@id="Questions[1].AnswerText"]/label');
    this.sponsor_modification_date_hint_label = this.page.locator('//*[@id="Questions[1]_AnswerText-hint"]/p');
  }

  //Page Methods
  async assertOnSponsorReferencePage() {
    await expect(this.pageHeading).toBeVisible();
  }
  async assertOnReviewAllChangesPage() {
    await expect(this.reviewAllChangesHeading).toBeVisible();
  }
}
