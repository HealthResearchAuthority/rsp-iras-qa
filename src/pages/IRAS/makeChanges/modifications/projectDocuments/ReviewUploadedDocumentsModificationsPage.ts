import { expect, Locator, Page } from '@playwright/test';
import * as reviewUploadedDocumentsModificationsPageTestData from '../../../../../resources/test_data/iras/make_changes/modifications/projectDocuments/review_uploaded_documents_modifications_data.json';

//Declare Page Objects
export default class ReviewUploadedDocumentsModificationsPage {
  readonly page: Page;
  readonly reviewUploadedDocumentsModificationsPageTestData: typeof reviewUploadedDocumentsModificationsPageTestData;
  readonly pageHeading: Locator;
  readonly pageLabels: Locator;
  readonly table: Locator;
  readonly rows: Locator;
  readonly cells: Locator;

  //Initialize Page Objects
  constructor(page: Page) {
    this.page = page;
    this.reviewUploadedDocumentsModificationsPageTestData = reviewUploadedDocumentsModificationsPageTestData;

    //Locators
    this.pageHeading = this.page.getByRole('heading');
    this.pageLabels = this.page.getByRole('paragraph');
    this.table = this.page.getByRole('table');
    this.rows = this.page.locator('tr');
  }

  //Page Methods
  async assertOnReviewUploadedDocumentsModificationsPage(specificChangeTitleLabel: string) {
    const expectedPageTitle =
      this.reviewUploadedDocumentsModificationsPageTestData.Review_Uploaded_Documents_Modifications_Page.heading +
      ' ' +
      specificChangeTitleLabel.toLowerCase();
    await expect(this.page).toHaveTitle(
      this.reviewUploadedDocumentsModificationsPageTestData.Review_Uploaded_Documents_Modifications_Page.page_title
    );
    await expect.soft(this.pageHeading.getByText(expectedPageTitle, { exact: true })).toBeVisible();
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
}
