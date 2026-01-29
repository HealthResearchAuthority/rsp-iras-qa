import { expect, Locator, Page } from '@playwright/test';
import * as myOrganisationsAuditHistoryPageTestData from '../../../../resources/test_data/iras/reviewResearch/sponsorWorkspace/my_organisations_audit_history_page_data.json';

//Declare Page Objects
export default class MyOrganisationsAuditHistoryPage {
  readonly page: Page;
  readonly myOrganisationsAuditHistoryPageTestData: typeof myOrganisationsAuditHistoryPageTestData;
  readonly page_heading: Locator;
  readonly date_label: Locator;
  readonly event_description_label: Locator;
  readonly username_label: Locator;

  //Initialize Page Objects
  constructor(page: Page) {
    this.page = page;
    this.myOrganisationsAuditHistoryPageTestData = myOrganisationsAuditHistoryPageTestData;

    //Locators
    this.page_heading = this.page
      .getByRole('heading')
      .getByText(this.myOrganisationsAuditHistoryPageTestData.My_Organisations_Audit_History_Page.page_heading);
    this.date_label = this.page.locator('th').first();
    this.event_description_label = this.page.locator('th').nth(1);
    this.username_label = this.page.locator('th').last();
  }

  //Page Methods

  async assertOnMyOrgAuditHistory() {
    await expect.soft(this.page_heading).toBeVisible();
  }

  async sortAuditDateListValues(datesInput: string[]): Promise<string[]> {
    const listAsDates: Date[] = [];
    const sortedListAsStrings: string[] = [];
    const formattedDates = datesInput.map((dates) => {
      const [day, month, year, at, time] = dates.split(' ');
      return [day, month, year, at, time];
    });

    for (const entry of formattedDates.entries()) {
      const dateEntryString = `${entry[1][2]} ${entry[1][1]} ${entry[1][0]} ${entry[1][4]}`;
      const dateFormattedEntry = new Date(dateEntryString);
      listAsDates.push(dateFormattedEntry);
    }

    listAsDates.sort((a, b) => b.getTime() - a.getTime());

    for (const date of listAsDates) {
      sortedListAsStrings.push(
        date
          .toLocaleString('en-GB', {
            day: '2-digit',
            month: 'short',
            year: 'numeric',
            hour: 'numeric',
            minute: 'numeric',
          })
          .replace(',', ' at')
          .replace('Sept', 'Sep')
      );
    }
    return sortedListAsStrings;
  }
}
