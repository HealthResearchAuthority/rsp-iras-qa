import { expect, Locator, Page } from '@playwright/test';
import * as sponsorModificationPageTestData from '../../../resources/test_data/iras/make_changes/sponsor_modification_page_data.json';

//Declare Page Objects
export default class SponsorModificationPage {
  readonly page: Page;
  readonly sponsorModificationPageTestData: typeof sponsorModificationPageTestData;
  readonly mainPageContent: Locator;
  readonly pageHeading: Locator;

  //Initialize Page Objects
  constructor(page: Page) {
    this.page = page;
    this.sponsorModificationPageTestData = sponsorModificationPageTestData;

    //Locators
    this.mainPageContent = this.page.getByTestId('main-content');
    this.pageHeading = this.page
      .getByRole('heading')
      .getByText(this.sponsorModificationPageTestData.Sponsor_Modification_Page.pageHeading, { exact: true });
  }

  //Page Methods
  async assertOnSponsorModificationPage() {
    await expect.soft(this.pageHeading).toBeVisible();
  }
}
