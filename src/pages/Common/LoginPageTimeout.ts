import { expect, Locator, Page } from '@playwright/test';
import * as loginPageTestData from '../../resources/test_data/common/login_page_data.json';
import { getDecryptedValue, resolveEnvExpression } from '../../utils/UtilFunctions';
import * as buttonTextData from '../../resources/test_data/common/button_text_data.json';
import * as homePageTestData from '../../resources/test_data/iras/home_page_data.json';

//Declare Page Objects
export default class LoginPageTimeout {
  sessionTimeoutLoginPage: Page;
  // readonly page: Page;
  readonly loginPageTestData: typeof loginPageTestData;
  readonly buttonTextData: typeof buttonTextData;
  readonly homePageTestData: typeof homePageTestData;
  readonly idgBanner: Locator;
  readonly usernameInput: Locator;
  readonly passwordInput: Locator;
  readonly btnNext: Locator;
  readonly btnContinue: Locator;
  readonly pageHeading: Locator;
  readonly projectGuidanceText: Locator;
  readonly loginBtn: Locator;
  readonly myWorkspacesHeading: Locator;

  //Initialize Page Objects
  constructor(sessionTimeoutLoginPage: Page) {
    this.sessionTimeoutLoginPage = sessionTimeoutLoginPage;
    this.loginPageTestData = loginPageTestData;
    this.homePageTestData = homePageTestData;
    this.buttonTextData = buttonTextData;

    //Locators
    this.idgBanner = sessionTimeoutLoginPage.locator('div[class="container-fluid"] h1');
    this.usernameInput = sessionTimeoutLoginPage.locator('input[id="usernameUserInput"]');
    this.passwordInput = sessionTimeoutLoginPage.locator('input[id="password"]');
    this.btnNext = sessionTimeoutLoginPage.locator('input[id="NEXT"]');
    this.btnContinue = sessionTimeoutLoginPage.locator('button[type="submit"]');
    this.loginBtn = sessionTimeoutLoginPage
      .locator('.gem-c-button')
      .and(sessionTimeoutLoginPage.getByText(this.buttonTextData.Home_Page.Login, { exact: true }));
    this.pageHeading = sessionTimeoutLoginPage.getByRole('heading').getByText(this.homePageTestData.Home_Page.heading);
    this.projectGuidanceText = sessionTimeoutLoginPage
      .getByRole('paragraph')
      .getByText(this.homePageTestData.Home_Page.guidance_text);
    this.myWorkspacesHeading = sessionTimeoutLoginPage
      .getByRole('heading')
      .getByText(this.homePageTestData.Home_Page.workspaceHeading);
  }

  //Page Methods
  async assertOnLoginPage() {
    const headerToValidate = this.loginPageTestData.Login_Page.header;
    const partialLinkToValidate = this.loginPageTestData.Login_Page.partial_link;
    await expect(this.idgBanner).toBeVisible();
    await expect(this.idgBanner).toHaveText(headerToValidate);
    expect(this.sessionTimeoutLoginPage.url()).toContain(partialLinkToValidate);
  }

  //passwords to be set in AzureDevops Pipeline, add encrypted values to .env when running locally
  async loginWithUserCreds(dataset: string) {
    const username = this.loginPageTestData[dataset].username;
    let secretKey: any;
    let authTag: any;
    if (dataset === 'System_Admin') {
      secretKey = process.env.SYSTEM_ADMIN_SECRET_KEY;
      authTag = process.env.SYSTEM_ADMIN_AUTH_TAG;
    } else if (dataset === 'Frontstage_User') {
      secretKey = process.env.FRONTSTAGE_USER_SECRET_KEY;
      authTag = process.env.FRONTSTAGE_USER_AUTH_TAG;
    } else if (dataset === 'Backstage_User') {
      secretKey = process.env.BACKSTAGE_USER_SECRET_KEY;
      authTag = process.env.BACKSTAGE_USER_AUTH_TAG;
    } else if (dataset === 'Admin_User') {
      secretKey = process.env.ADMIN_USER_SECRET_KEY;
      authTag = process.env.ADMIN_USER_AUTH_TAG;
    } else if (dataset === 'Non_Admin_User') {
      secretKey = process.env.NON_ADMIN_USER_SECRET_KEY;
      authTag = process.env.NON_ADMIN_USER_AUTH_TAG;
    }
    const password = getDecryptedValue(
      resolveEnvExpression(this.loginPageTestData[dataset].password),
      secretKey,
      authTag
    );
    await this.usernameInput.fill(username);
    await this.btnNext.click();
    await this.passwordInput.fill(password);
    await this.btnContinue.click();
  }

  async assertOnHomePage() {
    await expect(this.pageHeading).toBeVisible();
    await expect(this.myWorkspacesHeading).toBeVisible();
    await expect(this.projectGuidanceText).toBeVisible();
  }
}
