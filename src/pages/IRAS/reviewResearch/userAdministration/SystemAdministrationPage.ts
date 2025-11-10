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
  readonly manage_sponsor_organisations_hint_label: Locator;
  readonly manageSponsorOrganisationsLink: Locator;

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
    this.manageSponsorOrganisationsLink = this.mainPageContent.getByText(
      this.linkTextData.System_Administration_Page.Manage_Sponsor_Organisations,
      {
        exact: true,
      }
    );
    this.manage_review_bodies_hint_label = this.manageReviewbodiesLink
      .locator('..')
      .getByRole('paragraph')
      .getByText(this.systemAdminPageTestData.Label_Texts.manage_review_bodies_hint_label);
    this.manage_users_hint_label = this.manageUsersLink
      .locator('..')
      .getByRole('paragraph')
      .getByText(this.systemAdminPageTestData.Label_Texts.manage_users_hint_label);
    this.manage_sponsor_organisations_hint_label = this.manageSponsorOrganisationsLink
      .locator('..')
      .getByRole('paragraph')
      .getByText(this.systemAdminPageTestData.Label_Texts.manage_sponsor_organisations_hint_label);
  }

  //Page Methods
  async goto() {
    await this.page.goto('systemadmin');
  }

  async assertOnSystemAdministrationPage() {
    await expect.soft(this.pageHeading).toBeVisible();
    expect.soft(await this.page.title()).toBe(this.systemAdminPageTestData.System_Admin_Page.title); // Temporarily commented out due to title mismatch
    await expect.soft(this.manage_review_bodies_hint_label).toBeVisible();
    await expect.soft(this.manage_users_hint_label).toBeVisible();
    await expect.soft(this.manage_sponsor_organisations_hint_label).toBeVisible();
  }
}
