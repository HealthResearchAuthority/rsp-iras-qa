import { expect, Locator, Page } from '@playwright/test';
import * as loginPageTestData from '../../resources/test_data/common/login_page_data.json';
import * as buttonTextData from '../../resources/test_data/common/button_text_data.json';
import { getDecryptedValue, resolveEnvExpression } from '../../utils/UtilFunctions';
import { generateToken } from '../../utils/GenerateMFA';

//Declare Page Objects
export default class LoginPage {
  readonly page: Page;
  readonly loginPageTestData: typeof loginPageTestData;
  readonly buttonTextData: typeof buttonTextData;
  readonly pageHeading: Locator;
  readonly btnSignIn: Locator;
  readonly usernameInput: Locator;
  readonly passwordInput: Locator;
  readonly mfaCodeInput: Locator;
  readonly btnContinue: Locator;

  //Initialize Page Objects
  constructor(page: Page) {
    this.page = page;
    this.loginPageTestData = loginPageTestData;
    this.buttonTextData = buttonTextData;

    //Locators
    this.pageHeading = this.page.getByRole('heading').getByText(this.loginPageTestData.Login_Page.header);
    this.btnSignIn = this.page.getByRole('button').getByText(this.buttonTextData.Login_Page.sign_in_button);
    this.usernameInput = page.getByTestId('email');
    this.passwordInput = page.getByTestId('password');
    this.mfaCodeInput = page.getByTestId('code');
    this.btnContinue = this.page.getByRole('button').getByText(this.buttonTextData.Login_Page.continue_button);
  }

  //Page Methods
  async assertOnLoginPage() {
    await expect.soft(this.pageHeading).toBeVisible();
  }

  //passwords & mfaKey to be set in AzureDevops Pipeline, add encrypted values to .env when running locally
  async loginWithUserCreds(dataset: string) {
    const username = this.loginPageTestData[dataset].username;
    let secretKey = '';
    let authTag = '';
    const userSecret = dataset + '_SECRET_KEY';
    const userAuth = dataset + '_AUTH_TAG';
    secretKey = process.env[userSecret];
    authTag = process.env[userAuth];
    const mfaKey = resolveEnvExpression(this.loginPageTestData[dataset].mfa);
    const password = getDecryptedValue(
      resolveEnvExpression(this.loginPageTestData[dataset].password),
      secretKey,
      authTag
    );
    await this.btnSignIn.click();
    await this.usernameInput.fill(username);
    await this.btnContinue.click();
    await this.passwordInput.fill(password);
    await this.btnContinue.click();
    const oneTimeMfaCode = generateToken(mfaKey);
    await this.mfaCodeInput.fill(oneTimeMfaCode);
    await this.btnContinue.click();
  }
}
