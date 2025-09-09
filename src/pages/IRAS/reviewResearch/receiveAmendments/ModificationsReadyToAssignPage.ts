import { expect, Locator, Page } from '@playwright/test';
import * as modificationsReadyToAssignPageTestData from '../../../../resources/test_data/iras/reviewResearch/receiveAmendments/modifications_ready_to_assign_page_data.json';
import * as buttonTextData from '../../../../resources/test_data/common/button_text_data.json';
import * as linkTextData from '../../../../resources/test_data/common/link_text_data.json';
import * as searchFilterResultsData from '../../../../resources/test_data/common/search_filter_results_data.json';

//Declare Page Objects
export default class ModificationsReadyToAssignPage {
  readonly page: Page;
  readonly modificationsReadyToAssignPageTestData: typeof modificationsReadyToAssignPageTestData;
  readonly searchFilterResultsData: typeof searchFilterResultsData;
  private _days_since_submission_from_filter: number;
  private _days_since_submission_to_filter: number;
  readonly buttonTextData: typeof buttonTextData;
  readonly linkTextData: typeof linkTextData;
  readonly modifications_tasklist_link: Locator;
  readonly short_project_title_label: Locator;
  readonly modification_id_label: Locator;
  readonly date_submitted_label: Locator;
  readonly days_since_submission_label: Locator;
  readonly checkall_modification_checkbox: Locator;
  readonly page_heading: Locator;
  readonly page_description: Locator;
  readonly modification_button_label: Locator;
  readonly search_input_text: Locator;
  readonly advanced_filter_label: Locator;
  readonly date_from_filter_input: Locator;
  readonly day_from_text: Locator;
  readonly month_from_dropdown: Locator;
  readonly year_from_text: Locator;
  readonly date_to_filter_input: Locator;
  readonly day_to_text: Locator;
  readonly month_to_dropdown: Locator;
  readonly year_to_text: Locator;
  readonly days_since_submission_from_text: Locator;
  readonly days_since_submission_to_text: Locator;
  readonly days_since_submission_filter_input: Locator;
  readonly days_since_submission_label: Locator;
  readonly days_since_submission_hint_label: Locator;
  readonly days_since_submission_to_separator: Locator;
  readonly days_since_submission_suffix_label: Locator;
  readonly short_project_title_text: Locator;
  readonly search_button_label: Locator;
  readonly modification_checkbox: Locator;
  readonly results_table: Locator;

