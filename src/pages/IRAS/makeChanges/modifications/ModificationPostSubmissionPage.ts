import { expect, Locator, Page } from '@playwright/test';
import * as modificationPostSubmissionPageTestData from '../../../../resources/test_data/iras/make_changes/modifications/modification_post_submission_page_data.json';

//Declare Page Objects
export default class ModificationPostSubmissionPage {
  readonly page: Page;
  readonly modificationPostSubmissionPageTestData: typeof modificationPostSubmissionPageTestData;
  readonly pageHeading: Locator;
  readonly auditTableRows: Locator;
  readonly date_column_header: Locator;
  readonly event_description_column_header: Locator;
  readonly user_column_header: Locator;
  private _updated_time: string;

  //Initialize Page Objects
  constructor(page: Page) {
    this.page = page;
    this.modificationPostSubmissionPageTestData = modificationPostSubmissionPageTestData;
    this._updated_time = '';

    //Locators
    this.pageHeading = this.page
      .getByRole('heading')
      .getByText(this.modificationPostSubmissionPageTestData.Modification_Post_Submission_Page.heading, {
        exact: true,
      });
    this.auditTableRows = this.page.getByRole('table').getByRole('row');
    this.date_column_header = this.auditTableRows
      .locator('th')
      .getByText(this.modificationPostSubmissionPageTestData.Modification_Post_Submission_Page.history_tab.date_label, {
        exact: true,
      });
    this.event_description_column_header = this.auditTableRows
      .locator('th')
      .getByText(
        this.modificationPostSubmissionPageTestData.Modification_Post_Submission_Page.history_tab
          .event_description_label,
        { exact: true }
      );
    this.user_column_header = this.auditTableRows
      .locator('th')
      .getByText(this.modificationPostSubmissionPageTestData.Modification_Post_Submission_Page.history_tab.user_label, {
        exact: true,
      });
  }

  //Page Methods
  async assertOnModificationPostSubmissionPage() {
    await expect(this.pageHeading).toBeVisible();
  }

  //Getters & Setters for Private Variables
  async getUpdatedTime(): Promise<string> {
    return this._updated_time;
  }

  async setUpdatedTime(value: string): Promise<void> {
    this._updated_time = value;
  }
}
