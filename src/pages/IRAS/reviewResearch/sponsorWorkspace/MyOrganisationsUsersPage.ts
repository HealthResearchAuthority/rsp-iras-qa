import { expect, Locator, Page } from '@playwright/test';
import * as mySponsorOrgUsersPageTestData from '../../../../resources/test_data/iras/reviewResearch/sponsorWorkspace/my_organisations_users_page_data.json';
import * as commonTestData from '../../../../resources/test_data/common/common_data.json';
import CommonItemsPage from '../../../Common/CommonItemsPage';
import * as dbConfigData from '../../../../resources/test_data/common/database/db_config_data.json';
import { connect } from '../../../../utils/DbConfig';

//Declare Page Objects
export default class MyOrganisationsUsersPage {
  readonly page: Page;
  readonly mySponsorOrgUsersPageTestData: typeof mySponsorOrgUsersPageTestData;
  readonly commonTestData: typeof commonTestData;
  readonly page_heading: Locator;
  readonly page_caption: Locator;
  readonly user_added_to_sponsor_organisation__success_message_text: Locator;
  readonly information_alert_banner: Locator;
  readonly user_in_sponsor_organisation_disabled_success_message_text: Locator;
  readonly user_in_sponsor_organisation_enabled_success_message_text: Locator;
  readonly search_guidance_text: Locator;
  readonly navList: Locator;
  readonly navLinks: Locator;
  readonly mainPageContent: Locator;
  readonly add_a_user_button: Locator;
  readonly usersLink: Locator;
  readonly users_tab_active: Locator;
  readonly add_a_user_section_heading: Locator;
  readonly add_a_user_section_hint_text: Locator;
  readonly actionLinks: Locator;

  //Initialize Page Objects
  constructor(page: Page) {
    this.page = page;
    this.mySponsorOrgUsersPageTestData = mySponsorOrgUsersPageTestData;
    this.commonTestData = commonTestData;

    //Locators
    this.user_added_to_sponsor_organisation__success_message_text = this.page
      .getByRole('heading')
      .getByText(
        this.mySponsorOrgUsersPageTestData.My_Organisations_Users_Page
          .user_added_to_sponsor_organisation_success_message_text
      );
    this.information_alert_banner = this.page.getByRole('alert');
    this.user_in_sponsor_organisation_disabled_success_message_text = this.page
      .getByRole('heading')
      .getByText(
        this.mySponsorOrgUsersPageTestData.My_Organisations_Users_Page
          .user_in_sponsor_organisation_disabled_success_message_text
      );
    this.user_in_sponsor_organisation_enabled_success_message_text = this.page
      .getByRole('heading')
      .getByText(
        this.mySponsorOrgUsersPageTestData.My_Organisations_Users_Page
          .user_in_sponsor_organisation_enabled_success_message_text
      );
    this.search_guidance_text = this.page.getByText(
      this.mySponsorOrgUsersPageTestData.My_Organisations_Users_Page.search_box_hint_text,
      {
        exact: true,
      }
    );
    this.mainPageContent = this.page.getByTestId('main-content');
    this.navList = this.mainPageContent.locator('ul.govuk-service-navigation__list');
    this.navLinks = this.navList.getByRole('link');
    this.add_a_user_button = this.page.getByRole('button', {
      name: mySponsorOrgUsersPageTestData.My_Organisations_Users_Page.add_a_user_button,
    });
    this.usersLink = this.page.getByRole('link', {
      name: mySponsorOrgUsersPageTestData.My_Organisations_Users_Page.users_tab_label,
    });
    this.users_tab_active = this.page.locator('li.govuk-service-navigation__item--active').filter({
      has: this.page.getByRole('link', {
        name: mySponsorOrgUsersPageTestData.My_Organisations_Users_Page.users_tab_label,
      }),
    });
    this.add_a_user_section_heading = this.mainPageContent.getByLabel(
      mySponsorOrgUsersPageTestData.My_Organisations_Users_Page.add_a_user_section_heading
    );
    this.add_a_user_section_hint_text = this.mainPageContent.getByText(
      mySponsorOrgUsersPageTestData.My_Organisations_Users_Page.add_a_user_section_hint_text
    );
    this.actionLinks = this.page.locator('tbody tr td:last-child a.govuk-link');
    this.page_caption = this.mainPageContent.locator('div.govuk-caption-l');
    this.page_heading = this.mainPageContent.getByRole('heading', { level: 1 });
  }