  //Initialize Page Objects
  constructor(page: Page) {
    this.page = page;
    this.modificationsReadyToAssignPageTestData = modificationsReadyToAssignPageTestData;
    this.searchFilterResultsData = searchFilterResultsData;
    this._days_since_submission_from_filter = 0;
    this._days_since_submission_to_filter = 0;
    this.linkTextData = linkTextData;
    this.buttonTextData = buttonTextData;

    //Locators
    this.modifications_tasklist_link = this.page.locator('.govuk-heading-s govuk-link hra-card-heading__link');
    this.short_project_title_label = this.page
      .getByRole('button')
      .getByText(this.modificationsReadyToAssignPageData.Label_Texts.short_project_title_label, {
        exact: true,
      });
    this.modification_id_label = this.page
      .getByRole('button')
      .getByText(this.modificationsReadyToAssignPageData.Label_Texts.modification_id_label, {
        exact: true,
      });
    this.date_submitted_label = this.page
      .getByRole('button')
      .getByText(this.modificationsReadyToAssignPageData.Label_Texts.date_submitted_label, {
        exact: true,
      });
    this.days_since_submission_label = this.page
      .getByRole('button')
      .getByText(this.modificationsReadyToAssignPageTestData.Label_Texts.days_since_submission_label, {
        exact: true,
      });
    this.search_input_text = this.page.getByTestId('Search_IrasId');
    this.checkall_modification_checkbox = this.page.locator('input[id="select-all-modifications"]');
    this.page_heading = this.page.getByTestId('title');
    this.advanced_filter_label = this.page.getByRole('button', {
      name: this.modificationsReadyToAssignPageTestData.Modifications_Ready_To_Assign_Page.advanced_filter_label,
    });
    this.date_from_filter_input = this.page.getByTestId('Search_FromDate_date');
    this.day_from_text = this.date_from_filter_input.getByLabel(
      this.modificationsReadyToAssignPageTestData.Filter_Labels.day_from_label
    );
    this.month_from_dropdown = this.date_from_filter_input.getByLabel(
      this.modificationsReadyToAssignPageTestData.Filter_Labels.month_from_label
    );
    this.year_from_text = this.date_from_filter_input.getByLabel(
      this.modificationsReadyToAssignPageTestData.Filter_Labels.year_from_label
    );
    this.date_to_filter_input = this.page.getByTestId('Search_ToDate_date');
    this.day_to_text = this.date_to_filter_input.getByLabel(
      this.modificationsReadyToAssignPageTestData.Filter_Labels.day_to_label
    );
    this.month_to_dropdown = this.date_to_filter_input.getByLabel(
      this.modificationsReadyToAssignPageTestData.Filter_Labels.month_to_label
    );
    this.year_to_text = this.date_to_filter_input.getByLabel(
      this.modificationsReadyToAssignPageTestData.Filter_Labels.year_to_label
    );
    this.days_since_submission_from_text = this.page.getByTestId('Search_FromDaysSinceSubmission');
    this.days_since_submission_to_text = this.page.getByTestId('Search_ToDaysSinceSubmission');
    this.days_since_submission_filter_input = this.page
      .locator('.search-filter-section__content')
      .filter({ has: this.days_since_submission_from_text });
    this.days_since_submission_label = this.days_since_submission_filter_input.getByText(
      this.modificationsReadyToAssignPageTestData.Modifications_Ready_To_Assign_Page.days_since_submission_label
    );
    this.days_since_submission_hint_label = this.days_since_submission_filter_input.getByText(
      this.modificationsReadyToAssignPageTestData.Modifications_Ready_To_Assign_Page.days_since_submission_hint_label
    );
    this.days_since_submission_to_separator = this.days_since_submission_filter_input.getByText(
      this.searchFilterResultsData.to_separator,
      { exact: true }
    );
    this.days_since_submission_suffix_label = this.days_since_submission_filter_input.getByText(
      this.modificationsReadyToAssignPageTestData.Modifications_Ready_To_Assign_Page.days_since_suffix,
      { exact: true }
    );
    // this.short_project_title_text = this.page.getByLabel(
    //   this.modificationsReadyToAssignPageTestData.Filter_Labels.short_project_title_label
    // );
    this.short_project_title_text = this.page.locator('input[name="Search.ShortProjectTitle"]'); //workaround use above after fix
    this.search_button_label = this.page.getByText('Search');
    // this.modification_checkbox = this.page.locator('input[name="selectedModificationIds"]'); //Check which is better
    this.modification_checkbox = this.page.getByRole('button', {
      name: this.modificationsReadyToAssignPageTestData.Modifications_Ready_To_Assign_Page.modification_checkbox,
    });
    this.results_table = this.page.getByTestId('modificationsTasklistTable');
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

  //Page Methods
  async goto() {
    await this.page.goto('modificationstasklist/index');
  }

  async assertOnModificationsReadyToAssignPage() {
    await expect(this.page_heading).toBeVisible();
    await this.page.waitForLoadState('domcontentloaded');
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
      const daysAsNum = parseInt(
        days
          .replace(
            this.modificationsReadyToAssignPageTestData.Modifications_Ready_To_Assign_Page.tasklist_days_suffix,
            ''
          )
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
      const days = `${nums} ${this.modificationsReadyToAssignPageTestData.Modifications_Ready_To_Assign_Page.tasklist_days_suffix}`;
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
      valuesMatch = parseInt(actualDay) == expectedDay;
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
    const fromExpectedDay = parseInt(searchInputDataset[searchInput].days_since_submission_from_text);
    const toExpectedDay = parseInt(searchInputDataset[searchInput].days_since_submission_to_text);
    for (const actualDay of daysResultValues) {
      if (searchInput.toLowerCase().includes('to')) {
        expectedDaysResultFound = parseInt(actualDay) <= toExpectedDay;
      } else if (searchInput.toLowerCase().includes('from')) {
        expectedDaysResultFound = parseInt(actualDay) >= fromExpectedDay;
      } else {
        expectedDaysResultFound = parseInt(actualDay) >= fromExpectedDay && parseInt(actualDay) <= toExpectedDay;
      }
      if (!expectedDaysResultFound) {
        return expectedDaysResultFound;
      }
    }
    return expectedDaysResultFound;
  }
}
