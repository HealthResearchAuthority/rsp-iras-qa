import { Locator, Page } from '@playwright/test';
import * as affectedOrganisationSelectionPageTestData from '../../../../../resources/test_data/iras/make_changes/modifications/applicabilityScreens/affected_organisation_selection_data.json';
import CommonItemsPage from '../../../../Common/CommonItemsPage';

//Declare Page Objects
export default class AffectedOrganisationSelectionPage {
  readonly page: Page;
  readonly affectedOrganisationSelectionPageTestData: typeof affectedOrganisationSelectionPageTestData;
  readonly which_organisation_affect_hint_label: Locator;
  readonly which_organisation_change_affect_checkbox: Locator;
  readonly which_organisation_change_affect_nhs_hsc_checkbox: Locator;
  readonly which_organisation_change_affect_non_nhs_hsc_checkbox: Locator;

  //Initialize Page Objects
  constructor(page: Page) {
    this.page = page;
    this.affectedOrganisationSelectionPageTestData = affectedOrganisationSelectionPageTestData;
    //SelectedOrganisationTypes_Non-NHS/HSC
    //Locators
    this.which_organisation_affect_hint_label = this.page.locator('.govuk-hint');
    this.which_organisation_change_affect_checkbox = this.page.locator('.govuk-checkboxes__input');
    this.which_organisation_change_affect_nhs_hsc_checkbox = this.page.getByTestId('SelectedOrganisationTypes_NHS/HSC');
    this.which_organisation_change_affect_non_nhs_hsc_checkbox = this.page.getByTestId(
      'SelectedOrganisationTypes_Non-NHS/HSC'
    );
  }
  //Page Methods
  async fillAffectedOrganisation(dataset: any, action: string) {
    const commonItemsPage = new CommonItemsPage(this.page);
    for (const key in dataset) {
      if (Object.hasOwn(dataset, key)) {
        if (key === 'which_organisation_change_affect_checkbox') {
          await commonItemsPage.fillUIComponent(dataset, key, this);
        }
      }
    }
    if (action === 'create') {
      await commonItemsPage.clickButton('Modifications_Page', 'Save_Continue');
    } else {
      await commonItemsPage.clickButton('Affected_Organisation_Selection_Page', 'Save_Changes');
    }
  }
}
