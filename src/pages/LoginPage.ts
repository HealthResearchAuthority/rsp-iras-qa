import { expect, Locator, Page } from '@playwright/test';

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
  async assertOnLoginPage() {
    await expect(this.idgBanner).toBeVisible();
    await expect(this.idgBanner).toHaveText('This is the TEST Identity Gateway');
    expect(this.page.url()).toContain('test.id.nihr.ac.uk/authenticationendpoint/login');
  }

  //passwords to be set in AzureDevops Pipeline, hardcode when running locally
  async loginWithUserCreds(user: string) {
    let username = '';
    let password = '';
    switch (user.toLowerCase()) {
      case 'poc':
        username = 'secontactmanageronly@test.id.nihr.ac.uk';
        password = `${process.env.CONTACT_MANAGER_ONLY_PASS}`;
        break;
      case 'sponsor contact':
        username = 'sesponsorcontact@test.id.nihr.ac.uk';
        password = `${process.env.SPONSOR_CONTACT_PASS}`;
        break;
      default:
        throw new Error(`${user} is not a valid option`);
    }
    await this.usernameInput.fill(username);
    await this.btnNext.click();
    await this.passwordInput.fill(password);
    await this.btnContinue.click();
  }
}
