import { expect, Locator, Page } from '@playwright/test';
import * as modificationNotAuthorisedPageTestData from '../../../resources/test_data/iras/make_changes/modification_not_authorised_page_data.json';

//Declare Page Objects
export default class ModificationNotAuthorisedPage {
  readonly page: Page;
  readonly modificationNotAuthorisedPageTestData: typeof modificationNotAuthorisedPageTestData;
  readonly pageHeading: Locator;
  readonly reason_textbox: Locator;

  //Initialize Page Objects
  constructor(page: Page) {
    this.page = page;
    this.modificationNotAuthorisedPageTestData = modificationNotAuthorisedPageTestData;

    //Locators
    this.pageHeading = this.page
      .getByRole('heading')
      .getByText(this.modificationNotAuthorisedPageTestData.Modification_Not_Authorised_Page.pageHeading);
    this.reason_textbox = page.locator('#ReasonNotApproved');
  }

  //Page Methods
  async assertOnModificationNotAuthorisedPage() {
    await expect.soft(this.pageHeading).toBeVisible();
    await expect
      .soft(
        this.page.getByText(
          this.modificationNotAuthorisedPageTestData.Modification_Not_Authorised_Page.descriptionLabel
        )
      )
      .toBeVisible();
  }
}
