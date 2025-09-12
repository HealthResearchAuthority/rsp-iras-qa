import { expect, Locator, Page } from '@playwright/test';
import * as modificationsReadyToAssignPageData from '../../../../resources/test_data/iras/reviewResearch/receiveAmendments/modifications_ready_to_assign_page_data.json';
import * as buttonTextData from '../../../../resources/test_data/common/button_text_data.json';
import * as linkTextData from '../../../../resources/test_data/common/link_text_data.json';

//Declare Page Objects
export default class ModificationsReadyToAssignPage {
  readonly page: Page;
  readonly modificationsReadyToAssignPageData: typeof modificationsReadyToAssignPageData;
  private _modification_record: string[];

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
  readonly advanced_filter_label: Locator;
  readonly search_button_label: Locator;
  readonly modification_checkbox: Locator;
  readonly iras_id_search_text: Locator;

  //Initialize Page Objects
  constructor(page: Page) {
    this.page = page;
    this.modificationsReadyToAssignPageData = modificationsReadyToAssignPageData;
    this.linkTextData = linkTextData;
    this.buttonTextData = buttonTextData;
    this._modification_record = [];

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
      .getByText(this.modificationsReadyToAssignPageData.Label_Texts.days_since_submission_label, {
        exact: true,
      });
    this.checkall_modification_checkbox = this.page.locator('input[id="select-all-modifications"]');
    this.page_heading = this.page.getByTestId('title');
    this.advanced_filter_label = this.page.getByRole('button', {
      name: this.modificationsReadyToAssignPageData.Modifications_Ready_To_Assign_Page.advanced_filter_label,
    });
    this.search_button_label = this.page.getByText('Search');
    this.modification_checkbox = this.page.locator('input[name="selectedModificationIds"]');
    this.iras_id_search_text = this.page.getByLabel(
      this.modificationsReadyToAssignPageData.Modifications_Ready_To_Assign_Page.iras_id_search_box_label,
      { exact: true }
    );
  }

  //Getters & Setters for Private Variables

  async getSelectedModifications(): Promise<string[]> {
    return this._modification_record;
  }

  async setSelectedModifications(value: string[]): Promise<void> {
    this._modification_record = value;
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
