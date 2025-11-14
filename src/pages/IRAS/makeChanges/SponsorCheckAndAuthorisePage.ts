import { expect, Locator, Page } from '@playwright/test';
import * as sponsorCheckAndAuthorisePageTestData from '../../../resources/test_data/iras/make_changes/sponsor_check_and_authorise_page_data.json';

//Declare Page Objects
export default class SponsorCheckAndAuthorisePage {
  readonly page: Page;
  readonly sponsorCheckAndAuthorisePageTestData: typeof sponsorCheckAndAuthorisePageTestData;
  readonly mainPageContent: Locator;
  readonly pageHeading: Locator;
  readonly dateCreatedValue: Locator;
  readonly statusValue: Locator;
  readonly outcomeBodyLabel: Locator;
  readonly outcome_selection_radio: Locator;

  //Initialize Page Objects
  constructor(page: Page) {
    this.page = page;
    this.sponsorCheckAndAuthorisePageTestData = sponsorCheckAndAuthorisePageTestData;

    //Locators
    this.mainPageContent = this.page.getByTestId('main-content');
    this.pageHeading = this.page
      .getByRole('heading')
      .getByText(this.sponsorCheckAndAuthorisePageTestData.Sponsor_Check_And_Authorise_Page.pageHeading);
    this.dateCreatedValue = this.page
      .locator('[class$="key"]')
      .getByText(this.sponsorCheckAndAuthorisePageTestData.Sponsor_Check_And_Authorise_Page.dateCreated)
      .locator('..')
      .locator('[class$="value"]');
    this.statusValue = this.page
      .locator('[class$="key"]')
      .getByText(this.sponsorCheckAndAuthorisePageTestData.Sponsor_Check_And_Authorise_Page.status)
      .locator('..')
      .locator('[class$="value"]');
    this.outcomeBodyLabel = this.page
      .getByText(this.sponsorCheckAndAuthorisePageTestData.Sponsor_Check_And_Authorise_Page.outcomeHeading, {
        exact: true,
      })
      .locator('..')
      .getByRole('paragraph');
    this.outcome_selection_radio = this.page.getByRole('radio');
  }

  //Page Methods
  async assertOnSponsorCheckAndAuthorisePage() {
    await expect.soft(this.pageHeading).toBeVisible();
  }
}
