import { expect, Locator, Page } from '@playwright/test';
import { generateDynamicLocator } from '../../utils/UtilFunctions';
import * as buttonTextData from '../../resources/test_data/common/button_text_data.json';
import * as linkTextData from '../../resources/test_data/common/link_text_data.json';

//Declare Page Objects
export default class CommonItemsPage {
  readonly page: Page;
  readonly buttonTextData: typeof buttonTextData;
  readonly linkTextData: typeof linkTextData;
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
  readonly bannerNavBar: Locator;
  readonly bannerLoginBtn: Locator;
  readonly bannerMyApplications: Locator;

  //Initialize Page Objects
  constructor(page: Page) {
    this.page = page;
    this.buttonTextData = buttonTextData;
    this.linkTextData = linkTextData;

    //Locators
    this.showAllSectionsAccordion = page.locator('.govuk-accordion__show-all"');
    this.govUkButton = this.page.locator('.govuk-button');
    this.govUkCheckboxes = this.page.locator('.govuk-checkboxes');
    this.govUkCheckboxItem = this.govUkCheckboxes.locator('.govuk-checkboxes__item');
    this.govUkLink = this.page.getByRole('link');
    this.qSetProgressBar = page.locator('.progress-container');
    this.qSetProgressBarStage = this.qSetProgressBar.locator('.stage');
    this.qSetProgressBarActiveStage = this.qSetProgressBar.locator('.stage.active');
    this.qSetProgressBarStageLink = this.qSetProgressBarStage.locator('.stage-label').getByRole('button');
    this.qSetProgressBarActiveStageLink = this.qSetProgressBarActiveStage.locator('.stage-label').getByRole('button');
    this.bannerNavBar = this.page.getByTestId('app-navigation');
    this.bannerLoginBtn = this.bannerNavBar.getByText(this.buttonTextData.Banner.Login, { exact: true });
    this.bannerMyApplications = this.bannerNavBar.getByText(linkTextData.Banner.My_Applications, { exact: true });
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

  async enterDate(date: string, dateLocator: string) {
    const dateSplit = date.split('/');
    const day = dateSplit[0];
    const month = dateSplit[1];
    const year = dateSplit[2];
    await this.page.locator(generateDynamicLocator(dateLocator, 'day')).fill(day);
    await this.page.locator(generateDynamicLocator(dateLocator, 'month')).fill(month);
    await this.page.locator(generateDynamicLocator(dateLocator, 'year')).fill(year);
  }

  async isAccordionExpanded(accordion: Locator): Promise<string | null> {
    const isExpanded = await accordion.getAttribute('aria-expanded');
    return isExpanded;
  }

  async toggleAccordion(accordion: Locator) {
    await accordion.click();
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

  async selectRadio(formGroupLabel: Locator, radioLabelFilter: string, radioButtonId: string) {
    const radioLabelLocator = formGroupLabel.filter({ hasText: radioLabelFilter });
    const radioButtonLocator = radioLabelLocator.locator('..').getByTestId(radioButtonId);
    await radioButtonLocator.check();
  }

  async verifyDetailsExpanded(isExpanded: string, details: Locator) {
    if (isExpanded === 'open') {
      await expect(details).toHaveAttribute('open');
    } else if (isExpanded === 'closed') {
      await expect(details).not.toHaveAttribute('open');
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

  async fillUIComponent<PageObject>(dataset: JSON, key: string, page: PageObject) {
    const locator: Locator = page[key];
    const typeAttribute = await locator.first().getAttribute('type');
    if (typeAttribute === 'text' || typeAttribute === 'date') {
      await locator.fill(dataset[key]);
    } else if (typeAttribute === 'radio') {
      await locator.locator('..').getByLabel(dataset[key]).check();
    } else if (typeAttribute === 'checkbox') {
      for (const checkbox of dataset[key]) {
        await locator.locator('..').getByLabel(checkbox).check();
      }
    }
  }
}
