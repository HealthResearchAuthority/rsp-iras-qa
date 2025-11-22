import { expect, Locator, Page } from '@playwright/test';
import * as addDocumentsModificationsPageTestData from '../../../../../resources/test_data/iras/make_changes/modifications/projectDocuments/add_documents_modifications_data.json';
import { confirmStringNotNull } from '../../../../../utils/UtilFunctions';

//Declare Page Objects
export default class AddDocumentsModificationsPage {
  readonly page: Page;
  readonly addDocumentsModificationsPageTestData: typeof addDocumentsModificationsPageTestData;
  readonly pageHeading: Locator;
  readonly pageLabels: Locator;
  readonly upload_files_input: Locator;
  readonly table: Locator;
  readonly rows: Locator;
  readonly cells: Locator;
  readonly documentStatus: Locator;
  readonly documentDeleteLink: Locator;
  private displayedStatuses: string[];

  //Initialize Page Objects
  constructor(page: Page) {
    this.page = page;
    this.addDocumentsModificationsPageTestData = addDocumentsModificationsPageTestData;
    this.displayedStatuses = [];

    //Locators
    this.pageHeading = this.page
      .getByRole('heading')
      .getByText(this.addDocumentsModificationsPageTestData.Add_Documents_Modifications_Page.heading);
    this.pageLabels = this.page.getByRole('paragraph');
    this.upload_files_input = this.page.getByTestId('Files');
    this.table = this.page.getByRole('table');
    this.rows = this.page.locator('.govuk-table__row');
    this.cells = this.page.locator('.govuk-table__cell');
    this.documentDeleteLink = this.rows.locator(this.cells).locator('.govuk-link');
    this.documentStatus = this.rows.locator(this.cells).locator('.govuk-tag');
  }

  //Page Methods
  async assertOnAddDocumentsModificationsPage(specificChangeTitleLabel: string) {
    const expectedPageHeading =
      this.addDocumentsModificationsPageTestData.Add_Documents_Modifications_Page.heading +
      ' ' +
      specificChangeTitleLabel.toLowerCase();
    await expect.soft(this.pageHeading.getByText(expectedPageHeading, { exact: true })).toBeVisible();

    const expectedPageTitle =
      this.addDocumentsModificationsPageTestData.Add_Documents_Modifications_Page.page_title_first_part +
      ' ' +
      specificChangeTitleLabel.toLowerCase() +
      ' ' +
      this.addDocumentsModificationsPageTestData.Add_Documents_Modifications_Page.page_title_second_part;
    expect.soft(await this.page.title()).toBe(expectedPageTitle);

    const expectedLabel = this.addDocumentsModificationsPageTestData.Add_Documents_Modifications_Page.hint_label;
    await expect.soft(this.pageLabels.getByText(expectedLabel, { exact: true })).toBeVisible();
  }
  async assertOnAddSupportDocumentsPage() {
    await expect.soft(this.pageHeading).toBeVisible();
    const expectedPageTitle =
      this.addDocumentsModificationsPageTestData.Add_Documents_Modifications_Page.page_title_first_part +
      ' ' +
      this.addDocumentsModificationsPageTestData.Add_Documents_Modifications_Page.page_title_second_part;
    expect.soft(await this.page.title()).toBe(expectedPageTitle);
  }

  async getSupportingDocumentsStatusFromUI(): Promise<Map<string, string[]>> {
    this.displayedStatuses = [];
    const listCount = await this.rows.count();
    for (let i = 0; i < listCount; i++) {
      const statusColumn = this.documentStatus.nth(i);
      const displayedStatus = confirmStringNotNull(await statusColumn.textContent());
      this.displayedStatuses.push(displayedStatus);
    }
    const DocumentsMap = new Map([['displayedStatuses', this.displayedStatuses]]);
    return DocumentsMap;
  }
}
