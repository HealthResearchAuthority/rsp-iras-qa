import { expect, Locator, Page } from '@playwright/test';
import * as reviewAllChangesPageTestData from '../../../../resources/test_data/iras/make_changes/modifications/review_all_changes_data.json';

//Declare Page Objects
export default class ReviewAllChangesPage {
  readonly page: Page;
  readonly reviewAllChangesPageTestData: typeof reviewAllChangesPageTestData;
  readonly pageHeading: Locator;

  //Initialize Page Objects
  constructor(page: Page) {
    this.page = page;
    this.reviewAllChangesPageTestData = reviewAllChangesPageTestData;

    //Locators
    this.pageHeading = this.page.getByRole('heading', {
      name: reviewAllChangesPageTestData.Review_All_Changes_Page.heading,
    });
  }

  //Page Methods
  async assertOnReviewAllChangesPage() {
    await expect(this.pageHeading).toBeVisible();
  }
}
