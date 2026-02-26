import { Locator, Page } from '@playwright/test';
import * as projectPersonnelChangePrincipalInvestigatorModificationPageTestData from '../../../../resources/test_data/iras/make_changes/modifications/project_personnel_change_principal_investigator_data.json';
import CommonItemsPage from '../../../Common/CommonItemsPage';

//Declare Page Objects
export default class ProjectPersonnelChangePrincipalInvestigatorPage {
  readonly page: Page;
  readonly projectPersonnelChangePrincipalInvestigatorModificationPageTestData: typeof projectPersonnelChangePrincipalInvestigatorModificationPageTestData;
  readonly new_principal_investigator_email_text: Locator;
  readonly name_text: Locator;
  readonly new_principal_investigator_first_name_text: Locator;
  readonly new_principal_investigator_last_name_text: Locator;

  //Initialize Page Objects
  constructor(page: Page) {
    this.page = page;
    this.projectPersonnelChangePrincipalInvestigatorModificationPageTestData =
      projectPersonnelChangePrincipalInvestigatorModificationPageTestData;

    //Locators
    this.new_principal_investigator_email_text = this.page
      .getByTestId('IQA0573_Text')
      .or(this.page.getByTestId('IQA0633_Text'));
    this.name_text = this.page
      .getByText(this.projectPersonnelChangePrincipalInvestigatorModificationPageTestData.Label_Texts.name_label, {
        exact: true,
      })
      .locator('..')
      .locator('input');
    this.new_principal_investigator_first_name_text = this.page
      .getByText(
        this.projectPersonnelChangePrincipalInvestigatorModificationPageTestData.Label_Texts
          .new_principal_investigator_first_name_label,
        {
          exact: true,
        }
      )
      .locator('..')
      .locator('input');
    this.new_principal_investigator_last_name_text = this.page
      .getByText(
        this.projectPersonnelChangePrincipalInvestigatorModificationPageTestData.Label_Texts
          .new_principal_investigator_last_name_label,
        {
          exact: true,
        }
      )
      .locator('..')
      .locator('input');
  }

  //Page Methods
  async fillPersonnelChangePrincipalInvestigatorModificationsPage(dataset: any, action: string) {
    const commonItemsPage = new CommonItemsPage(this.page);
    const clickAction = action === 'create' ? 'Save_Continue' : 'Save_Changes';
    const ExpectedKeys = [
      'new_principal_investigator_email_text',
      'new_principal_investigator_first_name_text',
      'new_principal_investigator_last_name_text',
      'name_text',
    ];
    for (const key of ExpectedKeys) {
      if (Object.hasOwn(dataset, key)) {
        await commonItemsPage.fillUIComponent(dataset, key, this);
      }
    }
    await commonItemsPage.clickButton('Modifications_Page', clickAction);
  }
}
