import { expect, Locator, Page } from '@playwright/test';
import * as manageUsersPageData from '../../../../../resources/test_data/iras/reviewResearch/userAdministration/manageUsers/pages/manage_users_page_data.json';
import * as linkTextData from '../../../../../resources/test_data/common/link_text_data.json';

//Declare Page Objects
export default class ManageUsersPage {
  readonly page: Page;
  readonly manageUsersPageData: typeof manageUsersPageData;
  readonly linkTextData: typeof linkTextData;
  readonly page_heading: Locator;
  // readonly add_new_users_record_link: Locator;
  // // readonly mainPageContent: Locator;
  // readonly first_name_column_header: Locator;
  // readonly last_name_column_header: Locator;
  // readonly email_address_column_header: Locator;
  // readonly status_column_header: Locator;
  // readonly last_logged_in_column_header: Locator;
  // readonly actions_column_header: Locator;
  readonly view_edit_link: Locator;
  // readonly find_user_title: Locator;
  // readonly search_box: Locator;
  // readonly search_button_label: Locator;

  //Initialize Page Objects
  constructor(page: Page) {
    this.page = page;
    this.manageUsersPageData = manageUsersPageData;

    //Locators
    this.page_heading = this.page.locator('.govuk-heading-l');
    // this.mainPageContent = this.page.getByTestId('main-content');
    // this.add_new_users_record_link = this.page.getByTestId('main-content');
    // this.first_name_column_header = this.page.getByTestId('main-content');
    // this.last_name_column_header = this.page.getByTestId('main-content');
    // this.email_address_column_header = this.page.getByTestId('main-content');
    // this.status_column_header = this.page.getByTestId('main-content');
    // this.last_logged_in_column_header = this.page.getByTestId('main-content');
    // this.actions_column_header = this.page.getByTestId('main-content');
    this.view_edit_link = this.page.locator('(//a[@class="govuk-link" and text()="View/Edit"])[1]');
    // this.find_user_title = this.page.getByTestId('main-content');
    // this.search_box = this.page.getByTestId('main-content');
    // this.search_button_label = this.page.getByTestId('main-content');
  }

  async assertOnManageUsersPage() {
    //need to update code here
    await expect(this.page_heading).toBeVisible();
    await expect(this.page_heading).toHaveText(this.manageUsersPageData.Manage_Users_Page.page_heading);
    //need to update code here
    // await expect(this.add_new_users_record_link).toHaveText(this.manageUsersPageData.Manage_Users_Page.add_new_users_record_link);
    // await expect(this.first_name_column_header).toHaveText(this.manageUsersPageData.Manage_Users_Page.first_name_column_header);
    // await expect(this.last_name_column_header).toHaveText(this.manageUsersPageData.Manage_Users_Page.last_logged_in_column_header);
    // await expect(this.email_address_column_header).toHaveText(this.manageUsersPageData.Manage_Users_Page.email_address_column_header);
    // await expect(this.status_column_header).toHaveText(this.manageUsersPageData.Manage_Users_Page.status_column_header);
    // await expect(this.last_logged_in_column_header).toHaveText(this.manageUsersPageData.Manage_Users_Page.last_logged_in_column_header);
    // await expect(this.actions_column_header).toHaveText(this.manageUsersPageData.Manage_Users_Page.actions_column_header);
    // await expect(this.view_edit_link).toHaveText(this.manageUsersPageData.Manage_Users_Page.view_edit_link);
    // await expect(this.find_user_title).toHaveText(this.manageUsersPageData.Manage_Users_Page.find_user_title);
    // await expect(this.search_button_label).toHaveText(this.manageUsersPageData.Manage_Users_Page.search_button_label);
  }
}
