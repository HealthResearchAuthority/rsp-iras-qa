import { expect, Locator, Page } from '@playwright/test';
import * as userProfilePageData from '../../../../../resources/test_data/iras/reviewResearch/userAdministration/manageUsers/pages/user_profile_page_data.json';
import * as buttonTextData from '../../../../../resources/test_data/common/button_text_data.json';

//Declare Page Objects
export default class UserProfilePage {
  readonly page: Page;
  readonly userProfilePageData: typeof userProfilePageData;
  readonly buttonTextData: typeof buttonTextData;
  readonly selected_bread_crumbs: Locator;
  readonly back_button: Locator;
  readonly page_heading: Locator;
  readonly title_label: Locator;
  readonly title_text: Locator;
  readonly title_change_link: Locator;
  readonly first_name_label: Locator;
  readonly first_name_text: Locator;
  readonly first_name_change_link: Locator;
  readonly last_name_label: Locator;
  readonly last_name_text: Locator;
  readonly last_name_change_link: Locator;
  readonly email_address_label: Locator;
  readonly email_address_text: Locator;
  readonly email_address_change_link: Locator;
  readonly telephone_label: Locator;
  readonly telephone_text: Locator;
  readonly telephone_change_link: Locator;
  readonly organisation_label: Locator;
  readonly organisation_text: Locator;
  readonly organisation_change_link: Locator;
  readonly job_title_label: Locator;
  readonly job_title_text: Locator;
  readonly job_title_change_link: Locator;
  readonly role_label: Locator;
  readonly role_text: Locator;
  readonly role_change_link: Locator;
  readonly audit_label: Locator;
  readonly audit_link: Locator;
  readonly last_updated_label: Locator;
  readonly last_updated_text: Locator;
  readonly disable_this_user_record_label: Locator;
  readonly disable_this_user_record_sub_label: Locator;
  readonly disable_user_record_button: Locator;

  //Initialize Page Objects
  constructor(page: Page) {
    this.page = page;
    this.userProfilePageData = userProfilePageData;

    //Locators
    this.selected_bread_crumbs = this.page.getByTestId('title'); // update
    this.back_button = this.page.getByTestId('title'); // update
    this.page_heading = this.page.getByTestId('title'); // update

    this.title_label = this.page.getByTestId('Name').locator('label'); // update
    this.title_text = this.page.getByTestId('Name').locator('label'); // update
    this.title_change_link = this.page.getByTestId('Name').locator('label'); // update

    this.first_name_label = this.page.getByTestId('app-name'); // update#
    this.first_name_text = this.page.getByTestId('app-name'); // update
    this.first_name_change_link = this.page.getByTestId('Name').locator('label'); // update

    this.last_name_label = this.page.getByTestId('app-name'); // update#
    this.last_name_text = this.page.getByTestId('app-name'); // update
    this.last_name_change_link = this.page.getByTestId('Name').locator('label'); // update

    this.email_address_label = this.page.getByTestId('app-description'); // update
    this.email_address_text = this.page.getByTestId('app-description'); // update
    this.email_address_change_link = this.page.getByTestId('Name').locator('label'); // update

    this.telephone_label = this.page.getByTestId('app-description'); // update
    this.telephone_text = this.page.getByTestId('app-description'); // update
    this.telephone_change_link = this.page.getByTestId('Name').locator('label'); // update

    this.organisation_label = this.page.getByTestId('Name').locator('label'); // update
    this.organisation_text = this.page.getByTestId('Name').locator('label'); // update
    this.organisation_change_link = this.page.getByTestId('Name').locator('label'); // update

    this.job_title_label = this.page.getByTestId('Name').locator('label'); // update
    this.job_title_text = this.page.getByTestId('Name').locator('label'); // update
    this.job_title_change_link = this.page.getByTestId('Name').locator('label'); // update

    this.role_label = this.page.getByTestId('Name').locator('label'); // update
    this.role_text = this.page.getByTestId('Name').locator('label'); // update
    this.role_change_link = this.page.getByTestId('Name').locator('label'); // update

    this.audit_label = this.page.getByTestId('Name').locator('label'); // update
    this.audit_link = this.page.getByTestId('Name').locator('label'); // update

    this.last_updated_label = this.page.getByTestId('Name').locator('label'); // update
    this.last_updated_text = this.page.getByTestId('Name').locator('label'); // update

    this.disable_this_user_record_label = this.page.getByTestId('Name').locator('label'); // update
    this.disable_this_user_record_sub_label = this.page.getByTestId('Name').locator('label'); // update

    //update locator
    this.disable_user_record_button = this.page
      .locator('.gem-c-button')
      .and(this.page.getByText(this.buttonTextData.User_Profile_Page.Disable_User_Record, { exact: true }));
  }

  //Page Methods
  // async goto() {
  //   await this.page.goto('application/startnewapplication'); //update
  // }

  async assertOnUserProfilePage() {
    //update
    await expect(this.page_heading).toBeVisible();
    // await expect(this.page_heading).toMatch(new RegExp(userProfilePageData.User_Profile_Page.page_heading));
    await expect(this.title_label).toHaveText(this.userProfilePageData.User_Profile_Page.title_label);
    await expect(this.title_change_link).toHaveText(this.userProfilePageData.User_Profile_Page.title_change_link);
    await expect(this.first_name_label).toHaveText(this.userProfilePageData.User_Profile_Page.first_name_label);
    await expect(this.first_name_change_link).toHaveText(
      this.userProfilePageData.User_Profile_Page.first_name_change_link
    );
    await expect(this.last_name_label).toHaveText(this.userProfilePageData.User_Profile_Page.last_name_label);
    await expect(this.last_name_change_link).toHaveText(
      this.userProfilePageData.User_Profile_Page.last_name_change_link
    );
    await expect(this.email_address_label).toHaveText(this.userProfilePageData.User_Profile_Page.email_address_label);
    await expect(this.email_address_change_link).toHaveText(
      this.userProfilePageData.User_Profile_Page.email_address_change_link
    );
    await expect(this.telephone_label).toHaveText(this.userProfilePageData.User_Profile_Page.telephone_label);
    await expect(this.telephone_change_link).toHaveText(
      this.userProfilePageData.User_Profile_Page.telephone_change_link
    );
    await expect(this.organisation_label).toHaveText(this.userProfilePageData.User_Profile_Page.organisation_label);
    await expect(this.organisation_change_link).toHaveText(
      this.userProfilePageData.User_Profile_Page.organisation_change_link
    );
    await expect(this.job_title_label).toHaveText(this.userProfilePageData.User_Profile_Page.job_title_label);
    await expect(this.job_title_change_link).toHaveText(
      this.userProfilePageData.User_Profile_Page.job_title_change_link
    );
    await expect(this.role_label).toHaveText(this.userProfilePageData.User_Profile_Page.role_label);
    await expect(this.role_change_link).toHaveText(this.userProfilePageData.User_Profile_Page.role_change_link);
    await expect(this.audit_label).toHaveText(this.userProfilePageData.User_Profile_Page.audit_label);
    await expect(this.audit_link).toHaveText(this.userProfilePageData.User_Profile_Page.audit_link);
    await expect(this.last_updated_label).toHaveText(this.userProfilePageData.User_Profile_Page.last_updated_label);
    await expect(this.disable_this_user_record_label).toHaveText(
      this.userProfilePageData.User_Profile_Page.disable_this_user_record_label
    );
    await expect(this.disable_this_user_record_sub_label).toHaveText(
      this.userProfilePageData.User_Profile_Page.disable_this_user_record_sub_label
    );
  }
}
