import { expect, Locator, Page } from '@playwright/test';
import * as auditHistoryUserPageTestData from '../../../../../resources/test_data/iras/reviewResearch/userAdministration/manageUsers/audit_history_user_page_data.json';
import * as buttonTextData from '../../../../../resources/test_data/common/button_text_data.json';
import * as linkTextData from '../../../../../resources/test_data/common/link_text_data.json';
// import { confirmStringNotNull } from '../../../../../utils/UtilFunctions';

//Declare Page Objects
export default class AuditHistoryUserPage {
  readonly page: Page;
  readonly auditHistoryUserPageTestData: typeof auditHistoryUserPageTestData;
  readonly linkTextData: typeof linkTextData;
  readonly buttonTextData: typeof buttonTextData;
  private _updated_time: string;
  readonly page_heading: Locator;
  readonly date_column_header: Locator;
  readonly event_description_column_header: Locator;
  readonly sys_admin_column_header: Locator;

  //Initialize Page Objects
  constructor(page: Page) {
    this.page = page;
    this.auditHistoryUserPageTestData = auditHistoryUserPageTestData;
    this.linkTextData = linkTextData;
    this.buttonTextData = buttonTextData;
    this._updated_time = '';
    this.page_heading = this.page
      .getByRole('heading')
      .getByText(this.auditHistoryUserPageTestData.Audit_History_User_Page.page_heading);
    this.date_column_header = this.page
      .locator('thead tr')
      .getByText(this.auditHistoryUserPageTestData.Audit_History_User_Page.Column_Header_Labels.date_header_label);
    this.event_description_column_header = this.page
      .locator('thead tr')
      .getByText(
        this.auditHistoryUserPageTestData.Audit_History_User_Page.Column_Header_Labels.event_description_label
      );
    this.sys_admin_column_header = this.page
      .locator('thead tr')
      .getByText(this.auditHistoryUserPageTestData.Audit_History_User_Page.Column_Header_Labels.sys_admin_label);
  }

  async assertOnAuditHistoryUserPage() {
    await expect(this.page_heading).toBeVisible();
    await expect(this.date_column_header).toBeVisible();
    await expect(this.event_description_column_header).toBeVisible();
    await expect(this.sys_admin_column_header).toBeVisible();
  }

  async getUserAuditEventDescriptionValue(eventDescriptionText: string, valuePrevious: string, valueCurrent: string) {
    const eventDescriptionValue = `${valuePrevious}${eventDescriptionText}${valueCurrent}`;
    return eventDescriptionValue.trim();
  }

  //Getters & Setters for Private Variables

  async getUpdatedTime(): Promise<string> {
    return this._updated_time;
  }

  async setUpdatedTime(value: string): Promise<void> {
    this._updated_time = value;
  }
}
