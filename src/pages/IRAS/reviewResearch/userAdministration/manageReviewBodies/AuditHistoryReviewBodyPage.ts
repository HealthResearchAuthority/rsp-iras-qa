import { expect, Locator, Page } from '@playwright/test';
import * as auditHistoryReviewBodyPageTestData from '../../../../../resources/test_data/iras/reviewResearch/userAdministration/manageReviewBodies/audit_history_review_body_page_data.json';

//Declare Page Objects
export default class AuditHistoryReviewBodyPage {
  readonly page: Page;
  readonly auditHistoryReviewBodyPageTestData: typeof auditHistoryReviewBodyPageTestData;
  private _updated_time: string;
  readonly page_heading: Locator;
  readonly auditTableRows: Locator;
  readonly date_column_header: Locator;
  readonly event_description_column_header: Locator;
  readonly sys_admin_column_header: Locator;
  readonly next_button: Locator;
  readonly hidden_next_button: Locator;

  //Initialize Page Objects
  constructor(page: Page) {
    this.page = page;
    this.auditHistoryReviewBodyPageTestData = auditHistoryReviewBodyPageTestData;
    this._updated_time = '';

    //Locators
    this.page_heading = this.page
      .getByRole('heading')
      .getByText(this.auditHistoryReviewBodyPageTestData.Review_Body_Audit_History_Page.page_heading);
    this.auditTableRows = this.page.getByRole('table').getByRole('row');
    this.date_column_header = this.auditTableRows
      .locator('th')
      .getByText(
        this.auditHistoryReviewBodyPageTestData.Review_Body_Audit_History_Page.Column_Header_Labels.date_header_label,
        { exact: true }
      );
    this.event_description_column_header = this.auditTableRows
      .locator('th')
      .getByText(
        this.auditHistoryReviewBodyPageTestData.Review_Body_Audit_History_Page.Column_Header_Labels
          .event_description_label,
        { exact: true }
      );
    this.sys_admin_column_header = this.auditTableRows
      .locator('th')
      .getByText(
        this.auditHistoryReviewBodyPageTestData.Review_Body_Audit_History_Page.Column_Header_Labels.sys_admin_label,
        { exact: true }
      );
    this.next_button = this.page
      .getByRole('link')
      .getByText(this.auditHistoryReviewBodyPageTestData.Review_Body_Audit_History_Page.next_button, { exact: true });
    this.hidden_next_button = this.page.locator('[class="govuk-pagination__next"][style="visibility: hidden"]');
  }

  //Page Methods
  async assertOnAuditHistoryReviewBodyPage() {
    await expect(this.page_heading).toBeVisible();
    await expect(this.date_column_header).toBeVisible();
    await expect(this.event_description_column_header).toBeVisible();
    await expect(this.sys_admin_column_header).toBeVisible();
  }

  //Getters & Setters for Private Variables

  async getUpdatedTime(): Promise<string> {
    return this._updated_time;
  }

  async setUpdatedTime(value: string): Promise<void> {
    this._updated_time = value;
  }

  async getAuditEventDescriptionValue(eventDescriptionText: string, valuePrevious: string, valueCurrent: string) {
    const eventDescriptionValue = eventDescriptionText + valuePrevious + ' to ' + valueCurrent;
    return eventDescriptionValue;
  }
}
