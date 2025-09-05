import { expect, Locator, Page } from '@playwright/test';
import * as loginPageTestData from '../../resources/test_data/common/login_page_data.json';
import * as buttonTextData from '../../resources/test_data/common/button_text_data.json';
import { confirmStringNotNull, getDecryptedValue, resolveEnvExpression } from '../../utils/UtilFunctions';
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
    await expect(this.pageHeading).toBeVisible();
  }

  //passwords & mfaKey to be set in AzureDevops Pipeline, add encrypted values to .env when running locally
  async loginWithUserCreds(dataset: string) {
    const username = this.loginPageTestData[dataset].username;
    let secretKey: string;
    let authTag: string;
    let mfaKey: string;
    if (dataset === 'System_Admin') {
      secretKey = process.env.SYSTEM_ADMIN_SECRET_KEY;
      authTag = process.env.SYSTEM_ADMIN_AUTH_TAG;
      mfaKey = confirmStringNotNull(process.env.SYSTEM_ADMIN_MFA_KEY);
    } else if (dataset === 'Applicant_User') {
      secretKey = process.env.APPLICANT_USER_SECRET_KEY;
      authTag = process.env.APPLICANT_USER_AUTH_TAG;
      mfaKey = confirmStringNotNull(process.env.APPLICANT_USER_MFA_KEY);
    } else if (dataset === 'Studywide_Reviewer') {
      secretKey = process.env.STUDYWIDE_REVIEWER_SECRET_KEY;
      authTag = process.env.STUDYWIDE_REVIEWER_AUTH_TAG;
      mfaKey = confirmStringNotNull(process.env.STUDYWIDE_REVIEWER_MFA_KEY);
    } else if (dataset === 'Team_Manager') {
      secretKey = process.env.TEAM_MANAGER_SECRET_KEY;
      authTag = process.env.TEAM_MANAGER_AUTH_TAG;
      mfaKey = confirmStringNotNull(process.env.TEAM_MANAGER_MFA_KEY);
    } else if (dataset === 'Workflow_Coordinator') {
      secretKey = process.env.WORKFLOW_COORDINATOR_SECRET_KEY;
      authTag = process.env.WORKFLOW_COORDINATOR_AUTH_TAG;
      mfaKey = confirmStringNotNull(process.env.WORKFLOW_COORDINATOR_MFA_KEY);
    } else {
      throw new Error(`${dataset} is not a valid option`);
    }
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
