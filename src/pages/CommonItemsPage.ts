import { FrameLocator, Locator, Page } from '@playwright/test';
import { generateDynamicLocator } from '../utils/UtilFunctions';

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

  async enterDate(date: string, dateLocator: string, iframe?: FrameLocator) {
    const dateSplit = date.split('/');
    const day = dateSplit[0];
    const month = dateSplit[1];
    const year = dateSplit[2];
    if (iframe) {
      await iframe.locator(generateDynamicLocator(dateLocator, 'day')).fill(day);
      await iframe.locator(generateDynamicLocator(dateLocator, 'month')).fill(month);
      await iframe.locator(generateDynamicLocator(dateLocator, 'year')).fill(year);
    } else {
      await this.page.locator(generateDynamicLocator(dateLocator, 'day')).fill(day);
      await this.page.locator(generateDynamicLocator(dateLocator, 'month')).fill(month);
      await this.page.locator(generateDynamicLocator(dateLocator, 'year')).fill(year);
    }
  }

  async isAccordionExpanded(accordion: Locator, iframe?: FrameLocator): Promise<string | null> {
    let isExpanded: string | null;
    if (iframe) {
      isExpanded = await iframe.locator(accordion).getAttribute('aria-expanded');
    } else {
      isExpanded = await accordion.getAttribute('aria-expanded');
    }
    return isExpanded;
  }

  async toggleAccordion(accordion: Locator, iframe?: FrameLocator) {
    if (iframe) {
      await iframe.locator(accordion).click();
    } else {
      await accordion.click();
    }
  }
}
