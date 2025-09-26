import { expect, Locator, Page } from '@playwright/test';
import * as addDocumentDetailsModificationsPageTestData from '../../../../../resources/test_data/iras/make_changes/modifications/projectDocuments/add_document_details_modifications_data.json';
import { confirmStringNotNull } from '../../../../../utils/UtilFunctions';

//Declare Page Objects
export default class AddDocumentDetailsModificationsPage {
  readonly page: Page;
  readonly addDocumentDetailsModificationsPageTestData: typeof addDocumentDetailsModificationsPageTestData;
  readonly pageHeading: Locator;
  readonly pageLabels: Locator;
  readonly table: Locator;
  readonly listItem: Locator;
  readonly documentName: Locator;
  readonly documentStatus: Locator;
  readonly documentlink: Locator;
  private displayedDocuments: string[];
  private displayedStatuses: string[];

  //Initialize Page Objects
  constructor(page: Page) {
    this.page = page;
    this.addDocumentDetailsModificationsPageTestData = addDocumentDetailsModificationsPageTestData;
    this.displayedDocuments = [];
    this.displayedStatuses = [];

    //Locators
    this.pageHeading = this.page.getByRole('heading');
    this.pageLabels = this.page.getByRole('paragraph');
    this.table = this.page.getByRole('table');
    this.listItem = this.page.locator('.govuk-task-list__item');
    this.documentName = this.page.locator('[class*="govuk-task-list__link"]');
    this.documentStatus = this.page.locator('.govuk-task-list__status');
    this.documentlink = this.page.locator('.govuk-link');
  }

  //Page Methods
  async assertOnAddDocumentsDetailsModificationsPage(specificChangeTitleLabel: string) {
    const expectedPageHeading =
      this.addDocumentDetailsModificationsPageTestData.Add_Document_Details_Modifications_Page.heading +
      ' ' +
      specificChangeTitleLabel.toLowerCase();
    await expect.soft(this.pageHeading.getByText(expectedPageHeading, { exact: true })).toBeVisible();
    const expectedPageTitle =
      this.addDocumentDetailsModificationsPageTestData.Add_Document_Details_Modifications_Page.page_title_first_part +
      ' ' +
      specificChangeTitleLabel.toLowerCase() +
      ' ' +
      this.addDocumentDetailsModificationsPageTestData.Add_Document_Details_Modifications_Page.page_title_second_part;
    expect.soft(await this.page.title()).toBe(expectedPageTitle);
    const expectedLabel =
      this.addDocumentDetailsModificationsPageTestData.Add_Document_Details_Modifications_Page.hint_label;
    await expect.soft(this.pageLabels.getByText(expectedLabel, { exact: true })).toBeVisible();
  }

  async getDisplayedDocumentsListAndStatusFromUI(refreshData?: boolean): Promise<Map<string, string[]>> {
    const listCount = await this.listItem.count();

    if (refreshData) {
      this.displayedDocuments = [];
      this.displayedStatuses = [];
    }
    for (let i = 0; i < listCount; i++) {
      const firstcolumn = this.documentName.nth(i);
      const displayedDocument = confirmStringNotNull(await firstcolumn.textContent());
      this.displayedDocuments.push(displayedDocument);
      const secondcolumn = this.documentStatus.nth(i);
      const displayedStatus = confirmStringNotNull(await secondcolumn.textContent());
      this.displayedStatuses.push(displayedStatus);
    }
    const DocumentsMap = new Map([
      ['displayedDocuments', this.displayedDocuments],
      ['displayedStatuses', this.displayedStatuses],
    ]);
    return DocumentsMap;
  }
}
