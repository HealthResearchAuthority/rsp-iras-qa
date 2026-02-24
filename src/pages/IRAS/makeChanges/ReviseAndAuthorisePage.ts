import { expect, Locator, Page } from '@playwright/test';
import * as reviseAndAuthorisePageTestData from '../../../resources/test_data/iras/make_changes/revise_and_authorise_page_data.json';

//Declare Page Objects
export default class ReviseAndAuthorisePage {
  readonly page: Page;
  readonly reviseAndAuthorisePageTestData: typeof reviseAndAuthorisePageTestData;
  readonly pageHeading: Locator;
  readonly description_of_revision_textbox: Locator;

  //Initialize Page Objects
  constructor(page: Page) {
    this.page = page;
    this.reviseAndAuthorisePageTestData = reviseAndAuthorisePageTestData;

    //Locators
    this.pageHeading = this.page
      .getByRole('heading')
      .getByText(this.reviseAndAuthorisePageTestData.Revise_And_Authorise_Page.pageHeading);
    this.description_of_revision_textbox = page.locator('#RevisionDescription');
  }

  //Page Methods
  async assertOnReviseAndAuthorisePage() {
    await expect.soft(this.pageHeading).toBeVisible();
    await expect
      .soft(this.page.getByText(this.reviseAndAuthorisePageTestData.Revise_And_Authorise_Page.descriptionHeaderLabel))
      .toBeVisible();
    await expect
      .soft(this.page.getByText(this.reviseAndAuthorisePageTestData.Revise_And_Authorise_Page.descriptionBodyLabel))
      .toBeVisible();
  }
}
