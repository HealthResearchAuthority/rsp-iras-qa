import { expect, Locator, Page } from '@playwright/test';
import * as checkCreateUserProfilePageData from '../../../../../resources/test_data/iras/reviewResearch/userAdministration/manageUsers/pages/check_create_user_profile_page_data.json';
import * as buttonTextData from '../../../../../resources/test_data/common/button_text_data.json';

//Declare Page Objects
export default class CheckCreateUserProfilePage {
  readonly page: Page;
  readonly checkCreateUserProfilePageData: typeof checkCreateUserProfilePageData;
  readonly buttonTextData: typeof buttonTextData;
  // readonly selectedBreadCrumbs: Locator;
  readonly backButton: Locator;
  readonly page_heading: Locator;
  readonly subHeading: Locator;
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
  readonly role_dropdown: Locator;
  readonly role_change_link: Locator;
  readonly committee_label: Locator;
  readonly committee_dropdown: Locator;
  readonly committee_change_link: Locator;
  readonly country_label: Locator;
  readonly country_checkbox: Locator;
  readonly country_change_link: Locator;
  readonly access_required_label: Locator;
  readonly access_required_checkbox: Locator;
  readonly access_required_change_link: Locator;
  readonly review_body_label: Locator;
  readonly review_body_dropdown: Locator;
  readonly review_body_change_link: Locator;
  readonly create_profile_button: Locator;

  //Initialize Page Objects
  constructor(page: Page) {
    this.page = page;
    this.checkCreateUserProfilePageData = checkCreateUserProfilePageData;

    //Locators
    // this.selectedBreadCrumbs = this.page.getByTestId('title'); // update
    // this.backButton = this.page.getByTestId('title'); // update
    this.page_heading = this.page.locator('.govuk-heading-l');
    this.subHeading = this.page.locator('.govuk-heading-l').locator('..').locator('p');
    this.title_label = this.page.locator('(//tr[@class="govuk-table__row"])[1]/td/b');
    this.title_text = this.page.locator('(//tr[@class="govuk-table__row"])[1]/td[2]');
    this.title_change_link = this.page.locator('(//tr[@class="govuk-table__row"])[1]/td[3]/button');
    this.first_name_label = this.page.locator('(//tr[@class="govuk-table__row"])[2]/td/b');
    this.first_name_text = this.page.locator('(//tr[@class="govuk-table__row"])[2]/td[2]');
    this.first_name_change_link = this.page.locator('(//tr[@class="govuk-table__row"])[2]/td[3]/button');
    this.last_name_label = this.page.locator('[class="govuk-label"][for="LastName"] b');
    this.last_name_text = this.page.locator('(//tr[@class="govuk-table__row"])[3]/td[2]');
    this.email_address_label = this.page.locator('[class="govuk-label"][for="Email"] b');
    this.email_address_text = this.page.locator('//input[@name="Email"]/..');
    this.telephone_label = this.page.locator('[class="govuk-label"][for="Telephone"] b');
    this.telephone_text = this.page.locator('//input[@name="Telephone"]/..');
    this.organisation_label = this.page.locator('[class="govuk-label"][for="Organisation"] b');
    this.organisation_text = this.page.locator('//input[@name="Organisation"]/..');
    this.job_title_label = this.page.locator('[class="govuk-label"][for="JobTitle"] b');
    this.job_title_text = this.page.locator('//input[@name="JobTitle"]/..');
    this.role_label = this.page.locator('[class="govuk-label"][for="Role"] b');
    this.role_dropdown = this.page.locator('//input[@name="Role"]/..');
    this.committee_label = this.page.locator('[class="govuk-label"][for="Committee"] b');
    this.committee_dropdown = this.page.getByTestId('Committee'); //update
    this.country_label = this.page.locator('[class="govuk-label"][for="Country"] b');
    this.country_checkbox = this.page.locator('//input[starts-with(@name,"Country")]/..');
    this.access_required_label = this.page.locator('[class="govuk-label"][for="AccessRequired"] b');
    this.access_required_checkbox = this.page.locator('//input[starts-with(@name,"AccessRequired")]/..');
    this.review_body_label = this.page.locator('[class="govuk-label"][for="ReviewBody"] b');
    this.review_body_dropdown = this.page.getByTestId('ReviewBody');
    this.create_profile_button = this.page.locator('button[class="govuk-button"]');
  }

  async assertOnCheckCreateUserProfilePage() {
    await expect(this.page_heading).toBeVisible();
    await expect(this.page_heading).toHaveText(
      this.checkCreateUserProfilePageData.Check_Create_User_Profile_Page_Role_Operations.page_heading
    );
    await expect(this.subHeading).toBeVisible();
    await expect(this.subHeading).toHaveText(
      this.checkCreateUserProfilePageData.Check_Create_User_Profile_Page_Role_Operations.sub_heading
    );
  }
}
