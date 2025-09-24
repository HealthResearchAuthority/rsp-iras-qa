import { Locator, Page } from '@playwright/test';
import * as modificationsReceivedCommonPagePageTestData from '../../../../resources/test_data/iras/reviewResearch/receiveAmendments/modifications_received_common_data.json';
import * as searchFilterResultsData from '../../../../resources/test_data/common/search_filter_results_data.json';

//Declare Page Objects
export default class ModificationsReceivedCommonPage {
  readonly page: Page;
  readonly modificationsReceivedCommonPagePageTestData: typeof modificationsReceivedCommonPagePageTestData;
  readonly searchFilterResultsData: typeof searchFilterResultsData;
  private _days_since_submission_from_filter: number;
  private _days_since_submission_to_filter: number;
  readonly days_since_submission_from_text: Locator;
  readonly days_since_submission_filter_input: Locator;
  readonly days_since_submission_label: Locator;
  readonly days_since_submission_hint_label: Locator;
  readonly days_since_submission_to_separator: Locator;
  readonly days_since_submission_suffix_label: Locator;

  //Initialize Page Objects
  constructor(page: Page) {
    this.page = page;
    this.modificationsReceivedCommonPagePageTestData = modificationsReceivedCommonPagePageTestData;
    this.searchFilterResultsData = searchFilterResultsData;
    this._days_since_submission_from_filter = 0;
    this._days_since_submission_to_filter = 0;

    //Locators
    this.days_since_submission_from_text = this.page.getByTestId('Search_FromDaysSinceSubmission');
    this.days_since_submission_filter_input = this.page
      .locator('.search-filter-section__content')
      .filter({ has: this.days_since_submission_from_text });
    this.days_since_submission_label = this.days_since_submission_filter_input.getByText(
      this.modificationsReceivedCommonPagePageTestData.Tasklist_Page.days_since_submission_label
    );
    this.days_since_submission_hint_label = this.days_since_submission_filter_input.getByText(
      this.modificationsReceivedCommonPagePageTestData.Tasklist_Page.days_since_submission_hint_label
    );
    this.days_since_submission_to_separator = this.days_since_submission_filter_input.getByText(
      this.searchFilterResultsData.to_separator,
      { exact: true }
    );
    this.days_since_submission_suffix_label = this.days_since_submission_filter_input.getByText(
      this.modificationsReceivedCommonPagePageTestData.Tasklist_Page.days_since_suffix,
      { exact: true }
    );
  }

  //Getters & Setters for Private Variables

  async getDaysSinceSubmissionFromFilter(): Promise<number> {
    return this._days_since_submission_from_filter;
  }

  async setDaysSinceSubmissionFromFilter(value: number): Promise<void> {
    this._days_since_submission_from_filter = value;
  }

  async getDaysSinceSubmissionToFilter(): Promise<number> {
    return this._days_since_submission_to_filter;
  }

  async setDaysSinceSubmissionToFilter(value: number): Promise<void> {
    this._days_since_submission_to_filter = value;
  }

