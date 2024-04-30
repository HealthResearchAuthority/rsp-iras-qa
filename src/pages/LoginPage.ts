import { expect, Locator, Page } from '@playwright/test';
import * as loginPageTestData from "../test_data/common/login_page.json";
import { DataTable } from '@cucumber/cucumber';

let loginPageTestDataMap = new Map(Object.entries(loginPageTestData));

//Declare Page Objects
export default class LoginPage {
  readonly page: Page;
  readonly idgBanner: Locator;
  readonly usernameInput: Locator;
  readonly passwordInput: Locator;
  readonly btnNext: Locator;
  readonly btnContinue: Locator;

  //Initialize Page Objects
  constructor(page: Page) {
    this.page = page;

    //Locators
    this.idgBanner = page.locator('div[class="container-fluid"] h1');
    this.usernameInput = page.locator('input[id="usernameUserInput"]');
    this.passwordInput = page.locator('input[id="password"]');
    this.btnNext = page.locator('input[id="NEXT"]');
    this.btnContinue = page.locator('button[type="submit"]');
  }

  //Page Methods
  async assertOnLoginPage(pageMapValue) {
    let headerToValidate = (<any>loginPageTestDataMap).get(pageMapValue)?.header;
    let partialLinkToValidate = (<any>loginPageTestDataMap).get(pageMapValue)?.partial_link;
    await expect(this.idgBanner).toBeVisible();
    await expect(this.idgBanner).toHaveText(headerToValidate);
    expect(this.page.url()).toContain(partialLinkToValidate);
  }

  //passwords to be set in AzureDevops Pipeline, hardcode when running locally
  async loginWithUserCreds(dataset) {
    let username = (<any>loginPageTestDataMap).get(dataset)?.username;
    let password = eval((<any>loginPageTestDataMap).get(dataset)?.password);
    await this.usernameInput.fill(username);
    await this.btnNext.click();
    await this.passwordInput.fill(password);
    await this.btnContinue.click();
  }
}