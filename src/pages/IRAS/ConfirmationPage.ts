import { expect, Locator, Page } from '@playwright/test';
import * as confirmationPageTestData from '../../resources/test_data/iras/confirmation_page_data.json';

//Declare Page Objects
export default class ConfirmationPage {
  readonly page: Page;
  readonly confirmationPageTestData: typeof confirmationPageTestData;
  readonly confirmation_header_label: Locator;
  readonly confirmation_body_label: Locator;

  //Initialize Page Objects
  constructor(page: Page) {
    this.page = page;
    this.confirmationPageTestData = confirmationPageTestData;

    //Locators
    this.confirmation_header_label = this.page
      .getByRole('heading', {
        name: confirmationPageTestData.add_remove_user_review_Body_confirmation_success_header_label,
      })
      .or(this.page.getByRole('heading', { name: confirmationPageTestData.enable_disable_confirmation_header_label }))
      .or(this.page.getByRole('heading', { name: confirmationPageTestData.disable_success_confirmation_header_label }))
      .or(this.page.getByRole('heading', { name: confirmationPageTestData.enable_success_confirmation_header_label }));
    this.confirmation_body_label = this.page.getByRole('paragraph').first();
  }

  async assertOnConfirmationPage() {
    await expect(this.confirmation_header_label).toBeVisible();
    await expect(this.confirmation_body_label).toBeVisible();
  }
}
