import { expect, Locator, Page } from '@playwright/test';
import * as reviewAllChangesPageTestData from '../../../../resources/test_data/iras/make_changes/modifications/review_all_changes_data.json';

//Declare Page Objects
export default class ReviewAllChangesPage {
  readonly page: Page;
  readonly reviewAllChangesPageTestData: typeof reviewAllChangesPageTestData;
  readonly page_heading: Locator;
  readonly overall_modification_ranking_heading: Locator;
  readonly overall_modification_ranking_subheading: Locator;
  readonly changes_heading: Locator;
  readonly sponsor_details_heading: Locator;
  readonly now_send_to_sponsor_heading: Locator;
  readonly now_send_to_sponsor_hint_label: Locator;

  //Initialize Page Objects
  constructor(page: Page) {
    this.page = page;
    this.reviewAllChangesPageTestData = reviewAllChangesPageTestData;

    //Locators
    this.page_heading = this.page.getByRole('heading', {
      name: reviewAllChangesPageTestData.Review_All_Changes_Page.page_heading,
    });
    this.overall_modification_ranking_heading = this.page.getByRole('heading', {
      name: reviewAllChangesPageTestData.Review_All_Changes_Page.overall_modification_ranking_heading,
    });
    this.overall_modification_ranking_subheading = this.page.getByRole('heading', {
      name: reviewAllChangesPageTestData.Review_All_Changes_Page.overall_modification_ranking_subheading,
    });
    this.changes_heading = this.page.getByRole('heading', {
      name: reviewAllChangesPageTestData.Review_All_Changes_Page.changes_heading,
    });
    this.sponsor_details_heading = this.page.getByRole('heading', {
      name: reviewAllChangesPageTestData.Review_All_Changes_Page.sponsor_details_heading,
    });
    this.now_send_to_sponsor_heading = this.page.getByRole('heading', {
      name: reviewAllChangesPageTestData.Review_All_Changes_Page.now_send_to_sponsor_heading,
    });
    this.now_send_to_sponsor_hint_label = this.page
      .getByRole('paragraph')
      .getByText(this.reviewAllChangesPageTestData.Review_All_Changes_Page.now_send_to_sponsor_hint_label);
  }

  //Page Methods
  async assertOnReviewAllChangesPage() {
    await expect.soft(this.page_heading).toBeVisible();
    await expect.soft(this.overall_modification_ranking_heading).toBeVisible();
    // await expect.soft(this.overall_modification_ranking_subheading).toBeVisible();
    // await expect.soft(this.changes_heading).toBeVisible();
    // await expect.soft(this.sponsor_details_heading).toBeVisible();
    await expect.soft(this.now_send_to_sponsor_heading).toBeVisible();
    await expect.soft(this.now_send_to_sponsor_hint_label).toBeVisible();
  }
}
