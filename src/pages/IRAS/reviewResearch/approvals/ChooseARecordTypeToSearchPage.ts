import { expect, Locator, Page } from '@playwright/test';
import * as chooseARecordTypeToSearchPageTestData from '../../../../resources/test_data/iras/reviewResearch/approvals/choose_a_record_type_to_search_page_data.json';
import * as buttonTextData from '../../../../resources/test_data/common/button_text_data.json';
import * as linkTextData from '../../../../resources/test_data/common/link_text_data.json';

//Declare Page Objects
export default class ChooseARecordTypeToSearchPage {
  readonly page: Page;
  readonly chooseARecordTypeToSearchPageTestData: typeof chooseARecordTypeToSearchPageTestData;
  readonly buttonTextData: typeof buttonTextData;
  readonly linkTextData: typeof linkTextData;
  readonly pageHeading: Locator;
  readonly recordType_radio: Locator;

  //Initialize Page Objects
  constructor(page: Page) {
    this.page = page;
    this.chooseARecordTypeToSearchPageTestData = chooseARecordTypeToSearchPageTestData;
    this.buttonTextData = buttonTextData;
    this.linkTextData = linkTextData;

    //Locators
    this.pageHeading = this.page
      .getByRole('heading')
      .getByText(this.chooseARecordTypeToSearchPageTestData.Choose_A_Record_Type_To_Search_Page.pageHeading);
    this.recordType_radio = this.page.locator('.govuk-radios__item');
  }

  //Page Methods
  async goto() {
    await this.page.goto('');
  }

  async assertOnChooseARecordTypeToSearchPage() {
    await expect(this.pageHeading).toBeVisible();
  }

  async selectRecordTypeToSearch(recordType: string) {
    const locatorVal: Locator = this.recordType_radio
      .filter({
        has: this.page.getByText(recordType),
      })
      .getByRole('radio');

    const typeAttribute = await locatorVal.first().getAttribute('type');
    if (typeAttribute === 'radio') {
      await locatorVal.check();
    }
    return locatorVal;
  }
}
