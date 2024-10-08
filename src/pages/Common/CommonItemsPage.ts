import { expect, FrameLocator, Locator, Page } from '@playwright/test';
import { generateDynamicLocator } from '../../utils/UtilFunctions';
import * as buttonTextData from '../../resources/test_data/common/button_text_data.json';
import * as linkTextData from '../../resources/test_data/common/link_text_data.json';

//Declare Page Objects
export default class CommonItemsPage {
  readonly page: Page;
  readonly buttonTextData: typeof buttonTextData;
  readonly linkTextData: typeof linkTextData;
  readonly bannerMyTasks: Locator;
  readonly bannerMyPersonalTasks: Locator;
  readonly showAllSectionsIFrame: FrameLocator;
  readonly showAllSectionsAccordion: Locator;
  readonly govUkButton: Locator;
  readonly govUkCheckboxes: Locator;
  readonly govUkCheckboxItem: Locator;
  readonly govUkLink: Locator;
  readonly qSetProgressBar: Locator;
  readonly qSetProgressBarStage: Locator;
  readonly qSetProgressBarActiveStage: Locator;
  readonly qSetProgressBarStageLink: Locator;
  readonly qSetProgressBarActiveStageLink: Locator;

  //Initialize Page Objects
  constructor(page: Page) {
    this.page = page;
    this.buttonTextData = buttonTextData;
    this.linkTextData = linkTextData;

    //Locators
    this.bannerMyTasks = page.locator('span[class="menu-item-title"]').getByText('My tasks', { exact: true });
    this.bannerMyPersonalTasks = page
      .locator('span[class="menu-item-title"]')
      .getByText('My personal tasks', { exact: true });
    this.showAllSectionsAccordion = page.locator('//button[@class="govuk-accordion__show-all"]');
    this.showAllSectionsIFrame = page.frameLocator('[title="Accordion example"]');
    this.govUkButton = page.locator('.govuk-button');
    this.govUkCheckboxes = page.locator('.govuk-checkboxes');
    this.govUkCheckboxItem = this.govUkCheckboxes.locator('.govuk-checkboxes__item');
    this.govUkLink = this.page.getByRole('link');
    this.qSetProgressBar = page.locator('.progress-container');
    this.qSetProgressBarStage = this.qSetProgressBar.locator('.stage');
    this.qSetProgressBarActiveStage = this.qSetProgressBar.locator('.stage.active');
    this.qSetProgressBarStageLink = this.qSetProgressBarStage.locator('.stage-label').getByRole('link');
    this.qSetProgressBarActiveStageLink = this.qSetProgressBarActiveStage.locator('.stage-label').getByRole('link');
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

  async selectCheckboxesOld(checkboxes: string, checkBoxLocator: string, iframe?: FrameLocator) {
    const checkBoxSplitArray = checkboxes.split('|');
    if (iframe) {
      for (const checkbox of checkBoxSplitArray) {
        await iframe.locator(generateDynamicLocator(checkBoxLocator, checkbox)).check();
      }
    } else {
      for (const checkbox of checkBoxSplitArray) {
        await this.page.locator(generateDynamicLocator(checkBoxLocator, checkbox)).check();
      }
    }
  }

  async selectCheckboxes(formGroupLabel: Locator, checkboxGroupLabelFilter: string, checkboxValues: string[]) {
    for (const checkboxValue of checkboxValues) {
      const checkboxGroupLabelLocator = formGroupLabel.filter({ hasText: checkboxGroupLabelFilter });
      const checkboxItem = checkboxGroupLabelLocator
        .locator('..')
        .locator(this.govUkCheckboxItem)
        .filter({ hasText: checkboxValue });
      const checkboxLocator = checkboxItem.getByRole('checkbox');
      await checkboxLocator.check();
    }
  }

  async selectRadioOld(radio: string, radioLocator: string, iframe?: FrameLocator) {
    if (iframe) {
      await iframe.locator(generateDynamicLocator(radioLocator, radio)).check();
    } else {
      await this.page.locator(generateDynamicLocator(radioLocator, radio)).check();
    }
  }

  async selectRadio(formGroupLabel: Locator, radioLabelFilter: string, radioButtonId: string) {
    const radioLabelLocator = formGroupLabel.filter({ hasText: radioLabelFilter });
    const radioButtonLocator = radioLabelLocator.locator('..').getByTestId(radioButtonId);
    await radioButtonLocator.check();
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

  async fillElementById(baseLocator: Locator, idSelector: string, value: string) {
    const inputLocator = baseLocator.getByTestId(idSelector);
    await inputLocator.fill(value);
  }

  async fillElementByAndId(baseLocator: Locator, idSelector: string, value: string) {
    const inputLocator = baseLocator.and(this.page.getByTestId(idSelector));
    await inputLocator.fill(value);
  }

  // To be Removed but Keeping as Placeholder for Mobile and Desktop Test Folders
  async samplePageAction(testType: string) {
    console.log(testType + ' test action');
  }
}
