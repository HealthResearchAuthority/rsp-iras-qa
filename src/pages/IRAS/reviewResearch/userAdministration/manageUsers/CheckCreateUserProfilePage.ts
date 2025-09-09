import { expect, Locator, Page } from '@playwright/test';
import * as checkCreateUserProfilePageTestData from '../../../../../resources/test_data/iras/reviewResearch/userAdministration/manageUsers/check_create_user_profile_page_data.json';
import * as linkTextData from '../../../../../resources/test_data/common/link_text_data.json';

//Declare Page Objects
export default class CheckCreateUserProfilePage {
  readonly page: Page;
  readonly checkCreateUserProfilePageTestData: typeof checkCreateUserProfilePageTestData;
  readonly linkTextData: typeof linkTextData;
  readonly page_heading: Locator;
  readonly guidance_text: Locator;
  readonly title_text: Locator;
  readonly title_change_link: Locator;
  readonly first_name_text: Locator;
  readonly first_name_change_link: Locator;
  readonly last_name_text: Locator;
  readonly last_name_change_link: Locator;
  readonly email_address_text: Locator;
  readonly email_address_change_link: Locator;
  readonly telephone_text: Locator;
  readonly telephone_change_link: Locator;
  readonly organisation_text: Locator;
  readonly organisation_change_link: Locator;
  readonly job_title_text: Locator;
  readonly job_title_change_link: Locator;
  readonly role_checkbox: Locator;
  readonly role_change_link: Locator;
  readonly country_checkbox: Locator;
  readonly country_change_link: Locator;
  readonly review_body_checkbox: Locator;
  readonly review_body_change_link: Locator;
  readonly create_profile_button: Locator;
  readonly back_button: Locator;
  readonly row_value_locator: Locator;
  readonly row_change_link_locator: Locator;
  readonly title_row: Locator;
  readonly first_name_row: Locator;
  readonly last_name_row: Locator;
  readonly email_address_row: Locator;
  readonly telephone_row: Locator;
  readonly organisation_row: Locator;
  readonly job_title_row: Locator;
  readonly role_row: Locator;
  readonly committee_row: Locator;
  readonly country_row: Locator;
  readonly access_required_row: Locator;
  readonly review_body_row: Locator;

