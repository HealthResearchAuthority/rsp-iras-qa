import { expect, Locator, Page } from '@playwright/test';
import * as buttonTextData from '../../resources/test_data/common/button_text_data.json';
import * as linkTextData from '../../resources/test_data/common/link_text_data.json';
import fs from 'fs';
import path from 'path';
import * as fse from 'fs-extra';

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
  readonly errorMessageFieldLabel: Locator;
  readonly errorMessageSummaryLabel: Locator;

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
    this.bannerNavBar = this.page.getByLabel('Service information');
    this.bannerLoginBtn = this.bannerNavBar.getByText(this.buttonTextData.Banner.Login, { exact: true });
    this.bannerMyApplications = this.bannerNavBar.getByText(this.linkTextData.Banner.My_Applications, { exact: true });
    this.errorMessageFieldLabel = page.locator('[class$="field-validation-error"]');
    this.errorMessageSummaryLabel = page.locator('div[class="govuk-error-summary"]');
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
  async generateUniqueEmail(keyVal: string, prefix: string): Promise<string> {
    const timestamp = new Date().toISOString().replace(/[-:.TZ]/g, '');
    const domain = keyVal;
    return `${prefix}${timestamp}${domain}`;
  }

  async updateUniqueEmailTestDataJson(filePath: string, updateVal: string) {
    (async () => {
      try {
        const data = await fse.readJson(filePath);
        data.Create_User_Profile.email_address_unique = updateVal;
        await fse.writeJson(filePath, data, { spaces: 2 });
      } catch (error) {
        console.error('Error updating prefix:', error);
      }
    })();
  }

  async removeUnwantedChars(value: string | null): Promise<string> {
    const safe_val = value ?? 'default value';
    const actual_val = safe_val.replace(/\s+/g, ' ').trim();
    return actual_val;
  }

  async validateFieldErrorMessage<PageObject>(errorMessageFieldDataset: string, key: string, page: PageObject) {
    const locator: Locator = page[key];
    const otherLocator = locator.locator('..').locator(this.errorMessageFieldLabel);
    await expect(otherLocator).toHaveText(errorMessageFieldDataset[key]);
  }

  pathToTestDataJson =
    './src/resources/test_data/iras/reviewResearch/userAdministration/manageUsers/pages/create_user_profile_page_data.json';
  async validateSelectedValues<PageObject>(dataset: JSON, key: string, page: PageObject) {
    const locator: Locator = page[key];
    if (key === 'email_address_text') {
      const filePath = path.resolve(this.pathToTestDataJson);
      const data = await fse.readJson(filePath);
      expect(await this.removeUnwantedChars(await locator.textContent())).toBe(
        data.Create_User_Profile.email_address_unique
      );
    } else if (key === 'country_checkbox' || key === 'access_required_checkbox') {
      expect(await this.removeUnwantedChars(await locator.textContent())).toBe(dataset[key][0]);
    } else {
      expect(await this.removeUnwantedChars(await locator.textContent())).toBe(dataset[key]);
    }
  }

  async validateSelectedValuesCreateUser<PageObject>(dataset: JSON, key: string, page: PageObject) {
    const locator: Locator = page[key];
    const typeAttribute = await locator.first().getAttribute('type');
    if (typeAttribute === 'text' || typeAttribute === 'date' || typeAttribute === 'tel') {
      expect(await this.removeUnwantedChars(await locator.getAttribute('value'))).toBe(dataset[key]);
    } else if (typeAttribute === 'radio') {
      expect(await locator.locator('..').getByLabel(dataset[key], { exact: true }).isChecked());
    } else if (typeAttribute === 'checkbox') {
      for (const checkbox of dataset[key]) {
        expect(await locator.locator('..').getByLabel(checkbox, { exact: true }).isChecked());
      }
    } else if (typeAttribute === 'email') {
      if (key === 'email_address_text') {
        const filePath = path.resolve(this.pathToTestDataJson);
        const data = await fse.readJson(filePath);
        expect(await this.removeUnwantedChars(await locator.getAttribute('value'))).toBe(
          data.Create_User_Profile.email_address_unique
        );
      }
    } else {
      const isSelectTag = await locator.evaluate((el) => el.tagName.toLowerCase() === 'select');
      if (isSelectTag) {
        expect(
          await this.removeUnwantedChars(
            await this.page.locator('select option[selected=selected]').getAttribute('value')
          )
        ).toBe(dataset[key]);
      }
    }
  }

  async clearUIComponent<PageObject>(dataset: JSON, key: string, page: PageObject) {
    const locator: Locator = page[key];
    const typeAttribute = await locator.first().getAttribute('type');
    if (typeAttribute === 'text' || typeAttribute === 'date' || typeAttribute === 'email' || typeAttribute === 'tel') {
      await locator.clear();
    } else if (typeAttribute === 'radio') {
      if (await locator.locator('..').getByLabel(dataset[key], { exact: true }).isChecked()) {
        await locator.locator('..').getByLabel(dataset[key], { exact: true }).uncheck();
        expect(await locator.locator('..').getByLabel(dataset[key], { exact: true }).isChecked()).toBeFalsy();
      }
    } else if (typeAttribute === 'checkbox') {
      for (const checkbox of dataset[key]) {
        if (await locator.locator('..').getByLabel(checkbox, { exact: true }).isChecked()) {
          await locator.locator('..').getByLabel(checkbox, { exact: true }).uncheck();
          expect(await locator.locator('..').getByLabel(checkbox, { exact: true }).isChecked()).toBeFalsy();
        }
      }
    } else {
      const isSelectTag = await locator.evaluate((el) => el.tagName.toLowerCase() === 'select');
      if (isSelectTag) {
        await locator.selectOption({ label: '' });
      }
    }
  }
}
