import { Locator, Page, expect } from '@playwright/test';
import * as affectedOrganisationQuestionsPageTestData from '../../../../../resources/test_data/iras/make_changes/modifications/applicabilityScreens/affected_organisation_questions_data.json';
import * as linkTextData from '../../../../../resources/test_data/common/link_text_data.json';
import CommonItemsPage from '../../../../Common/CommonItemsPage';

//Declare Page Objects
export default class AffectedOrganisationQuestionsPage {
  readonly page: Page;
  readonly affectedOrganisationQuestionsPageTestData: typeof affectedOrganisationQuestionsPageTestData;
  readonly linkTextData: typeof linkTextData;
  readonly pageHeading: Locator;
  readonly where_organisation_change_affect_nhs_question_label: Locator;
  readonly checkbox_fieldset: Locator;
  readonly where_organisation_change_affect_nhs_question_checkbox: Locator;
  readonly where_organisation_change_affect_non_nhs_question_checkbox: Locator;
  readonly where_organisation_change_affect_hint_label: Locator;
  readonly will_some_or_all_organisations_be_affected_question_label: Locator;
  readonly will_some_or_all_organisations_be_affected_hint_label: Locator;
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
      .getByText(affectedOrganisationQuestionsPageTestData.Affected_Organisation_Question_Page.page_heading_label);

    this.where_organisation_change_affect_nhs_question_label = this.page
      .locator('.govuk-fieldset__legend--s')
      .getByText(
        this.affectedOrganisationQuestionsPageTestData.Label_Texts_Nhs_Hsc
          .where_organisation_change_affect_nhs_question_label
      );
    this.where_organisation_change_affect_hint_label = this.page
      .locator('.govuk-hint')
      .getByText(
        this.affectedOrganisationQuestionsPageTestData.Label_Texts_Nhs_Hsc.where_organisation_change_affect_hint_label
      );

    this.will_some_or_all_organisations_be_affected_hint_label = this.page
      .locator('.govuk-hint')
      .getByText(
        this.affectedOrganisationQuestionsPageTestData.Label_Texts_Nhs_Hsc
          .will_some_or_all_organisations_be_affected_hint_label
      );
    this.where_organisation_change_affect_nhs_question_checkbox = this.page
      .getByTestId('Questions[0].Answers_checkboxes')
      .getByRole('checkbox');

    this.where_organisation_change_affect_non_nhs_question_checkbox = this.page
      .getByTestId('Questions[3].Answers_checkboxes')
      .getByRole('checkbox');

    this.will_some_or_all_organisations_be_affected_question_label = this.page
      .locator('.govuk-fieldset__legend--s')
      .getByText(
        this.affectedOrganisationQuestionsPageTestData.Label_Texts_Nhs_Hsc
          .will_some_or_all_organisations_be_affected_question_label,
        { exact: true }
      );
    this.will_some_or_all_organisations_radio_fieldset = this.page.locator('.govuk-form-group', {
      has: this.will_some_or_all_organisations_be_affected_question_label,
    });
    this.will_some_or_all_organisations_be_affected_question_radio =
      this.will_some_or_all_organisations_radio_fieldset.getByRole('radio');

    this.will_nhs_hsc_organisations_require_additional_resources_question_label = this.page
      .locator('.govuk-fieldset__legend--s')
      .getByText(
        this.affectedOrganisationQuestionsPageTestData.Label_Texts_Nhs_Hsc
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
    expect(currentUrl).toContain('affecting-organisations');
  }

  async fillAffectedOrganisationQuestions(dataset: any, action: string) {
    const commonItemsPage = new CommonItemsPage(this.page);
    for (const key in dataset) {
      if (Object.hasOwn(dataset, key)) {
        if (
          key === 'where_organisation_change_affect_nhs_question_checkbox' ||
          key === 'where_organisation_change_affect_non_nhs_question_checkbox' ||
          key === 'will_some_or_all_organisations_be_affected_question_radio' ||
          key === 'will_nhs_hsc_organisations_require_additional_resources_question_radio'
        ) {
          await commonItemsPage.fillUIComponent(dataset, key, this);
        }
      }
    }
    if (action === 'create') {
      await commonItemsPage.clickButton('Modifications_Page', 'Save_Continue');
    } else {
      await commonItemsPage.clickButton('Affected_Organisation_Questions_Page', 'Save_Changes');
    }
  }
}
