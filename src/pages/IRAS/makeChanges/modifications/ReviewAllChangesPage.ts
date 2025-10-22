import { expect, Locator, Page } from '@playwright/test';
import * as reviewAllChangesPageTestData from '../../../../resources/test_data/iras/make_changes/modifications/review_all_changes_data.json';
import * as modificationsCommonPageTestData from '../../../../resources/test_data/iras/make_changes/modifications/modifications_common_data.json';

//Declare Page Objects
export default class ReviewAllChangesPage {
  readonly page: Page;
  readonly reviewAllChangesPageTestData: typeof reviewAllChangesPageTestData;
  readonly modificationsCommonPageTestData: typeof modificationsCommonPageTestData;
  readonly page_heading: Locator;
  readonly overall_modification_ranking_heading: Locator;
  readonly overall_modification_ranking_subheading: Locator;
  readonly changes_heading: Locator;
  readonly sponsor_details_heading: Locator;
  readonly now_send_to_sponsor_heading: Locator;
  readonly now_send_to_sponsor_hint_label: Locator;
  readonly changes_free_text: Locator;

  //Initialize Page Objects
  constructor(page: Page) {
    this.page = page;
    this.reviewAllChangesPageTestData = reviewAllChangesPageTestData;
    this.modificationsCommonPageTestData = modificationsCommonPageTestData;

    //Locators
    this.page_heading = this.page.getByRole('heading', {
      name: reviewAllChangesPageTestData.Review_All_Changes_Page.page_heading,
      exact: true,
    });
    this.overall_modification_ranking_heading = this.page.getByRole('heading', {
      name: reviewAllChangesPageTestData.Review_All_Changes_Page.overall_modification_ranking_heading,
      exact: true,
    });
    this.overall_modification_ranking_subheading = this.page.getByRole('heading', {
      name: reviewAllChangesPageTestData.Review_All_Changes_Page.overall_modification_ranking_subheading,
    });
    this.changes_heading = this.page.getByRole('heading', {
      name: reviewAllChangesPageTestData.Review_All_Changes_Page.changes_heading,
      exact: true,
    });
    this.sponsor_details_heading = this.page
      .getByRole('heading', {
        name: reviewAllChangesPageTestData.Review_All_Changes_Page.sponsor_details_heading,
        exact: true,
      })
      .first();
    this.now_send_to_sponsor_heading = this.page.getByRole('heading', {
      name: reviewAllChangesPageTestData.Review_All_Changes_Page.now_send_to_sponsor_heading,
    });
    this.now_send_to_sponsor_hint_label = this.page
      .getByRole('paragraph')
      .getByText(this.reviewAllChangesPageTestData.Review_All_Changes_Page.now_send_to_sponsor_hint_label);
    this.changes_free_text = this.page
      .getByText(this.modificationsCommonPageTestData.Label_Texts.changes_free_textbox_label)
      .locator('..')
      .locator('textarea');
  }

  //Page Methods
  async assertOnReviewAllChangesPage() {
    await expect.soft(this.page_heading).toBeVisible();
    await expect.soft(this.overall_modification_ranking_heading).toBeVisible();
    await expect.soft(this.changes_heading).toBeVisible();
    await expect.soft(this.sponsor_details_heading).toBeVisible();
  }
}
