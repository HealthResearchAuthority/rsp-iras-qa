import { Locator, Page } from '@playwright/test';
import * as projectPersonnelChangePrincipalInvestigatorModificationPageTestData from '../../../../resources/test_data/iras/make_changes/modifications/project_personnel_change_principal_investigator_data.json';
import CommonItemsPage from '../../../Common/CommonItemsPage';

//Declare Page Objects
export default class ProjectPersonnelChangePrincipalInvestigatorPage {
  readonly page: Page;
  readonly projectPersonnelChangePrincipalInvestigatorModificationPageTestData: typeof projectPersonnelChangePrincipalInvestigatorModificationPageTestData;
  readonly select_details_to_change_radio: Locator;
  readonly principal_investigator_email_text: Locator;
  readonly name_text: Locator;

  //Initialize Page Objects
  constructor(page: Page) {
    this.page = page;
    this.projectPersonnelChangePrincipalInvestigatorModificationPageTestData =
      projectPersonnelChangePrincipalInvestigatorModificationPageTestData;

    //Locators
    this.select_details_to_change_radio = this.page.getByTestId(/^IQA0989/);
    this.principal_investigator_email_text = this.page.getByTestId(/^(IQA0633_Text|IQA0573_Text)$/);
    this.name_text = this.page
      .getByText(this.projectPersonnelChangePrincipalInvestigatorModificationPageTestData.Label_Texts.name_label, {
        exact: true,
      })
      .locator('..')
      .locator('input');
  }

  //Page Methods
  async fillPersonnelChangePrincipalInvestigatorModificationsPage(dataset: any, action: string) {
    const commonItemsPage = new CommonItemsPage(this.page);
    const clickAction = action === 'create' ? 'Save_Continue' : 'Save_Changes';
    if (Object.hasOwn(dataset, 'select_details_to_change_radio')) {
      await commonItemsPage.fillUIComponent(dataset, 'select_details_to_change_radio', this);
    }
    await commonItemsPage.clickButton('Modifications_Page', clickAction);
    const ExpectedKeys = ['principal_investigator_email_text', 'name_text'];
    for (const key of ExpectedKeys) {
      if (Object.hasOwn(dataset, key)) {
        await commonItemsPage.fillUIComponent(dataset, key, this);
      }
    }
    await commonItemsPage.clickButton('Modifications_Page', clickAction);
  }
}
