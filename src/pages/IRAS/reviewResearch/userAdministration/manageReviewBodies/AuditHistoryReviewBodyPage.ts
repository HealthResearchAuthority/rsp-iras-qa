import { expect, Locator, Page } from '@playwright/test';
import * as auditHistoryReviewBodyPageTestData from '../../../../../resources/test_data/iras/reviewResearch/userAdministration/manageReviewBodies/audit_history_review_body_page_data.json';
import { confirmStringNotNull } from '../../../../../utils/UtilFunctions';

//Declare Page Objects
export default class AuditHistoryReviewBodyPage {
  readonly page: Page;
  readonly auditHistoryReviewBodyPageTestData: typeof auditHistoryReviewBodyPageTestData;
  private _updated_time: string;
  readonly page_heading: Locator;
  readonly auditTableRows: Locator;
  readonly date_label: Locator;
  readonly event_description_label: Locator;
  readonly system_admin_label: Locator;
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
    this.date_label = this.auditTableRows.getByRole('columnheader').getByText('Date', { exact: true });
    this.event_description_label = this.auditTableRows
      .getByRole('columnheader')
      .getByText('Event description', { exact: true });
    this.system_admin_label = this.auditTableRows
      .getByRole('columnheader')
      .getByText('System administrator', { exact: true });
    this.next_button = this.page
      .getByRole('link')
      .getByText(this.auditHistoryReviewBodyPageTestData.Review_Body_Audit_History_Page.next_button, { exact: true });
    this.hidden_next_button = this.page.locator('[class="govuk-pagination__next"][style="visibility: hidden"]');
  }

  async assertOnAuditHistoryReviewBodyPage() {
    await expect(this.page_heading).toBeVisible();
  }

  //Getters & Setters for Private Variables

  async getUpdatedTime(): Promise<string> {
    return this._updated_time;
  }

  async setUpdatedTime(value: string): Promise<void> {
    this._updated_time = value;
  }

  async getAuditLog(): Promise<Map<string, string[]>> {
    const timeValues: string[] = [];
    const eventValues: string[] = [];
    const adminEmailValues: string[] = [];
    let dataFound = false;
    while (!dataFound) {
      const rowCount = await this.auditTableRows.count();
      for (let i = 1; i < rowCount; i++) {
        const columns = this.auditTableRows.nth(i).getByRole('cell');
        const timeValue = confirmStringNotNull(await columns.nth(0).textContent());
        timeValues.push(timeValue);
        const eventValue = confirmStringNotNull(await columns.nth(1).textContent());
        eventValues.push(eventValue);
        const adminEmailValue = confirmStringNotNull(await columns.nth(2).textContent());
        adminEmailValues.push(adminEmailValue);
      }
      if ((await this.next_button.isVisible()) && !(await this.next_button.isDisabled())) {
        await this.next_button.click();
        await this.page.waitForLoadState('domcontentloaded');
      } else {
        dataFound = true;
      }
    }
    const auditMap = new Map([
      ['timeValues', timeValues],
      ['eventValues', eventValues],
      ['adminEmailValues', adminEmailValues],
    ]);
    return auditMap;
  }

  async getEventDescriptionValue(eventDescriptionText: string, valuePrevious: string, valueCurrent: string) {
    const eventDescriptionValue = eventDescriptionText + valuePrevious + ' to ' + valueCurrent;
    return eventDescriptionValue;
  }
}
