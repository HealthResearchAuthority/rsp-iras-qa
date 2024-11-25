import { expect, Locator, Page } from '@playwright/test';
import * as buttonTextData from '../../resources/test_data/common/button_text_data.json';
import * as linkTextData from '../../resources/test_data/common/link_text_data.json';
import * as questionSetData from '../../resources/test_data/common/question_set_data.json';

//Declare Page Objects
export default class CommonItemsPage {
  readonly page: Page;
  readonly buttonTextData: typeof buttonTextData;
  readonly linkTextData: typeof linkTextData;
  readonly questionSetData: typeof questionSetData;
  readonly showAllSectionsAccordion: Locator;
  readonly govUkButton: Locator;
  readonly govUkCheckboxes: Locator;
  readonly govUkCheckboxItem: Locator;
  readonly govUkLink: Locator;
  readonly govUkFieldValidationError: Locator;
  readonly qSetProgressBar: Locator;
  readonly qSetProgressBarStage: Locator;
  readonly qSetProgressBarActiveStage: Locator;
  readonly qSetProgressBarStageLink: Locator;
  readonly qSetProgressBarActiveStageLink: Locator;
  readonly bannerNavBar: Locator;
  readonly bannerLoginBtn: Locator;
  readonly bannerMyApplications: Locator;
  readonly alert_box: Locator;
  readonly alert_box_heading: Locator;
  readonly alert_box_list: Locator;
  readonly alert_box_list_items: Locator;

  //Initialize Page Objects
  constructor(page: Page) {
    this.page = page;
    this.buttonTextData = buttonTextData;
    this.linkTextData = linkTextData;
    this.questionSetData = questionSetData;

    //Locators
    this.showAllSectionsAccordion = page.locator('.govuk-accordion__show-all"');
    this.govUkButton = this.page.locator('.govuk-button');
    this.govUkCheckboxes = this.page.locator('.govuk-checkboxes');
    this.govUkCheckboxItem = this.govUkCheckboxes.locator('.govuk-checkboxes__item');
    this.govUkLink = this.page.getByRole('link');
    this.govUkFieldValidationError = this.page.locator('.govuk-error-message.field-validation-error');
    this.qSetProgressBar = page.locator('.progress-container');
    this.qSetProgressBarStage = this.qSetProgressBar.locator('.stage');
    this.qSetProgressBarActiveStage = this.qSetProgressBar.locator('.stage.active');
    this.qSetProgressBarStageLink = this.qSetProgressBarStage.locator('.stage-label').getByRole('button');
    this.qSetProgressBarActiveStageLink = this.qSetProgressBarActiveStage.locator('.stage-label').getByRole('button');
    this.bannerNavBar = this.page.getByLabel('Service information');
    this.bannerLoginBtn = this.bannerNavBar.getByText(this.buttonTextData.Banner.Login, { exact: true });
    this.bannerMyApplications = this.bannerNavBar.getByText(this.linkTextData.Banner.My_Applications, { exact: true });
    //Validation Alert Box
    this.alert_box = this.page.getByRole('alert');
    this.alert_box_heading = this.alert_box.getByRole('heading');
    this.alert_box_list = this.alert_box.getByRole('list');
    this.alert_box_list_items = this.alert_box.getByRole('listitem');
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

  async isAccordionExpanded(accordion: Locator): Promise<string | null> {
    const isExpanded = await accordion.getAttribute('aria-expanded');
    return isExpanded;
  }

  async toggleAccordion(accordion: Locator) {
    await accordion.click();
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
      await locator.locator('..').getByLabel(dataset[key], { exact: true }).check();
    } else if (typeAttribute === 'checkbox') {
      for (const checkbox of dataset[key]) {
        await locator.locator('..').getByLabel(checkbox, { exact: true }).check();
      }
    }
  }

  async getFieldErrors<PageObject>(key: string, page: PageObject): Promise<Locator> {
    const locator: Locator = page[key];
    const typeAttribute = await locator.first().getAttribute('type');
    //Check if Textbox or Date Field else must be Radio or Checkbox
    if (typeAttribute === 'text' || typeAttribute == null) {
      const fieldError = locator.locator('..').locator(this.govUkFieldValidationError);
      return fieldError;
    } else if (typeAttribute === 'date') {
      const fieldError = locator.locator('../../../../..').locator(this.govUkFieldValidationError);
      return fieldError;
    } else {
      const fieldError = locator.locator('../../..').locator(this.govUkFieldValidationError);
      return fieldError;
    }
  }
}
