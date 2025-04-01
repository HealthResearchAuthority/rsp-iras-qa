import { expect, Locator, Page } from '@playwright/test';
import * as systemAdminHomePageTestData from '../../../../resources/test_data/iras/reviewResearch/userAdministration/system_admin_home_page_data.json';
import * as buttonTextData from '../../../../resources/test_data/common/button_text_data.json';
import * as linkTextData from '../../../../resources/test_data/common/link_text_data.json';

//Declare Page Objects
export default class SystemAdministrationHomePage {
  readonly page: Page;
  readonly systemAdminHomePageTestData: typeof systemAdminHomePageTestData;
  readonly buttonTextData: typeof buttonTextData;
  readonly linkTextData: typeof linkTextData;
  readonly mainPageContent: Locator;
  readonly pageHeading: Locator;
  readonly loginBtn: Locator;
  readonly myApplicationsLink: Locator;
  readonly manageReviewbodiesLink: Locator;
  readonly manageUsersLink: Locator;

  //Initialize Page Objects
  constructor(page: Page) {
    this.page = page;
    this.systemAdminHomePageTestData = systemAdminHomePageTestData;
    this.buttonTextData = buttonTextData;
    this.linkTextData = linkTextData;

    //Locators
    this.mainPageContent = this.page.getByTestId('main-content');
    this.pageHeading = this.page.locator('h1.govuk-heading-l');
    this.loginBtn = this.page
      .locator('.gem-c-button')
      .and(this.page.getByText(this.buttonTextData.Home_Page.Login, { exact: true }));
    this.myApplicationsLink = this.mainPageContent.getByText(this.linkTextData.Home_Page.My_Applications, {
      exact: true,
    });
    this.manageReviewbodiesLink = this.mainPageContent.getByText(this.linkTextData.Home_Page.Manage_Review_Bodies, {
      exact: true,
    });
    this.manageUsersLink = this.mainPageContent.getByText(this.linkTextData.Home_Page.Manage_Users, {
      exact: true,
    });
  }

  //Page Methods
  async goto() {
    await this.page.goto('systemadmin');
  }

  async assertOnSystemAdministrationHomePage() {
    await expect(this.pageHeading).toBeVisible();
    await expect(this.pageHeading).toHaveText(this.systemAdminHomePageTestData.System_Admin_Home_Page.pageHeading);
  }
}
