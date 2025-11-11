import { expect, Locator, Page } from '@playwright/test';
import * as viewEditUserProfilePageTestData from '../../../../../resources/test_data/iras/reviewResearch/userAdministration/manageSponsorOrgs/view_edit_user_profile_page_data.json';
import * as buttonTextData from '../../../../../resources/test_data/common/button_text_data.json';
import * as linkTextData from '../../../../../resources/test_data/common/link_text_data.json';

//Declare Page Objects
export default class ViewEditUserProfilePage {
  readonly page: Page;
  readonly viewEditUserProfilePageTestData: typeof viewEditUserProfilePageTestData;
  readonly linkTextData: typeof linkTextData;
  readonly buttonTextData: typeof buttonTextData;
  private _userid: string;
  private _title: string;
  private _telephone: string;
  private _organisation: string;
  private _job_title: string;
  private _role: string[];
  readonly selected_bread_crumbs: Locator;
  readonly page_heading: Locator;
  readonly row_value_locator: Locator;
  readonly title_row: Locator;
  readonly title_value: Locator;
  readonly first_name_row: Locator;
  readonly first_name_value: Locator;
  readonly last_name_row: Locator;
  readonly last_name_value: Locator;
  readonly email_address_row: Locator;
  readonly email_address_value: Locator;
  readonly telephone_row: Locator;
  readonly telephone_value: Locator;
  readonly organisation_row: Locator;
  readonly organisation_value: Locator;
  readonly job_title_row: Locator;
  readonly job_title_value: Locator;
  readonly role_row: Locator;
  readonly role_value: Locator;
  readonly disable_header_label: Locator;
  readonly disable_hint_label: Locator;
  readonly enable_header_label: Locator;
  readonly enable_hint_label: Locator;
  readonly disable_sub_heading: Locator;
  readonly disable_guidance_text: Locator;
  readonly enable_sub_heading: Locator;
  readonly enable_guidance_text: Locator;
  readonly disable_button: Locator;
  readonly enable_button: Locator;

