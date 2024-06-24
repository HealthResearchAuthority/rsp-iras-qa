import { Locator, Page } from '@playwright/test';

//Declare Page Objects
export default class CommonItemsPage {
  readonly page: Page;
  readonly bannerMyTasks: Locator;
  readonly bannerMyPersonalTasks: Locator;

  //Initialize Page Objects
  constructor(page: Page) {
    this.page = page;

    //Locators
    this.bannerMyTasks = this.page.locator('span[class="menu-item-title"]').getByText('My tasks', { exact: true });
    this.bannerMyPersonalTasks = this.page
      .locator('span[class="menu-item-title"]')
      .getByText('My personal tasks', { exact: true });
  }

  //Page Methods
  async storeAuthState(user: string) {
    const authContactManagerOnlyFile = 'auth-storage-states/contactManagerOnly.json';
    switch (user.toLowerCase()) {
      case 'poc_user':
        await this.page.context().storageState({ path: authContactManagerOnlyFile });
        break;
      default:
        throw new Error(`${user} is not a valid option`);
    }
  }
}
