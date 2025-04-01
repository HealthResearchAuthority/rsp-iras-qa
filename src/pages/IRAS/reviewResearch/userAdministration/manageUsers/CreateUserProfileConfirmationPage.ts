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

    this.confirmation_message = this.page.locator('.govuk-panel__title');
    this.consentVal = this.page.locator('//*[contains(@class,"govuk-panel--confirmation")]/../p[1]');
    this.add_another_user_link = this.page.locator('a[href="/admin/users/createuser"]');
    this.back_to_manage_user_link = this.page.locator('(//a[@href="/admin/users"])[2]');
  }

  async assertOnCreateUserProfileConfirmationPage() {
    await expect(this.confirmation_message).toBeVisible();
    await expect(this.confirmation_message).toHaveText(
      this.createUserProfileConfirmationPageTestData.Create_User_Profile_Confirmation_Page.confirmation_message
    );
    await expect(this.add_another_user_link).toHaveText(
      this.createUserProfileConfirmationPageTestData.Create_User_Profile_Confirmation_Page.add_another_user_link
    );
    //Back to Manage Users or Back to Manage users >> check figma and app
    // await expect(this.back_to_manage_user_link).toHaveText(
    //   this.createUserProfileConfirmationPageTestData.Create_User_Profile_Confirmation_Page.back_to_manage_user_link
    // );
  }
}
