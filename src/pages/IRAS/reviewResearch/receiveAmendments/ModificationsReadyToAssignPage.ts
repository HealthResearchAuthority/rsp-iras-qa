import { expect, Locator, Page } from '@playwright/test';
import * as modificationsReadyToAssignPageData from '../../../../resources/test_data/iras/reviewResearch/receiveAmendments/modifications_ready_to_assign_page_data.json';

//Declare Page Objects
export default class ModificationsReadyToAssignPage {
  readonly page: Page;
  readonly modificationsReadyToAssignPageData: typeof modificationsReadyToAssignPageData;

  readonly page_heading: Locator;
  readonly page_description: Locator;
  readonly modification_button_label: Locator;
  readonly advanced_filter_label: Locator;
  readonly search_button_label: Locator;
  readonly modification_checkbox: Locator;

  //Initialize Page Objects
  constructor(page: Page) {
    this.page = page;
    this.modificationsReadyToAssignPageData = modificationsReadyToAssignPageData;

    //Locators
    this.page_heading = this.page.getByTestId('title');
    this.modification_button_label = this.page
      .getByRole('button')
      .getByText(this.modificationsReadyToAssignPageData.Modifications_Ready_To_Assign_Page.modification_button_label, {
        exact: true,
      });
    this.advanced_filter_label = this.page.getByRole('button', {
      name: this.modificationsReadyToAssignPageData.Modifications_Ready_To_Assign_Page.advanced_filter_label,
    });
    this.search_button_label = this.page.getByText('Search');
    this.modification_checkbox = this.page.getByRole('button', {
      name: this.modificationsReadyToAssignPageData.Modifications_Ready_To_Assign_Page.modification_checkbox,
    });
  }

  //Page Methods

  async goto() {
    await this.page.goto('modificationstasklist/index');
  }
  async assertOnModificationsReadyToAssignPage() {
    await expect(this.page_heading).toBeVisible();
  }

  async sortDateSubmittedListValues(datesSubmitted: string[], sortDirection: string): Promise<string[]> {
    const listAsDates: Date[] = [];
    const sortedListAsStrings: string[] = [];
    const formattedDatesSubmitted = datesSubmitted.map((id) => {
      const [day, month, year] = id.split(' ');
      return [day, month, year];
    });

    for (const entry of formattedDatesSubmitted.entries()) {
      const usFormattedEntry = entry[1].toReversed();
      const dateEntryString = `${usFormattedEntry[0]} ${usFormattedEntry[1]} ${usFormattedEntry[2]}`;
      const dateFormattedEntry = new Date(dateEntryString);
      listAsDates.push(dateFormattedEntry);
    }

    if (sortDirection.toLowerCase() == 'descending') {
      listAsDates.sort((a, b) => b.getTime() - a.getTime());
    } else {
      listAsDates.sort((a, b) => a.getTime() - b.getTime());
    }

    for (const date of listAsDates) {
      sortedListAsStrings.push(date.toLocaleString('en-GB', { day: '2-digit', month: 'short', year: 'numeric' }));
    }
    return sortedListAsStrings;
  }

  async sortDaysSinceSubmittedListValues(daysSinceSubmitted: string[], sortDirection: string): Promise<string[]> {
    const listAsNums: number[] = [];
    const sortedListAsStrings: string[] = [];
    for (const days of daysSinceSubmitted) {
      const daysAsNum = parseInt(
        days
          .replace(this.modificationsReadyToAssignPageData.Modifications_Ready_To_Assign_Page.tasklist_days_suffix, '')
          .trim()
      );
      listAsNums.push(daysAsNum);
    }

    if (sortDirection.toLowerCase() == 'descending') {
      listAsNums.sort((a, b) => b - a);
    } else {
      listAsNums.sort((a, b) => a - b);
    }

    for (const nums of listAsNums) {
      const days = `${nums} ${this.modificationsReadyToAssignPageData.Modifications_Ready_To_Assign_Page.tasklist_days_suffix}`;
      sortedListAsStrings.push(days);
    }
    return sortedListAsStrings;
  }
}
