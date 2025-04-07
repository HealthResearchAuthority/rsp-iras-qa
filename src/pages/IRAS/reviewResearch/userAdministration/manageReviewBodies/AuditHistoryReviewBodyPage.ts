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
  readonly back_button: Locator;
  readonly page_heading: Locator;
  readonly subHeading: Locator;
  readonly auditTableRows: Locator;
  readonly date_label: Locator;
  readonly event_description_label: Locator;
  readonly system_admin_label: Locator;

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
  }

  async assertOnAuditHistoryReviewBodyPage() {
    await expect(this.page_heading).toBeVisible();
    await expect(this.page_heading).toContainText(
      this.auditHistoryReviewBodyPageTestData.Review_Body_Audit_History_Page.page_heading
    );
  }

  async getAuditLog() {
    const rowCount = await this.auditTableRows.count();
    const timeValues: string[] = [];
    const eventValues: string[] = [];
    const adminEmailValues: string[] = [];
    for (let i = 1; i < rowCount; i++) {
      const columns = this.auditTableRows.nth(i).getByRole('cell');
      const timeValue = confirmStringNotNull(await columns.first().textContent());
      timeValues.push(timeValue);
      const eventValue = confirmStringNotNull(await columns.nth(1).textContent());
      eventValues.push(eventValue);
      const adminEmailValue = confirmStringNotNull(await columns.nth(2).textContent());
      adminEmailValues.push(adminEmailValue);
    }
    return [timeValues, eventValues, adminEmailValues];
  }

  async getSelectedValues<PageObject>(dataset: JSON, key: string, page: PageObject) {
    const locator: Locator = page[key];
    return await removeUnwantedWhitespace(confirmStringNotNull(await locator.textContent()));
  }
}
