import { expect, Locator, Page } from '@playwright/test';
import * as myOrganisationsUserProfilePageTestData from '../../../../resources/test_data/iras/reviewResearch/sponsorWorkspace/my_organisations_user_profile_page_data.json';

//Declare Page Objects
export default class MyOrganisationsUserProfilePage {
  readonly page: Page;
  readonly myOrganisationsUserProfilePageTestData: typeof myOrganisationsUserProfilePageTestData;
  private _role: string;
  private _authoriser: string;
  private _status: string;
  readonly page_caption: Locator;
  readonly title_label: Locator;
  readonly title_row: Locator;
  readonly title_value: Locator;
  readonly first_name_label: Locator;
  readonly first_name_row: Locator;
  readonly first_name_value: Locator;
  readonly last_name_label: Locator;
  readonly last_name_row: Locator;
  readonly last_name_value: Locator;
  readonly email_label: Locator;
  readonly email_row: Locator;
  readonly email_value: Locator;
  readonly telephone_label: Locator;
  readonly telephone_row: Locator;
  readonly telephone_value: Locator;
  readonly organisation_label: Locator;
  readonly organisation_row: Locator;
  readonly organisation_value: Locator;
  readonly job_title_label: Locator;
  readonly job_title_row: Locator;
  readonly job_title_value: Locator;
  readonly role_label: Locator;
  readonly role_row: Locator;
  readonly role_value: Locator;
  readonly role_change_link: Locator;
  readonly authoriser_label: Locator;
  readonly authoriser_row: Locator;
  readonly authoriser_value: Locator;
  readonly authoriser_change_link: Locator;
  readonly status_label: Locator;
  readonly status_row: Locator;
  readonly status_value: Locator;

  //Initialize Page Objects
  constructor(page: Page) {
    this.page = page;
    this.myOrganisationsUserProfilePageTestData = myOrganisationsUserProfilePageTestData;
    this._role = '';
    this._authoriser = '';
    this._status = '';

    //Locators
    this.page_caption = this.page.getByText(
      this.myOrganisationsUserProfilePageTestData.My_Organisations_User_Profile_Page.page_caption,
      {
        exact: true,
      }
    );
    this.title_label = this.page
      .getByRole('cell')
      .getByText(
        this.myOrganisationsUserProfilePageTestData.My_Organisations_User_Profile_Page.Row_Labels.title_label,
        { exact: true }
      );
    this.title_row = this.page.getByRole('row').filter({ has: this.title_label });
    this.title_value = this.title_row.getByRole('cell').nth(1);
    this.first_name_label = this.page
      .getByRole('cell')
      .getByText(
        this.myOrganisationsUserProfilePageTestData.My_Organisations_User_Profile_Page.Row_Labels.first_name_label,
        { exact: true }
      );
    this.first_name_row = this.page.getByRole('row').filter({ has: this.first_name_label });
    this.first_name_value = this.first_name_row.getByRole('cell').nth(1);
    this.last_name_label = this.page
      .getByRole('cell')
      .getByText(
        this.myOrganisationsUserProfilePageTestData.My_Organisations_User_Profile_Page.Row_Labels.last_name_label,
        { exact: true }
      );
    this.last_name_row = this.page.getByRole('row').filter({ has: this.last_name_label });
    this.last_name_value = this.last_name_row.getByRole('cell').nth(1);
    this.email_label = this.page
      .getByRole('cell')
      .getByText(
        this.myOrganisationsUserProfilePageTestData.My_Organisations_User_Profile_Page.Row_Labels.email_label,
        { exact: true }
      );
    this.email_row = this.page.getByRole('row').filter({ has: this.email_label });
    this.email_value = this.email_row.getByRole('cell').nth(1);
    this.telephone_label = this.page
      .getByRole('cell')
      .getByText(
        this.myOrganisationsUserProfilePageTestData.My_Organisations_User_Profile_Page.Row_Labels.telephone_label,
        { exact: true }
      );
    this.telephone_row = this.page.getByRole('row').filter({ has: this.telephone_label });
    this.telephone_value = this.telephone_row.getByRole('cell').nth(1);
    this.organisation_label = this.page
      .getByRole('cell')
      .getByText(
        this.myOrganisationsUserProfilePageTestData.My_Organisations_User_Profile_Page.Row_Labels.organisation_label,
        { exact: true }
      );
    this.organisation_row = this.page.getByRole('row').filter({ has: this.organisation_label });
    this.organisation_value = this.organisation_row.getByRole('cell').nth(1);
    this.job_title_label = this.page
      .getByRole('cell')
      .getByText(
        this.myOrganisationsUserProfilePageTestData.My_Organisations_User_Profile_Page.Row_Labels.job_title_label,
        { exact: true }
      );
    this.job_title_row = this.page.getByRole('row').filter({ has: this.job_title_label });
    this.job_title_value = this.job_title_row.getByRole('cell').nth(1);
    this.role_label = this.page
      .getByRole('cell')
      .getByText(this.myOrganisationsUserProfilePageTestData.My_Organisations_User_Profile_Page.Row_Labels.role_label, {
        exact: true,
      });
    this.role_row = this.page.getByRole('row').filter({ has: this.role_label });
    this.role_value = this.role_row.getByRole('cell').nth(1);
    this.role_change_link = this.role_row
      .getByRole('link')
      .getByText(this.myOrganisationsUserProfilePageTestData.My_Organisations_User_Profile_Page.change_link);
    this.authoriser_label = this.page
      .getByRole('cell')
      .getByText(
        this.myOrganisationsUserProfilePageTestData.My_Organisations_User_Profile_Page.Row_Labels.authoriser_label,
        { exact: true }
      );
    this.authoriser_row = this.page.getByRole('row').filter({ has: this.authoriser_label });
    this.authoriser_value = this.authoriser_row.getByRole('cell').nth(1);
    this.authoriser_change_link = this.authoriser_row
      .getByRole('link')
      .getByText(this.myOrganisationsUserProfilePageTestData.My_Organisations_User_Profile_Page.change_link);
    this.status_label = this.page
      .getByRole('cell')
      .getByText(
        this.myOrganisationsUserProfilePageTestData.My_Organisations_User_Profile_Page.Row_Labels.status_label,
        { exact: true }
      );
    this.status_row = this.page.getByRole('row').filter({ has: this.status_label });
    this.status_value = this.status_row.getByRole('cell').nth(1);
  }

  //Getters & Setters for Private Variables

  async getRole(): Promise<string> {
    return this._role;
  }

  async setRole(value: string): Promise<void> {
    this._role = value;
  }

  async getAuthoriser(): Promise<string> {
    return this._authoriser;
  }

  async setAuthoriser(value: string): Promise<void> {
    this._authoriser = value;
  }

  async getStatus(): Promise<string> {
    return this._status;
  }

  async setStatus(value: string): Promise<void> {
    this._status = value;
  }

  //Page Methods

  async assertOnMySponsorOrgUserProfilePage(): Promise<void> {
    await expect.soft(this.page_caption).toBeVisible();
    await expect.soft(this.title_label).toBeVisible();
    await expect.soft(this.first_name_label).toBeVisible();
    await expect.soft(this.last_name_label).toBeVisible();
    await expect.soft(this.email_label).toBeVisible();
    await expect.soft(this.telephone_label).toBeVisible();
    await expect.soft(this.organisation_label).toBeVisible();
    await expect.soft(this.job_title_label).toBeVisible();
    await expect.soft(this.authoriser_label).toBeVisible();
    await expect.soft(this.status_label).toBeVisible();
  }
}
