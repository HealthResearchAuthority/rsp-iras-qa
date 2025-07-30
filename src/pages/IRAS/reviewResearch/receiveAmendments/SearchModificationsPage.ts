import { expect, Locator, Page } from '@playwright/test';
import * as linkTextData from '../../../../resources/test_data/common/link_text_data.json';
import * as searchModificationsPageTestData from '../../../../resources/test_data/iras/reviewResearch/receiveAmendments/search_modifications_page_data.json';
import { confirmStringNotNull } from '../../../../utils/UtilFunctions';

//Declare Page Objects
export default class SearchModificationsPage {
  readonly page: Page;
  readonly searchModificationsPageTestData: typeof searchModificationsPageTestData;
  readonly linkTextData: typeof linkTextData;
  private _modifications_list_after_search: string[];
  readonly page_heading: Locator;
  readonly page_guidance_text: Locator;
  readonly next_button: Locator;
  readonly advanced_filter_chevron: Locator;
  readonly result_count: Locator;
  readonly results_table: Locator;

  //Initialize Page Objects
  constructor(page: Page) {
    this.page = page;
    this.searchModificationsPageTestData = searchModificationsPageTestData;
    this.linkTextData = linkTextData;
    this._modifications_list_after_search = [];

    //Locators
    this.page_heading = this.page
      .getByRole('heading')
      .getByText(this.searchModificationsPageTestData.Search_Modifications_Page.page_heading);
    this.page_guidance_text = this.page
      .getByRole('paragraph')
      .getByText(this.searchModificationsPageTestData.Search_Modifications_Page.page_guidance_text);
    this.next_button = this.page.locator('.govuk-pagination__next a');
    this.advanced_filter_chevron = this.page.getByRole('button', {
      name: this.searchModificationsPageTestData.Search_Modifications_Page.advanced_filter_label,
    });
    this.result_count = this.advanced_filter_chevron
      .locator('..')
      .getByRole('heading', { level: 2 })
      .getByText(this.searchModificationsPageTestData.Search_Modifications_Page.result_count_heading);
    this.results_table = this.page.getByTestId('modificationsTable');
  }

  //Getters & Setters for Private Variables

  async getModificationIdListAfterSearch(): Promise<string[]> {
    return this._modifications_list_after_search;
  }

  async setModificationIdListAfterSearch(value: string[]): Promise<void> {
    this._modifications_list_after_search = value;
  }

  //Page Methods

  async assertOnSearchModificationsPage() {
    await expect(this.page_heading).toBeVisible();
    await expect(this.page_guidance_text).toBeVisible();
    expect(await this.page.title()).toBe(this.searchModificationsPageTestData.Search_Modifications_Page.title);
  }

  async goto() {
    await this.page.goto('approvals/search');
    await this.assertOnSearchModificationsPage();
  }

  async getAllModificationsTheTable(tableRows: Locator): Promise<Map<string, string[]>> {
    const searchResultValues: string[] = [];
    const modificationIdValues: string[] = [];
    const shortProjectTitleValues: string[] = [];
    const modificationTypeValues: string[] = [];
    const chiefInvestigatorNameValues: string[] = [];
    const leadNationValues: string[] = [];
    await this.page.waitForLoadState('domcontentloaded');
    await this.page.waitForTimeout(3000);
    let dataFound = false;
    while (!dataFound) {
      const rowCount = await tableRows.count();
      for (let i = 1; i < rowCount; i++) {
        const columns = tableRows.nth(i).getByRole('cell');
        const modificationId = confirmStringNotNull(await columns.nth(0).textContent());
        modificationIdValues.push(modificationId);
        const shortProjectTitle = confirmStringNotNull(await columns.nth(1).textContent());
        shortProjectTitleValues.push(shortProjectTitle);
        const modificationType = confirmStringNotNull(await columns.nth(2).textContent());
        modificationTypeValues.push(modificationType);
        const chiefInvestigatorName = confirmStringNotNull(await columns.nth(3).textContent());
        chiefInvestigatorNameValues.push(chiefInvestigatorName);
        const leadNation = confirmStringNotNull(await columns.nth(4).textContent());
        leadNationValues.push(leadNation);
        searchResultValues.push(
          modificationId +
            '|' +
            shortProjectTitle +
            '|' +
            modificationType +
            '|' +
            chiefInvestigatorName +
            '|' +
            leadNation
        );
      }
      if ((await this.next_button.isVisible()) && !(await this.next_button.isDisabled())) {
        await this.next_button.click();
        await this.page.waitForLoadState('domcontentloaded');
      } else {
        dataFound = true;
      }
    }
    const searchResultMap = new Map([
      ['searchResultValues', searchResultValues],
      ['modificationIdValues', modificationIdValues],
      ['shortProjectTitleValues', shortProjectTitleValues],
      ['modificationTypeValues', modificationTypeValues],
      ['chiefInvestigatorNameValues', chiefInvestigatorNameValues],
      ['leadNationValues', leadNationValues],
    ]);
    return searchResultMap;
  }

  async sortModificationIdListValues(modificationIds: string[], sortDirection: string): Promise<string[]> {
    let sortedListAsNums: number[][];
    const sortedListAsStrings: string[] = [];
    const formattedModificationIds = modificationIds.map((id) => {
      const [prefix, suffix] = id.split('/');
      return [parseInt(prefix), parseInt(suffix)];
    });
    if (sortDirection.toLowerCase() == 'ascending') {
      sortedListAsNums = formattedModificationIds.toSorted((a, b) => {
        if (a[0] - b[0] == 0) {
          return a[1] - b[1];
        } else {
          return a[0] - b[0];
        }
      });
    } else {
      sortedListAsNums = formattedModificationIds.toSorted((a, b) => {
        if (b[0] - a[0] == 0) {
          return b[1] - a[1];
        } else {
          return b[0] - a[0];
        }
      });
    }
    for (const entry of sortedListAsNums.entries()) {
      sortedListAsStrings.push(entry[1].toString().replace(',', '/'));
    }
    return sortedListAsStrings;
  }

  async getActualListValues(tableBodyRows: Locator, columnIndex: number): Promise<string[]> {
    const actualListValues: string[] = [];
    for (const row of await tableBodyRows.all()) {
      const actualListValue = confirmStringNotNull(await row.getByRole('cell').nth(columnIndex).textContent());
      actualListValues.push(actualListValue);
    }
    return actualListValues;
  }
}