  async goto(): Promise<void> {
    this.page.goto('');
  }

  async assertOnMySponsorOrgUsersPage(sponsor_organisation: string, commonItemsPage: CommonItemsPage): Promise<void> {
    const pageUrl = this.page.url();
    expect.soft(pageUrl).toContain(this.mySponsorOrgUsersPageTestData.My_Organisations_Users_Page.partial_url);
    await expect
      .soft(this.page_caption)
      .toHaveText(this.mySponsorOrgUsersPageTestData.My_Organisations_Users_Page.page_caption);
    await expect.soft(this.page_heading).toHaveText(sponsor_organisation);
    await expect.soft(commonItemsPage.search_box_label).toBeVisible();
    await expect.soft(this.search_guidance_text).toBeVisible();
    if ((await commonItemsPage.userListTableRows.count()) >= 2) {
      await expect.soft(commonItemsPage.name_label).toBeVisible();
      await expect.soft(commonItemsPage.email_address_label).toBeVisible();
      await expect.soft(commonItemsPage.status_label).toBeVisible();
      await expect.soft(commonItemsPage.role_label).toBeVisible();
      await expect.soft(commonItemsPage.authoriser_label).toBeVisible();
      await expect.soft(commonItemsPage.actions_label).toBeVisible();
    }
    if ((await commonItemsPage.userListTableRows.count()) >= 2) {
      const userList = await commonItemsPage.getSponsorUsers();
      const emailAddress: any = userList.get('emailAddressValues');
      await commonItemsPage.setUserEmail(emailAddress);
      const firstName: any = userList.get('firstNameValues');
      await commonItemsPage.setUserFirstName(firstName);
      const lastName: any = userList.get('lastNameValues');
      await commonItemsPage.setUserLastName(lastName);
      await commonItemsPage.setFirstName(firstName[0]);
      await commonItemsPage.setLastName(lastName[0]);
      await commonItemsPage.setEmail(emailAddress[0]);
      if (await commonItemsPage.firstPage.isVisible()) {
        await commonItemsPage.firstPage.click();
      }
    }
  }

  async getVisibleTabNames(): Promise<string[]> {
    const names = await this.navLinks.allTextContents();
    return names.map((name) => name.trim());
  }

  // SQL STATEMENTS //

  async sqlGetAutomationActiveUserEmails() {
    const sqlConnection = await connect(dbConfigData.Identity_Service);
    const queryResult = await sqlConnection.query(`SELECT Top 20 Email
FROM Users
WHERE Email LIKE 'QAAutomation%hscrd@health.org' and Status='active';`);
    await sqlConnection.close();
    return queryResult.recordset.map((row) => row.Email);
  }
  //   async sqlGetAutomationDisabledUserEmails() {
  //     const sqlConnection = await connect(dbConfigData.Identity_Service);
  //     const queryResult = await sqlConnection.query(`SELECT Top 5 Email
  // FROM Users
  // WHERE Email LIKE 'QAAutomation%hscrd@health.org' and Status='disabled';`);
  //     await sqlConnection.close();
  //     return queryResult.recordset.map((row) => row.Email);
  //   }

  async getAutomationUserEmails() {
    const activeUsers = new Set(await this.sqlGetAutomationActiveUserEmails());
    // const disabledUsers = new Set(await this.sqlGetAutomationDisabledUserEmails());
    // // Union of two sets
    // const all = new Set<string>([...activeUsers, ...disabledUsers]);
    return activeUsers;
  }
}
