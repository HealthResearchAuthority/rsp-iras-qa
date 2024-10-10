import { expect, FrameLocator, Locator, Page } from '@playwright/test';
import { generateDynamicLocator } from '../../utils/UtilFunctions';
import * as buttonTextData from '../../resources/test_data/common/button_text_data.json';

//Declare Page Objects
export default class CommonItemsPage {
  readonly page: Page;
  readonly buttonTextData: typeof buttonTextData;
  readonly bannerMyTasks: Locator;
  readonly bannerMyPersonalTasks: Locator;
  readonly showAllSectionsIFrame: FrameLocator;
  readonly showAllSectionsAccordion: Locator;
  readonly govUkButton: Locator;

  //Initialize Page Objects
  constructor(page: Page) {
    this.page = page;
    this.buttonTextData = buttonTextData;

    //Locators
    this.bannerMyTasks = this.page.locator('span[class="menu-item-title"]').getByText('My tasks', { exact: true });
    this.bannerMyPersonalTasks = this.page
      .locator('span[class="menu-item-title"]')
      .getByText('My personal tasks', { exact: true });
    this.showAllSectionsAccordion = page.locator('//button[@class="govuk-accordion__show-all"]');
    this.showAllSectionsIFrame = this.page.frameLocator('[title="Accordion example"]');
    this.govUkButton = this.page.locator('.govuk-button');
  }

  //Page Methods
  async storeAuthState(user: string) {
    const authAdminUserFile = 'auth-storage-states/adminUser.json';
    switch (user.toLowerCase()) {
      case 'admin_user':
        await this.page.context().storageState({ path: authAdminUserFile });
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

  async verifyDetailsExpanded(isExpanded: string, details: Locator, iframe?: FrameLocator) {
    if (isExpanded === 'open') {
      if (iframe) {
        await expect(iframe.locator(details)).toHaveAttribute('open');
      } else {
        await expect(details).toHaveAttribute('open');
      }
    } else if (isExpanded === 'closed') {
      if (iframe) {
        await expect(iframe.locator(details)).not.toHaveAttribute('open');
      } else {
        await expect(details).not.toHaveAttribute('open');
      }
    }
  }

  async uploadFiles(filePaths: string, chooseFilesElement: Locator, uploadButtonElement: Locator) {
    const filePathsSplitArray = filePaths.split('|');
    await chooseFilesElement.setInputFiles(filePathsSplitArray);
    await uploadButtonElement.click();
  }

  // To be Removed but Keeping as Placeholder for Mobile and Desktop Test Folders
  async samplePageAction(testType: string) {
    console.log(testType + ' test action');
  }

  async fillUIComponent(dataset: any, key: any, page: any) {
    let attributeValue: string = '';
    let locator = page[key];
    const checkLocator = page[key];
    if (typeof page[key] == 'string') {
      if (typeof dataset[key] == 'object') {
        locator = this.page.locator(generateDynamicLocator(page[key], dataset[key][0]));
        attributeValue = await locator.getAttribute('class');
      } else {
        locator = this.page.locator(generateDynamicLocator(page[key], dataset[key]));
        attributeValue = await locator.getAttribute('class');
      }
    }
    if ((await locator.getAttribute('type')) === 'text') {
      await locator.fill(dataset[key]);
    } else if (attributeValue.includes('radio')) {
      await locator.check();
    } else if (attributeValue.includes('checkbox')) {
      if (!Array.isArray(dataset[key]) || !dataset[key].length) {
        await locator.check();
      } else {
        for (const checkbox of dataset[key]) {
          await this.page.locator(generateDynamicLocator(checkLocator, checkbox)).check();
        }
      }
    }
  }
}
