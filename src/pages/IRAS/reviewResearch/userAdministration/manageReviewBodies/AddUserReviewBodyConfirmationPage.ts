import { expect, Locator, Page } from '@playwright/test';
import * as addUserReviewBodyConfirmationPageTestData from '../../../../../resources/test_data/iras/reviewResearch/userAdministration/manageReviewBodies/add_user_review_body_confirmation_page_data.json';

//Declare Page Objects
export default class AddUserReviewBodyConfirmationPage {
  readonly page: Page;
  readonly addUserReviewBodyConfirmationPageTestData: typeof addUserReviewBodyConfirmationPageTestData;
  readonly page_heading: Locator;
  readonly page_guidance_text: Locator;

  //Initialize Page Objects
  constructor(page: Page) {
    this.page = page;
    this.addUserReviewBodyConfirmationPageTestData = addUserReviewBodyConfirmationPageTestData;

    //Locators
    this.page_heading = this.page
      .getByRole('heading')
      .getByText(this.addUserReviewBodyConfirmationPageTestData.Add_User_Review_Body_Confirmation_Page.page_heading);
    this.page_guidance_text = this.page.getByRole('paragraph').first();
  }

  async assertOnAddUserReviewBodyConfirmationPage() {
    await expect(this.page_heading).toBeVisible();
    await expect(this.page_guidance_text).toBeVisible();
  }
}
