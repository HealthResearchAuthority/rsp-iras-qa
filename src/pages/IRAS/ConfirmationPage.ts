import { Locator, Page } from '@playwright/test';
import * as confirmationPageTestData from '../../resources/test_data/iras/confirmation_page_data.json';

//Declare Page Objects
export default class ConfirmationPage {
  readonly page: Page;
  readonly confirmationPageTestData: typeof confirmationPageTestData;
  readonly confirmation_header_label: Locator;
  readonly confirmation_body_label: Locator;
  readonly confirmation_hint_label: Locator;
  readonly disable_confirmation_success_header_label: Locator;
  readonly disable_confirmation_success_body_label: Locator;
  readonly enable_confirmation_success_header_label: Locator;
  readonly enable_confirmation_success_body_label: Locator;

  //Initialize Page Objects
  constructor(page: Page) {
    this.page = page;
    this.confirmationPageTestData = confirmationPageTestData;

    //Locators

    this.confirmation_header_label = this.page.locator('[class$="govuk-heading-l"]');
    this.confirmation_body_label = this.page.locator('[class$="govuk-body"]');
    this.confirmation_hint_label = this.page.locator('[class$="govuk-hint"]');
    this.disable_confirmation_success_header_label = this.enable_confirmation_success_header_label = this.page.locator(
      'h1[class="govuk-panel__title"]'
    );
    this.disable_confirmation_success_body_label = this.enable_confirmation_success_body_label = this.page
      .locator('p[class="govuk-body"]')
      .first();
  }
}
