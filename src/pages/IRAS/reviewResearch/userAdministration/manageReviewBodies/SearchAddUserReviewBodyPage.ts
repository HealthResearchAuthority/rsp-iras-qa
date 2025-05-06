import { expect, Locator, Page } from '@playwright/test';
import * as searchAddUserReviewBodyPageData from '../../../../../resources/test_data/iras/reviewResearch/userAdministration/manageReviewBodies/search_add_user_review_body_page_data.json';
import * as linkTextData from '../../../../../resources/test_data/common/link_text_data.json';

//Declare Page Objects
export default class SearchAddUserReviewBodyPage {
  readonly page: Page;
  readonly searchAddUserReviewBodyPageData: typeof searchAddUserReviewBodyPageData;
  readonly linkTextData: typeof linkTextData;
  private _user_first_name: string;
  private _user_last_name: string;
  private _user_email: string;
  private _user_status: string;
  readonly page_heading: Locator;
  readonly page_description: Locator;
  readonly search_guidance_text: Locator;
  readonly search_input_label: Locator;
  readonly search_input_text: Locator;
  readonly no_search_results_heading: Locator;
  readonly no_search_results_guidance_text: Locator;
  readonly back_to_users_link: Locator;
  readonly manage_users_link: Locator;
  readonly search_result_table: Locator;
  readonly search_result_table_header: Locator;
  readonly search_result_table_row: Locator;
  readonly search_result_table_first_name: Locator;
  readonly search_result_table_last_name: Locator;
  readonly search_result_table_email: Locator;
  readonly search_result_table_status: Locator;
  readonly search_result_table_add_user_link: Locator;

  //Initialize Page Objects
  constructor(page: Page) {
    this.page = page;
    this.searchAddUserReviewBodyPageData = searchAddUserReviewBodyPageData;
    this.linkTextData = linkTextData;
    this._user_first_name = '';
    this._user_last_name = '';
    this._user_email = '';
    this._user_status = '';

    //Locators
    this.page_heading = this.page
      .getByRole('heading')
      .getByText(this.searchAddUserReviewBodyPageData.Search_Add_User_Review_Body_Page.page_heading, { exact: true });
    this.page_description = this.page
      .getByRole('paragraph')
      .getByText(this.searchAddUserReviewBodyPageData.Search_Add_User_Review_Body_Page.page_description, {
        exact: true,
      });
    this.search_input_label = this.page.getByText(
      this.searchAddUserReviewBodyPageData.Search_Add_User_Review_Body_Page.search_input_label,
      { exact: true }
    );
    this.search_guidance_text = this.page
      .getByRole('paragraph')
      .getByText(this.searchAddUserReviewBodyPageData.Search_Add_User_Review_Body_Page.search_guidance_text, {
        exact: true,
      });
    this.search_input_text = this.page.getByTestId('SearchQuery');
    this.no_search_results_heading = this.page
      .getByRole('heading')
      .getByText(this.searchAddUserReviewBodyPageData.Search_Add_User_Review_Body_Page.no_search_results_heading, {
        exact: true,
      });
    this.no_search_results_guidance_text = this.page
      .getByRole('paragraph')
      .getByText(
        this.searchAddUserReviewBodyPageData.Search_Add_User_Review_Body_Page.no_search_results_guidance_text,
        { exact: true }
      );
    this.back_to_users_link = this.page
      .getByRole('link')
      .getByText(this.linkTextData.Search_Add_User_Review_Body_Page.Back_To_Users);
    this.manage_users_link = this.page
      .getByRole('link')
      .getByText(this.linkTextData.Search_Add_User_Review_Body_Page.Manage_Users, { exact: true });
    this.search_result_table = this.page.getByRole('table');
    this.search_result_table_header = this.search_result_table.locator('th');
    this.search_result_table_row = this.search_result_table.locator('tbody').getByRole('row');
    this.search_result_table_first_name = this.page.getByRole('cell').first();
    this.search_result_table_last_name = this.page.getByRole('cell').nth(1);
    this.search_result_table_email = this.page.getByRole('cell').nth(2);
    this.search_result_table_status = this.page.getByRole('cell').nth(3);
    this.search_result_table_add_user_link = this.search_result_table_row
      .getByRole('link')
      .getByText(this.linkTextData.Search_Add_User_Review_Body_Page.Add_User)
      .first();
  }

  async assertOnSearchAddUserReviewBodyPage() {
    await expect(this.page_heading).toBeVisible();
    await expect(this.page_description).toBeVisible();
    await expect(this.search_input_label).toBeVisible();
    // await expect(this.search_guidance_text).toBeVisible(); // Not available due to defect
    await expect(this.search_input_text).toBeVisible();
  }

  //Getters & Setters for Private Variables

  async getUserFirstName(): Promise<string> {
    return this._user_first_name;
  }
  async setUserFirstName(value: string): Promise<void> {
    this._user_first_name = value;
  }

  async getUserLastName(): Promise<string> {
    return this._user_last_name;
  }
  async setUserLastName(value: string): Promise<void> {
    this._user_last_name = value;
  }

  async getUserEmail(): Promise<string> {
    return this._user_email;
  }
  async setUserEmail(value: string): Promise<void> {
    this._user_email = value;
  }

  async getUserStatus(): Promise<string> {
    return this._user_status;
  }
  async setUserStatus(value: string): Promise<void> {
    this._user_status = value;
  }
}
