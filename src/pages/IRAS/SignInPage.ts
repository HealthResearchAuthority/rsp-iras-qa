import { expect, Locator, Page } from '@playwright/test';
import * as signInPageTestData from '../../resources/test_data/iras/sigin_in_page_data.json';
import * as buttonTextData from '../../resources/test_data/common/button_text_data.json';

//Declare Page Objects
export default class SignInPage {
  readonly page: Page;
  readonly signInPageTestData: typeof signInPageTestData;
  readonly buttonTextData: typeof buttonTextData;
  readonly mainPageContent: Locator;
  readonly pageHeading: Locator;
  readonly whoCanUseHeading: Locator;
  readonly getStartedSubHeading: Locator;
  readonly signInHeading: Locator;
  readonly serviceHelpHeading: Locator;
  readonly loginBtn: Locator;

  //Initialize Page Objects
  constructor(page: Page) {
    this.page = page;
    this.signInPageTestData = signInPageTestData;
    this.buttonTextData = buttonTextData;

    //Locators
    this.mainPageContent = this.page.getByTestId('main-content');
    this.pageHeading = this.page.getByRole('heading').getByText(this.signInPageTestData.Sign_In_Page.heading);
    this.whoCanUseHeading = this.page
      .getByRole('heading')
      .getByText(this.signInPageTestData.Sign_In_Page.who_can_use_heading);
    this.getStartedSubHeading = this.page
      .getByRole('paragraph', {})
      .getByText(this.signInPageTestData.Sign_In_Page.get_started_sub_heading);
    this.signInHeading = this.page.getByRole('heading').getByText(this.signInPageTestData.Sign_In_Page.sign_in_heading);
    this.serviceHelpHeading = this.page
      .getByRole('heading')
      .getByText(this.signInPageTestData.Sign_In_Page.service_help_heading);
    this.loginBtn = this.page
      .locator('.gem-c-button')
      .and(this.page.getByText(this.buttonTextData.Sign_In_Page.Login, { exact: true }));
  }

  //Page Methods

  async assertOnSignInPage() {
    // await expect(this.pageHeading).toBeVisible();
    // await expect(this.whoCanUseHeading).toBeVisible();
    // await expect(this.getStartedSubHeading).toBeVisible();
    // await expect(this.signInHeading).toBeVisible();
    // await expect(this.serviceHelpHeading).toBeVisible();
    await expect(this.page).toHaveTitle(this.signInPageTestData.Sign_In_Page.title);
  }
}
