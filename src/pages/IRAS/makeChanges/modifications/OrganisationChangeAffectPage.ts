import { Locator, Page } from '@playwright/test';
import * as organisationChangeAffectPageTestData from '../../../../resources/test_data/iras/make_changes/modifications/organisation_change_affect_data.json';

//Declare Page Objects
export default class OrganisationChangeAffectPage {
  readonly page: Page;
  readonly organisationChangeAffectPageTestData: typeof organisationChangeAffectPageTestData;
  readonly which_organisation_affect_hint_label: Locator;
  readonly which_organisation_change_affect_checkbox: Locator;

  //Initialize Page Objects
  constructor(page: Page) {
    this.page = page;
    this.organisationChangeAffectPageTestData = organisationChangeAffectPageTestData;

    //Locators
    this.which_organisation_affect_hint_label = this.page.locator('.govuk-hint');
    this.which_organisation_change_affect_checkbox = this.page.locator('.govuk-checkboxes__input');
  }

  //Page Methods
}
