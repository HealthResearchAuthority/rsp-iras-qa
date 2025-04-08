import { expect, Locator, Page } from '@playwright/test';
import * as userProfilePageTestData from '../../../../../resources/test_data/iras/reviewResearch/userAdministration/manageUsers/user_profile_page_data.json';
import * as buttonTextData from '../../../../../resources/test_data/common/button_text_data.json';
import * as linkTextData from '../../../../../resources/test_data/common/link_text_data.json';

//Declare Page Objects
export default class UserProfilePage {
  readonly page: Page;
  readonly userProfilePageTestData: typeof userProfilePageTestData;
  readonly linkTextData: typeof linkTextData;
  readonly buttonTextData: typeof buttonTextData;
  readonly selected_bread_crumbs: Locator;
  readonly back_button: Locator;
  readonly page_heading: Locator;
  readonly first_change_link: Locator;
  readonly row_value_locator: Locator;
  readonly row_change_link_locator: Locator;
  readonly title_row: Locator;
  readonly title_value: Locator;
  readonly title_change_link: Locator;
  readonly first_name_row: Locator;
  readonly first_name_value: Locator;
  readonly first_name_change_link: Locator;
  readonly last_name_row: Locator;
  readonly last_name_value: Locator;
  readonly last_name_change_link: Locator;
  readonly email_address_row: Locator;
  readonly email_address_value: Locator;
  readonly email_address_change_link: Locator;
  readonly telephone_row: Locator;
  readonly telephone_value: Locator;
  readonly telephone_change_link: Locator;
  readonly organisation_row: Locator;
  readonly organisation_value: Locator;
  readonly organisation_change_link: Locator;
  readonly job_title_row: Locator;
  readonly job_title_value: Locator;
  readonly job_title_change_link: Locator;
  readonly role_row: Locator;
  readonly role_value: Locator;
  readonly role_change_link: Locator;
  readonly committee_row: Locator;
  readonly committee_value: Locator;
  readonly committee_change_link: Locator;
  readonly country_row: Locator;
  readonly country_value: Locator;
  readonly country_change_link: Locator;
  readonly review_body_row: Locator;
  readonly review_body_value: Locator;
  readonly review_body_change_link: Locator;
  readonly audit_row: Locator;
  readonly audit_link: Locator;
  readonly last_updated_row: Locator;
  readonly last_updated_value: Locator;
  readonly disable_header_label: Locator;
  readonly disable_hint_label: Locator;
  readonly enable_header_label: Locator;
  readonly enable_hint_label: Locator;

