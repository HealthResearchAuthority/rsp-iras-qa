import { expect, Locator, Page } from '@playwright/test';
import * as viewEditUserProfilePageTestData from '../../../../../resources/test_data/iras/reviewResearch/userAdministration/manageSponsorOrgs/view_edit_user_profile_page_data.json';
import * as buttonTextData from '../../../../../resources/test_data/common/button_text_data.json';
import * as linkTextData from '../../../../../resources/test_data/common/link_text_data.json';
import { confirmStringNotNull } from '../../../../../utils/UtilFunctions';

//Declare Page Objects
export default class ViewEditUserProfilePage {
  readonly page: Page;
  readonly viewEditUserProfilePageTestData: typeof viewEditUserProfilePageTestData;
  readonly linkTextData: typeof linkTextData;
  readonly buttonTextData: typeof buttonTextData;
  private _userid: string;
  private _title: string;
  private _new_title: string;
  private _first_name: string;
  private _new_first_name: string;
  private _last_name: string;
  private _new_last_name: string;
  private _email_address: string;
  private _new_email_address: string;
  private _telephone: string;
  private _new_telephone: string;
  private _organisation: string;
  private _new_organisation: string;
  private _job_title: string;
  private _new_job_title: string;
  private _countries: string[];
  private _new_countries: string[];
  private _review_body: string[];
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
    this._new_title = '';
    this._first_name = '';
    this._new_first_name = '';
    this._last_name = '';
    this._new_last_name = '';
    this._email_address = '';
    this._new_email_address = '';
    this._telephone = '';
    this._new_telephone = '';
    this._organisation = '';
    this._new_organisation = '';
    this._job_title = '';
    this._new_job_title = '';
    this._countries = [];
    this._new_countries = [];
    this._review_body = [];
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

  async assertOnViewEditUserProfilePage() {
    await expect(this.page_heading).toBeVisible();
  }

  async goto() {
    await this.page.goto('');
  }

  async getUserProfileValue(editUserFieldName: string) {
    switch (editUserFieldName) {
      case 'title_text':
        return confirmStringNotNull(await this.title_value.textContent()).trim();
      case 'first_name_text':
        return confirmStringNotNull(await this.first_name_value.textContent()).trim();
      case 'last_name_text':
        return confirmStringNotNull(await this.last_name_value.textContent()).trim();
      case 'email_address_text':
        return confirmStringNotNull(await this.email_address_value.textContent()).trim();
      case 'telephone_text':
        return confirmStringNotNull(await this.telephone_value.textContent()).trim();
      case 'organisation_text':
        return confirmStringNotNull(await this.organisation_value.textContent()).trim();
      case 'job_title_text':
        return confirmStringNotNull(await this.job_title_value.textContent()).trim();
      case 'role_checkbox':
        return confirmStringNotNull(await this.role_value.textContent()).trim();
      default:
        throw new Error(`${editUserFieldName} is not a valid user profile field`);
    }
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

  async getNewTitle(): Promise<string> {
    return this._new_title;
  }

  async setNewTitle(value: string): Promise<void> {
    this._new_title = value;
  }

  async getFirstName(): Promise<string> {
    return this._first_name;
  }

  async setFirstName(value: string): Promise<void> {
    this._first_name = value;
  }

  async getNewFirstName(): Promise<string> {
    return this._new_first_name;
  }

  async setNewFirstName(value: string): Promise<void> {
    this._new_first_name = value;
  }

  async getLastName(): Promise<string> {
    return this._last_name;
  }

  async setLastName(value: string): Promise<void> {
    this._last_name = value;
  }

  async getNewLastName(): Promise<string> {
    return this._new_last_name;
  }

  async setNewLastName(value: string): Promise<void> {
    this._new_last_name = value;
  }

  async getEmail(): Promise<string> {
    return this._email_address;
  }

  async setEmail(value: string): Promise<void> {
    this._email_address = value;
  }

  async getNewEmail(): Promise<string> {
    return this._new_email_address;
  }

  async setNewEmail(value: string): Promise<void> {
    this._new_email_address = value;
  }

  async getTelephone(): Promise<string> {
    return this._telephone;
  }

  async setTelephone(value: string): Promise<void> {
    this._telephone = value;
  }

  async getNewTelephone(): Promise<string> {
    return this._new_telephone;
  }

  async setNewTelephone(value: string): Promise<void> {
    this._new_telephone = value;
  }

  async getOrganisation(): Promise<string> {
    return this._organisation;
  }

  async setOrganisation(value: string): Promise<void> {
    this._organisation = value;
  }

  async getNewOrganisation(): Promise<string> {
    return this._new_organisation;
  }

  async setNewOrganisation(value: string): Promise<void> {
    this._new_organisation = value;
  }

  async getJobTitle(): Promise<string> {
    return this._job_title;
  }

  async setJobTitle(value: string): Promise<void> {
    this._job_title = value;
  }

  async getNewJobTitle(): Promise<string> {
    return this._new_job_title;
  }

  async setNewJobTitle(value: string): Promise<void> {
    this._new_job_title = value;
  }

  async getCountries(): Promise<string[]> {
    return this._countries;
  }

  async setCountries(value: string[]): Promise<void> {
    this._countries = value;
  }

  async getNewCountries(): Promise<string[]> {
    return this._new_countries;
  }

  async setNewCountries(value: string[]): Promise<void> {
    this._new_countries = value;
  }

  async getReviewBody(): Promise<string[]> {
    return this._review_body;
  }
  async setReviewBody(value: string[]): Promise<void> {
    this._review_body = value;
  }

  async getRole(): Promise<string[]> {
    return this._role;
  }

  async setRole(value: string[]): Promise<void> {
    this._role = value;
  }
}
