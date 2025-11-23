import { expect, Locator, Page } from '@playwright/test';
import * as userListReviewBodyPageTestData from '../../../../../resources/test_data/iras/reviewResearch/userAdministration/manageReviewBodies/user_list_review_body_page_data.json';
import * as dbConfigData from '../../../../../resources/test_data/common/database/db_config_data.json';
import { confirmStringNotNull } from '../../../../../utils/UtilFunctions';
import CommonItemsPage from '../../../../Common/CommonItemsPage';
import { connect } from '../../../../../utils/DbConfig';

//Declare Page Objects
export default class UserListReviewBodyPage {
  readonly page: Page;
  readonly userListReviewBodyPageTestData: typeof userListReviewBodyPageTestData;
  readonly page_heading: Locator;
  readonly guidance_text: Locator;
  readonly no_results_guidance_text: Locator;
  readonly no_results_heading: Locator;

  //Initialize Page Objects
  constructor(page: Page) {
    this.page = page;
    this.userListReviewBodyPageTestData = userListReviewBodyPageTestData;
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
  }

  async goto(reviewBodyId: string): Promise<void> {
    this.page.goto(`reviewbody/viewreviewbodyusers?reviewBodyId=${reviewBodyId}`);
  }

  async assertOnUserListReviewBodyPage(commonItemsPage: CommonItemsPage): Promise<void> {
    await expect(this.page_heading).toBeVisible();
    await expect(this.guidance_text).toBeVisible();
    await expect(commonItemsPage.search_box_label).toBeVisible();
    if ((await commonItemsPage.userListTableRows.count()) >= 2) {
      await expect(commonItemsPage.first_name_label).toBeVisible();
      await expect(commonItemsPage.last_name_label).toBeVisible();
      await expect(commonItemsPage.email_address_label).toBeVisible();
      await expect(commonItemsPage.status_label).toBeVisible();
      await expect(commonItemsPage.last_logged_in_label).toBeVisible();
      await expect(commonItemsPage.actions_label).toBeVisible();
    }
  }

  //Getters & Setters for Private Variables

  async getSearchQueryFNameLNameEmail(position: string, fieldKey: string, commonItemsPage: CommonItemsPage) {
    let searchKey: string = '';
    let searchValues: string[] = [];
    if (fieldKey === 'Email_Address') {
      searchValues = await commonItemsPage.getUserEmail();
    } else if (fieldKey === 'First_Name') {
      searchValues = await commonItemsPage.getUserFirstName();
    } else if (fieldKey === 'Last_Name') {
      searchValues = await commonItemsPage.getUserLastName();
    }
    const rowCount = searchValues.length;
    if (position.toLowerCase() == 'first') {
      searchKey = searchValues[0];
    } else if (position.toLowerCase() == 'last') {
      searchKey = searchValues[rowCount - 1];
    }
    return searchKey;
  }

  async getSearchQueryFullName(position: string, commonItemsPage: CommonItemsPage) {
    let searchKey: string = '';
    let firstNameValue: string = '';
    let lastNameValue: string = '';
    const firstNameValues: any = await commonItemsPage.getUserFirstName();
    const lastNameValues: any = await commonItemsPage.getUserLastName();
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
    await commonItemsPage.setFullName(fullNameMap);
    return searchKey;
  }
  async updateUserInfo(commonItemsPage: CommonItemsPage) {
    await commonItemsPage.setFirstName(
      confirmStringNotNull(await commonItemsPage.first_name_value_first_row.textContent())
    );
    await commonItemsPage.setLastName(
      confirmStringNotNull(await commonItemsPage.last_name_value_first_row.textContent())
    );
    await commonItemsPage.setEmail(
      confirmStringNotNull(await commonItemsPage.email_address_value_first_row.textContent())
    );
    await commonItemsPage.setStatus(confirmStringNotNull(await commonItemsPage.status_value_first_row.textContent()));
  }

  async getSearchQueryFNameLNameEmailByPosition(position: string, fieldKey: string, commonItemsPage: CommonItemsPage) {
    let searchValues: any;
    const userList = await this.getUserListByPosition(position, commonItemsPage);
    if (fieldKey === 'Email_Address') {
      searchValues = userList.get('emailAddressValues');
      await commonItemsPage.setUserEmail(searchValues);
    } else if (fieldKey === 'First_Name') {
      searchValues = userList.get('firstNameValues');
      await commonItemsPage.setUserFirstName(searchValues);
    } else if (fieldKey === 'Last_Name') {
      searchValues = userList.get('lastNameValues');
      await commonItemsPage.setUserLastName(searchValues);
    }
    return searchValues[0];
  }

  async getUserListByPosition(position: string, commonItemsPage: CommonItemsPage) {
    let userList: any;
    if (position.toLowerCase() == 'first') {
      userList = await this.getUsersByPage(commonItemsPage);
    } else if (position.toLowerCase() == 'last') {
      const totalPages = await commonItemsPage.getTotalPages();
      await commonItemsPage.clickOnPages(totalPages, 'clicking on page number');
      userList = await this.getUsersByPage(commonItemsPage);
    }
    return userList;
  }

  async getUsersByPage(commonItemsPage: CommonItemsPage): Promise<Map<string, string[]>> {
    const firstNameValues: string[] = [];
    const lastNameValues: string[] = [];
    const emailAddressValues: string[] = [];
    for (let i = 1; i < 2; i++) {
      const columns = commonItemsPage.tableRows.nth(i).getByRole('cell');
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
      await commonItemsPage.setUserFirstName(userList.get('firstNameValues'));
      await commonItemsPage.setUserLastName(userList.get('lastNameValues'));
    }
  }

  async getFilteredSearchResultsBeforeSearch(commonItemsPage: CommonItemsPage) {
    const userValues = await commonItemsPage.getUserListBeforeSearch();
    const searchKey = await commonItemsPage.getSearchKey();
    const searchTerms = await commonItemsPage.splitSearchTerm(searchKey);
    const filteredSearchResults = await commonItemsPage.filterResults(userValues, searchTerms);
    return filteredSearchResults;
  }

  // SQL STATEMENTS //
  async sqlDeleteReviewBodyAutomatedUserListById(revBodyId: string): Promise<void> {
    const sqlApplicationConnection = await connect(dbConfigData.Application_Service);
    await sqlApplicationConnection.query(
      `DELETE FROM RegulatoryBodiesUsers WHERE Id = '${revBodyId}' AND Email LIKE 'qaautomation%'`
    );
    await sqlApplicationConnection.close();
  }
}
