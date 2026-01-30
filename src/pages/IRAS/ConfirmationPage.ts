import { expect, Locator, Page } from '@playwright/test';
import * as confirmationPageTestData from '../../resources/test_data/iras/confirmation_page_data.json';

//Declare Page Objects
export default class ConfirmationPage {
  readonly page: Page;
  readonly confirmationPageTestData: typeof confirmationPageTestData;
  readonly confirmation_header_label: Locator;
  readonly confirmation_header_common_label: Locator;
  readonly success_message_header_label: Locator;
  readonly success_message_body_text: Locator;
  readonly confirmation_body_label: Locator;
  readonly what_happens_next_label: Locator;
  readonly mainPageContent: Locator;

  //Initialize Page Objects
  constructor(page: Page) {
    this.page = page;
    this.confirmationPageTestData = confirmationPageTestData;

    //Locators
    this.mainPageContent = this.page.locator('#main-content');
    this.confirmation_header_common_label = this.page
      .getByRole('heading', { level: 2 })
      .or(this.page.getByRole('heading', { level: 1 }));
    this.confirmation_header_label = this.mainPageContent
      .getByRole('heading', {
        name: confirmationPageTestData.add_remove_user_review_Body_confirmation_success_header_label,
      })
      .or(this.page.getByRole('heading', { name: confirmationPageTestData.enable_disable_confirmation_header_label }))
      .or(this.page.getByRole('heading', { name: confirmationPageTestData.disable_success_confirmation_header_label }))
      .or(this.page.getByRole('heading', { name: confirmationPageTestData.enable_success_confirmation_header_label }))
      .or(
        this.page.getByRole('heading', {
          name: confirmationPageTestData.Modification_Sent_To_Sponsor_Labels.page_heading,
        })
      )
      .or(
        this.page.getByRole('heading', {
          name: confirmationPageTestData.Remove_User_From_Review_Body_Labels
            .remove_user_confirmation_success_header_label,
        })
      );
    this.success_message_header_label = this.mainPageContent.getByRole('heading', {
      name: confirmationPageTestData.Project_Record_Created_Labels.page_heading,
    });
    this.success_message_body_text = this.mainPageContent.locator('.govuk-panel__body');
    this.confirmation_body_label = this.mainPageContent.locator('.govuk-grid-column-two-thirds p');
    this.what_happens_next_label = this.page.getByRole('heading', {
      name: confirmationPageTestData.Modification_Sent_To_Sponsor_Labels.what_happens_next_label,
    });
  }

  async assertOnConfirmationPage() {
    await expect.soft(this.confirmation_header_label).toBeVisible();
    await expect.soft(this.confirmation_body_label).toBeVisible();
  }
}
