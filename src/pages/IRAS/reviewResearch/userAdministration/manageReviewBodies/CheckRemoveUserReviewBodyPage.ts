import { expect, Locator, Page } from '@playwright/test';
import * as checkRemoveUserReviewBodyPageTestData from '../../../../../resources/test_data/iras/reviewResearch/userAdministration/manageReviewBodies/check_remove_user_review_body_page_data.json';

//Declare Page Objects
export default class CheckRemoveUserReviewBodyPage {
  readonly page: Page;
  readonly checkRemoveUserReviewBodyPageTestData: typeof checkRemoveUserReviewBodyPageTestData;
  private _first_name: string;
  private _last_name: string;
  private _email_address: string;
  readonly page_heading: Locator;
  readonly guidance_text: Locator;
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

  //Initialize Page Objects
  constructor(page: Page) {
    this.page = page;
    this.checkRemoveUserReviewBodyPageTestData = checkRemoveUserReviewBodyPageTestData;
    this._first_name = '';
    this._last_name = '';
    this._email_address = '';

    //Locators
    this.page_heading = this.page
      .getByRole('heading')
      .getByText(this.checkRemoveUserReviewBodyPageTestData.Check_Remove_User_Page.page_heading, { exact: true });
    this.guidance_text = this.page
      .getByRole('paragraph')
      .getByText(this.checkRemoveUserReviewBodyPageTestData.Check_Remove_User_Page.guidance_text);
    this.row_value_locator = this.page.locator('input');
    this.title_row = this.page.locator('tr', {
      has: this.page
        .getByRole('cell')
        .getByText(this.checkRemoveUserReviewBodyPageTestData.Check_Remove_User_Page.title_label, {
          exact: true,
        }),
    });
    this.title_value = this.title_row.locator('td', { has: this.row_value_locator });
    this.first_name_row = this.page.locator('tr', {
      has: this.page
        .getByRole('cell')
        .getByText(this.checkRemoveUserReviewBodyPageTestData.Check_Remove_User_Page.first_name_label, {
          exact: true,
        }),
    });
    this.first_name_value = this.first_name_row.locator('td', { has: this.row_value_locator });
    this.last_name_row = this.page.locator('tr', {
      has: this.page
        .getByRole('cell')
        .getByText(this.checkRemoveUserReviewBodyPageTestData.Check_Remove_User_Page.last_name_label, {
          exact: true,
        }),
    });
    this.last_name_value = this.last_name_row.locator('td', { has: this.row_value_locator });
    this.email_address_row = this.page.locator('tr', {
      has: this.page
        .getByRole('cell')
        .getByText(this.checkRemoveUserReviewBodyPageTestData.Check_Remove_User_Page.email_address_label, {
          exact: true,
        }),
    });
    this.email_address_value = this.email_address_row.locator('td', { has: this.row_value_locator });
    this.telephone_row = this.page.locator('tr', {
      has: this.page
        .getByRole('cell')
        .getByText(this.checkRemoveUserReviewBodyPageTestData.Check_Remove_User_Page.telephone_label, {
          exact: true,
        }),
    });
    this.telephone_value = this.telephone_row.locator('td', { has: this.row_value_locator });
    this.organisation_row = this.page.locator('tr', {
      has: this.page
        .getByRole('cell')
        .getByText(this.checkRemoveUserReviewBodyPageTestData.Check_Remove_User_Page.organisation_label, {
          exact: true,
        }),
    });
    this.organisation_value = this.organisation_row.locator('td', { has: this.row_value_locator });
    this.job_title_row = this.page.locator('tr', {
      has: this.page
        .getByRole('cell')
        .getByText(this.checkRemoveUserReviewBodyPageTestData.Check_Remove_User_Page.job_title_label, {
          exact: true,
        }),
    });
    this.job_title_value = this.job_title_row.locator('td', { has: this.row_value_locator });
    this.role_row = this.page.locator('tr', {
      has: this.page
        .getByRole('cell')
        .getByText(this.checkRemoveUserReviewBodyPageTestData.Check_Remove_User_Page.role_label, {
          exact: true,
        }),
    });
    this.role_value = this.role_row.locator('td', { has: this.row_value_locator });
  }

  async assertOnCheckRemoveUserProfilePage() {
    await expect(this.page_heading).toBeVisible();
    await expect(this.guidance_text).toBeVisible();
  }

  //Getters & Setters for Private Variables

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
}
