import { expect, Locator, Page } from '@playwright/test';
import * as adultsLackingCapacityPageTestData from '../../../resources/test_data/iras/question_set/pages/adults_lacking_capacity_page_data.json';
import { getTextFromElementArray } from '../../../utils/UtilFunctions';

//Declare Page Objects
export default class AdultsLackingCapacityPage {
  readonly page: Page;
  readonly adultsLackingCapacityPageTestData: typeof adultsLackingCapacityPageTestData;
  readonly alc_section_headings: Locator;
  readonly adults_lacking_capacity_ctimp_section: Locator;
  readonly adults_lacking_capacity_non_ctimp_section: Locator;
  readonly how_project_meet_requirement_life_threatening_text: Locator;
  readonly why_project_essential_to_validate_data_text: Locator;
  readonly benefits_administration_investigational_products_expected_text: Locator;
  readonly how_ensure_suitably_qualified_text: Locator;
  readonly arrangements_to_identify_consent_text: Locator;
  readonly arrangements_to_continue_consult_personal_text: Locator;
  readonly provide_information_on_trial_to_participants_text: Locator;
  readonly is_participant_urgent_treatment_recruited_radio: Locator;
  readonly outline_decisions_on_recruited_participants_text: Locator;
  readonly describe_arrangements_informing_relatives_text: Locator;
  readonly what_provisions_apply_if_no_consent_text: Locator;
  readonly steps_to_ensure_when_patricipants_object_text: Locator;
  readonly steps_to_ensure_nothing_done_contrary_to_statement_text: Locator;
  readonly project_connected_impairing_condition_text: Locator;
  readonly why_project_not_carried_out_text: Locator;
  readonly project_has_potential_for_checkbox: Locator;
  readonly describe_project_potential_to_benefit_participant_text: Locator;
  readonly describe_project_contribute_knowledge_text: Locator;
  readonly project_not_interfere_participants_freedom_text: Locator;
  readonly how_ensure_suitably_qualified_experienced_text: Locator;
  readonly arrangements_made_to_identify_consult_induviduals_text: Locator;
  readonly scotland_arrangements_made_welfare_guardian_text: Locator;
  readonly arrangements_continue_consult_during_course_text: Locator;
  readonly information_about_trial_to_participants_text: Locator;
  readonly arrangements_for_consent_fluctuate_text: Locator;
  readonly is_participant_urgent_recruited_before_wishes_feelings_radio: Locator;
  readonly seek_agreement_registered_practitioner_text: Locator;
  readonly arrangements_informing_relatives_text: Locator;
  readonly participant_recruited_prior_consent_text: Locator;
  readonly steps_ensure_nothing_done_participant_object_text: Locator;
  readonly steps_ensure_nothing_done_contrary_statement_text: Locator;

