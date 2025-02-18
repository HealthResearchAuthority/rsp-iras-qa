import { expect, Locator, Page } from '@playwright/test';
import * as projectDetailsPageTestData from '../../../resources/test_data/iras/question_set/pages/project_details_page_data.json';
import { getTextFromElementArray } from '../../../utils/UtilFunctions';

//Declare Page Objects
export default class ProjectDetailsPage {
  readonly page: Page;
  readonly projectDetailsPageTestData: typeof projectDetailsPageTestData;
  readonly project_details_section_headings: Locator;
  readonly project_information_section: Locator;
  readonly protocol_ref_no_text: Locator;
  readonly eu_trial_no_text: Locator;
  readonly research_project_public_summary_text: Locator;
  readonly public_involvement_section: Locator;
  readonly aspects_already_actively_involved_checkbox: Locator;
  readonly details_involved_contributors_text: Locator;
  readonly reasons_for_not_involving_text: Locator;
  readonly how_identified_involved_contributors_checkbox: Locator;
  readonly detail_how_identified_involved_contributors_text: Locator;
  readonly tell_us_about_contributors_text: Locator;
  readonly what_did_contributors_say_text: Locator;
  readonly how_plan_involve_contributors_remaining_stages_checkbox: Locator;
  readonly give_details_other_aspects_text: Locator;
  readonly justify_approach_decribe_benefits_of_contributors_text: Locator;
  readonly justify_approach_and_absence_of_public_involvement_text: Locator;
  readonly research_design_section: Locator;
  readonly methods_using_checkbox: Locator;
  readonly detail_methods_using_text: Locator;
  readonly specify_methods_text: Locator;
  readonly more_detail_method_text: Locator;
  readonly is_novel_intervention_trial_radio: Locator;
  readonly is_compare_interventions_trial_radio: Locator;
  readonly is_intervention_gold_standard_radio: Locator;
  readonly principle_research_question_objective_text: Locator;
  readonly secondary_research_question_objective_text: Locator;
  readonly does_project_use_ai_checkbox: Locator;
  readonly developing_best_describe_ai_type_checkbox: Locator;
  readonly describe_ai_type_text: Locator;
  readonly existing_best_describe_ai_type_checkbox: Locator;
  readonly describe_ai_type_again_text: Locator;
  readonly what_will_happen_participants_text: Locator;
  readonly research_activities_section: Locator;
  readonly what_intervention_treatment_being_studied_text: Locator;
  readonly is_treatment_first_human_radio: Locator;
  readonly does_involve_change_delay_care_radio: Locator;
  readonly are_treatments_compared_standard_care_radio: Locator;
  readonly describe_arrangements_to_address_changes_text: Locator;
  readonly select_type_questions_used_checkbox: Locator;
  readonly is_possible_sensitive_topics_radio: Locator;
  readonly is_possible_criminal_disclosures_radio: Locator;
  readonly explain_how_criminal_disclosures_dealt_with_text: Locator;
  readonly potential_benefits_participants_society_text: Locator;
  readonly any_risks_of_activity_or_monitoring_text: Locator;
  readonly any_risks_change_or_delay_text: Locator;
  readonly any_risks_topics_sensitive_text: Locator;
  readonly will_inform_participant_gp_radio: Locator;
  readonly explain_circumstance_gp_contact_text: Locator;
  readonly what_will_happen_treatment_when_finished_will_continue_radio: Locator;
  readonly describe_all_arrangements_for_continued_treatment_text: Locator;
  readonly describe_care_arrangements_after_finished_text: Locator;
  readonly when_plan_finish_collecting_data_date: Locator;
  readonly participants_section: Locator;
  readonly primary_conditions_problems_checkbox: Locator;
  readonly list_principal_inclusion_criteria_text: Locator;
  readonly list_principal_exclusion_criteria_text: Locator;
  readonly how_making_sure_reflects_real_world_population_text: Locator;
  readonly how_ensure_people_able_fully_participate_text: Locator;
  readonly groups_participate_provide_samples_checkbox: Locator;
  readonly give_details_of_groups_samples_text: Locator;
  readonly when_plan_start_recruiting_collecting_date: Locator;
  readonly how_long_participant_in_project_text: Locator;
  readonly what_arrangements_apply_to_participants_involved_text: Locator;
  readonly could_any_participants_be_vulnerable_radio: Locator;
  readonly consent_section: Locator;
  readonly only_include_adults_lacking_capacity_checkbox: Locator;
  readonly only_include_children_radio: Locator;
  readonly seek_consent_prior_to_participation_radio: Locator;
  readonly reasons_why_consent_not_obtained_checkbox: Locator;
  readonly justify_not_seek_consent_text: Locator;
  readonly describe_arrangments_for_consent_text: Locator;
  readonly how_long_allow_participants_to_decide_text: Locator;
  readonly explain_payments_benefits_incentives_text: Locator;
  readonly what_arrangments_comply_welsh_language_text: Locator;
  readonly what_arrangements_for_communication_needs_text: Locator;
  readonly what_arrangements_unable_written_consent_text: Locator;
  readonly what_arrangements_participants_recieve_info_text: Locator;
  readonly what_steps_if_paticipant_loses_capacity_radio: Locator;
  readonly risks_conflict_section: Locator;
  readonly describe_risks_to_team_and_how_managed_text: Locator;
  readonly does_investigator_have_personal_involvement_radio: Locator;
  readonly give_details_of_relevant_conflict_text: Locator;
  readonly is_chief_member_of_nhs_ethics_rec_radio: Locator;
  readonly rec_chief_investigators_are_members_of_checkbox: Locator;
  readonly will_chief_investigators_recieve_payment_incentives_radio: Locator;
  readonly give_details_of_payment_incentives_text: Locator;
  readonly summary_ethical_issues_section: Locator;
  readonly summarise_main_ethical_issues_text: Locator;
  readonly is_application_any_of_following_checkbox: Locator;
  readonly provide_iras_id_of_unfavorable_opinion_text: Locator;
  readonly explain_how_reasons_for_opinion_have_been_addressed_text: Locator;
  readonly provide_info_about_project_background_text: Locator;
  readonly research_analysis_section: Locator;
  readonly how_quality_research_been_assessed_checkbox: Locator;
  readonly detail_how_quality_research_assessed_text: Locator;
  readonly explain_why_review_process_appropriate_text: Locator;
  readonly what_primary_form_of_analysis_radio: Locator;
  readonly detail_methods_for_analysing_data_text: Locator;
  readonly how_statistical_aspects_been_reviewed_checkbox: Locator;
  readonly detail_who_undertook_statistical_review_text: Locator;
  readonly primary_outcome_measure_for_project_text: Locator;
  readonly secondary_outcome_measures_text: Locator;
  readonly how_many_participants_samples_records_studied_text: Locator;
  readonly how_was_sample_size_decided_text: Locator;
  readonly what_criteria_electively_stopping_early_text: Locator;
  readonly governance_management_section: Locator;
  readonly detail_source_funding_materials_text: Locator;
  readonly describe_logistical_legal_risks_text: Locator;
  readonly arrangements_for_monitoring_conduct_checkbox: Locator;
  readonly arrangements_to_review_safety_data_text: Locator;
  readonly arrangements_for_insurance_sponsors_management_text: Locator;
  readonly arrangements_for_insurance_sponsors_design_text: Locator;
  readonly arrangements_for_insurance_investigators_text: Locator;
  readonly describe_participants_excluded_insurance_text: Locator;
  readonly have_sponsors_arranged_payment_compensation_radio: Locator;
  readonly detail_arrangements_for_compensation_text: Locator;
  readonly have_sponsors_delegated_responsibilities_radio: Locator;
  readonly detail_cro_ctu_management_responsibilities_text: Locator;
  readonly has_responsibility_research_activity_delegated_radio: Locator;
  readonly detail_proposed_oversight_arrangements_text: Locator;
  readonly transparency_section: Locator;
  readonly publication_deferral_request_radio: Locator;
  readonly first_provide_justification_for_deferral_text: Locator;
  readonly first_confirm_arrangements_registration_of_project_checkbox: Locator;
  readonly detail_other_arrangements_project_registration_text: Locator;
  readonly second_confirm_arrangements_registration_of_project_checkbox: Locator;
  readonly isrctn_text: Locator;
  readonly clinical_trials_gov_text: Locator;
  readonly provide_name_registries_ref_no_text: Locator;
  readonly project_summary_deferral_request_checkbox: Locator;
  readonly second_provide_justification_for_deferral_text: Locator;
  readonly planned_end_date: Locator;
  readonly how_intend_report_results_of_project_checkbox: Locator;
  readonly detail_other_reporting_plans_text: Locator;
  readonly how_you_will_inform_participants_of_results_text: Locator;
  readonly do_plan_to_share_participant_level_data_radio: Locator;
  readonly detail_plans_sharing_participant_level_data_text: Locator;
  readonly will_have_remaining_human_bio_material_radio: Locator;
  readonly will_be_registering_remaining_samples_radio: Locator;
  readonly justify_post_study_arrangements_for_material_text: Locator;
  readonly first_email_text: Locator;
  readonly first_telephone_text: Locator;
  readonly first_postal_address_text: Locator;
  readonly second_email_text: Locator;
  readonly second_telephone_text: Locator;
  readonly second_postal_address_text: Locator;
  readonly confidentiality_info_governance_section: Locator;
  readonly is_study_limited_to_data_only_radio: Locator;

