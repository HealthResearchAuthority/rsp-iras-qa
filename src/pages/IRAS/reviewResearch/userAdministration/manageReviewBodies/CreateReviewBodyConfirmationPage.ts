import { expect, Locator, Page } from '@playwright/test';
import * as createReviewBodyConfirmationPageData from '../../../../../resources/test_data/iras/reviewResearch/userAdministration/manageReviewBodies/create_review_body_confirmation_page_data.json';
import * as buttonTextData from '../../../../../resources/test_data/common/button_text_data.json';

//Declare Page Objects
export default class CreateReviewBodyConfirmationPage {
  readonly page: Page;
  readonly createReviewBodyConfirmationPageData: typeof createReviewBodyConfirmationPageData;
  readonly buttonTextData: typeof buttonTextData;
  readonly selectedBreadCrumbs: Locator;
  readonly confirmation_panel_heading: Locator;
  readonly confirmation_email_note: Locator;
  readonly add_another_review_body_link: Locator;
  readonly back_manage_review_bodies_link: Locator;

  //Initialize Page Objects
  constructor(page: Page) {
    this.page = page;
    this.createReviewBodyConfirmationPageData = createReviewBodyConfirmationPageData;

    //Locators
    this.selectedBreadCrumbs = this.page.getByTestId('title'); // update
    this.confirmation_panel_heading = this.page
      .getByRole('heading')
      .getByText(this.createReviewBodyConfirmationPageData.Create_Review_Body_Confirmation_Page.confirmation_message, {
        exact: true,
      });
    this.confirmation_email_note = this.page.getByRole('paragraph');
    this.add_another_review_body_link = this.page
      .getByRole('link')
      .getByText(
        this.createReviewBodyConfirmationPageData.Create_Review_Body_Confirmation_Page.add_another_review_body_link
      );
    this.back_manage_review_bodies_link = this.page
      .getByRole('link')
      .getByText(
        this.createReviewBodyConfirmationPageData.Create_Review_Body_Confirmation_Page.back_manage_review_bodies_link
      );
  }

  //Page Methods
  async goto() {
    await this.page.goto('reviewbody/submit');
  }

  async assertOnCreateReviewbodyConfirmationPage() {
    await expect(this.confirmation_panel_heading).toBeVisible();
    await expect(this.add_another_review_body_link).toBeVisible();
    await expect(this.back_manage_review_bodies_link).toBeVisible();
  }
}
