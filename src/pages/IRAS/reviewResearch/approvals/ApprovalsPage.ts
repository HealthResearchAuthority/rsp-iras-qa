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
  readonly pageHeading: Locator;
  readonly searchLink: Locator;
  readonly search_hint_label: Locator;

  //Initialize Page Objects
  constructor(page: Page) {
    this.page = page;
    this.approvalsPageTestData = approvalsPageTestData;
    this.buttonTextData = buttonTextData;
    this.linkTextData = linkTextData;

    //Locators
    this.pageHeading = this.page.getByRole('heading').getByText(this.approvalsPageTestData.Approvals_Page.pageHeading);
    this.searchLink = this.page.getByText(this.linkTextData.System_Administration_Page.Manage_Review_Bodies, {
      exact: true,
    });
    this.search_hint_label = this.searchLink.locator('..').getByRole('paragraph');
  }

  //Page Methods
  async goto() {
    await this.page.goto('');
  }

  async assertOnApprovalsPage() {
    await expect(this.pageHeading).toBeVisible();
  }
}
