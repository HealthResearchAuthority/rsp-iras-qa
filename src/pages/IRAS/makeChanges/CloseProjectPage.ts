import { expect, Locator, Page } from '@playwright/test';
import * as closeProjectPageTestData from '../../../resources/test_data/iras/make_changes/close_project_data.json';

//Declare Page Objects
export default class CloseProjectPage {
  readonly page: Page;
  readonly closeProjectPageTestData: typeof closeProjectPageTestData;
  readonly pageHeading: Locator;
  readonly close_project_actual_project_closure_date_day_textbox: Locator;
  readonly close_project_actual_project_closure_date_month_dropdown: Locator;
  readonly close_project_actual_project_closure_date_year_textbox: Locator;
  readonly planned_end_date_label: Locator;
  readonly projectClosureTransactionTableHeader: Locator;
  readonly projectClosureTransactionTableBodyRows: Locator;
  readonly tableCell: Locator;
  private projectClosureDate: string;
  private projectClosureTransactionID: string;
  readonly projectClosureTransactionDetails: {
    transactionID: string;
    dateOfProjectClosure: string;
    userEmail: string;
    dateSubmitted: string;
    status: string;
  }[] = [];
  transactionCount: number;

  //Initialize Page Objects
  constructor(page: Page) {
    this.page = page;
    this.closeProjectPageTestData = closeProjectPageTestData;
    this.transactionCount = 0;
    //Locators
    this.pageHeading = this.page.getByRole('heading', {
      name: closeProjectPageTestData.Close_Project_Page.heading,
    });
    this.close_project_actual_project_closure_date_day_textbox = this.page
      .getByText(this.closeProjectPageTestData.Close_Project_Page.close_project_actual_project_closure_date_day_label)
      .locator('..')
      .getByRole('textbox');
    this.close_project_actual_project_closure_date_month_dropdown = this.page
      .getByText(this.closeProjectPageTestData.Close_Project_Page.close_project_actual_project_closure_date_month_label)
      .locator('..')
      .getByRole('combobox');
    this.close_project_actual_project_closure_date_year_textbox = this.page
      .getByText(this.closeProjectPageTestData.Close_Project_Page.close_project_actual_project_closure_date_year_label)
      .locator('..')
      .getByRole('textbox');
    this.planned_end_date_label = this.page
      .getByText(this.closeProjectPageTestData.Close_Project_Page.close_project_planned_project_end_date_label)
      .locator('..');
    this.projectClosureTransactionTableHeader = this.page.locator('#projectClosureTable thead tr th');
    this.projectClosureTransactionTableBodyRows = this.page.locator('#projectClosureTable tbody').getByRole('row');
    this.tableCell = this.page.locator('td');
  }

  //Page Methods
  async assertOnCloseProjectPage() {
    await expect(this.pageHeading).toBeVisible();
  }

  async setProjectClosureDate(value: string): Promise<void> {
    this.projectClosureDate = value;
  }

  async getProjectClosureDate(): Promise<string> {
    return this.projectClosureDate;
  }

  async setProjectClosureTransactionID(value: string): Promise<void> {
    this.projectClosureTransactionID = value;
  }

  async getProjectClosureTransactionID(): Promise<string> {
    return this.projectClosureTransactionID;
  }

  set setProjectClosureTransactionDetailsRecord(record: {
    transactionID: string;
    dateOfProjectClosure: string;
    userEmail: string;
    dateSubmitted: string;
    status: string;
  }) {
    this.projectClosureTransactionDetails.push(record);
  }

  get getProjectClosureTransactionDetailsRecord() {
    return this.projectClosureTransactionDetails;
  }
}
