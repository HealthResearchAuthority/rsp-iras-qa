import { expect, Locator, Page } from '@playwright/test';
import * as userListSponsorOrgPageTestData from '../../../../../resources/test_data/iras/reviewResearch/userAdministration/manageSponsorOrgs/user_list_sponsor_organisation_page_data.json';
import * as commonTestData from '../../../../../resources/test_data/common/common_data.json';
import CommonItemsPage from '../../../../Common/CommonItemsPage';

//Declare Page Objects
export default class UserListReviewBodyPage {
  readonly page: Page;
  readonly userListSponsorOrgPageTestData: typeof userListSponsorOrgPageTestData;
  readonly commonTestData: typeof commonTestData;
  readonly page_heading: Locator;
  readonly guidance_text: Locator;
  readonly user_added_to_sponsor_organisation_success_message_header_text: Locator;
  readonly user_added_to_sponsor_organisation__success_message_text: Locator;
  readonly information_alert_banner: Locator;
  readonly user_in_sponsor_organisation_disabled_success_message_header_text: Locator;
  readonly user_in_sponsor_organisation_disabled_success_message_text: Locator;
  readonly user_in_sponsor_organisation_enabled_success_message_header_text: Locator;
  readonly user_in_sponsor_organisation_enabled_success_message_text: Locator;

  //Initialize Page Objects
  constructor(page: Page) {
    this.page = page;
    this.userListSponsorOrgPageTestData = userListSponsorOrgPageTestData;
    this.commonTestData = commonTestData;

    //Locators
    this.page_heading = this.page
      .getByRole('heading')
      .getByText(this.userListSponsorOrgPageTestData.Sponsor_Organisation_User_List_Page.heading_prefix_label);
    this.guidance_text = this.page
      .getByRole('paragraph')
      .getByText(this.userListSponsorOrgPageTestData.Sponsor_Organisation_User_List_Page.guidance_text, {
        exact: true,
      });
    this.user_added_to_sponsor_organisation_success_message_header_text = this.page
      .getByTestId('govuk-notification-banner-title')
      .getByText(
        this.userListSponsorOrgPageTestData.Sponsor_Organisation_User_List_Page
          .user_added_to_sponsor_organisation_success_message_header_text
      );
    this.user_added_to_sponsor_organisation__success_message_text = this.page
      .getByRole('heading')
      .getByText(
        this.userListSponsorOrgPageTestData.Sponsor_Organisation_User_List_Page
          .user_added_to_sponsor_organisation__success_message_text
      );
    this.information_alert_banner = this.page.getByRole('alert');
    this.user_in_sponsor_organisation_disabled_success_message_header_text = this.page
      .getByTestId('govuk-notification-banner-title')
      .getByText(
        this.userListSponsorOrgPageTestData.Sponsor_Organisation_User_List_Page
          .user_in_sponsor_organisation_disabled_success_message_header_text
      );
    this.user_in_sponsor_organisation_disabled_success_message_text = this.page
      .getByRole('heading')
      .getByText(
        this.userListSponsorOrgPageTestData.Sponsor_Organisation_User_List_Page
          .user_in_sponsor_organisation_disabled_success_message_text
      );
    this.user_in_sponsor_organisation_enabled_success_message_header_text = this.page
      .getByTestId('govuk-notification-banner-title')
      .getByText(
        this.userListSponsorOrgPageTestData.Sponsor_Organisation_User_List_Page
          .user_in_sponsor_organisation_enabled_success_message_header_text
      );
    this.user_in_sponsor_organisation_enabled_success_message_text = this.page
      .getByRole('heading')
      .getByText(
        this.userListSponsorOrgPageTestData.Sponsor_Organisation_User_List_Page
          .user_in_sponsor_organisation_enabled_success_message_text
      );
  }

  async goto(reviewBodyId: string): Promise<void> {
    this.page.goto(`reviewbody/viewreviewbodyusers?reviewBodyId=${reviewBodyId}`);
  }

  async assertOnUserListSponsorOrgPage(commonItemsPage: CommonItemsPage): Promise<void> {
    expect
      .soft(await this.page.title())
      .toBe(this.userListSponsorOrgPageTestData.Sponsor_Organisation_User_List_Page.title);
    await expect.soft(this.page_heading).toBeVisible();
    await expect.soft(this.guidance_text).toBeVisible();
    await expect.soft(commonItemsPage.search_box_label).toBeVisible();
    if ((await commonItemsPage.userListTableRows.count()) >= 2) {
      await expect.soft(commonItemsPage.first_name_label).toBeVisible();
      await expect.soft(commonItemsPage.last_name_label).toBeVisible();
      await expect.soft(commonItemsPage.email_address_label).toBeVisible();
      await expect.soft(commonItemsPage.status_label).toBeVisible();
      await expect.soft(commonItemsPage.last_logged_in_label).toBeVisible();
      await expect.soft(commonItemsPage.actions_label).toBeVisible();
    }
  }
}