  //Initialize Page Objects
  constructor(page: Page) {
    this.page = page;
    this.projectDetailsPageTestData = projectDetailsPageTestData;

    //Locators
    this.project_details_section_headings = this.page.locator('.govuk-fieldset__legend--l');
    //Project Information Section
    this.project_information_section = this.page.locator('legend').getByText('Project Information').locator('..');
    this.protocol_ref_no_text = this.project_information_section.getByTestId('IQA0036_Text');
    this.eu_trial_no_text = this.project_information_section.getByTestId('IQA0037_Text');
    this.research_project_public_summary_text = this.project_information_section.getByTestId('IQA0040_Text');
    //Public Involvement Section
    this.public_involvement_section = this.page.locator('legend').getByText('Public Involvement').locator('..');
    this.aspects_already_actively_involved_checkbox = this.public_involvement_section.getByTestId(/^IQA0045/);
    this.details_involved_contributors_text = this.public_involvement_section.getByTestId('IQA0046_Text');
    this.reasons_for_not_involving_text = this.public_involvement_section.getByTestId('IQA0048_Text');
    this.how_identified_involved_contributors_checkbox = this.public_involvement_section.getByTestId(/^IQA0042/);
    this.detail_how_identified_involved_contributors_text = this.public_involvement_section.getByTestId('IQA0043_Text');
    this.tell_us_about_contributors_text = this.public_involvement_section.getByTestId('IQA0044_Text');
    this.what_did_contributors_say_text = this.public_involvement_section.getByTestId('IQA03274_Text');
    this.how_plan_involve_contributors_remaining_stages_checkbox =
      this.public_involvement_section.getByTestId(/^IQA0162/);
    this.give_details_other_aspects_text = this.public_involvement_section.getByTestId('IQA0163_Text');
    this.justify_approach_decribe_benefits_of_contributors_text =
      this.public_involvement_section.getByTestId('IQA03275_Text');
    this.justify_approach_and_absence_of_public_involvement_text =
      this.public_involvement_section.getByTestId('IQA03276_Text');
    //Research Design & Methodology Section
    this.research_design_section = this.page
      .locator('legend')
      .getByText('Research Design and Methodology')
      .locator('..');
    this.methods_using_checkbox = this.research_design_section.getByTestId(/^IQA0049/);
    this.detail_methods_using_text = this.research_design_section.getByTestId('IQA0050_Text');
    this.specify_methods_text = this.research_design_section.getByTestId('IQA0052_Text');
    this.more_detail_method_text = this.research_design_section.getByTestId('IQA0053_Text');
    this.is_novel_intervention_trial_radio = this.research_design_section.getByTestId(/^IQA0054/);
    this.is_compare_interventions_trial_radio = this.research_design_section.getByTestId(/^IQA0055/);
    this.is_intervention_gold_standard_radio = this.research_design_section.getByTestId(/^IQA0056/);
    this.principle_research_question_objective_text = this.research_design_section.getByTestId('IQA0057_Text');
    this.secondary_research_question_objective_text = this.research_design_section.getByTestId('IQA0058_Text');
    this.does_project_use_ai_checkbox = this.research_design_section.getByTestId(/^IQA03277/);
    this.developing_best_describe_ai_type_checkbox = this.research_design_section.getByTestId(/^IQA03278/);
    this.describe_ai_type_text = this.research_design_section.getByTestId('IQA03279_Text');
    this.existing_best_describe_ai_type_checkbox = this.research_design_section.getByTestId(/^IQA03280/);
    this.describe_ai_type_again_text = this.research_design_section.getByTestId('IQA03281_Text');
    this.what_will_happen_participants_text = this.research_design_section.getByTestId('IQA0060_Text');
    //Research Activities Section
    this.research_activities_section = this.page.locator('legend').getByText('Research Activities').locator('..');
    this.what_intervention_treatment_being_studied_text = this.research_activities_section.getByTestId('IQA0062_Text');
    this.is_treatment_first_human_radio = this.research_activities_section.getByTestId(/^IQA0063/);
    this.does_involve_change_delay_care_radio = this.research_activities_section.getByTestId(/^IQA0064/);
    this.are_treatments_compared_standard_care_radio = this.research_activities_section.getByTestId(/^IQA0065/);
    this.describe_arrangements_to_address_changes_text = this.research_activities_section.getByTestId('IQA0066_Text');
    this.select_type_questions_used_checkbox = this.research_activities_section.getByTestId(/^IQA03273/);
    this.is_possible_sensitive_topics_radio = this.research_activities_section.getByTestId(/^IQA0068/);
    this.is_possible_criminal_disclosures_radio = this.research_activities_section.getByTestId(/^IQA0070/);
    this.explain_how_criminal_disclosures_dealt_with_text =
      this.research_activities_section.getByTestId('IQA0071_Text');
    this.potential_benefits_participants_society_text = this.research_activities_section.getByTestId('IQA0072_Text');
    this.any_risks_of_activity_or_monitoring_text = this.research_activities_section.getByTestId('IQA0074_Text');
    this.any_risks_change_or_delay_text = this.research_activities_section.getByTestId('IQA0075_Text');
    this.any_risks_topics_sensitive_text = this.research_activities_section.getByTestId('IQA0076_Text');
    this.will_inform_participant_gp_radio = this.research_activities_section.getByTestId(/^IQA0077/);
    this.explain_circumstance_gp_contact_text = this.research_activities_section.getByTestId('IQA0078_Text');
    this.what_will_happen_treatment_when_finished_will_continue_radio =
      this.research_activities_section.getByTestId(/^IQA0079/);
    this.describe_all_arrangements_for_continued_treatment_text =
      this.research_activities_section.getByTestId('IQA0080_Text');
    this.describe_care_arrangements_after_finished_text = this.research_activities_section.getByTestId('IQA0081_Text');
    this.when_plan_finish_collecting_data_date = this.research_activities_section.getByTestId('IQA0082_Text');
    //Participants Section
    this.participants_section = this.page.locator('legend').getByText('Participants').locator('..');
    this.primary_conditions_problems_checkbox = this.participants_section.getByTestId(/^IQA0083/);
    this.list_principal_inclusion_criteria_text = this.participants_section.getByTestId('IQA0084_Text');
    this.list_principal_exclusion_criteria_text = this.participants_section.getByTestId('IQA0085_Text');
    this.how_making_sure_reflects_real_world_population_text = this.participants_section.getByTestId('IQA0086_Text');
    this.how_ensure_people_able_fully_participate_text = this.participants_section.getByTestId('IQA0087_Text');
    this.groups_participate_provide_samples_checkbox = this.participants_section.getByTestId(/^IQA0088/);
    this.give_details_of_groups_samples_text = this.participants_section.getByTestId('IQA0089_Text');
    this.when_plan_start_recruiting_collecting_date = this.participants_section.getByTestId('IQA0090_Text');
    this.how_long_participant_in_project_text = this.participants_section.getByTestId('IQA0091_Text');
    this.what_arrangements_apply_to_participants_involved_text = this.participants_section.getByTestId('IQA0092_Text');
    this.could_any_participants_be_vulnerable_radio = this.participants_section.getByTestId(/^IQA0093/);
    //Consent Section
    this.consent_section = this.page.locator('legend').getByText('Consent').locator('..');
    this.only_include_adults_lacking_capacity_checkbox = this.consent_section.getByTestId(/^IQA0096/);
    this.only_include_children_radio = this.consent_section.getByTestId(/^IQA0095/);
    this.seek_consent_prior_to_participation_radio = this.consent_section.getByTestId(/^IQA0097/);
    this.reasons_why_consent_not_obtained_checkbox = this.consent_section.getByTestId(/^IQA0098/);
    this.justify_not_seek_consent_text = this.consent_section.getByTestId('IQA0099_Text');
    this.describe_arrangments_for_consent_text = this.consent_section.getByTestId('IQA0100_Text');
    this.how_long_allow_participants_to_decide_text = this.consent_section.getByTestId('IQA0102_Text');
    this.explain_payments_benefits_incentives_text = this.consent_section.getByTestId('IQA0103_Text');
    this.what_arrangments_comply_welsh_language_text = this.consent_section.getByTestId('IQA0104_Text');
    this.what_arrangements_for_communication_needs_text = this.consent_section.getByTestId('IQA0105_Text');
    this.what_arrangements_unable_written_consent_text = this.consent_section.getByTestId('IQA0106_Text');
    this.what_arrangements_participants_recieve_info_text = this.consent_section.getByTestId('IQA0107_Text');
    this.what_steps_if_paticipant_loses_capacity_radio = this.consent_section.getByTestId(/^IQA0108/);
    //Risks and Conflicts of Interest Section
    this.risks_conflict_section = this.page.locator('legend').getByText('Risk and Conflicts of Interest').locator('..');
    this.describe_risks_to_team_and_how_managed_text = this.risks_conflict_section.getByTestId('IQA0110_Text');
    this.does_investigator_have_personal_involvement_radio = this.risks_conflict_section.getByTestId(/^IQA0111/);
    this.give_details_of_relevant_conflict_text = this.risks_conflict_section.getByTestId('IQA0112_Text');
    this.is_chief_member_of_nhs_ethics_rec_radio = this.risks_conflict_section.getByTestId(/^IQA0113/);
    this.rec_chief_investigators_are_members_of_checkbox = this.risks_conflict_section.getByTestId(/^IQA0114/);
    this.will_chief_investigators_recieve_payment_incentives_radio =
      this.risks_conflict_section.getByTestId(/^IQA0115/);
    this.give_details_of_payment_incentives_text = this.risks_conflict_section.getByTestId('IQA0116_Text');
    //Summary Ethical Issues Section
    this.summary_ethical_issues_section = this.page.locator('legend').getByText('Summary Ethical Issues').locator('..');
    this.summarise_main_ethical_issues_text = this.summary_ethical_issues_section.getByTestId('IQA0117_Text');
    this.is_application_any_of_following_checkbox = this.summary_ethical_issues_section.getByTestId(/^IQA0118/);
    this.provide_iras_id_of_unfavorable_opinion_text = this.summary_ethical_issues_section.getByTestId('IQA0119_Text');
    this.explain_how_reasons_for_opinion_have_been_addressed_text =
      this.summary_ethical_issues_section.getByTestId('IQA0120_Text');
    this.provide_info_about_project_background_text = this.summary_ethical_issues_section.getByTestId('IQA0039_Text');
    //Resarch Analysis Section
    this.research_analysis_section = this.page.locator('legend').getByText('Research Analysis').locator('..');
    this.how_quality_research_been_assessed_checkbox = this.research_analysis_section.getByTestId(/^IQA0121/);
    this.detail_how_quality_research_assessed_text = this.research_analysis_section.getByTestId('IQA0122_Text');
    this.explain_why_review_process_appropriate_text = this.research_analysis_section.getByTestId('IQA0123_Text');
    this.what_primary_form_of_analysis_radio = this.research_analysis_section.getByTestId(/^IQA0124/);
    this.detail_methods_for_analysing_data_text = this.research_analysis_section.getByTestId('IQA0125_Text');
    this.how_statistical_aspects_been_reviewed_checkbox = this.research_analysis_section.getByTestId(/^IQA0126/);
    this.detail_who_undertook_statistical_review_text = this.research_analysis_section.getByTestId('IQA0127_Text');
    this.primary_outcome_measure_for_project_text = this.research_analysis_section.getByTestId('IQA0128_Text');
    this.secondary_outcome_measures_text = this.research_analysis_section.getByTestId('IQA0129_Text');
    this.how_many_participants_samples_records_studied_text =
      this.research_analysis_section.getByTestId('IQA0130_Text');
    this.how_was_sample_size_decided_text = this.research_analysis_section.getByTestId('IQA0131_Text');
    this.what_criteria_electively_stopping_early_text = this.research_analysis_section.getByTestId('IQA0132_Text');
    //Governance and Management Section
    this.governance_management_section = this.page
      .locator('legend')
      .getByText('Governance and Management')
      .locator('..');
    this.detail_source_funding_materials_text = this.governance_management_section.getByTestId('IQA0139_Text');
    this.describe_logistical_legal_risks_text = this.governance_management_section.getByTestId('IQA0140_Text');
    this.arrangements_for_monitoring_conduct_checkbox = this.governance_management_section.getByTestId(/^IQA0147/);
    this.arrangements_to_review_safety_data_text = this.governance_management_section.getByTestId('IQA0148_Text');
    this.arrangements_for_insurance_sponsors_management_text =
      this.governance_management_section.getByTestId('IQA0149_Text');
    this.arrangements_for_insurance_sponsors_design_text =
      this.governance_management_section.getByTestId('IQA0150_Text');
    this.arrangements_for_insurance_investigators_text = this.governance_management_section.getByTestId('IQA0151_Text');
    this.describe_participants_excluded_insurance_text = this.governance_management_section.getByTestId('IQA0152_Text');
    this.have_sponsors_arranged_payment_compensation_radio = this.governance_management_section.getByTestId(/^IQA0153/);
    this.detail_arrangements_for_compensation_text = this.governance_management_section.getByTestId('IQA0154_Text');
    this.have_sponsors_delegated_responsibilities_radio = this.governance_management_section.getByTestId(/^IQA0155/);
    this.detail_cro_ctu_management_responsibilities_text =
      this.governance_management_section.getByTestId('IQA0156_Text');
    this.has_responsibility_research_activity_delegated_radio =
      this.governance_management_section.getByTestId(/^IQA0157/);
    this.detail_proposed_oversight_arrangements_text = this.governance_management_section.getByTestId('IQA0158_Text');
    //Transparency Section
    this.transparency_section = this.page.locator('legend').getByText('Transparency').locator('..');
    this.publication_deferral_request_radio = this.transparency_section.getByTestId(/^IQA0165/);
    this.first_provide_justification_for_deferral_text = this.transparency_section.getByTestId('IQA0166_Text');
    this.first_confirm_arrangements_registration_of_project_checkbox =
      this.transparency_section.getByTestId(/^IQA0167/);
    this.detail_other_arrangements_project_registration_text = this.transparency_section.getByTestId('IQA0168_Text');
    this.second_confirm_arrangements_registration_of_project_checkbox =
      this.transparency_section.getByTestId(/^IQA0169/);
    this.isrctn_text = this.transparency_section.getByTestId('IQA0170_Text');
    this.clinical_trials_gov_text = this.transparency_section.getByTestId('IQA0171_Text');
    this.provide_name_registries_ref_no_text = this.transparency_section.getByTestId('IQA0172_Text');
    this.project_summary_deferral_request_checkbox = this.transparency_section.getByTestId(/^IQA0173/);
    this.second_provide_justification_for_deferral_text = this.transparency_section.getByTestId('IQA0174_Text');
    this.planned_end_date = this.transparency_section.getByTestId('IQA0175_Text');
    this.how_intend_report_results_of_project_checkbox = this.transparency_section.getByTestId(/^IQA0176/);
    this.detail_other_reporting_plans_text = this.transparency_section.getByTestId('IQA0177_Text');
    this.how_you_will_inform_participants_of_results_text = this.transparency_section.getByTestId('IQA0178_Text');
    this.do_plan_to_share_participant_level_data_radio = this.transparency_section.getByTestId(/^IQA0179/);
    this.detail_plans_sharing_participant_level_data_text = this.transparency_section.getByTestId('IQA0180_Text');
    this.will_have_remaining_human_bio_material_radio = this.transparency_section.getByTestId(/^IQA0181/);
    this.will_be_registering_remaining_samples_radio = this.transparency_section.getByTestId(/^IQA0182/);
    this.justify_post_study_arrangements_for_material_text = this.transparency_section.getByTestId('IQA0183_Text');
    this.first_email_text = this.transparency_section.getByTestId('IQA0185_Text');
    this.first_telephone_text = this.transparency_section.getByTestId('IQA0186_Text');
    this.first_postal_address_text = this.transparency_section.getByTestId('IQA0187_Text');
    this.second_email_text = this.transparency_section.getByTestId('IQA0189_Text');
    this.second_telephone_text = this.transparency_section.getByTestId('IQA0190_Text');
    this.second_postal_address_text = this.transparency_section.getByTestId('IQA0191_Text');
    //Confidentiality and Information Governance Section
    this.confidentiality_info_governance_section = this.page
      .locator('legend')
      .getByText('Confidentiality and Information Governance')
      .locator('..');
    this.is_study_limited_to_data_only_radio = this.confidentiality_info_governance_section.getByTestId(/^IQA0251/);
  }

