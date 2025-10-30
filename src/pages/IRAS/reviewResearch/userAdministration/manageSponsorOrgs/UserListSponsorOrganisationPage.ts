import { expect, Locator, Page } from '@playwright/test';
import * as userListSponsorOrgPageTestData from '../../../../../resources/test_data/iras/reviewResearch/userAdministration/manageSponsorOrgs/user_list_sponsor_organisation_page_data.json';

//Declare Page Objects
export default class UserListReviewBodyPage {
  readonly page: Page;
  readonly userListSponsorOrgPageTestData: typeof userListSponsorOrgPageTestData;
  private _user_list_before_search: string[];
  private _user_email: string[];
  private _user_fname: string[];
  private _user_lname: string[];
  private _first_name: string;
  private _last_name: string;
  private _email_address: string;
  private _status: string;
  private _user_full_name: Map<string, string>;
  readonly page_heading: Locator;
  readonly guidance_text: Locator;
  readonly userListTableRows: Locator;
  readonly userListTableBodyRows: Locator;
  readonly search_box_label: Locator;
  readonly first_name_label: Locator;
  readonly first_name_value_first_row: Locator;
  readonly last_name_value_first_row: Locator;
  readonly email_address_value_first_row: Locator;
  readonly status_value_first_row: Locator;
  readonly last_name_label: Locator;
  readonly email_address_label: Locator;
  readonly status_label: Locator;
  readonly last_logged_in_label: Locator;
  readonly actions_label: Locator;
  readonly back_to_users_link: Locator;
  readonly no_results_heading: Locator;
  readonly no_results_guidance_text: Locator;
  readonly tableRows: Locator;
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
    this._user_list_before_search = [];
    this._user_email = [];
    this._user_fname = [];
    this._user_lname = [];
    this._first_name = '';
    this._last_name = '';
    this._email_address = '';
    this._status = '';
    this._user_full_name = new Map();
    //Locators
    this.page_heading = this.page
      .getByRole('heading')
      .getByText(this.userListSponsorOrgPageTestData.Sponsor_Organisation_User_List_Page.heading_prefix_label);
    this.guidance_text = this.page
      .getByRole('paragraph')
      .getByText(this.userListSponsorOrgPageTestData.Sponsor_Organisation_User_List_Page.guidance_text, {
        exact: true,
      });
    this.userListTableRows = this.page.getByRole('table').getByRole('row');
    this.userListTableBodyRows = this.page.getByRole('table').locator('tbody').getByRole('row');
    this.first_name_label = this.userListTableRows
      .locator('th')
      .getByText(
        this.userListSponsorOrgPageTestData.Sponsor_Organisation_User_List_Page.Column_Header_Labels.first_name_label,
        {
          exact: true,
        }
      );
    this.first_name_value_first_row = this.userListTableRows.nth(1).getByRole('cell').first();
    this.last_name_value_first_row = this.userListTableRows.nth(1).getByRole('cell').nth(1);
    this.email_address_value_first_row = this.userListTableRows.nth(1).getByRole('cell').nth(2);
    this.status_value_first_row = this.userListTableRows.nth(1).getByRole('cell').nth(3);
    this.last_name_label = this.userListTableRows
      .locator('th')
      .getByText(
        this.userListSponsorOrgPageTestData.Sponsor_Organisation_User_List_Page.Column_Header_Labels.last_name_label,
        {
          exact: true,
        }
      );
    this.email_address_label = this.userListTableRows
      .locator('th')
      .getByText(
        this.userListSponsorOrgPageTestData.Sponsor_Organisation_User_List_Page.Column_Header_Labels
          .email_address_label,
        { exact: true }
      );
    this.status_label = this.userListTableRows
      .locator('th')
      .getByText(
        this.userListSponsorOrgPageTestData.Sponsor_Organisation_User_List_Page.Column_Header_Labels.status_label,
        {
          exact: true,
        }
      );
    this.last_logged_in_label = this.userListTableRows
      .locator('th')
      .getByText(
        this.userListSponsorOrgPageTestData.Sponsor_Organisation_User_List_Page.Column_Header_Labels
          .last_logged_in_label,
        {
          exact: true,
        }
      );
    this.actions_label = this.userListTableRows
      .locator('th')
      .getByText(
        this.userListSponsorOrgPageTestData.Sponsor_Organisation_User_List_Page.Column_Header_Labels.actions_label,
        {
          exact: true,
        }
      );
    this.search_box_label = this.page.getByText(
      this.userListSponsorOrgPageTestData.Sponsor_Organisation_User_List_Page.search_box_label,
      {
        exact: true,
      }
    );
    this.tableRows = this.page.getByRole('table').getByRole('row');
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

  //Getters & Setters for Private Variables

  async getUserListBeforeSearch(): Promise<string[]> {
    return this._user_list_before_search;
  }

  async setUserListBeforeSearch(value: string[]): Promise<void> {
    this._user_list_before_search = value;
  }

  async getUserEmail(): Promise<string[]> {
    return this._user_email;
  }

  async setUserEmail(value: string[]): Promise<void> {
    this._user_email = value;
  }

  async getUserFirstName(): Promise<string[]> {
    return this._user_fname;
  }

  async setUserFirstName(value: string[]): Promise<void> {
    this._user_fname = value;
  }
  async getUserLastName(): Promise<string[]> {
    return this._user_lname;
  }

  async setUserLastName(value: string[]): Promise<void> {
    this._user_lname = value;
  }
  async getFirstName(): Promise<string> {
    return this._first_name;
  }

  async setFirstName(value: string): Promise<void> {
    this._first_name = value;
  }

  async getLastName(): Promise<string> {
    return this._last_name;
  }

  async setLastName(value: string): Promise<void> {
    this._last_name = value;
  }

  async getEmail(): Promise<string> {
    return this._email_address;
  }

  async setEmail(value: string): Promise<void> {
    this._email_address = value;
  }

  async getStatus(): Promise<string> {
    return this._status;
  }

  async setStatus(value: string): Promise<void> {
    this._status = value;
  }

  async getFullName(): Promise<Map<string, string>> {
    return this._user_full_name;
  }

  async setFullName(value: Map<string, string>): Promise<void> {
    this._user_full_name = value;
  }

  async goto(reviewBodyId: string): Promise<void> {
    this.page.goto(`reviewbody/viewreviewbodyusers?reviewBodyId=${reviewBodyId}`);
  }

  async assertOnUserListSponsorOrgPage(): Promise<void> {
    expect
      .soft(await this.page.title())
      .toBe(this.userListSponsorOrgPageTestData.Sponsor_Organisation_User_List_Page.title);
    await expect.soft(this.page_heading).toBeVisible();
    await expect.soft(this.guidance_text).toBeVisible();
    await expect.soft(this.search_box_label).toBeVisible();
    if ((await this.userListTableRows.count()) >= 2) {
      await expect.soft(this.first_name_label).toBeVisible();
      await expect.soft(this.last_name_label).toBeVisible();
      await expect.soft(this.email_address_label).toBeVisible();
      await expect.soft(this.status_label).toBeVisible();
      await expect.soft(this.last_logged_in_label).toBeVisible();
      await expect.soft(this.actions_label).toBeVisible();
    }
  }
}
