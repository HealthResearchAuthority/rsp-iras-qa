import { expect, Locator, Page } from '@playwright/test';
import * as userListReviewBodyPageTestData from '../../../../../resources/test_data/iras/reviewResearch/userAdministration/manageReviewBodies/user_list_review_body_page_data.json';

//Declare Page Objects
export default class UserListReviewBodyPage {
  readonly page: Page;
  readonly userListReviewBodyPageTestData: typeof userListReviewBodyPageTestData;
  private _search_key: string;
  private _user_list: string[];
  readonly page_heading: Locator;
  readonly guidance_text: Locator;
  readonly userListTableRows: Locator;
  readonly search_box_label: Locator;
  readonly first_name_label: Locator;
  readonly last_name_label: Locator;
  readonly email_address_label: Locator;
  // readonly next_button: Locator;
  // readonly hidden_next_button: Locator;
  readonly status_label: Locator;
  readonly last_logged_in_label: Locator;
  readonly actions_label: Locator;
  readonly search_text: Locator;
  readonly remove_link: Locator;

  //Initialize Page Objects
  constructor(page: Page) {
    this.page = page;
    this.userListReviewBodyPageTestData = userListReviewBodyPageTestData;
    this._search_key = '';
    this._user_list = [];
    //Locators
    this.page_heading = this.page
      .getByRole('heading')
      .getByText(this.userListReviewBodyPageTestData.Review_Body_User_List_Page.page_heading);
    this.guidance_text = this.page
      .getByRole('paragraph')
      .getByText(this.userListReviewBodyPageTestData.Review_Body_User_List_Page.guidance_text, { exact: true });
    this.userListTableRows = this.page.getByRole('table').getByRole('row');
    this.first_name_label = this.userListTableRows
      .locator('th')
      .getByText(this.userListReviewBodyPageTestData.Review_Body_User_List_Page.Column_Header_Labels.first_name_label, {
        exact: true,
      });
    this.last_name_label = this.userListTableRows
      .locator('th')
      .getByText(this.userListReviewBodyPageTestData.Review_Body_User_List_Page.Column_Header_Labels.last_name_label, {
        exact: true,
      });
    this.email_address_label = this.userListTableRows
      .locator('th')
      .getByText(
        this.userListReviewBodyPageTestData.Review_Body_User_List_Page.Column_Header_Labels.email_address_label,
        { exact: true }
      );
    this.status_label = this.userListTableRows
      .locator('th')
      .getByText(this.userListReviewBodyPageTestData.Review_Body_User_List_Page.Column_Header_Labels.status_label, {
        exact: true,
      });
    this.last_logged_in_label = this.userListTableRows
      .locator('th')
      .getByText(
        this.userListReviewBodyPageTestData.Review_Body_User_List_Page.Column_Header_Labels.last_logged_in_label,
        {
          exact: true,
        }
      );
    this.actions_label = this.userListTableRows
      .locator('th')
      .getByText(this.userListReviewBodyPageTestData.Review_Body_User_List_Page.Column_Header_Labels.actions_label, {
        exact: true,
      });
    this.search_box_label = this.page.getByText(
      this.userListReviewBodyPageTestData.Review_Body_User_List_Page.search_box_label,
      {
        exact: true,
      }
    );
    // this.search_text = this.page.getByRole('textbox', {
    //   name: this.userListReviewBodyPageTestData.Review_Body_User_List_Page.search_box_label,
    // });
    this.search_text = this.page.locator('#SearchQuery');
    this.remove_link = this.page.getByText('Remove').first();
    //

    // this.next_button = this.page
    //   .getByRole('link')
    //   .getByText(this.userListReviewBodyPageTestData.Review_Body_User_List_Page.next_button, { exact: true });
    // this.hidden_next_button = this.page.locator('[class="govuk-pagination__next"][style="visibility: hidden"]');
  }

  async assertOnUserListReviewBodyPage() {
    await expect(this.page_heading).toBeVisible();
    await expect(this.guidance_text).toBeVisible();
    await expect(this.search_box_label).toBeVisible();
    if ((await this.userListTableRows.count()) >= 2) {
      await expect(this.first_name_label).toBeVisible();
      await expect(this.last_name_label).toBeVisible();
      await expect(this.email_address_label).toBeVisible();
      await expect(this.status_label).toBeVisible();
      await expect(this.last_logged_in_label).toBeVisible();
      await expect(this.actions_label).toBeVisible();
    }
  }

  //Getters & Setters for Private Variables

  async getSearchKey(): Promise<string> {
    return this._search_key;
  }

  async setSearchKey(value: string): Promise<void> {
    this._search_key = value;
  }

  async getUserListBeforeSearch(): Promise<string[]> {
    return this._user_list;
  }

  async setUserListBeforeSearch(value: string[]): Promise<void> {
    this._user_list = value;
  }
}
