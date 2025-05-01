import { expect, Locator, Page } from '@playwright/test';
import * as reviewYourAnswersPageTestData from '../../../resources/test_data/iras/make_changes/review_your_answers_data.json';
import * as linkTextData from '../../../resources/test_data/common/link_text_data.json';

//Declare Page Objects
export default class ReviewYourAnswersPage {
  readonly page: Page;
  readonly reviewYourAnswersPageTestData: typeof reviewYourAnswersPageTestData;
  readonly pageHeading: Locator;
  readonly linkTextData: typeof linkTextData;
  readonly row_value_locator: Locator;
  readonly row_change_link_locator: Locator;
  readonly iras_id_row: Locator;
  readonly iras_id_text: Locator;
  readonly short_project_title_row: Locator;
  readonly short_project_title_text: Locator;
  readonly short_project_title_change_link: Locator;
  readonly list_row: Locator;

  //Initialize Page Objects
  constructor(page: Page) {
    this.page = page;
    this.reviewYourAnswersPageTestData = reviewYourAnswersPageTestData;
    this.linkTextData = linkTextData;

    //Locators

    this.pageHeading = this.page
      .getByRole('heading')
      .getByText(this.reviewYourAnswersPageTestData.Review_Your_Answers_Page.heading);

    this.row_value_locator = this.page.locator('input');

    this.row_change_link_locator = this.page
      .getByRole('link')
      .getByText(this.linkTextData.Review_Your_Answers_Page.Change, { exact: true });
    this.iras_id_row = this.page.locator('tr', {
      has: this.page
        .getByRole('list')
        .getByText(this.reviewYourAnswersPageTestData.Review_Your_Answers_Page.iras_id_label, {
          exact: true,
        }),
    });
    this.iras_id_text = this.iras_id_row.locator('tr', { has: this.row_value_locator });

    this.list_row = this.page.locator('.govuk-summary-list__row');
    this.short_project_title_row = this.list_row.filter({
      has: this.page.getByText(this.reviewYourAnswersPageTestData.Review_Your_Answers_Page.short_project_label),
    });

    this.short_project_title_text = this.short_project_title_row.getByRole('definition').first();

    this.short_project_title_change_link = this.short_project_title_row.getByText(
      this.linkTextData.Review_Your_Answers_Page.Change
    );
  }

  //Page Methods
  async assertOnReviewYourAnswersPage() {
    await expect(this.pageHeading).toBeVisible();
    await this.short_project_title_row.highlight();
    await this.page.pause();
    await this.short_project_title_text.highlight();
    await this.page.pause();

    await this.short_project_title_change_link.highlight();
    await this.page.pause();
  }
}
