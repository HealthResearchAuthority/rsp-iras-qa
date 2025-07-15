import { expect, Locator, Page } from '@playwright/test';
import * as systemAdminPageTestData from '../../../../resources/test_data/iras/reviewResearch/userAdministration/system_admin_page_data.json';
import * as buttonTextData from '../../../../resources/test_data/common/button_text_data.json';
import * as linkTextData from '../../../../resources/test_data/common/link_text_data.json';

//Declare Page Objects
export default class SystemAdministrationPage {
  readonly page: Page;
  readonly systemAdminPageTestData: typeof systemAdminPageTestData;
  readonly buttonTextData: typeof buttonTextData;
  readonly linkTextData: typeof linkTextData;
  readonly mainPageContent: Locator;
  readonly pageHeading: Locator;
  readonly manageReviewbodiesLink: Locator;
  readonly manageUsersLink: Locator;
  readonly manage_review_bodies_hint_label: Locator;
  readonly manage_users_hint_label: Locator;

  //Initialize Page Objects
  constructor(page: Page) {
    this.page = page;
    this.systemAdminPageTestData = systemAdminPageTestData;
    this.buttonTextData = buttonTextData;
    this.linkTextData = linkTextData;

    //Locators
    this.mainPageContent = this.page.getByTestId('main-content');
    this.pageHeading = this.page
      .getByRole('heading')
      .getByText(this.systemAdminPageTestData.System_Admin_Page.pageHeading);
    this.manageReviewbodiesLink = this.mainPageContent.getByText(
      this.linkTextData.System_Administration_Page.Manage_Review_Bodies,
      {
        exact: true,
      }
    );
    this.manageUsersLink = this.mainPageContent.getByText(this.linkTextData.System_Administration_Page.Manage_Users, {
      exact: true,
    });
    this.manage_review_bodies_hint_label = this.manageReviewbodiesLink.locator('..').getByRole('paragraph');
    this.manage_users_hint_label = this.manageUsersLink.locator('..').getByRole('paragraph');
  }

  //Page Methods
  async goto() {
    await this.page.goto('systemadmin');
  }

  async assertOnSystemAdministrationPage() {
    await expect(this.pageHeading).toBeVisible();
  }
}
