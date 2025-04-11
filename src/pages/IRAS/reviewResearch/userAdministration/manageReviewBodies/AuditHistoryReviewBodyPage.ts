import { expect, Locator, Page } from '@playwright/test';
import * as auditHistoryReviewBodyPageTestData from '../../../../../resources/test_data/iras/reviewResearch/userAdministration/manageReviewBodies/audit_history_review_body_page_data.json';
import { confirmStringNotNull, removeUnwantedWhitespace } from '../../../../../utils/UtilFunctions';
const pathToTestDataJson =
  './src/resources/test_data/iras/reviewResearch/userAdministration/manageReviewBodies/create_review_body_page_data.json';

//Declare Page Objects
export default class AuditHistoryReviewBodyPage {
  readonly page: Page;
  readonly auditHistoryReviewBodyPageTestData: typeof auditHistoryReviewBodyPageTestData;
  readonly pathToTestDataJson: typeof pathToTestDataJson;
  private _updated_time: string;
  readonly back_button: Locator;
  readonly page_heading: Locator;
  readonly subHeading: Locator;
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
    this.pathToTestDataJson = pathToTestDataJson;

    //Locators
    this.back_button = this.page.getByText('Back');
    this.page_heading = this.page.getByRole('heading');
    this.subHeading = this.page_heading.locator('..').locator('p');
    this.auditTableRows = this.page.getByRole('table').getByRole('row');
    this.date_label = this.auditTableRows.getByRole('columnheader').getByText('Date', { exact: true });
    this.event_description_label = this.auditTableRows
      .getByRole('columnheader')
      .getByText('Event description', { exact: true });
    this.system_admin_label = this.auditTableRows
      .getByRole('columnheader')
      .getByText('System administrator', { exact: true });
    this.next_button = this.page.locator('.govuk-pagination__next a');
    this.hidden_next_button = this.page.locator('[class="govuk-pagination__next"][style="visibility: hidden"]');
  }

  async assertOnAuditHistoryReviewBodyPage() {
    await expect(this.page_heading).toBeVisible();
    await expect(this.page_heading).toContainText(
      this.auditHistoryReviewBodyPageTestData.Review_Body_Audit_History_Page.page_heading
    );
  }

  //Getters & Setters for Private Variables

  async getUpdatedTime(): Promise<string> {
    return this._updated_time;
  }

  async setUpdatedTime(value: string): Promise<void> {
    this._updated_time = value;
  }

  async getAuditLog() {
    const timeValues: string[] = [];
    const eventValues: string[] = [];
    const adminEmailValues: string[] = [];
    const dataFound = false;
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
      } else if ((await this.hidden_next_button.count()) > 0) {
        break;
      } else if ((await this.next_button.count()) == 0) {
        break;
      }
    }
    return [timeValues, eventValues, adminEmailValues];
  }

  async getSelectedValues<PageObject>(dataset: JSON, key: string, page: PageObject) {
    const locator: Locator = page[key];
    return await removeUnwantedWhitespace(confirmStringNotNull(await locator.textContent()));
  }
}
