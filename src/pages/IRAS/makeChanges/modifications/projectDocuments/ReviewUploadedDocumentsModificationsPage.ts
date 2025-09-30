import { expect, Locator, Page } from '@playwright/test';
import * as reviewUploadedDocumentsModificationsPageTestData from '../../../../../resources/test_data/iras/make_changes/modifications/projectDocuments/review_uploaded_documents_modifications_data.json';
import { confirmStringNotNull } from '../../../../../utils/UtilFunctions';

//Declare Page Objects
export default class ReviewUploadedDocumentsModificationsPage {
  readonly page: Page;
  readonly reviewUploadedDocumentsModificationsPageTestData: typeof reviewUploadedDocumentsModificationsPageTestData;
  private _file_names: string[];
  readonly pageHeading: Locator;
  readonly pageLabels: Locator;
  readonly table: Locator;
  readonly rows: Locator;
  readonly cells: Locator;

  //Initialize Page Objects
  constructor(page: Page) {
    this.page = page;
    this.reviewUploadedDocumentsModificationsPageTestData = reviewUploadedDocumentsModificationsPageTestData;
    this._file_names = [];

    //Locators
    this.pageHeading = this.page.getByRole('heading');
    this.pageLabels = this.page.getByRole('paragraph');
    this.table = this.page.getByRole('table');
    this.rows = this.page.locator('tr');
  }
  //Getters & Setters for Private Variables

  async getUploadedFileName(): Promise<string[]> {
    return this._file_names;
  }

  async setUploadedFileName(value: string[]): Promise<void> {
    this._file_names = value;
  }
  //Page Methods
  // async assertOnReviewUploadedDocumentsModificationsPage(specificChangeTitleLabel: string) {
  //   const expectedPageTitle =
  //     this.reviewUploadedDocumentsModificationsPageTestData.Review_Uploaded_Documents_Modifications_Page.heading +
  //     ' ' +
  //     specificChangeTitleLabel.toLowerCase();
  //   await expect
  //     .soft(this.page)
  //     .toHaveTitle(
  //       this.reviewUploadedDocumentsModificationsPageTestData.Review_Uploaded_Documents_Modifications_Page.page_title
  //     );
  //   await expect.soft(this.pageHeading.getByText(expectedPageTitle, { exact: true })).toBeVisible();
  //   await expect
  //     .soft(
  //       this.pageHeading.getByText(
  //         this.reviewUploadedDocumentsModificationsPageTestData.Review_Uploaded_Documents_Modifications_Page
  //           .add_document_detail_next_step_header,
  //         { exact: true }
  //       )
  //     )
  //     .toBeVisible();
  //   await expect
  //     .soft(
  //       this.pageLabels.getByText(
  //         this.reviewUploadedDocumentsModificationsPageTestData.Review_Uploaded_Documents_Modifications_Page
  //           .add_document_detail_next_step_hint_label,
  //         { exact: true }
  //       )
  //     )
  //     .toBeVisible();
  // }
  async assertOnReviewUploadedDocumentsModificationsPage(specificChangeTitleLabel: string) {
    const expectedPageHeading =
      this.reviewUploadedDocumentsModificationsPageTestData.Review_Uploaded_Documents_Modifications_Page.heading +
      ' ' +
      specificChangeTitleLabel;
    await expect.soft(this.pageHeading.getByText(expectedPageHeading)).toBeVisible();

    // const expectedPageTitle =
    //   this.reviewUploadedDocumentsModificationsPageTestData.Review_Uploaded_Documents_Modifications_Page
    //     .page_title_first_part +
    //   ' ' +
    //   specificChangeTitleLabel +
    //   ' ' +
    //   this.reviewUploadedDocumentsModificationsPageTestData.Review_Uploaded_Documents_Modifications_Page
    //     .page_title_second_part;
    // expect.soft(await this.page.title()).toBe(expectedPageTitle);

    await expect
      .soft(
        this.pageHeading.getByText(
          this.reviewUploadedDocumentsModificationsPageTestData.Review_Uploaded_Documents_Modifications_Page
            .add_document_detail_next_step_header,
          { exact: true }
        )
      )
      .toBeVisible();

    await expect
      .soft(
        this.pageLabels.getByText(
          this.reviewUploadedDocumentsModificationsPageTestData.Review_Uploaded_Documents_Modifications_Page
            .add_document_detail_next_step_hint_label,
          { exact: true }
        )
      )
      .toBeVisible();
  }

  async getUploadedDocumentsListFromUI() {
    const uploadedDocuments: string[] = [];
    const rowCount = await this.rows.count();
    for (let i = 1; i < rowCount; i++) {
      const columns = this.rows.nth(i).getByRole('cell');
      const uploadedDocument = confirmStringNotNull(await columns.first().textContent());
      uploadedDocuments.push(uploadedDocument);
    }
    return uploadedDocuments;
  }
}
