import { expect, Locator, Page } from '@playwright/test';
import * as loginPageTestData from '../../resources/test_data/common/login_page_data.json';
import * as buttonTextData from '../../resources/test_data/common/button_text_data.json';
import { getDecryptedValue, resolveEnvExpression } from '../../utils/UtilFunctions';
import { generateToken } from '../../utils/GenerateMFA';
import * as dbConfigData from '../../resources/test_data/common/database/db_config_data.json';
import { connect } from '../../utils/DbConfig';

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
    const userSecret = dataset + '_SECRET_KEY';
    const userAuth = dataset + '_AUTH_TAG';
    const secretKey = process.env[userSecret];
    const authTag = process.env[userAuth];
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

  // SQL STATEMENTS //

  async sqlResetAllUserRoles(username: string, role: string): Promise<void> {
    const sqlConnection = await connect(dbConfigData.Identity_Service);
    const userQueryResult = await sqlConnection.query(`SELECT Id FROM Users WHERE UserName = '${username}'`);
    const roleQueryResult = await sqlConnection.query(`SELECT Id FROM Roles WHERE Name = '${role}'`);
    const userId = userQueryResult.recordset[0].Id;
    const roleId = roleQueryResult.recordset[0].Id;

    // Add expected user role if not present
    const userExpectedRoleQueryResult = await sqlConnection.query(
      `SELECT * FROM UserRoles WHERE UserId = '${userId}' AND RoleId = '${roleId}'`
    );
    if (userExpectedRoleQueryResult.rowsAffected[0] < 1) {
      await sqlConnection.query(`INSERT INTO UserRoles (UserId, RoleId) VALUES ('${userId}', '${roleId}')`);
    }

    // Remove any unexpected user roles
    const allUsersRolesQueryResult = await sqlConnection.query(`SELECT * FROM UserRoles WHERE UserId = '${userId}'`);
    if (allUsersRolesQueryResult.rowsAffected[0] > 1) {
      for (const record of allUsersRolesQueryResult.recordset) {
        if (record.RoleId != roleId) {
          await sqlConnection.query(`DELETE FROM UserRoles WHERE UserId = '${userId}' AND RoleId = '${record.RoleId}'`);
        }
      }
    }
    await sqlConnection.close();
  }
}
