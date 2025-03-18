import { expect, Locator, Page } from '@playwright/test';
import * as manageUsersPageData from '../../../../../resources/test_data/iras/reviewResearch/userAdministration/manageUsers/pages/manage_users_page_data.json';
import * as linkTextData from '../../../../../resources/test_data/common/link_text_data.json';

//Declare Page Objects
export default class ManageUsersPage {
  readonly page: Page;
  readonly manageUsersPageData: typeof manageUsersPageData;
  readonly linkTextData: typeof linkTextData;
  readonly pageHeading: Locator;
  readonly addNewUserProfileRecordLink: Locator;
  readonly mainPageContent: Locator;

  //Initialize Page Objects
  constructor(page: Page) {
    this.page = page;
    this.manageUsersPageData = manageUsersPageData;

    //Locators
    this.pageHeading = this.page.getByTestId('title');
    this.mainPageContent = this.page.getByTestId('main-content');
    this.addNewUserProfileRecordLink = this.mainPageContent.getByText(
      this.linkTextData.Manage_Users_Page.Add_New_User_Profile_Record,
      {
        exact: true,
      }
    );
  }

  //Page Methods
  async goto() {
    await this.page.goto('application/startnewapplication'); // need to update URL here
  }

  async assertOnManageUsersPage() {
    //need to update code here
    await expect(this.pageHeading).toBeVisible();
    await expect(this.pageHeading).toHaveText(this.manageUsersPageData.Manage_Users_Page.heading);
  }
}
