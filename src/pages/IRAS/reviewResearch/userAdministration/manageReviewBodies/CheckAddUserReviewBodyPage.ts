import { expect, Locator, Page } from '@playwright/test';
import * as checkAddUserReviewBodyPageData from '../../../../../resources/test_data/iras/reviewResearch/userAdministration/manageReviewBodies/check_add_user_review_body_page_data.json';

//Declare Page Objects
export default class CheckAddUserReviewBodyPage {
  readonly page: Page;
  readonly checkAddUserReviewBodyPageData: typeof checkAddUserReviewBodyPageData;
  readonly page_heading: Locator;
  readonly page_guidance_text: Locator;
  readonly user_details_table: Locator;
  readonly user_details_table_labels: Locator;
  readonly user_details_table_row: Locator;
  readonly user_first_name_row: Locator;
  readonly user_first_name_value: Locator;
  readonly user_last_name_row: Locator;
  readonly user_last_name_value: Locator;
  readonly user_email_row: Locator;
  readonly user_email_value: Locator;

  //Initialize Page Objects
  constructor(page: Page) {
    this.page = page;
    this.checkAddUserReviewBodyPageData = checkAddUserReviewBodyPageData;

    //Locators
    this.page_heading = this.page
      .getByRole('heading')
      .getByText(this.checkAddUserReviewBodyPageData.Check_Add_User_Review_Body_Page.page_heading, { exact: true });
    this.page_guidance_text = this.page.getByRole('paragraph');
    this.user_details_table = this.page.getByRole('table').locator('tbody');
    this.user_details_table_labels = this.user_details_table.getByRole('cell').locator('b');
    this.user_details_table_row = this.user_details_table.getByRole('row');
    this.user_first_name_row = this.user_details_table_row.filter({
      hasText: this.checkAddUserReviewBodyPageData.Check_Add_User_Review_Body_Page.user_details_table_labels[1],
    });
    this.user_first_name_value = this.user_first_name_row.getByRole('cell').nth(1);
    this.user_last_name_row = this.user_details_table_row.filter({
      hasText: this.checkAddUserReviewBodyPageData.Check_Add_User_Review_Body_Page.user_details_table_labels[2],
    });
    this.user_last_name_value = this.user_last_name_row.getByRole('cell').nth(1);
    this.user_email_row = this.user_details_table_row.filter({
      hasText: this.checkAddUserReviewBodyPageData.Check_Add_User_Review_Body_Page.user_details_table_labels[3],
    });
    this.user_email_value = this.user_email_row.getByRole('cell').nth(1);
  }

  //Page Methods
  async assertOnCheckAddUserReviewBodyPage() {
    await expect(this.page_heading).toBeVisible();
    await expect(this.page_guidance_text).toBeVisible();
  }
}
