import { expect, Locator, Page } from '@playwright/test';
import * as buttonTextData from '../../resources/test_data/common/button_text_data.json';
import * as linkTextData from '../../resources/test_data/common/link_text_data.json';
import * as questionSetData from '../../resources/test_data/common/question_set_data.json';
import * as commonTestData from '../../resources/test_data/common/common_data.json';
import * as fs from 'fs';
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
import { confirmArrayNotNull, confirmStringNotNull, removeUnwantedWhitespace } from '../../utils/UtilFunctions';
import sharp from 'sharp';

//Declare Page Objects
export default class CommonItemsPage {
  readonly page: Page;
  readonly buttonTextData: typeof buttonTextData;
  readonly linkTextData: typeof linkTextData;
  readonly questionSetData: typeof questionSetData;
  readonly commonTestData: typeof commonTestData;
  readonly showAllSectionsAccordion: Locator;
  readonly genericButton: Locator;
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
  readonly bannerHome: Locator;
  readonly bannerReviewApplications: Locator;
  readonly bannerAdmin: Locator;
  readonly bannerManageUsers: Locator;
  readonly bannerQuestionSet: Locator;
  readonly bannerSystemAdmin: Locator;
  readonly bannerMyApplications: Locator;
  readonly alert_box: Locator;
  readonly alert_box_headings: Locator;
  readonly alert_box_list: Locator;
  readonly alert_box_list_items: Locator;
  readonly errorMessageFieldLabel: Locator;
  readonly errorMessageSummaryLabel: Locator;
  readonly topMenuBarLinks: Locator;
  readonly summaryErrorLinks: Locator;
  readonly tableRows: Locator;
  readonly tableBodyRows: Locator;
  readonly hidden_next_button: Locator;
  readonly next_button: Locator;
  readonly pagination_next_link: Locator;
  readonly fieldGroup: Locator;
  readonly errorFieldGroup: Locator;
  readonly search_text: Locator;
  readonly pagination: Locator;
  readonly firstPage: Locator;
  readonly lastPage: Locator;
  readonly previous_button: Locator;
  readonly currentPage: Locator;
  readonly pagination_results: Locator;
  readonly pagination_items: Locator;
  readonly pageLinks: Locator;
  readonly advanced_filter_chevron: Locator;
  readonly advanced_filter_active_filters_label: Locator;
  readonly no_matching_search_result_header_label: Locator;
  readonly no_matching_search_result_sub_header_label: Locator;
  readonly no_matching_search_result_body_one_label: Locator;
  readonly no_matching_search_result_body_two_label: Locator;
  readonly no_matching_search_result_body_three_label: Locator;
  readonly no_matching_search_result_body_four_label: Locator;
  readonly no_matching_search_result_count_label: Locator;