  async sortDateSubmittedListValues(datesSubmitted: string[], sortDirection: string): Promise<string[]> {
    const listAsDates: Date[] = [];
    const sortedListAsStrings: string[] = [];
    const formattedDatesSubmitted = datesSubmitted.map((dates) => {
      const [day, month, year] = dates.split(' ');
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
      sortedListAsStrings.push(
        date.toLocaleString('en-GB', { day: '2-digit', month: 'short', year: 'numeric' }).replace('Sept', 'Sep')
      );
    }
    return sortedListAsStrings;
  }

  async sortDaysSinceSubmittedListValues(daysSinceSubmitted: string[], sortDirection: string): Promise<string[]> {
    const listAsNums: number[] = [];
    const sortedListAsStrings: string[] = [];
    for (const days of daysSinceSubmitted) {
      const daysAsNum = Number.parseInt(
        days.replace(this.modificationsReceivedCommonPagePageTestData.Tasklist_Page.days_since_suffix, '').trim()
      );
      listAsNums.push(daysAsNum);
    }

    if (sortDirection.toLowerCase() == 'descending') {
      listAsNums.sort((a, b) => b - a);
    } else {
      listAsNums.sort((a, b) => a - b);
    }

    for (const nums of listAsNums) {
      const days = `${nums} ${this.modificationsReceivedCommonPagePageTestData.Tasklist_Page.days_since_suffix}`;
      sortedListAsStrings.push(days);
    }
    return sortedListAsStrings;
  }

  async getVisibleIrasIds(modificationIds: string[]): Promise<string[]> {
    const visibleIrasIds = modificationIds.map((id) => {
      const [irasId] = id.split('/');
      return irasId;
    });
    return visibleIrasIds;
  }

  async checkSingleValueEquals(
    irasIds: string[],
    shortTitles: string[],
    daysSinceSubmission: string[],
    datesSubmitted: string[],
    searchInputDataset: any,
    searchInput: string
  ): Promise<boolean> {
    let valuesMatch = false;
    if (searchInput.toLowerCase().includes('iras')) {
      valuesMatch = irasIds.toString() == searchInputDataset[searchInput].search_input_text;
    }
    if (searchInput.toLowerCase().includes('title')) {
      valuesMatch =
        shortTitles.toString().toLowerCase() == searchInputDataset[searchInput].short_project_title_text.toLowerCase();
    }
    if (searchInput.toLowerCase().includes('days')) {
      const actualDay = daysSinceSubmission.toString();
      const expectedDay = await this.getDaysSinceSubmissionFromFilter();
      valuesMatch = Number.parseInt(actualDay) == expectedDay;
    }
    if (searchInput.toLowerCase().includes('date')) {
      const day = searchInputDataset[searchInput].day_to_text.padStart(2, '0');
      const month = searchInputDataset[searchInput].month_to_dropdown.substring(0, 3);
      const expectedValue = `${day} ${month} ${searchInputDataset[searchInput].year_to_text}`;
      valuesMatch = datesSubmitted.toString() == expectedValue;
    }
    return valuesMatch;
  }

  async checkMultiValuesStartsWith(
    irasIds: string[],
    shortTitles: string[],
    searchInputDataset: any,
    searchInput: string
  ): Promise<boolean> {
    let valuesStartWith = false;
    if (searchInput.toLowerCase().includes('iras')) {
      for (const irasId of irasIds) {
        valuesStartWith = irasId.startsWith(searchInputDataset[searchInput].search_input_text);
        if (!valuesStartWith) {
          return valuesStartWith;
        }
      }
    }
    if (searchInput.toLowerCase().includes('title')) {
      for (const title of shortTitles) {
        valuesStartWith = title
          .toLowerCase()
          .startsWith(searchInputDataset[searchInput].short_project_title_text.toLowerCase());
        if (!valuesStartWith) {
          return valuesStartWith;
        }
      }
    }
    return valuesStartWith;
  }

  async checkPartialValuesContain(
    irasIds: string[],
    shortTitles: string[],
    searchInputDataset: any,
    searchInput: string
  ): Promise<boolean> {
    let valuesContain = false;
    if (searchInput.toLowerCase().includes('iras')) {
      for (const irasId of irasIds) {
        valuesContain = irasId.includes(searchInputDataset[searchInput].search_input_text);
        if (!valuesContain) {
          return valuesContain;
        }
      }
    }
    if (searchInput.toLowerCase().includes('title')) {
      for (const title of shortTitles) {
        valuesContain = title
          .toLowerCase()
          .includes(searchInputDataset[searchInput].short_project_title_text.toLowerCase());
        if (!valuesContain) {
          return valuesContain;
        }
      }
    }
    return valuesContain;
  }

  async checkDaysSearchResultValues(
    daysResultValues: string[],
    searchInputDataset: any,
    searchInput: string
  ): Promise<boolean> {
    let expectedDaysResultFound = false;
    const fromExpectedDay = Number.parseInt(searchInputDataset[searchInput].days_since_submission_from_text);
    const toExpectedDay = Number.parseInt(searchInputDataset[searchInput].days_since_submission_to_text);
    for (const actualDay of daysResultValues) {
      if (searchInput.toLowerCase().includes('to')) {
        expectedDaysResultFound = Number.parseInt(actualDay) <= toExpectedDay;
      } else if (searchInput.toLowerCase().includes('from')) {
        expectedDaysResultFound = Number.parseInt(actualDay) >= fromExpectedDay;
      } else {
        expectedDaysResultFound =
          Number.parseInt(actualDay) >= fromExpectedDay && Number.parseInt(actualDay) <= toExpectedDay;
      }
      if (!expectedDaysResultFound) {
        return expectedDaysResultFound;
      }
    }
    return expectedDaysResultFound;
  }
}
