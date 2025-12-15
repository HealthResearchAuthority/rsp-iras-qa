import { expect, Locator, Page } from '@playwright/test';
import * as approvalsPageTestData from '../../../../resources/test_data/iras/reviewResearch/approvals/approvals_page_data.json';
import * as buttonTextData from '../../../../resources/test_data/common/button_text_data.json';
import * as linkTextData from '../../../../resources/test_data/common/link_text_data.json';

//Declare Page Objects
export default class ApprovalsPage {
  readonly page: Page;
  readonly approvalsPageTestData: typeof approvalsPageTestData;
  readonly buttonTextData: typeof buttonTextData;
  readonly linkTextData: typeof linkTextData;
  readonly mainPageContent: Locator;
  readonly pageHeading: Locator;
  readonly search_records_link: Locator;
  readonly search_records_hint_label: Locator;

  //Initialize Page Objects
  constructor(page: Page) {
    this.page = page;
    this.approvalsPageTestData = approvalsPageTestData;
    this.buttonTextData = buttonTextData;
    this.linkTextData = linkTextData;

    //Locators
    this.mainPageContent = this.page.getByTestId('main-content');
    this.pageHeading = this.mainPageContent
      .getByRole('heading')
      .getByText(this.approvalsPageTestData.Approvals_Page.pageHeading);
    this.search_records_link = this.mainPageContent
      .getByRole('link')
      .getByText(this.approvalsPageTestData.Approvals_Page.search_records_link);
    this.search_records_hint_label = this.search_records_link.locator('..').getByRole('paragraph');
  }

  //Page Methods
  async goto() {
    await this.page.goto('/approvalsmenu');
  }

  async assertOnApprovalsPage() {
    // expect.soft(await this.page.title()).toBe(this.approvalsPageTestData.Approvals_Page.title);
    await expect.soft(this.pageHeading).toBeVisible();
    await expect.soft(this.search_records_link).toBeVisible();
    await expect.soft(this.search_records_hint_label).toBeVisible();
    expect
      .soft(await this.search_records_hint_label.textContent())
      .toBe(this.approvalsPageTestData.Approvals_Page.search_records_hint_label);
  }
}