  //Initialize Page Objects
  constructor(page: Page) {
    this.page = page;
    this.buttonTextData = buttonTextData;
    this.linkTextData = linkTextData;
    this.questionSetData = questionSetData;
    this.commonTestData = commonTestData;

    //Locators
    this.showAllSectionsAccordion = page.locator('.govuk-accordion__show-all"');
    this.genericButton = this.page.getByRole('button');
    this.govUkButton = this.page.locator('.govuk-button');
    this.govUkCheckboxes = this.page.locator('.govuk-checkboxes');
    this.govUkCheckboxItem = this.govUkCheckboxes.locator('.govuk-checkboxes__item');
    this.govUkLink = this.page.getByRole('link');
    this.fieldGroup = this.page.locator('.govuk-form-group');
    this.errorFieldGroup = this.page.locator('.govuk-form-group--error');
    this.govUkFieldValidationError = this.page.locator('.govuk-error-message');
    this.qSetProgressBar = page.locator('.progress-container');
    this.qSetProgressBarStage = this.qSetProgressBar.locator('.stage');
    this.qSetProgressBarActiveStage = this.qSetProgressBar.locator('.stage.active');
    this.qSetProgressBarStageLink = this.qSetProgressBarStage.locator('.stage-label').getByRole('button');
    this.qSetProgressBarActiveStageLink = this.qSetProgressBarActiveStage.locator('.stage-label').getByRole('button');
    this.tableRows = this.page.getByRole('table').getByRole('row');
    this.tableBodyRows = this.page.getByRole('table').locator('tbody').getByRole('row');
    this.hidden_next_button = this.page.locator('[class="govuk-pagination__next"][style="visibility: hidden"]');
    this.search_text = this.page
      .getByTestId('SearchQuery')
      .or(this.page.getByTestId('Search.SearchQuery'))
      .or(this.page.getByTestId('Search_IrasId'))
      .first();
    //Banner
    this.bannerNavBar = this.page.getByLabel('Service information');
    this.bannerLoginBtn = this.bannerNavBar.getByText(this.buttonTextData.Banner.Login, { exact: true });
    this.bannerHome = this.bannerNavBar.getByText(this.linkTextData.Banner.Home, { exact: true });
    this.bannerReviewApplications = this.bannerNavBar.getByText(this.linkTextData.Banner.Review_Applications, {
      exact: true,
    });
    this.bannerAdmin = this.bannerNavBar.getByText(this.linkTextData.Banner.Admin, { exact: true });
    this.bannerManageUsers = this.bannerNavBar.getByText(this.linkTextData.Banner.Manage_Users, { exact: true });
    this.bannerQuestionSet = this.bannerNavBar.getByText(this.linkTextData.Banner.Question_Set, { exact: true });
    this.bannerSystemAdmin = this.bannerNavBar.getByText(this.linkTextData.Banner.System_Admin, { exact: true });
    this.bannerMyApplications = this.bannerNavBar.getByText(this.linkTextData.Banner.My_Applications, { exact: true });
    this.next_button = this.page.getByRole('link').getByText(this.commonTestData.next_button, { exact: true });
    this.pagination_next_link = this.page.locator('div[class="govuk-pagination__next"]').getByRole('link');
    this.errorMessageFieldLabel = this.page
      .locator('.field-validation-error')
      .or(this.page.locator('.govuk-error-message'))
      .first();
    this.errorMessageSummaryLabel = this.page
      .getByRole('heading')
      .getByText(this.commonTestData.error_message_summary_header, {
        exact: true,
      });
    this.summaryErrorLinks = this.errorMessageSummaryLabel.locator('..').getByRole('listitem').getByRole('link');
    this.topMenuBarLinks = this.page.getByTestId('navigation').getByRole('listitem').getByRole('link');
    this.pagination = page.getByRole('navigation', { name: 'Pagination' });
    this.firstPage = this.pagination.getByRole('link', { name: this.commonTestData.first_page, exact: true });
    this.lastPage = this.pagination.getByRole('listitem').last();
    this.previous_button = this.pagination
      .getByRole('link')
      .getByText(this.commonTestData.previous_button, { exact: true });
    this.currentPage = this.pagination.locator('a[class$="current"]');
    this.pagination_results = this.page
      .getByRole('navigation', { name: 'Pagination' })
      .locator('..')
      .getByRole('paragraph');
    this.pagination_items = this.pagination.getByRole('listitem');
    this.pageLinks = this.pagination.locator('a[aria-label^="Page"]');
    //Validation Alert Box
    this.alert_box = this.page.getByRole('alert');
    this.alert_box_headings = this.alert_box.getByRole('heading');
    this.alert_box_list = this.alert_box.getByRole('list');
    this.alert_box_list_items = this.alert_box.getByRole('listitem');
    this.advanced_filter_chevron = this.page.getByRole('button', { name: this.commonTestData.advanced_filter_label });
    this.advanced_filter_active_filters_label = this.page.getByRole('list');
    this.no_matching_search_result_header_label = this.page.getByRole('heading');
    this.no_matching_search_result_sub_header_label = this.page.getByRole('paragraph');
    this.no_matching_search_result_body_one_label =
      this.no_matching_search_result_body_two_label =
      this.no_matching_search_result_body_three_label =
      this.no_matching_search_result_body_four_label =
        this.page.getByRole('listitem');
    this.no_matching_search_result_count_label = this.page.getByRole('heading');
  }