  //Initialize Page Objects
  constructor(page: Page) {
    this.page = page;
    this.adultsLackingCapacityPageTestData = adultsLackingCapacityPageTestData;

    //Locators
    this.alc_section_headings = this.page.locator('.govuk-fieldset__legend--l');
    //Adults Lacking Capacity (CTIMP) Section
    this.adults_lacking_capacity_ctimp_section = this.page.locator(
      '//legend[contains(text(),"CTIMP Adults lacking capacity")]/parent::fieldset'
    );
    this.how_project_meet_requirement_life_threatening_text =
      this.adults_lacking_capacity_ctimp_section.getByTestId('IQA0278_Text');
    this.why_project_essential_to_validate_data_text =
      this.adults_lacking_capacity_ctimp_section.getByTestId('IQA0279_Text');
    this.benefits_administration_investigational_products_expected_text =
      this.adults_lacking_capacity_ctimp_section.getByTestId('IQA0280_Text');
    this.how_ensure_suitably_qualified_text = this.adults_lacking_capacity_ctimp_section.getByTestId('IQA0281_Text');
    this.arrangements_to_identify_consent_text = this.adults_lacking_capacity_ctimp_section.getByTestId('IQA0282_Text');
    this.arrangements_to_continue_consult_personal_text =
      this.adults_lacking_capacity_ctimp_section.getByTestId('IQA0283_Text');
    this.provide_information_on_trial_to_participants_text =
      this.adults_lacking_capacity_ctimp_section.getByTestId('IQA0284_Text');
    this.is_participant_urgent_treatment_recruited_radio =
      this.adults_lacking_capacity_ctimp_section.getByTestId(/^IQA0285/);
    this.outline_decisions_on_recruited_participants_text =
      this.adults_lacking_capacity_ctimp_section.getByTestId('IQA0286_Text');
    this.describe_arrangements_informing_relatives_text =
      this.adults_lacking_capacity_ctimp_section.getByTestId('IQA0287_Text');
    this.what_provisions_apply_if_no_consent_text =
      this.adults_lacking_capacity_ctimp_section.getByTestId('IQA0288_Text');
    this.steps_to_ensure_when_patricipants_object_text =
      this.adults_lacking_capacity_ctimp_section.getByTestId('IQA0289_Text');
    this.steps_to_ensure_nothing_done_contrary_to_statement_text =
      this.adults_lacking_capacity_ctimp_section.getByTestId('IQA0290_Text');
    //Adults Lacking Capacity (CTIMP) Section
    this.adults_lacking_capacity_non_ctimp_section = this.page.locator(
      '//legend[contains(text(),"Non-CTIMP Adults Lacking Capacity")]/parent::fieldset'
    );
    this.project_connected_impairing_condition_text =
      this.adults_lacking_capacity_non_ctimp_section.getByTestId('IQA0291_Text');
    this.why_project_not_carried_out_text = this.adults_lacking_capacity_non_ctimp_section.getByTestId('IQA0292_Text');
    this.project_has_potential_for_checkbox = this.adults_lacking_capacity_non_ctimp_section.getByTestId(/^IQA0293/);
    this.describe_project_potential_to_benefit_participant_text =
      this.adults_lacking_capacity_non_ctimp_section.getByTestId('IQA0294_Text');
    this.describe_project_contribute_knowledge_text =
      this.adults_lacking_capacity_non_ctimp_section.getByTestId('IQA0295_Text');
    this.project_not_interfere_participants_freedom_text =
      this.adults_lacking_capacity_non_ctimp_section.getByTestId('IQA0296_Text');
    this.how_ensure_suitably_qualified_experienced_text =
      this.adults_lacking_capacity_non_ctimp_section.getByTestId('IQA0297_Text');
    this.arrangements_made_to_identify_consult_induviduals_text =
      this.adults_lacking_capacity_non_ctimp_section.getByTestId('IQA0298_Text');
    this.scotland_arrangements_made_welfare_guardian_text =
      this.adults_lacking_capacity_non_ctimp_section.getByTestId('IQA0299_Text');
    this.arrangements_continue_consult_during_course_text =
      this.adults_lacking_capacity_non_ctimp_section.getByTestId('IQA0300_Text');
    this.information_about_trial_to_participants_text =
      this.adults_lacking_capacity_non_ctimp_section.getByTestId('IQA0301_Text');
    this.arrangements_for_consent_fluctuate_text =
      this.adults_lacking_capacity_non_ctimp_section.getByTestId('IQA0302_Text');
    this.is_participant_urgent_recruited_before_wishes_feelings_radio =
      this.adults_lacking_capacity_non_ctimp_section.getByTestId(/^IQA0303/);
    this.seek_agreement_registered_practitioner_text =
      this.adults_lacking_capacity_non_ctimp_section.getByTestId('IQA0304_Text');
    this.arrangements_informing_relatives_text =
      this.adults_lacking_capacity_non_ctimp_section.getByTestId('IQA0305_Text');
    this.participant_recruited_prior_consent_text =
      this.adults_lacking_capacity_non_ctimp_section.getByTestId('IQA0306_Text');
    this.steps_ensure_nothing_done_participant_object_text =
      this.adults_lacking_capacity_non_ctimp_section.getByTestId('IQA0307_Text');
    this.steps_ensure_nothing_done_contrary_statement_text =
      this.adults_lacking_capacity_non_ctimp_section.getByTestId('IQA0308_Text');
  }

  //Page Methods
  async goto() {
    await this.page.goto('questionnaire/displayquestionnaire?categoryId=C7');
  }

  async assertOnAdultsLackingCapacityPage(activeStage: Locator) {
    const expectedSectionHeadingsText = this.adultsLackingCapacityPageTestData.Adults_Lacking_Capacity.section_headings;
    expect(await activeStage.textContent()).toBe(
      this.adultsLackingCapacityPageTestData.Adults_Lacking_Capacity.page_name
    );
    await expect(this.alc_section_headings).toHaveCount(expectedSectionHeadingsText.length);
    const actualSectionHeadings = await getTextFromElementArray(await this.alc_section_headings.all());
    for await (const expectedHeadingText of expectedSectionHeadingsText) {
      expect(actualSectionHeadings).toContainEqual(expectedHeadingText);
    }
    expect(await this.page.title()).toBe(this.adultsLackingCapacityPageTestData.Adults_Lacking_Capacity.title);
  }

  async getTestDataForALC(sectionName: string, datasetName: string): Promise<JSON | null> {
    let dataset: any;
    if (sectionName === 'adults lacking capacity ctimp') {
      dataset = this.adultsLackingCapacityPageTestData.Adults_Lacking_Capacity_CTIMP[datasetName];
    } else if (sectionName === 'adults lacking capacity non ctimp') {
      dataset = this.adultsLackingCapacityPageTestData.Adults_Lacking_Capacity_Non_CTIMP[datasetName];
    }
    return dataset;
  }

  async getQSetSectionLocator(sectionName: string): Promise<Locator> {
    let sectionLocator: Locator;
    if (sectionName === 'Adults_Lacking_Capacity_CTIMP') {
      sectionLocator = this.adults_lacking_capacity_ctimp_section;
    } else if (sectionName === 'Adults_Lacking_Capacity_Non_CTIMP') {
      sectionLocator = this.adults_lacking_capacity_non_ctimp_section;
    } else {
      throw new Error(
        `${sectionName} is not defined in the adults lacking capacity page. Create a locator for the section - ${sectionName}`
      );
    }
    return sectionLocator;
  }
}
