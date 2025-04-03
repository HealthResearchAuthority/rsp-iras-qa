import { expect, Locator, Page } from '@playwright/test';
import * as buttonTextData from '../../resources/test_data/common/button_text_data.json';
import * as linkTextData from '../../resources/test_data/common/link_text_data.json';
import * as questionSetData from '../../resources/test_data/common/question_set_data.json';
import fs from 'fs';
import path from 'path';
import ProjectFilterPage from '../IRAS/questionSet/ProjectFilterPage';
import ProjectDetailsPage from '../IRAS/questionSet/ProjectDetailsPage';
import DevicesPage from '../IRAS/questionSet/DevicesPage';
import TissuePage from '../IRAS/questionSet/TissuePage';
import StudentPage from '../IRAS/questionSet/StudentPage';
import AdultsLackingCapacityPage from '../IRAS/questionSet/AdultsLackingCapacityPage';
import BookingPage from '../IRAS/questionSet/BookingPage';
import ChildrenPage from '../IRAS/questionSet/ChildrenPage';
import { PageObjectDataName } from '../../utils/CustomTypes';

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
  readonly alert_box_headings: Locator;
  readonly alert_box_list: Locator;
  readonly alert_box_list_items: Locator;
  readonly errorMessageFieldLabel: Locator;
  readonly errorMessageSummaryLabel: Locator;

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
    this.errorMessageFieldLabel = page.locator('[class$="field-validation-error"]');
    this.errorMessageSummaryLabel = page.locator('div[class="govuk-error-summary"]');
    //Validation Alert Box
    this.alert_box = this.page.getByRole('alert');
    this.alert_box_headings = this.alert_box.getByRole('heading');
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

  async goBack() {
    await this.page.goBack();
  }

  async goForward() {
    await this.page.goForward();
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
    if (typeAttribute === 'text' || typeAttribute === 'date' || typeAttribute === 'email' || typeAttribute === 'tel') {
      await locator.fill(dataset[key]);
    } else if (typeAttribute === 'radio') {
      await locator.locator('..').getByLabel(dataset[key], { exact: true }).check();
    } else if (typeAttribute === 'checkbox') {
      for (const checkbox of dataset[key]) {
        await locator.locator('..').getByLabel(checkbox, { exact: true }).check();
      }
    } else {
      const isSelectTag = await locator.evaluate((el) => el.tagName.toLowerCase() === 'select');
      if (isSelectTag) {
        await locator.selectOption({ label: dataset[key] });
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

  async getFieldTypeErrorMessage<PageObject>(key: string, page: PageObject): Promise<string> {
    const locator: Locator = page[key];
    const typeAttribute = await locator.first().getAttribute('type');
    //Check if Textbox, Date or Radio Field else must be Checkbox
    if (typeAttribute === 'text' || typeAttribute === 'date') {
      return this.questionSetData.Validation.text_error_message;
    } else if (typeAttribute === 'radio' || typeAttribute == null) {
      return this.questionSetData.Validation.radio_error_message;
    } else {
      return this.questionSetData.Validation.checkbox_error_message;
    }
  }

  async getQsetPageObjectDataName(page: string): Promise<PageObjectDataName> {
    switch (page.toLowerCase()) {
      case 'project filter': {
        const pageObject = new ProjectFilterPage(this.page);
        const dataName = 'projectFilterPageTestData';
        return { pageObject, dataName };
      }
      case 'project details': {
        const pageObject = new ProjectDetailsPage(this.page);
        const dataName = 'projectDetailsPageTestData';
        return { pageObject, dataName };
      }
      case 'student': {
        const pageObject = new StudentPage(this.page);
        const dataName = 'studentPageTestData';
        return { pageObject, dataName };
      }
      case 'devices': {
        const pageObject = new DevicesPage(this.page);
        const dataName = 'devicesPageTestData';
        return { pageObject, dataName };
      }
      case 'tissue': {
        const pageObject = new TissuePage(this.page);
        const dataName = 'tissuePageTestData';
        return { pageObject, dataName };
      }
      case 'alc': {
        const pageObject = new AdultsLackingCapacityPage(this.page);
        const dataName = 'adultsLackingCapacityPageTestData';
        return { pageObject, dataName };
      }
      case 'children': {
        const pageObject = new ChildrenPage(this.page);
        const dataName = 'childrenPageTestData';
        return { pageObject, dataName };
      }
      case 'booking': {
        const pageObject = new BookingPage(this.page);
        const dataName = 'bookingPageTestData';
        return { pageObject, dataName };
      }
      default:
        throw new Error(`${page} is not a valid option`);
    }
  }

  async getQsetPageValidationData(page: string, dataType: string, datasetName: string): Promise<Map<string, any>> {
    let inputDataset: JSON = {} as JSON;
    switch (page.toLowerCase()) {
      case 'project filter':
        inputDataset = new ProjectFilterPage(this.page).projectFilterPageTestData[dataType][datasetName];
        break;
      case 'project details':
        inputDataset = new ProjectDetailsPage(this.page).projectDetailsPageTestData[dataType][datasetName];
        break;
      case 'student':
        inputDataset = new StudentPage(this.page).studentPageTestData[dataType][datasetName];
        break;
      case 'devices':
        inputDataset = new DevicesPage(this.page).devicesPageTestData[dataType][datasetName];
        break;
      case 'tissue':
        inputDataset = new TissuePage(this.page).tissuePageTestData[dataType][datasetName];
        break;
      case 'alc':
        inputDataset = new AdultsLackingCapacityPage(this.page).adultsLackingCapacityPageTestData[dataType][
          datasetName
        ];
        break;
      case 'children':
        inputDataset = new ChildrenPage(this.page).childrenPageTestData[dataType][datasetName];
        break;
      case 'booking':
        inputDataset = new BookingPage(this.page).bookingPageTestData[dataType][datasetName];
        break;
      default:
        throw new Error(`${page} is not a valid option`);
    }
    const test = Object.entries(inputDataset);
    return new Map(test);
  }

  async writeExtractedDataFromMemoryToJSON(
    extractedValuesInMemory: JSON,
    testDataJSONPath: string,
    jsonParentNodesMap: Map<string, string>
  ) {
    const jsonRootParentNode: any = jsonParentNodesMap.get('jsonRootParentNode');
    const jsonParentNode: any = jsonParentNodesMap.get('jsonParentNode');
    const createNewJSONObject = () => {
      const newJSONObjectData = {
        [jsonRootParentNode]: {
          [jsonParentNode]: {},
        },
      };
      const firstNode = newJSONObjectData[jsonRootParentNode];
      firstNode[jsonParentNode] = extractedValuesInMemory;
      return newJSONObjectData;
    };
    const parentDirectory = path.resolve(testDataJSONPath, '..');
    const writeToJSONFile = (readJSONFile: JSON) => {
      if (!fs.existsSync(parentDirectory)) {
        fs.mkdirSync(parentDirectory, { recursive: true });
      }
      fs.writeFileSync(testDataJSONPath, JSON.stringify(readJSONFile, null, 2));
    };
    if (!fs.existsSync(testDataJSONPath) || fs.statSync(testDataJSONPath).size == 0) {
      if (!fs.existsSync(parentDirectory)) {
        fs.mkdirSync(parentDirectory, { recursive: true });
      }
      fs.writeFileSync(testDataJSONPath, JSON.stringify(createNewJSONObject(), null, 2));
    } else {
      const readJSONFile = await JSON.parse(fs.readFileSync(testDataJSONPath, 'utf8'));
      if (Object.prototype.hasOwnProperty.call(readJSONFile, jsonRootParentNode)) {
        const rootParentNodeValues = readJSONFile[jsonRootParentNode];
        rootParentNodeValues[jsonParentNode] = extractedValuesInMemory;
        writeToJSONFile(readJSONFile);
      } else {
        const newJSONObjectChildData = {
          [jsonParentNode]: extractedValuesInMemory,
        };
        readJSONFile[jsonRootParentNode] = newJSONObjectChildData;
        writeToJSONFile(readJSONFile);
      }
    }
  }

  async selfHealLocator(locatorList: Locator[]): Promise<Locator> {
    let selfHealedLocator: Locator | null = null;
    for (const locator of locatorList) {
      try {
        await expect(locator).toBeAttached();
        selfHealedLocator = locator;
        break;
      } catch {
        // This catch block is defined empty so that even if the element is not present in the DOM, the loop will continue to check for the next element.
        // If no locators from the list are found valid then the below 'if' statement will throw the error to fail the test execution.
      }
    }
    if (!selfHealedLocator) {
      throw new Error(
        `Self Healing for locator has failed. Automation was not able to find a valid locator from the available list:[ ${locatorList} ]. Add a new valid locator to the list`
      );
    }
    return selfHealedLocator;
  }

  async captureScreenshot(page: Page, $step: any, $testInfo: any) {
    const screenshot = await page.screenshot({ path: 'screenshot.png', fullPage: true });
    await $testInfo.attach(`[step] ${$step.title}`, { body: screenshot, contentType: 'image/png' });
  }

  async captureComponentScreenshot(locator: Locator, $step: any, $testInfo: any) {
    const screenshot = await locator.screenshot({ path: 'screenshot.png' });
    await $testInfo.attach(`[step] ${$step.title}`, { body: screenshot, contentType: 'image/png' });
  }

  async validateErrorMessage<PageObject>(
    errorMessageFieldDataset: string,
    errorMessageSummaryDataset: string,
    key: string,
    page: PageObject
  ) {
    const typeAttribute = await page[key].first().getAttribute('type');
    // Create a new locator in required pages to validate the summary error labels.
    // The name of locator should be the same as in the test data and appended by '_summary_error_label'.
    const summaryLocatorKey = key + '_summary_error_label';
    await expect(
      this.errorMessageSummaryLabel.getByText(errorMessageSummaryDataset['error_message_summary_header'])
    ).toBeVisible();
    await expect(page[summaryLocatorKey].getByText(errorMessageSummaryDataset[key])).toBeVisible();
    if (typeAttribute === 'checkbox') {
      const checkboxLocator = page[key].locator('../../../..').locator(this.errorMessageFieldLabel);
      await expect(checkboxLocator).toHaveText(errorMessageFieldDataset[key]);
    } else if (typeAttribute === 'radio') {
      const radioLocator = page[key].locator('../../../..').locator(this.errorMessageFieldLabel);
      await expect(radioLocator).toHaveText(errorMessageFieldDataset[key]);
    } else if (
      typeAttribute === 'date' ||
      (await page[key].first().getAttribute('class')).toLowerCase().includes('date')
    ) {
      const dateLocator = page[key].locator('../../../../../..').locator(this.errorMessageFieldLabel);
      await expect(dateLocator).toHaveText(errorMessageFieldDataset[key]);
    } else {
      const otherLocator = page[key].locator('..').locator(this.errorMessageFieldLabel);
      await expect(otherLocator).toHaveText(errorMessageFieldDataset[key]);
    }
  }

  async validateUIComponentValues<PageObject>(dataset: JSON, key: string, page: PageObject) {
    const locator: Locator = page[key];
    const typeAttribute = await locator.first().getAttribute('type');
    if (typeAttribute === 'text' || typeAttribute === 'date') {
      expect(await locator.getAttribute('value')).toBe(dataset[key]);
    } else if (typeAttribute === 'radio') {
      expect(await locator.locator('..').getByLabel(dataset[key], { exact: true }).isChecked());
    } else if (typeAttribute === 'checkbox') {
      for (const checkbox of dataset[key]) {
        expect(await locator.locator('..').getByLabel(checkbox, { exact: true }).isChecked());
      }
    }
  }

  async validateUILabels<PageObject>(dataset: JSON, key: string, page: PageObject) {
    const locator: Locator = page[key];
    expect((await locator.textContent())?.trim()).toBe(dataset[key]);
  }

  async validateFieldErrorMessage<PageObject>(errorMessageFieldDataset: string, key: string, page: PageObject) {
    const locator: Locator = page[key];
    const otherLocator = locator.locator('..').locator(this.errorMessageFieldLabel);
    await expect(otherLocator).toHaveText(errorMessageFieldDataset[key]);
  }

  async clearUIComponent<PageObject>(dataset: JSON, key: string, page: PageObject) {
    const locator: Locator = page[key];
    const typeAttribute = await locator.first().getAttribute('type');
    if (typeAttribute === 'text' || typeAttribute === 'date' || typeAttribute === 'email' || typeAttribute === 'tel') {
      await locator.clear();
    } else if (typeAttribute === 'radio') {
      await locator.locator('..').getByLabel(dataset[key], { exact: true }).uncheck();
    } else if (typeAttribute === 'checkbox') {
      for (const checkbox of dataset[key]) {
        await locator.locator('..').getByLabel(checkbox, { exact: true }).uncheck();
      }
    } else {
      const isSelectTag = await locator.evaluate((el) => el.tagName.toLowerCase() === 'select');
      if (isSelectTag) {
        await locator.selectOption({ label: '' });
      }
    }
  }
}
