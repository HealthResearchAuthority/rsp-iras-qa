import { Locator, Page } from '@playwright/test';
import * as projectPersonnelChangeChiefInvestigatorModificationPageTestData from '../../../../resources/test_data/iras/make_changes/modifications/project_personnel_change_chief_investigator_data.json';
import CommonItemsPage from '../../../Common/CommonItemsPage';

//Declare Page Objects
export default class ProjectPersonnelChangeChiefInvestigatorPage {
  readonly page: Page;
  readonly projectPersonnelChangeChiefInvestigatorModificationPageTestData: typeof projectPersonnelChangeChiefInvestigatorModificationPageTestData;
  readonly select_details_to_change_radio: Locator;
  readonly new_chief_investigator_email_text: Locator;
  readonly name_text: Locator;
  readonly new_chief_investigator_first_name_text: Locator;
  readonly new_chief_investigator_last_name_text: Locator;

  //Initialize Page Objects
  constructor(page: Page) {
    this.page = page;
    this.projectPersonnelChangeChiefInvestigatorModificationPageTestData =
      projectPersonnelChangeChiefInvestigatorModificationPageTestData;

    //Locators
    this.select_details_to_change_radio = this.page.getByTestId(/^IQA0889/);
    this.new_chief_investigator_email_text = this.page
      .getByTestId('IQA0311_Text')
      .or(this.page.getByTestId('IQA0319_Text'));

    this.new_chief_investigator_first_name_text = this.page
      .getByText(this.projectPersonnelChangeChiefInvestigatorModificationPageTestData.Label_Texts.first_name_label, {
        exact: true,
      })
      .locator('..')
      .locator('input');

    this.new_chief_investigator_last_name_text = this.page
      .getByText(this.projectPersonnelChangeChiefInvestigatorModificationPageTestData.Label_Texts.last_name_label, {
        exact: true,
      })
      .locator('..')
      .locator('input');
  }

  //Page Methods
  async fillPersonnelChangeChiefInvestigatorModificationsPage(dataset: any, action: string) {
    const commonItemsPage = new CommonItemsPage(this.page);
    const clickAction = action === 'create' ? 'Save_Continue' : 'Save_Changes';
    const ExpectedKeys = [
      'new_chief_investigator_email_text',
      'new_chief_investigator_first_name_text',
      'new_chief_investigator_last_name_text',
    ];
    for (const key of ExpectedKeys) {
      if (Object.hasOwn(dataset, key)) {
        await commonItemsPage.fillUIComponent(dataset, key, this);
      }
    }
    await commonItemsPage.clickButton('Modifications_Page', clickAction);
  }
}
