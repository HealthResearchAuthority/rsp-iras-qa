import { expect, Locator, Page } from '@playwright/test';
import * as createUserProfileConfirmationPageData from '../../../../../resources/test_data/iras/reviewResearch/userAdministration/manageUsers/pages/create_user_profile_confirmation_page_data.json';
import * as buttonTextData from '../../../../../resources/test_data/common/button_text_data.json';

//Declare Page Objects
export default class CreateUserProfileConfirmationPage {
  readonly page: Page;
  readonly createUserProfileConfirmationPageData: typeof createUserProfileConfirmationPageData;
  readonly buttonTextData: typeof buttonTextData;
  readonly selectedBreadCrumbs: Locator;
  readonly confirmationMessageContent: Locator;
  readonly consentVal: Locator;
  readonly addAnotherReviewBodyLink: Locator;
  readonly backToManageReviewBodiesLink: Locator;

  //Initialize Page Objects
  constructor(page: Page) {
    this.page = page;
    this.createUserProfileConfirmationPageData = createUserProfileConfirmationPageData;

    //Locators
    this.selectedBreadCrumbs = this.page.getByTestId('title'); // update
    this.confirmationMessageContent = this.page.getByTestId('Name').locator('label'); // update
    this.consentVal = this.page.getByTestId('app-name'); // update
    this.addAnotherReviewBodyLink = this.page.getByTestId('Name').locator('label'); // update
    this.backToManageReviewBodiesLink = this.page.getByTestId('Name').locator('label'); // update
  }

  //Page Methods
  async goto() {
    await this.page.goto('application/startnewapplication'); //update
  }

  async assertOnCreateUserProfileConfirmationPage() {
    //update
    await expect(this.confirmationMessageContent).toBeVisible();
    await expect(this.confirmationMessageContent).toHaveText(
      this.createUserProfileConfirmationPageData.Create_Review_Body_Confirmation_Page.confirmation_message
    );
    await expect(this.addAnotherReviewBodyLink).toHaveText(
      this.createUserProfileConfirmationPageData.Create_Review_Body_Confirmation_Page.add_another_review_body_link
    );
    await expect(this.backToManageReviewBodiesLink).toHaveText(
      this.createUserProfileConfirmationPageData.Create_Review_Body_Confirmation_Page.back_to_manage_review_bodies_link
    );
  }
}
