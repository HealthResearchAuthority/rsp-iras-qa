import { expect, Locator, Page } from '@playwright/test';
import * as addDocumentsModificationsPageTestData from '../../../../../resources/test_data/iras/make_changes/modifications/projectDocuments/add_documents_modifications_data.json';

//Declare Page Objects
export default class AddDocumentsModificationsPage {
  readonly page: Page;
  readonly addDocumentsModificationsPageTestData: typeof addDocumentsModificationsPageTestData;
  readonly pageHeading: Locator;
  readonly pageLabels: Locator;
  readonly upload_files_input: Locator;

  //Initialize Page Objects
  constructor(page: Page) {
    this.page = page;
    this.addDocumentsModificationsPageTestData = addDocumentsModificationsPageTestData;

    //Locators
    this.pageHeading = this.page.getByRole('heading');
    this.pageLabels = this.page.getByRole('paragraph');
    this.upload_files_input = this.page.getByTestId('Files');
  }

  //Page Methods
  async assertOnAddDocumentsModificationsPage(specificChangeTitleLabel: string) {
    const expectedPageTitle =
      this.addDocumentsModificationsPageTestData.Add_Documents_Modifications_Page.heading +
      ' ' +
      specificChangeTitleLabel.toLowerCase();
    await expect(this.page).toHaveTitle(
      this.addDocumentsModificationsPageTestData.Add_Documents_Modifications_Page.page_title
    );
    await expect.soft(this.pageHeading.getByText(expectedPageTitle, { exact: true })).toBeVisible();
    await expect
      .soft(
        this.pageLabels.getByText(
          this.addDocumentsModificationsPageTestData.Add_Documents_Modifications_Page.hint_label,
          { exact: true }
        )
      )
      .toBeVisible();
  }
}
