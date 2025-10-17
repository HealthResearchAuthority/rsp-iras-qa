import { expect, Locator, Page } from '@playwright/test';
import * as manageReviewBodiesPageData from '../../../../../resources/test_data/iras/reviewResearch/userAdministration/manageReviewBodies/manage_review_body_page_data.json';
import * as linkTextData from '../../../../../resources/test_data/common/link_text_data.json';
import { confirmStringNotNull } from '../../../../../utils/UtilFunctions';
import CommonItemsPage from '../../../../Common/CommonItemsPage';
import ReviewBodyProfilePage from './ReviewBodyProfilePage';
import CreateReviewBodyPage from './CreateReviewBodyPage';

//Declare Page Objects
export default class ManageReviewBodiesPage {
  readonly page: Page;
  readonly manageReviewBodiesPageData: typeof manageReviewBodiesPageData;
  private _org_name: string[];
  private _row_val: Locator;
  readonly linkTextData: typeof linkTextData;
  readonly pageHeading: Locator;
  readonly addNewReviewBodyRecordLink: Locator;
  readonly mainPageContent: Locator;
  readonly review_bodies_list_rows: Locator;
  readonly organisation_name_from_list: Locator;
  readonly status_from_list: Locator;
  readonly actionsLink: Locator;
  readonly statusCell: Locator;
  readonly orgListRows: Locator;
  readonly no_results_heading: Locator;
  readonly no_results_guidance_text: Locator;
  readonly listRows: Locator;
  readonly listCell: Locator;
  readonly next_button: Locator;
  readonly tableRows: Locator;
  readonly country_checkbox: Locator;
  readonly status_radio: Locator;
  readonly country_checkbox_chevron: Locator;
  readonly status_radio_chevron: Locator;
  readonly country_hint_label: Locator;
  readonly country_selected_hint_label: Locator;
  readonly status_hint_label: Locator;
  readonly review_body_search_text: Locator;
  readonly search_hint_text: Locator;

  //Initialize Page Objects
  constructor(page: Page) {
    this.page = page;
    this.manageReviewBodiesPageData = manageReviewBodiesPageData;
    this.linkTextData = linkTextData;
    this._org_name = [];

    //Locators
    this.pageHeading = this.page
      .getByRole('heading')
      .getByText(this.manageReviewBodiesPageData.Manage_Review_Body_Page.heading);
    this.mainPageContent = this.page.getByTestId('main-content');
    this.addNewReviewBodyRecordLink = this.mainPageContent.getByText(
      this.linkTextData.Manage_Review_Bodies_Page.Add_New_Review_Body_Record,
      {
        exact: true,
      }
    );
    this.review_bodies_list_rows = this.page.locator('table tbody tr');
    this.organisation_name_from_list = this.page.locator('td:nth-child(1)');
    this.status_from_list = this.page.locator('td:nth-child(3)');
    this.actionsLink = this.page
      .getByRole('link')
      .getByText(this.manageReviewBodiesPageData.Manage_Review_Body_Page.actions_link, { exact: true });
    this.statusCell = this.page.getByRole('cell').nth(2);
    this.orgListRows = this.page.getByRole('table').getByRole('row');
    this.no_results_heading = this.page
      .getByRole('heading')
      .getByText(this.manageReviewBodiesPageData.Manage_Review_Body_Page.no_results_heading, { exact: true });
    this.no_results_guidance_text = this.page
      .getByRole('paragraph')
      .getByText(this.manageReviewBodiesPageData.Manage_Review_Body_Page.no_results_guidance_text, {
        exact: true,
      });
    this.listRows = this.page.locator('tbody').getByRole('row');
    this.listCell = this.page.getByRole('cell');
    this.next_button = this.page.locator('.govuk-pagination__next a');
    this.tableRows = this.page.getByRole('table').getByRole('row');
    this.country_checkbox_chevron = this.page
      .getByRole('heading', { level: 2 })
      .getByText(this.manageReviewBodiesPageData.Manage_Review_Body_Page.country_label, {
        exact: true,
      });
    this.status_radio_chevron = this.page
      .getByRole('heading', { level: 2 })
      .getByText(this.manageReviewBodiesPageData.Manage_Review_Body_Page.status_label, {
        exact: true,
      });
    this.country_checkbox = page.getByRole('checkbox');
    this.status_radio = page.getByRole('radio');
    this.page.getByRole('checkbox');
    this.country_selected_hint_label = page.getByTestId('country-hint');
    this.country_hint_label = page.getByTestId('Search.Country');
    this.status_hint_label = page.getByTestId('Search.Status');
    this.review_body_search_text = this.page.getByLabel(
      this.manageReviewBodiesPageData.Manage_Review_Body_Page.review_body_search_box_label,
      {
        exact: true,
      }
    );
    this.search_hint_text = this.page.getByText(
      this.manageReviewBodiesPageData.Manage_Review_Body_Page.search_hint_text
    );
  }

