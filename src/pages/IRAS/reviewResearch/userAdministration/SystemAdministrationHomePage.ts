import { expect, Locator, Page } from '@playwright/test';
import * as systemAdminHomePageTestData from '../../../../resources/test_data/iras/reviewResearch/userAdministration/system_admin_home_page_data.json';

//Declare Page Objects
export default class SystemAdministrationHomePage {
  readonly page: Page;
  readonly systemAdminHomePageTestData: typeof systemAdminHomePageTestData;
  readonly pageHeading: Locator;
  readonly manageReviewbodiesLink: Locator;
  readonly manageUsersLink: Locator;

  //Initialize Page Objects
  constructor(page: Page) {
    this.page = page;
    this.systemAdminHomePageTestData = systemAdminHomePageTestData;

    //Locators
    this.pageHeading = this.page.locator('h1.govuk-heading-l');
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
