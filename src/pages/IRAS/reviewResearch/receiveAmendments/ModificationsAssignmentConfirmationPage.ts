import { expect, Locator, Page } from '@playwright/test';
import * as modificationsAssignmentConfirmationPageTestData from '../../../../resources/test_data/iras/reviewResearch/receiveAmendments/modifications_assignment_confirmation_page_data.json';

//Declare Page Objects
export default class ModificationsAssignmentConfirmationPage {
  readonly page: Page;
  readonly modificationsAssignmentConfirmationPageTestData: typeof modificationsAssignmentConfirmationPageTestData;
  readonly confirmation_message: Locator;
  readonly consentVal: Locator;
  readonly back_to_task_list_link: Locator;
  readonly back_to_dashboard_link: Locator;

  //Initialize Page Objects
  constructor(page: Page) {
    this.page = page;
    this.modificationsAssignmentConfirmationPageTestData = modificationsAssignmentConfirmationPageTestData;

    //Locators
    this.confirmation_message = this.page
      .getByRole('heading')
      .getByText(
        this.modificationsAssignmentConfirmationPageTestData.Modifications_Assignment_Confirmation_Page
          .confirmation_message
      );
    this.consentVal = this.page.locator('[class$="confirmation"]').locator('..').locator('p').first();

    this.back_to_task_list_link = this.page
      .getByRole('link')
      .getByText(
        this.modificationsAssignmentConfirmationPageTestData.Modifications_Assignment_Confirmation_Page
          .back_to_task_list_link
      );
    this.back_to_dashboard_link = this.page
      .getByRole('link')
      .getByText(
        this.modificationsAssignmentConfirmationPageTestData.Modifications_Assignment_Confirmation_Page
          .back_to_dashboard_link
      );
  }

  async assertOnModificationsAssignmentConfirmationPage(roleValue: string) {
    await expect(this.confirmation_message).toBeVisible();
    if (roleValue === 'Team_Manager') {
      await expect.soft(this.back_to_dashboard_link).toBeVisible();
    } else {
      await expect.soft(this.back_to_task_list_link).toBeVisible();
    }
  }
}