  //Initialize Page Objects
  constructor(page: Page) {
    this.page = page;
    this.userProfilePageTestData = userProfilePageTestData;
    this.linkTextData = linkTextData;
    this.page_heading = this.page
      .getByRole('heading')
      .getByText(this.userProfilePageTestData.User_Profile_Page.page_heading_prefix, { exact: false });

    this.row_value_locator = this.page.locator('input');
    this.row_change_link_locator = this.page
      .getByRole('cell')
      .getByText(this.linkTextData.User_Profile_Page.Change, { exact: true });
    this.title_row = this.page.locator('tr', {
      has: this.page.getByRole('cell').getByText(this.userProfilePageTestData.User_Profile_Page.title_label, {
        exact: true,
      }),
    });
    this.title_value = this.title_row.locator('td', { has: this.row_value_locator });
    this.title_change_link = this.title_row.locator(this.row_change_link_locator);
    this.first_name_row = this.page.locator('tr', {
      has: this.page.getByRole('cell').getByText(this.userProfilePageTestData.User_Profile_Page.first_name_label, {
        exact: true,
      }),
    });
    this.first_name_value = this.first_name_row.locator('td', { has: this.row_value_locator });
    this.first_name_change_link = this.first_name_row.locator(this.row_change_link_locator);
    this.last_name_row = this.page.locator('tr', {
      has: this.page.getByRole('cell').getByText(this.userProfilePageTestData.User_Profile_Page.last_name_label, {
        exact: true,
      }),
    });
    this.last_name_value = this.last_name_row.locator('td', { has: this.row_value_locator });
    this.last_name_change_link = this.last_name_row.locator(this.row_change_link_locator);
    this.email_address_row = this.page.locator('tr', {
      has: this.page.getByRole('cell').getByText(this.userProfilePageTestData.User_Profile_Page.email_address_label, {
        exact: true,
      }),
    });
    this.email_address_value = this.email_address_row.locator('td', { has: this.row_value_locator });
    this.email_address_change_link = this.email_address_row.locator(this.row_change_link_locator);
    this.telephone_row = this.page.locator('tr', {
      has: this.page.getByRole('cell').getByText(this.userProfilePageTestData.User_Profile_Page.telephone_label, {
        exact: true,
      }),
    });
    this.telephone_value = this.telephone_row.locator('td', { has: this.row_value_locator });
    this.telephone_change_link = this.telephone_row.locator(this.row_change_link_locator);
    this.organisation_row = this.page.locator('tr', {
      has: this.page.getByRole('cell').getByText(this.userProfilePageTestData.User_Profile_Page.organisation_label, {
        exact: true,
      }),
    });
    this.organisation_value = this.organisation_row.locator('td', { has: this.row_value_locator });
    this.organisation_change_link = this.organisation_row.locator(this.row_change_link_locator);
    this.job_title_row = this.page.locator('tr', {
      has: this.page.getByRole('cell').getByText(this.userProfilePageTestData.User_Profile_Page.job_title_label, {
        exact: true,
      }),
    });
    this.job_title_value = this.job_title_row.locator('td', { has: this.row_value_locator });
    this.job_title_change_link = this.job_title_row.locator(this.row_change_link_locator);
    this.role_row = this.page.locator('tr', {
      has: this.page.getByRole('cell').getByText(this.userProfilePageTestData.User_Profile_Page.role_label, {
        exact: true,
      }),
    });
    this.role_value = this.role_row.locator('td', { has: this.row_value_locator });
    this.role_change_link = this.role_row.locator(this.row_change_link_locator);
    this.committee_row = this.page.locator('tr', {
      has: this.page.getByRole('cell').getByText(this.userProfilePageTestData.User_Profile_Page.committee_label, {
        exact: true,
      }),
    });
    this.committee_value = this.committee_row.locator('td', { has: this.row_value_locator });
    this.committee_change_link = this.committee_row.locator(this.row_change_link_locator);
    this.country_row = this.page.locator('tr', {
      has: this.page.getByRole('cell').getByText(this.userProfilePageTestData.User_Profile_Page.country_label, {
        exact: true,
      }),
    });
    this.country_value = this.country_row.locator('td', { has: this.row_value_locator });
    this.country_change_link = this.country_row.locator(this.row_change_link_locator);
    this.review_body_row = this.page.locator('tr', {
      has: this.page.getByRole('cell').getByText(this.userProfilePageTestData.User_Profile_Page.review_body_label, {
        exact: true,
      }),
    });
    this.review_body_value = this.review_body_row.locator('td', { has: this.row_value_locator });
    this.review_body_change_link = this.review_body_row.locator(this.row_change_link_locator);
    this.audit_row = this.page.locator('tr', {
      has: this.page.getByRole('cell').getByText(this.userProfilePageTestData.User_Profile_Page.audit_label, {
        exact: true,
      }),
    });
    this.audit_link = this.audit_row.locator(this.row_change_link_locator);
    this.last_updated_row = this.page.locator('tr', {
      has: this.page.getByRole('cell').getByText(this.userProfilePageTestData.User_Profile_Page.last_updated_label, {
        exact: true,
      }),
    });
    this.last_updated_value = this.last_updated_row.locator('td', { has: this.row_value_locator });
    this.disable_header_label = this.enable_header_label = this.page.locator('h2[class="govuk-heading-m"]');
    this.disable_hint_label = this.enable_hint_label = this.page.locator('div[class="govuk-hint"]');
  }

  async assertOnUserProfilePage() {
    await expect(this.page_heading).toBeVisible();
  }

  async clickOnChangeUserProfileDetails(editUserFieldName: string, userRole: string) {
    switch (editUserFieldName) {
      case 'title_text':
        await this.title_change_link.click();
        break;
      case 'first_name_text':
        await this.first_name_change_link.click();
        break;
      case 'last_name_text':
        await this.last_name_change_link.click();
        break;
      case 'email_address_text':
        await this.email_address_change_link.click();
        break;
      case 'telephone_text':
        await this.telephone_change_link.click();
        break;
      case 'organisation_text':
        await this.organisation_change_link.click();
        break;
      case 'job_title_text':
        await this.job_title_change_link.click();
        break;
      case 'role_dropdown':
        await this.role_change_link.click();
        break;
      case 'committee':
        if (userRole.trim().toLocaleLowerCase() != 'operations') {
          break;
        } else {
          await this.committee_change_link.click();
          break;
        }
      case 'country_checkbox':
        if (userRole.trim().toLocaleLowerCase() != 'operations') {
          break;
        } else {
          await this.country_change_link.click();
          break;
        }
      case 'review_body':
        if (userRole.trim().toLocaleLowerCase() != 'operations') {
          break;
        } else {
          await this.review_body_change_link.click();
          break;
        }
      default:
        throw new Error(`${editUserFieldName} is not a valid field to edit user profile`);
    }
  }

  async getUserProfileValue(editUserFieldName: string) {
    switch (editUserFieldName) {
      case 'title_text':
        return this.title_value.textContent();
      case 'first_name_text':
        return await this.first_name_value.textContent();
      case 'last_name_text':
        return await this.last_name_value.click();
      case 'email_address_text':
        return await this.email_address_value.textContent();
      case 'telephone_text':
        return await this.telephone_value.textContent();
      case 'organisation_text':
        return await this.organisation_value.textContent();
      case 'job_title_text':
        return await this.job_title_value.textContent();
      case 'role_dropdown':
        return await this.role_value.textContent();
      case 'country_checkbox':
        return await this.country_value.textContent();
      default:
        throw new Error(`${editUserFieldName} is not a valid user profile field`);
    }
  }
}
