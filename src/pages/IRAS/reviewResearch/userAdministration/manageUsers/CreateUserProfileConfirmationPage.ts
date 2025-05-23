import { expect, Locator, Page } from '@playwright/test';
import * as createUserProfileConfirmationPageTestData from '../../../../../resources/test_data/iras/reviewResearch/userAdministration/manageUsers/create_user_profile_confirmation_page_data.json';

//Declare Page Objects
export default class CreateUserProfileConfirmationPage {
  readonly page: Page;
  readonly createUserProfileConfirmationPageTestData: typeof createUserProfileConfirmationPageTestData;
  readonly confirmation_message: Locator;
  readonly consentVal: Locator;
  readonly add_another_user_link: Locator;
  readonly back_to_manage_user_link: Locator;

  //Initialize Page Objects
  constructor(page: Page) {
    this.page = page;
    this.createUserProfileConfirmationPageTestData = createUserProfileConfirmationPageTestData;

    //Locators
    this.confirmation_message = this.page
      .getByRole('heading')
      .getByText(
        this.createUserProfileConfirmationPageTestData.Create_User_Profile_Confirmation_Page.confirmation_message
      );
    this.consentVal = this.page.locator('[class$="confirmation"]').locator('..').locator('p').first();
    this.add_another_user_link = this.page
      .getByRole('link')
      .getByText(
        this.createUserProfileConfirmationPageTestData.Create_User_Profile_Confirmation_Page.add_another_user_link
      );
    this.back_to_manage_user_link = this.page
      .getByRole('link')
      .getByText(
        this.createUserProfileConfirmationPageTestData.Create_User_Profile_Confirmation_Page.back_to_manage_user_link
      );
  }

  async assertOnCreateUserProfileConfirmationPage() {
    await expect(this.confirmation_message).toBeVisible();
    await expect(this.add_another_user_link).toBeVisible();
    await expect(this.back_to_manage_user_link).toBeVisible();
  }
}
