import { expect, Locator, Page } from '@playwright/test';
import * as requestRevisionsPageTestData from '../../../resources/test_data/iras/make_changes/request_revisions_page_data.json';

//Declare Page Objects
export default class RequestRevisionsPage {
  readonly page: Page;
  readonly requestRevisionsPageTestData: typeof requestRevisionsPageTestData;
  readonly pageHeading: Locator;
  readonly revision_description_textbox: Locator;

  //Initialize Page Objects
  constructor(page: Page) {
    this.page = page;
    this.requestRevisionsPageTestData = requestRevisionsPageTestData;

    //Locators
    this.pageHeading = this.page
      .getByRole('heading')
      .getByText(this.requestRevisionsPageTestData.Request_Revisions_Page.pageHeading);
    this.revision_description_textbox = page.locator('#RevisionDescription');
  }

  //Page Methods
  async assertOnRequestRevisionsPage() {
    await expect.soft(this.pageHeading).toBeVisible();
    await expect
      .soft(this.page.getByText(this.requestRevisionsPageTestData.Request_Revisions_Page.descriptionLabel))
      .toBeVisible();
  }
}