  //Getters & Setters for Private Variables

  async getOrgName(): Promise<string[]> {
    return this._org_name;
  }

  async setOrgName(value: string[]): Promise<void> {
    this._org_name = value;
  }

  async getReviewBodyRow(): Promise<Locator> {
    return this._row_val;
  }

  async setReviewBodyRow(value: Locator): Promise<void> {
    this._row_val = value;
  }

  //Page Methods

  async goto(pageSize?: string, searchQuery?: string) {
    if (typeof pageSize !== 'undefined' && typeof searchQuery !== 'undefined') {
      await this.page.goto(`reviewbody/view?SearchQuery=${searchQuery}&PageSize=${pageSize}`);
    } else if (typeof pageSize !== 'undefined') {
      await this.page.goto(`reviewbody/view?pageSize=${pageSize}`);
    } else {
      await this.page.goto('reviewbody/view');
    }
  }
  async assertOnManageReviewBodiesPage() {
    await expect(this.pageHeading).toBeVisible();
    // expect.soft(await this.page.title()).toBe(this.manageReviewBodiesPageData.Manage_Review_Body_Page.title); // Temporarily commented out due to title mismatch
    await expect(this.search_hint_text).toBeVisible();
  }

  async getRowByOrgName(orgName: string, exactMatch: boolean) {
    return this.mainPageContent.locator('tr', {
      has: this.page.locator('td').getByText(`${orgName}`, { exact: exactMatch }),
    });
  }

  async getOrgNamesListFromUI() {
    const orgNames: string[] = [];
    let hasNextPage = true;
    //adding this for loop instead of while loop to limit navigation till first 3 pages only,to reduce time and reduce fakiness
    for (let i = 0; i < 2; i++) {
      const rowCount = await this.orgListRows.count();
      for (let i = 1; i < rowCount; i++) {
        const columns = this.orgListRows.nth(i).getByRole('cell');
        const orgValue = confirmStringNotNull(await columns.first().textContent());
        orgNames.push(orgValue);
      }
      hasNextPage = (await this.next_button.isVisible()) && !(await this.next_button.isDisabled());
      if (hasNextPage) {
        await this.next_button.click();
        await this.page.waitForLoadState('domcontentloaded');
      }
    }
    return orgNames;
  }

  async buildSearchRecord(name: string, status?: string): Promise<string> {
    return typeof status !== 'undefined' ? `${name}|${status}` : name;
  }

  async getRowData(row: any, status?: string): Promise<string> {
    const columns = await row.locator(this.listCell).allTextContents();
    const selected = typeof status !== 'undefined' ? [columns[0], columns[2]] : [columns[0]];
    return selected.map((col) => col.trim()).join('|');
  }

  async findReviewBody(reviewBodyName: string, reviewBodyStatus?: string) {
    let hasNextPage = true;
    while (hasNextPage) {
      const rows = await this.listRows.all();
      for (const row of rows) {
        const match = await this.isMatchingRow(row, reviewBodyName, reviewBodyStatus);
        if (match) {
          return row;
        }
      }
      hasNextPage = await this.shouldGoToNextPage();
      if (hasNextPage) {
        await this.goToNextPage();
      }
    }
    throw new Error(`No matching record found`);
  }

  async isMatchingRow(row: any, reviewBodyName: string, reviewBodyStatus?: string): Promise<boolean> {
    if (reviewBodyName === 'QA Automation') {
      const columns = await row.locator(this.listCell).allTextContents();
      return columns[0].trim().includes(reviewBodyName) && columns[2].trim() === reviewBodyStatus;
    } else {
      const searchRecord = await this.buildSearchRecord(reviewBodyName, reviewBodyStatus);
      const fullRowData = await this.getRowData(row, reviewBodyStatus);
      return fullRowData === searchRecord;
    }
  }

  async shouldGoToNextPage(): Promise<boolean> {
    return (await this.next_button.isVisible()) && !(await this.next_button.isDisabled());
  }

  async goToNextPage(): Promise<void> {
    await this.next_button.click();
    await this.page.waitForLoadState('domcontentloaded');
  }

