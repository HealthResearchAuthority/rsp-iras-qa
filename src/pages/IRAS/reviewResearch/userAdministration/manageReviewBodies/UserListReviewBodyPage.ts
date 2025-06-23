import { expect, Locator, Page } from '@playwright/test';
import * as userListReviewBodyPageTestData from '../../../../../resources/test_data/iras/reviewResearch/userAdministration/manageReviewBodies/user_list_review_body_page_data.json';
import { confirmStringNotNull } from '../../../../../utils/UtilFunctions';
import CommonItemsPage from '../../../../Common/CommonItemsPage';

//Declare Page Objects
export default class UserListReviewBodyPage {
  readonly page: Page;
  readonly userListReviewBodyPageTestData: typeof userListReviewBodyPageTestData;
  private _search_key: string;
  private _user_list_before_search: string[];
  private _user_email: string[];
  private _user_fname: string[];
  private _user_lname: string[];
  private _first_name: string;
  private _last_name: string;
  private _email_address: string;
  private _status: string;
  private _user_full_name: Map<string, string>;
  readonly page_heading: Locator;
  readonly guidance_text: Locator;
  readonly userListTableRows: Locator;
  readonly userListTableBodyRows: Locator;
  readonly search_box_label: Locator;
  readonly first_name_label: Locator;
  readonly first_name_value_first_row: Locator;
  readonly last_name_value_first_row: Locator;
  readonly email_address_value_first_row: Locator;
  readonly status_value_first_row: Locator;
  readonly last_name_label: Locator;
  readonly email_address_label: Locator;
  readonly status_label: Locator;
  readonly last_logged_in_label: Locator;
  readonly actions_label: Locator;
  readonly back_to_users_link: Locator;
  readonly no_results_heading: Locator;
  readonly no_results_guidance_text: Locator;
  readonly tableRows: Locator;

  //Initialize Page Objects
  constructor(page: Page) {
    this.page = page;
    this.userListReviewBodyPageTestData = userListReviewBodyPageTestData;
    this._search_key = '';
    this._user_list_before_search = [];
    this._user_email = [];
    this._user_fname = [];
    this._user_lname = [];
    this._first_name = '';
    this._last_name = '';
    this._email_address = '';
    this._status = '';
    this._user_full_name = new Map();
    //Locators
    this.page_heading = this.page
      .getByRole('heading')
      .getByText(this.userListReviewBodyPageTestData.Review_Body_User_List_Page.page_heading);
    this.guidance_text = this.page
      .getByRole('paragraph')
      .getByText(this.userListReviewBodyPageTestData.Review_Body_User_List_Page.guidance_text, { exact: true });
    this.no_results_heading = this.page
      .getByRole('heading')
      .getByText(this.userListReviewBodyPageTestData.Review_Body_User_List_Page.no_results_heading, { exact: true });
    this.no_results_guidance_text = this.page
      .getByRole('paragraph')
      .getByText(this.userListReviewBodyPageTestData.Review_Body_User_List_Page.no_results_guidance_text, {
        exact: true,
      });
    this.userListTableRows = this.page.getByRole('table').getByRole('row');
    this.userListTableBodyRows = this.page.getByRole('table').locator('tbody').getByRole('row');
    this.first_name_label = this.userListTableRows
      .locator('th')
      .getByText(this.userListReviewBodyPageTestData.Review_Body_User_List_Page.Column_Header_Labels.first_name_label, {
        exact: true,
      });
    this.first_name_value_first_row = this.userListTableRows.nth(1).getByRole('cell').first();
    this.last_name_value_first_row = this.userListTableRows.nth(1).getByRole('cell').nth(1);
    this.email_address_value_first_row = this.userListTableRows.nth(1).getByRole('cell').nth(2);
    this.status_value_first_row = this.userListTableRows.nth(1).getByRole('cell').nth(3);
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
    this.back_to_users_link = this.page
      .getByRole('link')
      .getByText(this.userListReviewBodyPageTestData.Review_Body_User_List_Page.back_to_users_link);
    this.tableRows = this.page.getByRole('table').getByRole('row');
  }

  async goto(reviewBodyId: string): Promise<void> {
    this.page.goto(`reviewbody/viewreviewbodyusers?reviewBodyId=${reviewBodyId}`);
  }

  async assertOnUserListReviewBodyPage(): Promise<void> {
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
    return this._user_list_before_search;
  }

  async setUserListBeforeSearch(value: string[]): Promise<void> {
    this._user_list_before_search = value;
  }

  async getUserEmail(): Promise<string[]> {
    return this._user_email;
  }

  async setUserEmail(value: string[]): Promise<void> {
    this._user_email = value;
  }

  async getUserFirstName(): Promise<string[]> {
    return this._user_fname;
  }

  async setUserFirstName(value: string[]): Promise<void> {
    this._user_fname = value;
  }
  async getUserLastName(): Promise<string[]> {
    return this._user_lname;
  }

  async setUserLastName(value: string[]): Promise<void> {
    this._user_lname = value;
  }
  async getFirstName(): Promise<string> {
    return this._first_name;
  }

  async setFirstName(value: string): Promise<void> {
    this._first_name = value;
  }

  async getLastName(): Promise<string> {
    return this._last_name;
  }

  async setLastName(value: string): Promise<void> {
    this._last_name = value;
  }

