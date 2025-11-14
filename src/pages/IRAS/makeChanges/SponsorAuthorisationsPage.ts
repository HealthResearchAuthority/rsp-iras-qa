import { expect, Locator, Page } from '@playwright/test';
import * as sponsorAuthorisationsPageTestData from '../../../resources/test_data/iras/make_changes/sponsor_authorisations_page_data.json';
import CommonItemsPage from '../../Common/CommonItemsPage';

//Declare Page Objects
export default class SponsorAuthorisationsPage {
  readonly page: Page;
  readonly sponsorAuthorisationsPageTestData: typeof sponsorAuthorisationsPageTestData;
  readonly pageHeading: Locator;
  readonly tableCell: Locator;

  //Initialize Page Objects
  constructor(page: Page) {
    this.page = page;
    this.sponsorAuthorisationsPageTestData = sponsorAuthorisationsPageTestData;

    //Locators
    this.pageHeading = this.page
      .getByRole('heading')
      .getByText(this.sponsorAuthorisationsPageTestData.Sponsor_Authorisations_Page.pageHeading);
    this.tableCell = this.page.locator('td');
  }

  //Page Methods
  async assertOnSponsorAuthorisationsPageTestData() {
    await expect.soft(this.pageHeading).toBeVisible();
  }

  async getModificationStatusForSponsor(status: string) {
    if (status.toLowerCase() == 'with sponsor') {
      return this.sponsorAuthorisationsPageTestData.Sponsor_Authorisations_Page.withSponsorStatus;
    } else if (status.toLowerCase() == 'with review body') {
      return this.sponsorAuthorisationsPageTestData.Sponsor_Authorisations_Page.withReviewBodyStatus;
    } else if (status.toLowerCase() == 'not authorised') {
      return this.sponsorAuthorisationsPageTestData.Sponsor_Authorisations_Page.notAuthorisedStatus;
    }
  }

  async findmodification(
    commonItemsPage: CommonItemsPage,
    modificationID: string,
    modificationStatusForSponsor?: string
  ) {
    let hasNextPage = true;
    while (hasNextPage) {
      const rows = await commonItemsPage.tableBodyRows.all();
      for (const row of rows) {
        const match = await this.isMatchingRow(commonItemsPage, row, modificationID, modificationStatusForSponsor);
        if (match) {
          return row;
        }
      }
      hasNextPage = await commonItemsPage.shouldGoToNextPage();
      if (hasNextPage) {
        await commonItemsPage.goToNextPage();
      }
    }
    throw new Error(`No matching record found`);
  }

  async isMatchingRow(
    commonItemsPage: CommonItemsPage,
    row: any,
    modificationID: string,
    modificationStatusForSponsor?: string
  ): Promise<boolean> {
    const columns = await row.locator(this.tableCell);
    const idText = (await columns.nth(0).innerText()).trim();
    const statusText = (await columns.nth(5).innerText()).trim();
    const idMatch = idText === modificationID;
    const statusMatch = modificationStatusForSponsor ? statusText === modificationStatusForSponsor : true;
    return idMatch && statusMatch;
  }
}
