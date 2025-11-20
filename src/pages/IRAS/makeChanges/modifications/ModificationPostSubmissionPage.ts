import { expect, Locator, Page } from '@playwright/test';
import * as modificationPostSubmissionPageTestData from '../../../../resources/test_data/iras/make_changes/modifications/modification_post_submission_page_data.json';

//Declare Page Objects
export default class ModificationPostSubmissionPage {
  readonly page: Page;
  readonly modificationPostSubmissionPageTestData: typeof modificationPostSubmissionPageTestData;
  readonly pageHeading: Locator;

  //Initialize Page Objects
  constructor(page: Page) {
    this.page = page;
    this.modificationPostSubmissionPageTestData = modificationPostSubmissionPageTestData;

    //Locators
    this.pageHeading = this.page
      .getByRole('heading')
      .getByText(this.modificationPostSubmissionPageTestData.Modification_Post_Submission_Page.heading, {
        exact: true,
      });
  }

  //Page Methods
  async assertOnModificationPostSubmissionPage() {
    await expect(this.pageHeading).toBeVisible();
  }
}