  //Initialize Page Objects
  constructor(page: Page) {
    this.page = page;
    this.viewEditUserProfilePageTestData = viewEditUserProfilePageTestData;
    this.linkTextData = linkTextData;
    this.buttonTextData = buttonTextData;
    this._userid = '';
    this._title = '';

    this._telephone = '';
    this._organisation = '';
    this._job_title = '';
    this._role = [];

    //Locators
    this.page_heading = this.page
      .getByRole('heading')
      .getByText(this.viewEditUserProfilePageTestData.View_And_Edit_User_Profile_Page.page_heading, {
        exact: false,
      });
    this.row_value_locator = this.page.locator('input');
    this.title_row = this.page.locator('tr', {
      has: this.page
        .getByRole('cell')
        .getByText(this.viewEditUserProfilePageTestData.View_And_Edit_User_Profile_Page.title_label, {
          exact: true,
        }),
    });
    this.title_value = this.title_row.locator('td', { has: this.row_value_locator });
    this.first_name_row = this.page.locator('tr', {
      has: this.page
        .getByRole('cell')
        .getByText(this.viewEditUserProfilePageTestData.View_And_Edit_User_Profile_Page.first_name_label, {
          exact: true,
        }),
    });
    this.first_name_value = this.first_name_row.locator('td', { has: this.row_value_locator });
    this.last_name_row = this.page.locator('tr', {
      has: this.page
        .getByRole('cell')
        .getByText(this.viewEditUserProfilePageTestData.View_And_Edit_User_Profile_Page.last_name_label, {
          exact: true,
        }),
    });
    this.last_name_value = this.last_name_row.locator('td', { has: this.row_value_locator });
    this.email_address_row = this.page.locator('tr', {
      has: this.page
        .getByRole('cell')
        .getByText(this.viewEditUserProfilePageTestData.View_And_Edit_User_Profile_Page.email_address_label, {
          exact: true,
        }),
    });
    this.email_address_value = this.email_address_row.locator('td', { has: this.row_value_locator });
    this.telephone_row = this.page.locator('tr', {
      has: this.page
        .getByRole('cell')
        .getByText(this.viewEditUserProfilePageTestData.View_And_Edit_User_Profile_Page.telephone_label, {
          exact: true,
        }),
    });
    this.telephone_value = this.telephone_row.locator('td', { has: this.row_value_locator });
    this.organisation_row = this.page.locator('tr', {
      has: this.page
        .getByRole('cell')
        .getByText(this.viewEditUserProfilePageTestData.View_And_Edit_User_Profile_Page.organisation_label, {
          exact: true,
        }),
    });
    this.organisation_value = this.organisation_row.locator('td', { has: this.row_value_locator });
    this.job_title_row = this.page.locator('tr', {
      has: this.page
        .getByRole('cell')
        .getByText(this.viewEditUserProfilePageTestData.View_And_Edit_User_Profile_Page.job_title_label, {
          exact: true,
        }),
    });
    this.job_title_value = this.job_title_row.locator('td', { has: this.row_value_locator });
    this.role_row = this.page.locator('tr', {
      has: this.page
        .getByRole('cell')
        .getByText(this.viewEditUserProfilePageTestData.View_And_Edit_User_Profile_Page.role_label, {
          exact: true,
        }),
    });
    this.role_value = this.role_row.locator('td', { has: this.row_value_locator });
    this.disable_header_label = this.enable_header_label = this.page.locator('h2[class="govuk-heading-m"]');
    this.disable_hint_label = this.enable_hint_label = this.page.locator('div[class="govuk-hint"]');
    this.disable_sub_heading = this.page
      .getByRole('heading')
      .getByText(this.viewEditUserProfilePageTestData.View_And_Edit_User_Profile_Page.disable_sub_heading, {
        exact: true,
      });
    this.disable_guidance_text = this.page
      .locator('.govuk-hint')
      .getByText(this.viewEditUserProfilePageTestData.View_And_Edit_User_Profile_Page.disable_guidance_text, {
        exact: true,
      });
    this.disable_button = this.page
      .getByRole('button')
      .getByText(this.viewEditUserProfilePageTestData.View_And_Edit_User_Profile_Page.disable_button, { exact: true });
    this.enable_sub_heading = this.page
      .getByRole('heading')
      .getByText(this.viewEditUserProfilePageTestData.View_And_Edit_User_Profile_Page.enable_sub_heading, {
        exact: true,
      });
    this.enable_guidance_text = this.page
      .locator('.govuk-hint')
      .getByText(this.viewEditUserProfilePageTestData.View_And_Edit_User_Profile_Page.enable_guidance_text, {
        exact: true,
      });
    this.enable_button = this.page
      .getByRole('button')
      .getByText(this.viewEditUserProfilePageTestData.View_And_Edit_User_Profile_Page.enable_button, { exact: true });
  }

  //Getters & Setters for Private Variables

  async getUserId(): Promise<string> {
    return this._userid;
  }

  async setUserId(value: string): Promise<void> {
    this._userid = value;
  }

  async getTitle(): Promise<string> {
    return this._title;
  }

  async setTitle(value: string): Promise<void> {
    this._title = value;
  }

  async getTelephone(): Promise<string> {
    return this._telephone;
  }

  async setTelephone(value: string): Promise<void> {
    this._telephone = value;
  }

  async getOrganisation(): Promise<string> {
    return this._organisation;
  }

  async setOrganisation(value: string): Promise<void> {
    this._organisation = value;
  }

  async getJobTitle(): Promise<string> {
    return this._job_title;
  }

  async setJobTitle(value: string): Promise<void> {
    this._job_title = value;
  }

  async getRole(): Promise<string[]> {
    return this._role;
  }

  async setRole(value: string[]): Promise<void> {
    this._role = value;
  }

  async assertOnViewEditUserProfilePage() {
    // this will be uncommented when KNOWN_DEFECT-RSP-5531 is fixed
    // expect
    //   .soft(await this.page.title())
    //   .toBe(this.viewEditUserProfilePageTestData.View_And_Edit_User_Profile_Page.title);
    await expect.soft(this.page_heading).toBeVisible();
  }

  async goto() {
    await this.page.goto('');
  }
}