  async getEmail(): Promise<string> {
    return this._email_address;
  }

  async setEmail(value: string): Promise<void> {
    this._email_address = value;
  }

  async getStatus(): Promise<string> {
    return this._status;
  }

  async setStatus(value: string): Promise<void> {
    this._status = value;
  }

  async getFullName(): Promise<Map<string, string>> {
    return this._user_full_name;
  }

  async setFullName(value: Map<string, string>): Promise<void> {
    this._user_full_name = value;
  }

  async getSearchQueryFNameLNameEmail(position: string, fieldKey: string) {
    let searchKey: string = '';
    let searchValues: string[] = [];
    if (fieldKey === 'Email_Address') {
      searchValues = await this.getUserEmail();
    } else if (fieldKey === 'First_Name') {
      searchValues = await this.getUserFirstName();
    } else if (fieldKey === 'Last_Name') {
      searchValues = await this.getUserLastName();
    }
    const rowCount = searchValues.length;
    if (position.toLowerCase() == 'first') {
      searchKey = searchValues[0];
    } else if (position.toLowerCase() == 'last') {
      searchKey = searchValues[rowCount - 1];
    }
    return searchKey;
  }

  async getSearchQueryFullName(position: string) {
    let searchKey: string = '';
    let firstNameValue: string = '';
    let lastNameValue: string = '';
    const firstNameValues: any = await this.getUserFirstName();
    const lastNameValues: any = await this.getUserLastName();
    const rowCount = lastNameValues.length;
    if (position.toLowerCase() == 'first') {
      searchKey = firstNameValues[0] + ' ' + lastNameValues[0];
      firstNameValue = firstNameValues[0];
      lastNameValue = lastNameValues[0];
    } else if (position.toLowerCase() == 'last') {
      searchKey = firstNameValues[rowCount - 1] + ' ' + lastNameValues[rowCount - 1];
      firstNameValue = firstNameValues[rowCount - 1];
      lastNameValue = lastNameValues[rowCount - 1];
    }
    const fullNameMap = new Map([
      ['firstName', firstNameValue],
      ['lastName', lastNameValue],
    ]);
    await this.setFullName(fullNameMap);
    return searchKey;
  }
  async updateUserInfo() {
    await this.setFirstName(confirmStringNotNull(await this.first_name_value_first_row.textContent()));
    await this.setLastName(confirmStringNotNull(await this.last_name_value_first_row.textContent()));
    await this.setEmail(confirmStringNotNull(await this.email_address_value_first_row.textContent()));
    await this.setStatus(confirmStringNotNull(await this.status_value_first_row.textContent()));
  }

  async getSearchQueryFNameLNameEmailByPosition(position: string, fieldKey: string, commonItemsPage: CommonItemsPage) {
    let searchValues: any;
    const userList = await this.getUserListByPosition(position, commonItemsPage);
    if (fieldKey === 'Email_Address') {
      searchValues = userList.get('emailAddressValues');
    } else if (fieldKey === 'First_Name') {
      searchValues = userList.get('firstNameValues');
      await this.setUserFirstName(searchValues);
    } else if (fieldKey === 'Last_Name') {
      searchValues = userList.get('lastNameValues');
      await this.setUserLastName(searchValues);
    }
    return searchValues[0];
  }

  async getUserListByPosition(position: string, commonItemsPage: CommonItemsPage) {
    let userList: any;
    if (position.toLowerCase() == 'first') {
      userList = await this.getUsersByPage();
    } else if (position.toLowerCase() == 'last') {
      const totalPages = await commonItemsPage.getTotalPages();
      await commonItemsPage.clickOnPages(totalPages, 'clicking on page number');
      userList = await this.getUsersByPage();
    }
    return userList;
  }

  async getUsersByPage(): Promise<Map<string, string[]>> {
    const firstNameValues: string[] = [];
    const lastNameValues: string[] = [];
    const emailAddressValues: string[] = [];
    for (let i = 1; i < 2; i++) {
      const columns = this.tableRows.nth(i).getByRole('cell');
      const firstName = confirmStringNotNull(await columns.nth(0).textContent());
      firstNameValues.push(firstName);
      const lastName = confirmStringNotNull(await columns.nth(1).textContent());
      lastNameValues.push(lastName);
      const emailAddress = confirmStringNotNull(await columns.nth(2).textContent());
      emailAddressValues.push(emailAddress);
    }
    const userMap = new Map([
      ['firstNameValues', firstNameValues],
      ['lastNameValues', lastNameValues],
      ['emailAddressValues', emailAddressValues],
    ]);
    return userMap;
  }

  async setSearchQueryFullNameByPosition(position: string, fieldKey: string, commonItemsPage: CommonItemsPage) {
    const userList = await this.getUserListByPosition(position, commonItemsPage);
    if (fieldKey === 'Full_Name') {
      await this.setUserFirstName(userList.get('firstNameValues'));
      await this.setUserLastName(userList.get('lastNameValues'));
    }
  }

  async getFilteredSearchResultsBeforeSearch(commonItemsPage: CommonItemsPage) {
    const userValues = await this.getUserListBeforeSearch();
    const searchKey = await this.getSearchKey();
    const searchTerms = await commonItemsPage.splitSearchTerm(searchKey);
    const filteredSearchResults = await commonItemsPage.filterResults(userValues, searchTerms);
    return filteredSearchResults;
  }
}
