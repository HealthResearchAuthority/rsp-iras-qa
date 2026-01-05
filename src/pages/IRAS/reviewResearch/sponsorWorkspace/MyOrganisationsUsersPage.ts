import { expect, Locator, Page } from '@playwright/test';
import * as mySponsorOrgUsersPageTestData from '../../../../resources/test_data/iras/reviewResearch/sponsorWorkspace/my_organisations_users_page_data.json';
import * as commonTestData from '../../../../resources/test_data/common/common_data.json';
import CommonItemsPage from '../../../Common/CommonItemsPage';

//Declare Page Objects
export default class MyOrganisationsUsersPage {
  readonly page: Page;
  readonly mySponsorOrgUsersPageTestData: typeof mySponsorOrgUsersPageTestData;
  readonly commonTestData: typeof commonTestData;
  readonly page_heading: Locator;
  readonly guidance_text: Locator;
  readonly user_added_to_sponsor_organisation__success_message_text: Locator;
  readonly information_alert_banner: Locator;
  readonly user_in_sponsor_organisation_disabled_success_message_text: Locator;
  readonly user_in_sponsor_organisation_enabled_success_message_text: Locator;
  readonly search_guidance_text: Locator;

  //Initialize Page Objects
  constructor(page: Page) {
    this.page = page;
    this.mySponsorOrgUsersPageTestData = mySponsorOrgUsersPageTestData;
    this.commonTestData = commonTestData;

    //Locators
    this.page_heading = this.page
      .getByRole('heading')
      .getByText(this.mySponsorOrgUsersPageTestData.My_Organisations_Users_Page.heading_prefix_label);
    this.guidance_text = this.page
      .getByRole('paragraph')
      .getByText(this.mySponsorOrgUsersPageTestData.My_Organisations_Users_Page.guidance_text, {
        exact: true,
      });
    this.user_added_to_sponsor_organisation__success_message_text = this.page
      .getByRole('heading')
      .getByText(
        this.mySponsorOrgUsersPageTestData.My_Organisations_Users_Page
          .user_added_to_sponsor_organisation__success_message_text
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
  }

  async goto(): Promise<void> {
    this.page.goto('');
  }

  async assertOnMySponsorOrgUsersPage(commonItemsPage: CommonItemsPage): Promise<void> {
    // this will be uncommented when KNOWN_DEFECT-RSP-5531 is fixed
    // expect
    //   .soft(await this.page.title())
    //   .toBe(this.mySponsorOrgUsersPageTestData.My_Organisations_Users_Page.title);
    const pageUrl = await this.page.url();
    console.log(`Current Page URL: ${pageUrl}`);
    await expect.soft(pageUrl).toContain(this.mySponsorOrgUsersPageTestData.My_Organisations_Users_Page.partial_url);
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
  }
}
