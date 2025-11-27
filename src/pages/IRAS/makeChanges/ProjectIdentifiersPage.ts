import { expect, Locator, Page } from '@playwright/test';
import * as projectIdentifiersPageTestData from '../../../resources/test_data/iras/make_changes/project_identifiers_page_data.json';
import * as buttonTextData from '../../../resources/test_data/common/button_text_data.json';
import { getCurrentDate } from '../../../utils/UtilFunctions';

//Declare Page Objects
export default class ProjectIdentifiersPage {
  readonly page: Page;
  readonly projectIdentifiersPageTestData: typeof projectIdentifiersPageTestData;
  readonly buttonTextData: typeof buttonTextData;
  readonly pageHeading: Locator;
  readonly primary_sponsor_organisation_text: Locator;
  readonly primary_sponsor_organisation_header_label: Locator;
  readonly primary_sponsor_organisation_jsenabled_text: Locator;
  readonly primary_sponsor_organisation_suggestion_list_labels: Locator;
  readonly primary_sponsor_organisation_suggestion_listbox: Locator;
  readonly primary_sponsor_organisation_jsdisabled_search_button: Locator;
  readonly primary_sponsor_organisation_jsdisabled_search_results_radio_button: Locator;
  readonly primary_sponsor_organisation_jsdisabled_result_hint_label: Locator;
  readonly primary_sponsor_organisation_jsdisabled_search_results_labels: Locator;
  readonly primary_sponsor_organisation_jsdisabled_narrow_down_label: Locator;
  readonly primary_sponsor_organisation_jsdisabled_no_suggestions_label: Locator;
  readonly primary_sponsor_organisation_jsdisabled_min_error_message: Locator;
  readonly primary_sponsor_organisation_filled_text: Locator;
  private _currentDate: string;

  //Initialize Page Objects
  constructor(page: Page) {
    this.page = page;
    this.projectIdentifiersPageTestData = projectIdentifiersPageTestData;
    this._currentDate = '';

    //Locators
    this.pageHeading = this.page.getByTestId('title');
    this.primary_sponsor_organisation_text = this.page.getByRole('textbox', {
      name: projectIdentifiersPageTestData.Project_Identifiers_Page.primary_sponsor_organisation_header_label,
    });
    this.primary_sponsor_organisation_filled_text = this.page
      .getByTestId('sponsor_org_search')
      .or(this.page.getByTestId('IQA0312_Text_autocomplete'));
    this.primary_sponsor_organisation_jsenabled_text = this.page.locator('#IQA0312_Text_autocomplete');
    this.primary_sponsor_organisation_jsdisabled_search_button = this.page.getByRole('button', {
      name: buttonTextData.Project_Identifiers_Page.Search,
    });
    this.primary_sponsor_organisation_suggestion_list_labels = this.primary_sponsor_organisation_jsenabled_text
      .locator('..')
      .getByRole('option');
    this.primary_sponsor_organisation_suggestion_listbox = this.primary_sponsor_organisation_jsenabled_text
      .locator('..')
      .getByRole('listbox');
    this.primary_sponsor_organisation_jsdisabled_search_results_radio_button = this.page.locator(
      'input[type="radio"][name="SponsorOrgSearch.SelectedOrganisation"]'
    );
    this.primary_sponsor_organisation_jsdisabled_result_hint_label = this.page.getByTestId(
      'SponsorOrgSearch.SelectedOrganisation-hint'
    );
    this.primary_sponsor_organisation_jsdisabled_narrow_down_label = this.page.locator('.govuk-inset-text');
    this.primary_sponsor_organisation_jsdisabled_search_results_labels = this.page
      .locator('.govuk-radios__item')
      .filter({ has: this.page.locator('.govuk-radios__label') });
    this.primary_sponsor_organisation_jsdisabled_no_suggestions_label = this.page.locator('.govuk-inset-text');
  }

  //Page Methods
  async assertOnProjectIdentifiersPage() {
    await expect(this.pageHeading).toBeVisible();
    await expect(this.pageHeading).toHaveText(this.projectIdentifiersPageTestData.Project_Identifiers_Page.heading);
  }

  async getCurrentDate(): Promise<string> {
    return this._currentDate;
  }

  async setCurrentDate(): Promise<void> {
    this._currentDate = await getCurrentDate();
  }
}
