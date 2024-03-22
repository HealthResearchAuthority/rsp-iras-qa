import { Page } from '@playwright/test';

//Declare Page Objects
export default class CommonItemsPage {
  readonly page: Page;

  //Initialize Page Objects
  constructor(page: Page) {
    this.page = page;

    //Locators
  }

  //Page Methods
  async storeAuthState(user: string) {
    const authContactManagerOnlyFile = 'auth-storage-states/contactManagerOnly.json';
    switch (user.toLowerCase()) {
      case 'poc':
        await this.page.context().storageState({ path: authContactManagerOnlyFile });
        break;
      default:
        throw new Error(`${user} is not a valid option`);
    }
  }
}
