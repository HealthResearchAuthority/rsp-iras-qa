import { Locator, Page } from '@playwright/test';
import * as contactDetailsModificationPageTestData from '../../../../resources/test_data/iras/make_changes/modifications/contact_details_modification_data.json';
import CommonItemsPage from '../../../Common/CommonItemsPage';

//Declare Page Objects
export default class ContactDetailsModificationPage {
  readonly page: Page;
  readonly contactDetailsModificationPageTestData: typeof contactDetailsModificationPageTestData;
  readonly select_contact_details_to_change_radio: Locator;
  readonly chief_investigator_email_text: Locator;
  readonly sponsor_contact_email_text: Locator;
  readonly contact_name_text: Locator;
  readonly contact_email_text: Locator;

  //Initialize Page Objects
  constructor(page: Page) {
    this.page = page;
    this.contactDetailsModificationPageTestData = contactDetailsModificationPageTestData;

    //Locators
    this.select_contact_details_to_change_radio = this.page.getByTestId(/^IQA0532/);
    this.chief_investigator_email_text = this.page.getByLabel(
      this.contactDetailsModificationPageTestData.Label_Texts.chief_investigator_email_label,
      { exact: true }
    );
    this.sponsor_contact_email_text = this.page.getByLabel(
      this.contactDetailsModificationPageTestData.Label_Texts.sponsor_contact_email_label,
      { exact: true }
    );
    this.contact_name_text = this.page.getByLabel(
      this.contactDetailsModificationPageTestData.Label_Texts.contact_name_label,
      { exact: true }
    );
    this.contact_email_text = this.page.getByLabel(
      this.contactDetailsModificationPageTestData.Label_Texts.contact_email_label,
      { exact: true }
    );
  }

  //Page Methods
  async fillContactDetailsModificationsPage(dataset: any, action: string) {
    const commonItemsPage = new CommonItemsPage(this.page);
    for (const key in dataset) {
      if (Object.hasOwn(dataset, key)) {
        if (key === 'select_contact_details_to_change_radio') {
          await commonItemsPage.fillUIComponent(dataset, key, this);
        }
      }
    }
    if (action === 'create') {
      await commonItemsPage.clickButton('Modifications_Page', 'Save_Continue');
    } else {
      await commonItemsPage.clickButton('Modifications_Page', 'Save_Changes');
    }
    for (const key in dataset) {
      if (Object.hasOwn(dataset, key)) {
        if (
          key === 'chief_investigator_email_text' ||
          key === 'sponsor_contact_email_text' ||
          key === 'contact_name_text' ||
          key === 'contact_email_text'
        ) {
          await commonItemsPage.fillUIComponent(dataset, key, this);
        }
      }
    }
    if (action === 'create') {
      await commonItemsPage.clickButton('Modifications_Page', 'Save_Continue');
    } else {
      await commonItemsPage.clickButton('Modifications_Page', 'Save_Changes');
    }
  }
}