  //Page Methods
  async goto() {
    await this.page.goto('questionnaire/displayquestionnaire?categoryId=B');
  }

  async assertOnProjectDetailsPage(activeStage: Locator) {
    const expectedSectionHeadingsText = this.projectDetailsPageTestData.Project_Details.section_headings;
    expect(await activeStage.textContent()).toBe(this.projectDetailsPageTestData.Project_Details.page_name);
    await expect(this.project_details_section_headings).toHaveCount(expectedSectionHeadingsText.length);
    const actualSectionHeadings = await getTextFromElementArray(await this.project_details_section_headings.all());
    for await (const expectedHeadingText of expectedSectionHeadingsText) {
      expect(actualSectionHeadings).toContainEqual(expectedHeadingText);
    }
    expect(await this.page.title()).toBe(this.projectDetailsPageTestData.Project_Details.title);
  }

  async getQSetSectionLocator(sectionName: string): Promise<Locator> {
    let sectionLocator: Locator;
    if (sectionName === 'Project_Information') {
      sectionLocator = this.project_information_section;
    } else if (sectionName === 'Public_Involvement') {
      sectionLocator = this.public_involvement_section;
    } else if (sectionName === 'Research_Design') {
      sectionLocator = this.research_design_section;
    } else if (sectionName === 'Research_Activities') {
      sectionLocator = this.research_activities_section;
    } else if (sectionName === 'Participants') {
      sectionLocator = this.participants_section;
    } else if (sectionName === 'Consent') {
      sectionLocator = this.consent_section;
    } else if (sectionName === 'Risks_Conflicts') {
      sectionLocator = this.risks_conflict_section;
    } else if (sectionName === 'Summary_Ethical_Issues') {
      sectionLocator = this.summary_ethical_issues_section;
    } else if (sectionName === 'Research_Analysis') {
      sectionLocator = this.research_analysis_section;
    } else if (sectionName === 'Governance_Management') {
      sectionLocator = this.governance_management_section;
    } else if (sectionName === 'Transparency') {
      sectionLocator = this.transparency_section;
    } else if (sectionName === 'Confidentiality_Info_Management') {
      sectionLocator = this.confidentiality_info_governance_section;
    } else {
      throw new Error(
        `${sectionName} is not defined in the project details page. Create a locator for the section - ${sectionName}`
      );
    }
    return sectionLocator;
  }
}
