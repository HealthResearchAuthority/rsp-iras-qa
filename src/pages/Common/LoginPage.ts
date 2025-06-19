import { expect, Locator, Page } from '@playwright/test';
import * as loginPageTestData from '../../resources/test_data/common/login_page_data.json';
import { getDecryptedValue, resolveEnvExpression } from '../../utils/UtilFunctions';

//Declare Page Objects
export default class LoginPage {
  readonly page: Page;
  readonly loginPageTestData: typeof loginPageTestData;
  readonly idgBanner: Locator;
  readonly usernameInput: Locator;
  readonly passwordInput: Locator;
  readonly btnNext: Locator;
  readonly btnContinue: Locator;

  //Initialize Page Objects
  constructor(page: Page) {
    this.page = page;
    this.loginPageTestData = loginPageTestData;

    //Locators
    this.idgBanner = page.locator('div[class="container-fluid"] h1');
    this.usernameInput = page.locator('input[id="usernameUserInput"]');
    this.passwordInput = page.locator('input[id="password"]');
    this.btnNext = page.locator('input[id="NEXT"]');
    this.btnContinue = page.locator('button[type="submit"]');
  }

  //Page Methods
  async assertOnLoginPage() {
    const headerToValidate = this.loginPageTestData.Login_Page.header;
    const partialLinkToValidate = this.loginPageTestData.Login_Page.partial_link;
    await expect(this.idgBanner).toBeVisible();
    await expect(this.idgBanner).toHaveText(headerToValidate);
    expect(this.page.url()).toContain(partialLinkToValidate);
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
}
