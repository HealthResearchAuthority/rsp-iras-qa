import { expect, Locator, Page } from '@playwright/test';
import * as reviewYourApplicationPageTestData from '../../../resources/test_data/iras/make_changes/review_your_application_data.json';

//Declare Page Objects
export default class ReviewYourApplicationPage {
  readonly page: Page;
  readonly reviewYourApplicationPageTestData: typeof reviewYourApplicationPageTestData;
  readonly pageHeading: Locator;

  //Initialize Page Objects
  constructor(page: Page) {
    this.page = page;
    this.reviewYourApplicationPageTestData = reviewYourApplicationPageTestData;

    //Locators
    this.pageHeading = this.page.getByTestId('title');
  }

  //Page Methods
  async assertOnReviewYourApplicationPage() {
    await expect(this.pageHeading).toBeVisible();
    await expect(this.pageHeading).toHaveText(
      this.reviewYourApplicationPageTestData.Review_Your_Application_Page.heading
    );
  }
}