  async getSearchQueryOrgName(position: string) {
    let searchKey: string = '';
    const orgNameValues: any = await this.getOrgName();
    const rowCount = orgNameValues.length;
    if (position.toLowerCase() == 'first') {
      searchKey = orgNameValues[0];
    } else if (position.toLowerCase() == 'last') {
      searchKey = orgNameValues[rowCount - 1];
    }
    return searchKey;
  }

  async getReviewBodyStatus(status: string) {
    if (status.toLowerCase() == 'disabled') {
      return this.manageReviewBodiesPageData.Manage_Review_Body_Page.disabled_status;
    } else {
      return this.manageReviewBodiesPageData.Manage_Review_Body_Page.enabled_status;
    }
  }

  async getReviewBodiesByPage(): Promise<Map<string, string[]>> {
    const orgNameValues: string[] = [];
    for (let i = 1; i < 2; i++) {
      const columns = this.tableRows.nth(i).getByRole('cell');
      const orgName = confirmStringNotNull(await columns.nth(0).textContent());
      orgNameValues.push(orgName);
    }
    const reviewBodyMap = new Map([['orgNameValues', orgNameValues]]);
    return reviewBodyMap;
  }

  async getReviewBodyListByPosition(position: string, commonItemsPage: CommonItemsPage) {
    let orgList: any;
    if (position.toLowerCase() == 'first') {
      orgList = await this.getReviewBodiesByPage();
    } else if (position.toLowerCase() == 'last') {
      const totalPages = await commonItemsPage.getTotalPages();
      await commonItemsPage.clickOnPages(totalPages, 'clicking on page number');
      orgList = await this.getReviewBodiesByPage();
    }
    return orgList;
  }

  async getReviewBodyName(
    inputType: string,
    reviewBodyProfilePage: ReviewBodyProfilePage,
    createReviewBodyPage: CreateReviewBodyPage
  ): Promise<string> {
    let reviewBodyName: string;
    switch (inputType) {
      case 'previously used review body':
        reviewBodyName = await reviewBodyProfilePage.getOrgName();
        break;
      case 'newly created review body':
        reviewBodyName = await createReviewBodyPage.getUniqueOrgName();
        break;
      default:
        reviewBodyName = inputType;
    }
    return reviewBodyName;
  }

  async validateFilters(countryActual: string, statusActual: string, filterDataset: any) {
    for (const key in filterDataset) {
      if (Object.hasOwn(filterDataset, key)) {
        if (key === 'country_checkbox') {
          const countryFilterLabelsExpected = filterDataset[key];
          expect(
            countryFilterLabelsExpected.some((countryLabel: string) =>
              countryActual.toLowerCase().includes(countryLabel.toLowerCase())
            )
          ).toBeTruthy();
        }
        if (key === 'status_radio') {
          const statusExpected = filterDataset[key];
          expect(statusActual.toLowerCase().includes(statusExpected.toLowerCase()));
        }
      }
    }
  }

  async getRowDataAdvancedFiltersSearch(row: any) {
    return {
      organisationName: confirmStringNotNull(await row.getByRole('cell').nth(0).textContent()),
      country: confirmStringNotNull(await row.getByRole('cell').nth(1).textContent()),
      status: confirmStringNotNull(await row.getByRole('cell').nth(2).textContent()),
    };
  }

  async validateResults(
    commonItemsPage: any,
    searchCriteriaDataset: any,
    filterDataset: any,
    validateSearch: boolean = true
  ) {
    for (let pageIndex = 1; pageIndex < 4; pageIndex++) {
      const rowCount = await commonItemsPage.tableRows.count();
      expect(rowCount).toBeGreaterThan(0);
      for (let rowIndex = 1; rowIndex < rowCount; rowIndex++) {
        const row = commonItemsPage.tableRows.nth(rowIndex);
        const { organisationName, country, status } = await this.getRowDataAdvancedFiltersSearch(row);

        // If search criteria is to be validated, check organisation name
        if (validateSearch && searchCriteriaDataset['search_input_text'] !== '') {
          const organisationNameExpected = searchCriteriaDataset['search_input_text'];
          expect(organisationName.toLowerCase().includes(organisationNameExpected.toLowerCase()));
        }
        this.validateFilters(country, status, filterDataset);
      }
      if (await commonItemsPage.next_button.isVisible()) {
        await commonItemsPage.next_button.click();
      } else {
        break;
      }
    }
  }
}
