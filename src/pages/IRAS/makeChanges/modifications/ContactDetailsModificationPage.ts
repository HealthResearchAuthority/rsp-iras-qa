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
  readonly name_text: Locator;
  readonly email_text: Locator;

  //Initialize Page Objects
  constructor(page: Page) {
    this.page = page;
    this.contactDetailsModificationPageTestData = contactDetailsModificationPageTestData;

    //Locators
    this.select_contact_details_to_change_radio = this.page.getByTestId(/^IQA0532/);
    this.chief_investigator_email_text = this.page
      .getByText(this.contactDetailsModificationPageTestData.Label_Texts.chief_investigator_email_label)
      .locator('..')
      .locator('input');
    this.sponsor_contact_email_text = this.page
      .getByText(this.contactDetailsModificationPageTestData.Label_Texts.sponsor_contact_email_label)
      .locator('..')
      .locator('input');
    this.name_text = this.page
      .getByText(this.contactDetailsModificationPageTestData.Label_Texts.contact_name_label)
      .locator('..')
      .locator('input');
    this.email_text = this.page
      .getByText(this.contactDetailsModificationPageTestData.Label_Texts.contact_email_label)
      .locator('..')
      .locator('input');
  }

  //Page Methods
  async fillContactDetailsModificationsPage(dataset: any, action: string) {
    const commonItemsPage = new CommonItemsPage(this.page);
    const clickAction = action === 'create' ? 'Save_Continue' : 'Save_Changes';
    if (Object.hasOwn(dataset, 'select_contact_details_to_change_radio')) {
      await commonItemsPage.fillUIComponent(dataset, 'select_contact_details_to_change_radio', this);
    }
    await commonItemsPage.clickButton('Modifications_Page', clickAction);
    const contactKeys = ['chief_investigator_email_text', 'sponsor_contact_email_text', 'name_text', 'email_text'];
    for (const key of contactKeys) {
      if (Object.hasOwn(dataset, key)) {
        await commonItemsPage.fillUIComponent(dataset, key, this);
      }
    }
    await commonItemsPage.clickButton('Modifications_Page', clickAction);
  }
}
