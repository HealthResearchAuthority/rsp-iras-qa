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
  readonly qSetProgressBar: Locator;
  readonly qSetProgressBarStage: Locator;
  readonly qSetProgressBarActiveStage: Locator;
  readonly qSetProgressBarStageLink: Locator;
  readonly qSetProgressBarActiveStageLink: Locator;
  readonly bannerNavBar: Locator;
  readonly bannerLoginBtn: Locator;
  readonly bannerMyApplications: Locator;
  readonly errorMessageQSetFieldLabel: Locator;
  readonly errorMessageSummaryQSetLabel: Locator;

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
    this.qSetProgressBar = page.locator('.progress-container');
    this.qSetProgressBarStage = this.qSetProgressBar.locator('.stage');
    this.qSetProgressBarActiveStage = this.qSetProgressBar.locator('.stage.active');
    this.qSetProgressBarStageLink = this.qSetProgressBarStage.locator('.stage-label').getByRole('button');
    this.qSetProgressBarActiveStageLink = this.qSetProgressBarActiveStage.locator('.stage-label').getByRole('button');
    this.bannerNavBar = this.page.getByLabel('Service information');
    this.bannerLoginBtn = this.bannerNavBar.getByText(this.buttonTextData.Banner.Login, { exact: true });
    this.bannerMyApplications = this.bannerNavBar.getByText(this.linkTextData.Banner.My_Applications, { exact: true });
    this.errorMessageQSetFieldLabel = page.locator('span[class="govuk-error-message field-validation-error"]');
    this.errorMessageSummaryQSetLabel = page.locator('div[class="govuk-error-summary"]');
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
    if ((typeAttribute === 'text' || typeAttribute === 'date') && dataset[key].length !== 0) {
      await locator.fill(dataset[key]);
    } else if (typeAttribute === 'radio' && dataset[key].length !== 0) {
      await locator.locator('..').getByLabel(dataset[key], { exact: true }).check();
    } else if (typeAttribute === 'checkbox' && dataset[key].length !== 0) {
      for (const checkbox of dataset[key]) {
        await locator.locator('..').getByLabel(checkbox, { exact: true }).check();
      }
    }
  }

  async validateErrorMessageForMandatoryField(dataset: JSON, key: string, locator: Locator, testData: any) {
    if (dataset[key].length === 0) {
      await expect(locator).toHaveText(testData['error_message_each_question_checkbox']);
    } else if (dataset[key].length !== 0) {
      await expect(locator).toHaveCount(0);
    }
  }

  async validateQsetErrorMessage<PageObject>(
    errorMessageSummaryEachQuestion: string,
    dataset: JSON,
    key: string,
    page: PageObject
  ) {
    const errorMessageCommon = this.questionSetData.ValidationObject['Empty_Fields_Error_Message'];
    const typeAttribute = await page[key].first().getAttribute('type');
    if (dataset[key].length === 0) {
      await expect(
        this.errorMessageSummaryQSetLabel.getByText(errorMessageCommon['error_message_summary_header'])
      ).toBeVisible();
      await expect(this.errorMessageSummaryQSetLabel.getByText(errorMessageSummaryEachQuestion[key])).toBeVisible();
    } else if (dataset[key].length !== 0) {
      await expect(this.errorMessageSummaryQSetLabel.getByText(errorMessageSummaryEachQuestion[key])).toHaveCount(0);
    }
    if (typeAttribute === 'checkbox') {
      const checkboxLocator = page[key].locator('../../../..').locator(this.errorMessageQSetFieldLabel);
      this.validateErrorMessageForMandatoryField(dataset, key, checkboxLocator, errorMessageCommon);
    } else if (typeAttribute === 'radio') {
      const radioLocator = page[key].locator('../../../..').locator(this.errorMessageQSetFieldLabel);
      this.validateErrorMessageForMandatoryField(dataset, key, radioLocator, errorMessageCommon);
    } else if (typeAttribute === 'date') {
      const dateLocator = page[key].locator('../../../../..').locator(this.errorMessageQSetFieldLabel);
      this.validateErrorMessageForMandatoryField(dataset, key, dateLocator, errorMessageCommon);
    } else {
      const otherLocator = page[key].locator('..').locator(this.errorMessageQSetFieldLabel);
      this.validateErrorMessageForMandatoryField(dataset, key, otherLocator, errorMessageCommon);
    }
  }
}
