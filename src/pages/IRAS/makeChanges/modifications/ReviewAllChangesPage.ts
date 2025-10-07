import { expect, Locator, Page } from '@playwright/test';
import * as reviewAllChangesPageTestData from '../../../../resources/test_data/iras/make_changes/review_all_changes_data.json';

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
    this.pageHeading = this.page
      .getByRole('heading')
      .getByText(this.reviewAllChangesPageTestData.Review_All_Changes_Page.heading);
  }

  //Page Methods
  async gotoReviewAllChangesPage(modificationName: string) {
    await this.page.goto(
      `modifications/reviewallchanges?${this.reviewAllChangesPageTestData.Modification_Url[modificationName]}`
    );
  }

  async assertOnReviewAllChangesPage() {
    await expect(this.pageHeading).toBeVisible();
    expect(await this.page.title()).toBe(this.reviewAllChangesPageTestData.Review_All_Changes_Page.title);
  }
}
