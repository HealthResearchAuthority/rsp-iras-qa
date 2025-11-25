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

  async findModification(
    commonItemsPage: CommonItemsPage,
    modificationID: string,
    options?: {
      statusForSponsor?: string;
      dateActionedSponsor?: string;
    }
  ) {
    let hasNextPage = true;
    while (hasNextPage) {
      const rows = await commonItemsPage.tableBodyRows.all();
      for (const row of rows) {
        const match =
          (options?.statusForSponsor &&
            (await this.isMatchingRowForStatus(commonItemsPage, row, modificationID, options.statusForSponsor))) ||
          (options?.dateActionedSponsor &&
            (await this.isMatchingRowForDateActioned(
              commonItemsPage,
              row,
              modificationID,
              options.dateActionedSponsor
            )));
        if (match) return row;
      }
      hasNextPage = await commonItemsPage.shouldGoToNextPage();
      if (hasNextPage) await commonItemsPage.goToNextPage();
    }
    expect.soft(false, `No matching record found for modificationID: ${modificationID}`).toBe(true);
  }

  async isMatchingRowForStatus(
    commonItemsPage: CommonItemsPage,
    row: any,
    modificationID: string,
    statusForSponsor?: string
  ): Promise<boolean> {
    const columns = row.locator(this.tableCell);
    const idText = (await columns.nth(0).innerText()).trim();
    const statusText = (await columns.nth(5).innerText()).trim();
    return idText === modificationID && (statusForSponsor ? statusText === statusForSponsor : true);
  }

  async isMatchingRowForDateActioned(
    commonItemsPage: CommonItemsPage,
    row: any,
    modificationID: string,
    dateActionedSponsor?: string
  ): Promise<boolean> {
    const columns = row.locator(this.tableCell);
    const idText = (await columns.nth(0).innerText()).trim();
    const dateActioned = (await columns.nth(2).innerText()).trim();
    return idText === modificationID && (dateActionedSponsor ? dateActioned === dateActionedSponsor : true);
  }
}
