import { expect, Locator, Page } from '@playwright/test';
import * as proceedApplicationPageData from '../../resources/test_data/iras/proceed_application_page_data.json';

//Declare Page Objects
export default class ProceedApplicationPage {
  readonly page: Page;
  readonly proceedApplicationPageData: typeof proceedApplicationPageData;
  readonly pageHeading: Locator;
  readonly summaryListKeys: Locator;
  readonly irasIdListKey: Locator;
  //Id for Iras and Title Values are the same - will need to be fixed by Dev team in future
  readonly irasIdProjectTitleListValue: Locator;
  readonly projectTitleListKey: Locator;
  readonly projectDescriptionListKey: Locator;
  readonly projectDescriptionListValue: Locator;

  //Initialize Page Objects
  constructor(page: Page) {
    this.page = page;
    this.proceedApplicationPageData = proceedApplicationPageData;

    //Locators
    this.pageHeading = this.page.getByTestId('title');
    this.summaryListKeys = this.page.locator('.govuk-summary-list__key');
    this.irasIdListKey = this.summaryListKeys.getByText(
      proceedApplicationPageData.Proceed_Application_Page.iras_id_key
    );
    this.irasIdProjectTitleListValue = this.page.getByTestId('review_title');
    this.projectTitleListKey = this.summaryListKeys.getByText(
      proceedApplicationPageData.Proceed_Application_Page.project_title_key
    );
    this.projectDescriptionListKey = this.summaryListKeys.getByText(
      proceedApplicationPageData.Proceed_Application_Page.project_desc_key
    );
    this.projectDescriptionListValue = this.page.getByTestId('review_description');
  }

  //Page Methods
  async goto() {
    await this.page.goto('');
  }

  async assertOnProceedApplicationPage() {
    await expect(this.pageHeading).toBeVisible();
    await expect(this.irasIdListKey).toBeVisible();
    await expect(this.projectTitleListKey).toBeVisible();
    await expect(this.projectDescriptionListKey).toBeVisible();
    expect(await this.page.title()).toBe(this.proceedApplicationPageData.Proceed_Application_Page.title);
  }
}
