import { Locator, Page, expect } from '@playwright/test';
import * as affectedOrganisationQuestionsPageTestData from '../../../../../resources/test_data/iras/make_changes/modifications/change_planned_end_date/affected_organisation_questions_data.json';
import * as linkTextData from '../../../../../resources/test_data/common/link_text_data.json';

//Declare Page Objects
export default class ChangePlannedEndDateAffectedOrganisationQuestionsPage {
  readonly page: Page;
  readonly affectedOrganisationQuestionsPageTestData: typeof affectedOrganisationQuestionsPageTestData;
  // readonly which_organisation_affect_hint_label: Locator;
  // readonly which_organisation_change_affect_checkbox: Locator;
  readonly linkTextData: typeof linkTextData;
  readonly pageHeading: Locator;
  readonly where_organisation_change_affect_nhs_question_label: Locator;
  readonly checkbox_fieldset: Locator;
  readonly where_organisation_change_affect_nhs_question_checkbox: Locator;
  readonly where_organisation_change_affect_non_nhs_question_checkbox: Locator;
  readonly will_some_or_all_organisations_be_affected_question_label: Locator;
  readonly will_some_or_all_organisations_radio_fieldset: Locator;
  readonly will_some_or_all_organisations_be_affected_question_radio: Locator;
  readonly will_nhs_hsc_organisations_require_additional_resources_question_label: Locator;
  readonly will_nhs_hsc_organisations_require_additional_resources_question_radio_fieldset: Locator;
  readonly will_nhs_hsc_organisations_require_additional_resources_question_radio: Locator;
  readonly remove_this_change_link: Locator;

  //Initialize Page Objects
  constructor(page: Page) {
    this.page = page;
    this.affectedOrganisationQuestionsPageTestData = affectedOrganisationQuestionsPageTestData;
    this.linkTextData = linkTextData;

    //Locators
    this.pageHeading = this.page
      .getByRole('heading', { level: 1 })
      .getByText(affectedOrganisationQuestionsPageTestData.Label_Texts.page_heading_label);

    this.where_organisation_change_affect_nhs_question_label = this.page
      .locator('.govuk-label')
      .getByText(
        this.affectedOrganisationQuestionsPageTestData.Label_Texts.where_organisation_change_affect_nhs_question_label
      );

    this.where_organisation_change_affect_nhs_question_checkbox = this.page
      .getByTestId('SelectedLocations_checkboxes')
      .getByRole('checkbox');

    this.where_organisation_change_affect_non_nhs_question_checkbox = this.page
      .getByTestId('SelectedLocations_checkboxes')
      .getByRole('checkbox');

    this.will_some_or_all_organisations_be_affected_question_label = this.page
      .locator('.govuk-label')
      .getByText(
        this.affectedOrganisationQuestionsPageTestData.Label_Texts
          .will_some_or_all_organisations_be_affected_question_label,
        { exact: true }
      );
    this.will_some_or_all_organisations_radio_fieldset = this.page.locator('.govuk-form-group', {
      has: this.will_some_or_all_organisations_be_affected_question_label,
    });
    this.will_some_or_all_organisations_be_affected_question_radio =
      this.will_some_or_all_organisations_radio_fieldset.getByRole('radio');

    this.will_nhs_hsc_organisations_require_additional_resources_question_label = this.page
      .locator('.govuk-label')
      .getByText(
        this.affectedOrganisationQuestionsPageTestData.Label_Texts
          .will_nhs_hsc_organisations_require_additional_resources_question_label,
        { exact: true }
      );
    this.will_nhs_hsc_organisations_require_additional_resources_question_radio_fieldset = this.page.locator(
      '.govuk-form-group',
      {
        has: this.will_nhs_hsc_organisations_require_additional_resources_question_label,
      }
    );
    this.will_nhs_hsc_organisations_require_additional_resources_question_radio =
      this.will_nhs_hsc_organisations_require_additional_resources_question_radio_fieldset.getByRole('radio');

    this.remove_this_change_link = this.page.getByRole('link', {
      name: this.linkTextData.Participating_Organisations_Page.Remove_This_Change,
      exact: true,
    });
  }

  //Page Methods
  async assertOnAffectedOrganisationQuestionsPage() {
    await expect(this.pageHeading).toBeVisible();
    const currentUrl = this.page.url();
    expect(currentUrl).toContain('projectmodification/affectingorganisations');
  }
}
