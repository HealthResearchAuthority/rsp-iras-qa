import { expect, Locator, Page } from '@playwright/test';
import * as createUserProfilePageData from '../../../../../resources/test_data/iras/reviewResearch/userAdministration/manageUsers/pages/create_user_profile_page_data.json';
import * as buttonTextData from '../../../../../resources/test_data/common/button_text_data.json';

//Declare Page Objects
export default class CreateUserProfilePage {
  readonly page: Page;
  readonly createUserProfilePageData: typeof createUserProfilePageData;
  readonly buttonTextData: typeof buttonTextData;
  readonly pageHeading: Locator;
  readonly organisationNameLbl: Locator;
  readonly countryLbl: Locator;
  readonly countryOption1Lbl: Locator;
  readonly countryOption2Lbl: Locator;
  readonly countryOption3Lbl: Locator;
  readonly countryOption4Lbl: Locator;
  readonly emailAddressLbl: Locator;
  readonly descriptionLbl: Locator;
  readonly completeBtn: Locator;

  //Initialize Page Objects
  constructor(page: Page) {
    this.page = page;
    this.createUserProfilePageData = createUserProfilePageData;

    //Locators
    this.pageHeading = this.page.getByTestId('title'); // update
    this.organisationNameLbl = this.page.getByTestId('Name').locator('label'); // update
    this.countryLbl = this.page.getByTestId('app-name'); // update
    this.countryOption1Lbl = this.page.getByTestId('Description').locator('label'); // update
    this.countryOption2Lbl = this.page.getByTestId('app-description'); // update
    this.countryOption3Lbl = this.page.getByTestId('app-description'); // update
    this.countryOption4Lbl = this.page.getByTestId('app-description'); // update
    this.emailAddressLbl = this.page.getByTestId('app-description'); // update
    this.descriptionLbl = this.page.getByTestId('app-description'); // update
    this.descriptionLbl = this.page.getByTestId('app-description'); // update
    this.completeBtn = this.page
      .locator('.gem-c-button')
      .and(this.page.getByText(this.buttonTextData.Create_User_Profile_Page.Complete, { exact: true }));
  }

  //Page Methods
  async goto() {
    await this.page.goto('application/startnewapplication'); //update
  }

  async assertOnCreateUserProfilePage() {
    await expect(this.pageHeading).toBeVisible();
    await expect(this.pageHeading).toHaveText(this.createUserProfilePageData.Create_User_Profile_Page.heading);
    await expect(this.organisationNameLbl).toHaveText(
      this.createUserProfilePageData.Create_User_Profile_Page.organisation_name_label
    );
    await expect(this.countryLbl).toHaveText(this.createUserProfilePageData.Create_User_Profile_Page.country_label);
    await expect(this.countryOption1Lbl).toHaveText(
      this.createUserProfilePageData.Create_User_Profile_Page.country_option1_label
    );
    await expect(this.countryOption2Lbl).toHaveText(
      this.createUserProfilePageData.Create_User_Profile_Page.country_option2_label
    );
    await expect(this.countryOption3Lbl).toHaveText(
      this.createUserProfilePageData.Create_User_Profile_Page.country_option3_label
    );
    await expect(this.countryOption4Lbl).toHaveText(
      this.createUserProfilePageData.Create_User_Profile_Page.country_option4_label
    );
    await expect(this.emailAddressLbl).toHaveText(
      this.createUserProfilePageData.Create_User_Profile_Page.email_address_label
    );
    await expect(this.descriptionLbl).toHaveText(
      this.createUserProfilePageData.Create_User_Profile_Page.description_label
    );
  }
}
