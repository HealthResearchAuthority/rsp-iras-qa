import { expect, Locator, Page } from '@playwright/test';
import * as userProfilePageData from '../../../../../resources/test_data/iras/reviewResearch/userAdministration/manageUsers/pages/user_profile_page_data.json';

//Declare Page Objects
export default class UserProfilePage {
  readonly page: Page;
  readonly userProfilePageData: typeof userProfilePageData;
  readonly selected_bread_crumbs: Locator;
  readonly back_button: Locator;
  readonly page_heading: Locator;
  readonly title_textbox_label: Locator;
  readonly title_text: Locator;
  readonly title_change_link: Locator;
  readonly first_name_textbox_label: Locator;
  readonly first_name_text: Locator;
  readonly first_name_change_link: Locator;
  readonly last_name_textbox_label: Locator;
  readonly last_name_text: Locator;
  readonly last_name_change_link: Locator;
  readonly email_address_textbox_label: Locator;
  readonly email_address_text: Locator;
  readonly email_address_change_link: Locator;
  readonly telephone_textbox_label: Locator;
  readonly telephone_text: Locator;
  readonly telephone_change_link: Locator;
  readonly organisation_textbox_label: Locator;
  readonly organisation_text: Locator;
  readonly organisation_change_link: Locator;
  readonly job_title_textbox_label: Locator;
  readonly job_title_text: Locator;
  readonly job_title_change_link: Locator;
  readonly role_dropdown_label: Locator;
  readonly role_text: Locator;
  readonly role_change_link: Locator;
  readonly committee_dropdown_label: Locator;
  readonly committee_text: Locator;
  readonly committee_change_link: Locator;
  readonly country_checkbox_label: Locator;
  readonly country_text: Locator;
  readonly country_change_link: Locator;
  readonly review_body_dropdown_label: Locator;
  readonly review_body_text: Locator;
  readonly review_body_change_link: Locator;
  readonly audit_label: Locator;
  readonly audit_link: Locator;
  readonly last_updated_label: Locator;
  readonly last_updated_text: Locator;
  readonly disable_this_user_record_sub_label: Locator;
  readonly disable_user_record_button: Locator;
  readonly first_change_link: Locator;

  //Initialize Page Objects
  constructor(page: Page) {
    this.page = page;
    this.userProfilePageData = userProfilePageData;
    this.page_heading = this.page.locator('.govuk-heading-l');
    this.first_change_link = this.page.locator('(//a[@class="govuk-link" and text()="Change"])[1]');
    this.title_textbox_label = this.page.locator('tbody tr:nth-child(1) td:nth-child(1) b');
    this.title_text = this.page.locator('tbody tr:nth-child(1) td:nth-child(2)');
    this.title_change_link = this.page.locator('tbody tr:nth-child(1) td:nth-child(3) a');
    this.first_name_textbox_label = this.page.locator('tbody tr:nth-child(2) td:nth-child(1)');
    this.first_name_text = this.page.locator('tbody tr:nth-child(2) td:nth-child(2)');
    this.first_name_change_link = this.page.locator('tbody tr:nth-child(2) td:nth-child(3) a');
    this.last_name_textbox_label = this.page.locator('tbody tr:nth-child(3) td:nth-child(1)');
    this.last_name_text = this.page.locator('tbody tr:nth-child(3) td:nth-child(2)');
    this.last_name_change_link = this.page.locator('tbody tr:nth-child(3) td:nth-child(3) a');
    this.email_address_textbox_label = this.page.locator('tbody tr:nth-child(4) td:nth-child(1)');
    this.email_address_text = this.page.locator('tbody tr:nth-child(4) td:nth-child(2)');
    this.email_address_change_link = this.page.locator('tbody tr:nth-child(4) td:nth-child(3) a');
    this.telephone_textbox_label = this.page.locator('tbody tr:nth-child(5) td:nth-child(1)');
    this.telephone_text = this.page.locator('tbody tr:nth-child(5) td:nth-child(2)');
    this.telephone_change_link = this.page.locator('tbody tr:nth-child(5) td:nth-child(3) a');
    this.organisation_textbox_label = this.page.locator('tbody tr:nth-child(6) td:nth-child(1)');
    this.organisation_text = this.page.locator('tbody tr:nth-child(6) td:nth-child(2)');
    this.organisation_change_link = this.page.locator('tbody tr:nth-child(6) td:nth-child(3) a');
    this.job_title_textbox_label = this.page.locator('tbody tr:nth-child(7) td:nth-child(1)');
    this.job_title_text = this.page.locator('tbody tr:nth-child(7) td:nth-child(2)');
    this.job_title_change_link = this.page.locator('tbody tr:nth-child(7) td:nth-child(3) a');
    this.role_dropdown_label = this.page.locator('tbody tr:nth-child(8) td:nth-child(1)');
    this.role_text = this.page.locator('tbody tr:nth-child(8) td:nth-child(2)');
    this.role_change_link = this.page.locator('tbody tr:nth-child(8) td:nth-child(3) a');
    this.committee_dropdown_label = this.page.locator('tbody tr:nth-child(9) td:nth-child(1)');
    this.committee_text = this.page.locator('tbody tr:nth-child(9) td:nth-child(2)');
    this.committee_change_link = this.page.locator('tbody tr:nth-child(9) td:nth-child(3) a');
    this.country_checkbox_label = this.page.locator('tbody tr:nth-child(10) td:nth-child(1)');
    this.country_text = this.page.locator('tbody tr:nth-child(10) td:nth-child(2)');
    this.country_change_link = this.page.locator('tbody tr:nth-child(10) td:nth-child(3) a');
    this.review_body_dropdown_label = this.page.locator('tbody tr:nth-child(11) td:nth-child(1)');
    this.review_body_text = this.page.locator('tbody tr:nth-child(11) td:nth-child(2)');
    this.review_body_change_link = this.page.locator('tbody tr:nth-child(11) td:nth-child(3) a');
    this.audit_label = this.page.getByText('Audit', { exact: true });
    this.audit_link = this.page.getByText("View this user's audit trail");
    this.last_updated_label = this.page.getByText('Last updated', { exact: true });
    this.last_updated_text = this.page.locator('tbody tr:nth-child(13) td:nth-child(2)');
    this.disable_this_user_record_sub_label = this.page.locator('.govuk-hint');
    this.disable_user_record_button = this.page.getByText('Disable user record');
  }

  async assertOnUserProfilePage() {
    await expect(this.page_heading).toBeVisible();
    await expect(this.page_heading).toContainText(new RegExp(userProfilePageData.User_Profile_Page.page_heading));
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
}