  //Initialize Page Objects
  constructor(page: Page) {
    this.page = page;
    this.checkCreateUserProfilePageTestData = checkCreateUserProfilePageTestData;
    this.linkTextData = linkTextData;

    //Locators
    this.page_heading = this.page
      .getByRole('heading')
      .getByText(this.checkCreateUserProfilePageTestData.Check_Create_User_Profile_Page.page_heading);
    this.guidance_text = this.page
      .getByRole('paragraph')
      .getByText(this.checkCreateUserProfilePageTestData.Check_Create_User_Profile_Page.guidance_text, { exact: true });
    this.row_value_locator = this.page.locator('input');
    this.row_change_link_locator = this.page
      .getByRole('button')
      .getByText(this.linkTextData.Check_Create_User_Profile_Page.Change, { exact: true });
    this.title_row = this.page.locator('tr', {
      has: this.page
        .getByRole('cell')
        .getByText(this.checkCreateUserProfilePageTestData.Check_Create_User_Profile_Page.title_label, {
          exact: true,
        }),
    });
    this.title_change_link = this.title_row.locator(this.row_change_link_locator);
    this.title_text = this.title_row.locator('td', { has: this.row_value_locator });
    this.first_name_row = this.page.locator('tr', {
      has: this.page
        .getByRole('cell')
        .getByText(this.checkCreateUserProfilePageTestData.Check_Create_User_Profile_Page.first_name_label, {
          exact: true,
        }),
    });

    this.first_name_change_link = this.first_name_row.locator(this.row_change_link_locator);
    this.first_name_text = this.first_name_row.locator('td', { has: this.row_value_locator });
    this.last_name_row = this.page.locator('tr', {
      has: this.page
        .getByRole('cell')
        .getByText(this.checkCreateUserProfilePageTestData.Check_Create_User_Profile_Page.last_name_label, {
          exact: true,
        }),
    });
    this.last_name_change_link = this.last_name_row.locator(this.row_change_link_locator);
    this.last_name_text = this.last_name_row.locator('td', { has: this.row_value_locator });
    this.email_address_row = this.page.locator('tr', {
      has: this.page
        .getByRole('cell')
        .getByText(this.checkCreateUserProfilePageTestData.Check_Create_User_Profile_Page.email_address_label, {
          exact: true,
        }),
    });
    this.email_address_change_link = this.email_address_row.locator(this.row_change_link_locator);
    this.email_address_text = this.email_address_row.locator('td', { has: this.row_value_locator });
    this.telephone_row = this.page.locator('tr', {
      has: this.page
        .getByRole('cell')
        .getByText(this.checkCreateUserProfilePageTestData.Check_Create_User_Profile_Page.telephone_label, {
          exact: true,
        }),
    });
    this.telephone_change_link = this.telephone_row.locator(this.row_change_link_locator);
    this.telephone_text = this.telephone_row.locator('td', { has: this.row_value_locator });
    this.organisation_row = this.page.locator('tr', {
      has: this.page
        .getByRole('cell')
        .getByText(this.checkCreateUserProfilePageTestData.Check_Create_User_Profile_Page.organisation_label, {
          exact: true,
        }),
    });
    this.organisation_change_link = this.organisation_row.locator(this.row_change_link_locator);
    this.organisation_text = this.organisation_row.locator('td', { has: this.row_value_locator });
    this.job_title_row = this.page.locator('tr', {
      has: this.page
        .getByRole('cell')
        .getByText(this.checkCreateUserProfilePageTestData.Check_Create_User_Profile_Page.job_title_label, {
          exact: true,
        }),
    });
    this.job_title_change_link = this.job_title_row.locator(this.row_change_link_locator);
    this.job_title_text = this.job_title_row.locator('td', { has: this.row_value_locator });
    this.role_row = this.page.locator('tr', {
      has: this.page
        .getByRole('cell')
        .getByText(this.checkCreateUserProfilePageTestData.Check_Create_User_Profile_Page.role_label, {
          exact: true,
        }),
    });
    this.role_change_link = this.role_row.locator(this.row_change_link_locator);
    this.role_checkbox = this.role_row.locator('td', { has: this.row_value_locator });
    this.committee_row = this.page.locator('tr', {
      has: this.page
        .getByRole('cell')
        .getByText(this.checkCreateUserProfilePageTestData.Check_Create_User_Profile_Page.committee_label, {
          exact: true,
        }),
    });
    this.country_row = this.page.locator('tr', {
      has: this.page
        .getByRole('cell')
        .getByText(this.checkCreateUserProfilePageTestData.Check_Create_User_Profile_Page.country_label, {
          exact: true,
        }),
    });
    this.country_change_link = this.country_row.locator(this.row_change_link_locator);
    this.country_checkbox = this.country_row.locator('td', { has: this.row_value_locator });
    this.access_required_row = this.page.locator('tr', {
      has: this.page
        .getByRole('cell')
        .getByText(this.checkCreateUserProfilePageTestData.Check_Create_User_Profile_Page.access_required_label, {
          exact: true,
        }),
    });
    this.review_body_row = this.page.locator('tr', {
      has: this.page
        .getByRole('cell')
        .getByText(this.checkCreateUserProfilePageTestData.Check_Create_User_Profile_Page.review_body_label, {
          exact: true,
        }),
    });
    this.review_body_change_link = this.review_body_row.locator(this.row_change_link_locator);
    this.review_body_checkbox = this.review_body_row.locator('td', { has: this.row_value_locator });
    this.create_profile_button = this.page.locator('button[class="govuk-button"]');
    this.back_button = this.page.locator('button.govuk-back-link-button');
  }

  async assertOnCheckCreateUserProfilePage() {
    await expect(this.page_heading).toBeVisible();
    await expect(this.guidance_text).toBeVisible();
  }
}