  //Page Methods
  async storeAuthState(user: string) {
    const authSysAdminUserFile = 'auth-storage-states/sysAdminUser.json';
    const authFrontStageUserFile = 'auth-storage-states/frontStageUser.json';
    const authBackStageUserFile = 'auth-storage-states/backStageUser.json';
    switch (user.toLowerCase()) {
      case 'system_admin':
        await this.page.context().storageState({ path: authSysAdminUserFile });
        break;
      case 'frontstage_user':
        await this.page.context().storageState({ path: authFrontStageUserFile });
        break;
      case 'backstage_user':
        await this.page.context().storageState({ path: authBackStageUserFile });
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
    if (typeAttribute === 'radio') {
      await locator.locator('..').getByLabel(dataset[key], { exact: true }).check();
    } else if (typeAttribute === 'checkbox') {
      for (const checkbox of dataset[key]) {
        await locator.locator('..').getByLabel(checkbox, { exact: true }).check();
      }
    } else if (confirmStringNotNull(await locator.getAttribute('class')).includes('govuk-select')) {
      await locator.selectOption({ label: dataset[key] });
    } else {
      await locator.fill(dataset[key]);
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

  async getUiLabel<PageObject>(key: string, page: PageObject) {
    const locator: Locator = page[key];
    return confirmStringNotNull(await locator.textContent());
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

  async getSelectedValues<PageObject>(key: string, page: PageObject) {
    const locator: Locator = page[key];
    return await removeUnwantedWhitespace(confirmStringNotNull(await locator.textContent()));
  }

  async getAuditLog(): Promise<Map<string, string[]>> {
    const timeValues: string[] = [];
    const eventValues: string[] = [];
    const adminEmailValues: string[] = [];
    let dataFound = false;
    while (!dataFound) {
      const rowCount = await this.tableRows.count();
      for (let i = 1; i < rowCount; i++) {
        const columns = this.tableRows.nth(i).getByRole('cell');
        const timeValue = confirmStringNotNull(await columns.nth(0).textContent());
        timeValues.push(timeValue);
        const eventValue = confirmStringNotNull(await columns.nth(1).textContent());
        eventValues.push(eventValue);
        const adminEmailValue = confirmStringNotNull(await columns.nth(2).textContent());
        adminEmailValues.push(adminEmailValue);
      }
      if ((await this.next_button.isVisible()) && !(await this.next_button.isDisabled())) {
        await this.next_button.click();
        await this.page.waitForLoadState('domcontentloaded');
      } else {
        dataFound = true;
      }
    }
    const auditMap = new Map([
      ['timeValues', timeValues],
      ['eventValues', eventValues],
      ['adminEmailValues', adminEmailValues],
    ]);
    return auditMap;
  }
  async getSummaryErrorMessages() {
    const summaryErrorActualValues = await this.summaryErrorLinks.allTextContents();
    return summaryErrorActualValues;
  }

  async getFieldErrorMessages<PageObject>(key: string, page: PageObject) {
    let fieldErrorMessage: string;
    const element = await page[key].first();
    const typeAttribute = await element.getAttribute('type');
    if (typeAttribute === 'checkbox') {
      key = key.replace('checkbox', 'label');
      fieldErrorMessage = confirmStringNotNull(
        await this.errorFieldGroup.filter({ has: page[key] }).locator(this.errorMessageFieldLabel).textContent()
      );
    } else {
      fieldErrorMessage = confirmStringNotNull(
        await this.errorFieldGroup.filter({ has: element }).locator(this.errorMessageFieldLabel).textContent()
      );
    }
    return fieldErrorMessage;
  }

  async getMultipleFieldErrorMessages<PageObject>(key: string, page: PageObject) {
    const element = await page[key];
    const errorSpan = this.errorFieldGroup.filter({ has: element }).locator(this.errorMessageFieldLabel);
    const htmlContent = await errorSpan.innerHTML();
    const fieldErrorMessages = htmlContent.split('<br>').map(confirmStringNotNull);
    return fieldErrorMessages;
  }

  async clickErrorSummaryLink<PageObject>(errorMessageFieldDataset: JSON, key: string, page: PageObject) {
    const element: Locator = await page[key].first();
    await this.summaryErrorLinks
      .locator('..')
      .getByRole('link', { name: errorMessageFieldDataset[key], exact: true })
      .click();
    await this.page.waitForTimeout(500); //added to prevent instability when looping through multiple summary links
    return element;
  }

  async clickErrorSummaryLinkMultipleErrorField<PageObject>(errorMessage: any, key: string, page: PageObject) {
    const element: Locator = await page[key].first();
    await this.summaryErrorLinks.locator('..').getByRole('link', { name: errorMessage, exact: true }).click();
    return element;
  }

  async getUsers(): Promise<Map<string, string[]>> {
    const firstNameValues: string[] = [];
    const lastNameValues: string[] = [];
    const emailAddressValues: string[] = [];
    let dataFound = false;
    while (!dataFound) {
      const rowCount = await this.tableRows.count();
      for (let i = 1; i < rowCount; i++) {
        const columns = this.tableRows.nth(i).getByRole('cell');
        const firstName = confirmStringNotNull(await columns.nth(0).textContent());
        firstNameValues.push(firstName);
        const lastName = confirmStringNotNull(await columns.nth(1).textContent());
        lastNameValues.push(lastName);
        const emailAddress = confirmStringNotNull(await columns.nth(2).textContent());
        emailAddressValues.push(emailAddress);
      }
      if ((await this.next_button.isVisible()) && !(await this.next_button.isDisabled())) {
        await this.next_button.click();
        await this.page.waitForLoadState('domcontentloaded');
      } else {
        dataFound = true;
      }
    }
    const userMap = new Map([
      ['firstNameValues', firstNameValues],
      ['lastNameValues', lastNameValues],
      ['emailAddressValues', emailAddressValues],
    ]);
    return userMap;
  }
  async getAllUsersFromTheTable(): Promise<Map<string, string[]>> {
    const searchResultValues: string[] = [];
    await this.page.waitForLoadState('domcontentloaded');
    await this.page.waitForTimeout(3000);
    let dataFound = false;
    while (!dataFound) {
      const rowCount = await this.tableRows.count();
      for (let i = 1; i < rowCount; i++) {
        const columns = this.tableRows.nth(i).getByRole('cell');
        const firstName = confirmStringNotNull(await columns.nth(0).textContent());
        const lastName = confirmStringNotNull(await columns.nth(1).textContent());
        const emailAddress = confirmStringNotNull(await columns.nth(2).textContent());
        searchResultValues.push(firstName + '|' + lastName + '|' + emailAddress);
      }
      if ((await this.next_button.isVisible()) && !(await this.next_button.isDisabled())) {
        await this.next_button.click();
        await this.page.waitForLoadState('domcontentloaded');
      } else {
        dataFound = true;
      }
    }
    const searchResultMap = new Map([['searchResultValues', searchResultValues]]);
    return searchResultMap;
  }

  async getAllOrgNamesFromTheTable(): Promise<Map<string, string[]>> {
    const searchResultValues: string[] = [];
    let pageCount = 0;
    const maxPages = 3;
    while (pageCount < maxPages) {
      const rowCount = await this.tableRows.count();
      for (let i = 1; i < rowCount; i++) {
        const columns = this.tableRows.nth(i).getByRole('cell');
        const orgName = confirmStringNotNull(await columns.nth(0).textContent());
        searchResultValues.push(orgName);
      }
      const hasNext = (await this.next_button.isVisible()) && !(await this.next_button.isDisabled());
      if (hasNext && pageCount < maxPages - 1) {
        await this.next_button.click();
        await this.page.waitForLoadState('domcontentloaded');
        pageCount++;
      } else {
        break;
      }
    }
    return new Map([['searchResultValues', searchResultValues]]);
  }

  async validateSearchResults(userListAfterSearch: any, searchKey: string) {
    for (const val of userListAfterSearch) {
      if (val.includes(searchKey)) {
        return true;
      }
    }
    return false;
  }

  async validateSearchResultsMultipleWordsSearchKey(results: string[], searchTerms: string[]) {
    const matchesSearchTerm = (text: string) =>
      searchTerms.some((term) => text.toLowerCase().includes(term.toLowerCase()));
    const resultsAfterFiltering = confirmArrayNotNull(results).filter(matchesSearchTerm);
    return resultsAfterFiltering;
  }

  async getTopMenuBarLinksNames() {
    const topMenuBarLinksValues: string[] = [];
    for (const val of await this.topMenuBarLinks.allTextContents()) {
      topMenuBarLinksValues.push(confirmStringNotNull(val));
    }
    return topMenuBarLinksValues;
  }

  async getPaginationResults(): Promise<string> {
    const paginationResultsActualValues = confirmStringNotNull(await this.pagination_results.textContent());
    return paginationResultsActualValues;
  }

  async getPageNumber(currentUrl: string) {
    const parts: string[] = currentUrl.split('?');
    const pageName: string[] = parts[1].split('&');
    const pageNumber = parseInt(pageName[0].split('=')[1], 10);
    return pageNumber;
  }

  async getTotalItems() {
    const paginationResults = await this.getPaginationResults();
    const paginationResultsParts: string[] = paginationResults.split(' results');
    const paginationResultsPartsOne: string[] = paginationResultsParts[0].split('Showing ');
    const paginationResultsPartsTwo: string[] = paginationResultsPartsOne[1].split(' of ');
    const totalItems = parseInt(paginationResultsPartsTwo[1], 10);
    return totalItems;
  }
  async getItemsPerPage() {
    const rowCount = await this.tableRows.count();
    return rowCount;
  }

  async clickOnNavigationButton(button: Locator) {
    const isButtonVisible = await button.isVisible();
    if (isButtonVisible) {
      await button.click();
      await this.page.waitForLoadState('domcontentloaded');
    }
  }

  async clickOnNextLink() {
    await this.clickOnNavigationButton(this.next_button);
  }

  async clickOnPreviousLink() {
    await this.clickOnNavigationButton(this.previous_button);
  }

  async getLocatorforNextPreviousLinks(linkLabel: string) {
    let locatorVal: Locator;
    if (linkLabel === 'Next') {
      locatorVal = this.next_button;
    } else if (linkLabel === 'Previous') {
      locatorVal = this.previous_button;
    } else {
      throw new Error(`Unsupported link label: ${linkLabel}`);
    }
    return locatorVal;
  }

  async getPaginationValues() {
    const items = await this.pagination_items.allTextContents();
    const ellipsisIndices: number[] = [];
    const allVisibleItems: any[] = [];
    for (let i = 0; i < items.length; i++) {
      const text = items[i].trim();
      allVisibleItems.push(text);
      if (text === '⋯') {
        ellipsisIndices.push(i);
      }
    }
    const itemsMap = new Map([
      ['ellipsisIndices', ellipsisIndices],
      ['allVisibleItems', allVisibleItems],
      ['items', items],
    ]);
    return itemsMap;
  }

  async getVisiblePages(itemsValues: any[]) {
    const visiblePages = itemsValues
      .map((text) => text.trim())
      .filter((text) => /^\d+$/.test(text))
      .map(Number);
    const visiblePagesMap = new Map([['visiblePages', visiblePages]]);
    return visiblePagesMap;
  }
  async getStartEndPages(i: number, pageSize: number, totalItems: number) {
    const start = (i - 1) * pageSize + 1;
    const end = Math.min(i * pageSize, totalItems);
    const startEndPagesMap = new Map([
      ['start', start],
      ['end', end],
    ]);
    return startEndPagesMap;
  }

  async clickOnPages(currentPageNumber: number, navigateMethod: string) {
    const currentPageLink = this.pagination.getByRole('link', { name: `Page ${currentPageNumber}`, exact: true });
    if (navigateMethod === 'clicking on page number') {
      if (await currentPageLink.isVisible()) {
        await currentPageLink.click();
        await this.page.waitForLoadState('domcontentloaded');
      }
    }
    return currentPageLink;
  }

  async getTotalPages(): Promise<number> {
    const count = await this.pageLinks.count();
    let maxPage = 1;
    const regex = /^Page (\d+)$/;
    for (let i = 0; i < count; i++) {
      const label = await this.pageLinks.nth(i).getAttribute('aria-label');
      const match = regex.exec(label ?? '');
      if (match) {
        const num = parseInt(match[1], 10);
        if (num > maxPage) maxPage = num;
      }
    }
    return maxPage;
  }

  async splitSearchTerm(term: string) {
    return term.trim().split(/\s+/);
  }

  async filterResults(results: string[], searchTerms: string[]) {
    return results.filter((result) => searchTerms.every((term) => result.toLowerCase().includes(term.toLowerCase())));
  }

  async clearCheckboxes(dataset: any, keys: string[], commonItemsPage: any, createUserProfilePage: any) {
    for (const key of keys) {
      if (Object.prototype.hasOwnProperty.call(dataset, key)) {
        await commonItemsPage.clearUIComponent(dataset, key, createUserProfilePage);
      }
    }
  }

  async captureLargeSizeScreenshot(page: Page, outputFile: string) {
    const viewportHeight = page.viewportSize()?.height || 800;
    const scrollHeight = await page.evaluate(() => {
      return document.documentElement.scrollHeight;
    });
    const totalParts = Math.ceil(scrollHeight / viewportHeight);
    const screenshotBuffers: Buffer[] = [];
    for (let i = 0; i < totalParts; i++) {
      const scrollY = i * viewportHeight;
      await page.evaluate((y) => window.scrollTo(0, y), scrollY);
      await page.waitForTimeout(300);
      const buf = await page.screenshot();
      screenshotBuffers.push(buf);
    }
    const images = await Promise.all(screenshotBuffers.map((b) => sharp(b).metadata()));
    const width = images[0].width;
    const heights = images.map((i) => i.height);
    const totalHeight = heights.reduce((a, b) => a + b, 0);
    const stitchedImage = sharp({
      create: {
        width,
        height: totalHeight,
        channels: 4,
        background: { r: 255, g: 255, b: 255, alpha: 1 },
      },
    });
    const composites = screenshotBuffers.map((input, index) => ({
      input,
      top: heights.slice(0, index).reduce((a, b) => a + b, 0),
      left: 0,
    }));
    await stitchedImage.composite(composites).toFile(outputFile);
  }
}
