import { expect, Locator, Page } from '@playwright/test';
import * as auditHistoryReviewBodyPageTestData from '../../../../../resources/test_data/iras/reviewResearch/userAdministration/manageReviewBodies/audit_history_review_body_page_data.json';
import { confirmStringNotNull, removeUnwantedWhitespace } from '../../../../../utils/UtilFunctions';
import path from 'path';
import * as fse from 'fs-extra';
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

    // this.title_label = this.userTableRows.getByRole('cell').getByText('Title', { exact: true });
    // this.title_text = this.userTableRows.getByRole('cell').getByTestId('Title').locator('..');
    // this.title_change_link = this.title_text.locator('..').getByText('Change');
    // this.first_name_label = this.userTableRows.getByRole('cell').getByText('First name', { exact: true });
    // this.first_name_text = this.userTableRows.getByRole('cell').getByTestId('FirstName').locator('..');
    // this.first_name_change_link = this.first_name_text.locator('..').getByText('Change');
    // this.last_name_label = this.userTableRows.getByRole('cell').getByText('Last name', { exact: true });
    // this.last_name_text = this.userTableRows.getByRole('cell').getByTestId('LastName').locator('..');
    // this.last_name_change_link = this.last_name_text.locator('..').getByText('Change');
    // this.email_address_label = this.userTableRows.getByRole('cell').getByText('Email address', { exact: true });
    // this.email_address_text = this.userTableRows.getByRole('cell').getByTestId('Email').locator('..');
    // this.email_address_change_link = this.email_address_text.locator('..').getByText('Change');
    // this.telephone_label = this.userTableRows.getByRole('cell').getByText('Telephone', { exact: true });
    // this.telephone_text = this.userTableRows.getByRole('cell').getByTestId('Telephone').locator('..');
    // this.telephone_change_link = this.telephone_text.locator('..').getByText('Change');
    // this.organisation_label = this.userTableRows.getByRole('cell').getByText('Organisation', { exact: true });
    // this.organisation_text = this.userTableRows.getByRole('cell').getByTestId('Organisation').locator('..');
    // this.organisation_change_link = this.organisation_text.locator('..').getByText('Change');
    // this.job_title_label = this.userTableRows.getByRole('cell').getByText('Job title', { exact: true });
    // this.job_title_text = this.userTableRows.getByRole('cell').getByTestId('JobTitle').locator('..');
    // this.job_title_change_link = this.job_title_text.locator('..').getByText('Change');
    // this.role_label = this.userTableRows.getByRole('cell').getByText('Role', { exact: true });
    // this.role_dropdown = this.userTableRows.getByRole('cell').getByTestId('Role').locator('..');
    // this.role_change_link = this.role_dropdown.locator('..').getByText('Change');
    // this.committee_label = this.userTableRows.getByRole('cell').getByText('Committee', { exact: true });
    // this.committee_dropdown = this.userTableRows.getByRole('cell').getByTestId('Committee').locator('..'); //update later when the Committee is available
    // this.committee_change_link = this.page.locator('tr.govuk-table__row:nth-child(9) button.govuk-link-button'); //update later when the Committee is available
    // this.country_label = this.userTableRows.getByRole('cell').getByText('Country', { exact: true });
    // this.country_checkbox = this.userTableRows.getByRole('cell').locator('[id^="Country"]').locator('..');
    // this.country_change_link = this.country_checkbox.locator('..').getByText('Change');
    // this.access_required_label = this.userTableRows.getByRole('cell').getByText('Access Required', { exact: true });
    // this.access_required_checkbox = this.userTableRows
    //   .getByRole('cell')
    //   .locator('[id^="AccessRequired"]')
    //   .locator('..');
    // this.access_required_change_link = this.access_required_checkbox.locator('..').getByText('Change');
    // this.review_body_label = this.userTableRows.getByRole('cell').getByText('Review body', { exact: true });
    // this.review_body_dropdown = this.userTableRows.getByRole('cell').getByTestId('ReviewBody').locator('..'); //update later when the review body is available
    // this.review_body_change_link = this.page.locator('tr.govuk-table__row:nth-child(12) button.govuk-link-button'); //update later when the review body is available
    // this.create_profile_button = this.page.locator('button[class="govuk-button"]');
  }

  async assertOnAuditHistoryReviewBodyPage() {
    await expect(this.page_heading).toBeVisible();
    const filePath = path.resolve(pathToTestDataJson);
    const data = await fse.readJson(filePath);
    await expect(this.page_heading).toHaveText(
      this.auditHistoryReviewBodyPageTestData.Review_Body_Audit_History_Page.page_heading +
        data.Create_Review_Body.organisation_name_unique
    );
  }

  async getAuditLog() {
    const rowCount = await this.auditTableRows.count();
    let timeValue: string = '';
    let eventValue: string = '';
    let adminEmailValue: string = '';
    for (let i = 1; i < rowCount; i++) {
      const columns = this.auditTableRows.nth(i).getByRole('cell');
      timeValue = confirmStringNotNull(await columns.first().textContent());
      eventValue = confirmStringNotNull(await columns.nth(1).textContent());
      adminEmailValue = confirmStringNotNull(await columns.nth(2).textContent());
    }
    return [timeValue, eventValue, adminEmailValue];
  }

  async getSelectedValues<PageObject>(dataset: JSON, key: string, page: PageObject) {
    const locator: Locator = page[key];
    return await removeUnwantedWhitespace(confirmStringNotNull(await locator.textContent()));
  }
}
