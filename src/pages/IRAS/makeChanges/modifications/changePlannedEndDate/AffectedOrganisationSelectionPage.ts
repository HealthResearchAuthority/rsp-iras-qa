import { Locator, Page } from '@playwright/test';
import * as affectedOrganisationSelectionPageTestData from '../../../../../resources/test_data/iras/make_changes/modifications/change_planned_end_date/affected_organisation_selection_data.json';

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
}
