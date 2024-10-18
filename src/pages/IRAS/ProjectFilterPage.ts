import { expect, Locator, Page } from '@playwright/test';
import * as projectFilterPageTestData from '../../resources/test_data/iras/project_filter_page_data.json';
import { getTextFromElementArray } from '../../utils/UtilFunctions';

//Declare Page Objects
export default class ProjectFilterPage {
  readonly page: Page;
  readonly projectFilterPageTestData: typeof projectFilterPageTestData;
  readonly project_filter_section_headings: Locator;
  readonly project_details_section: Locator;
  readonly short_project_title_text: Locator;
  readonly full_project_title_text: Locator;
  readonly is_project_managed_commercial_research_radio: Locator;
  readonly is_nihr_funding_radio: Locator;
  readonly access_cpms_services_radio: Locator;
  readonly email_initial_contact_cpms_text: Locator;
  readonly project_scope_section: Locator;
  readonly is_educational_project_radio: Locator;
  readonly activities_involved_checkbox: Locator;
  readonly is_research_bioresource_radio: Locator;
  readonly bioresource_established_nhs_hsc_radio: Locator;
  readonly is_ctimp_radio: Locator;
  readonly options_applied_for_project_radio: Locator;
  readonly product_contain_genetically_modified_organism_radio: Locator;
  readonly is_clinical_or_medical_devices_radio: Locator;
  readonly exposing_ionising_radiation_radio: Locator;
  readonly using_human_biological_samples_radio: Locator;
  readonly patient_data_accessed_outside_radio: Locator;
  readonly research_with_adults_lacking_capacity_to_consent_radio: Locator;
  readonly include_children_radio: Locator;
  readonly include_prisoners_offenders_radio: Locator;
  readonly involve_ministry_of_defence_radio: Locator;
  readonly involve_hfea_radio: Locator;
  readonly reserch_location_section: Locator;
  readonly is_outside_uk_radio: Locator;
  readonly places_in_uk_for_project_checkbox: Locator;
  readonly where_human_sample_held_checkbox: Locator;
  readonly where_human_sample_obtained_checkbox: Locator;
  readonly where_project_take_place_checkbox: Locator;
  readonly details_other_organisation_text: Locator;
  readonly use_pic_radio: Locator;

  //Initialize Page Objects
  constructor(page: Page) {
    this.page = page;
    this.projectFilterPageTestData = projectFilterPageTestData;

    //Locators
    this.project_filter_section_headings = this.page.locator('.govuk-fieldset__legend--l');
    //Project Details Section
    this.project_details_section = this.page.locator('legend').getByText('Project Details').locator('..');
    this.short_project_title_text = this.project_details_section.getByTestId('IQA0002_Text');
    this.full_project_title_text = this.project_details_section.getByTestId('IQA0003_Text');
    this.is_project_managed_commercial_research_radio = this.project_details_section.getByTestId(/^IQA0004/);
    this.is_nihr_funding_radio = this.project_details_section.getByTestId(/^IQA03271/);
    this.access_cpms_services_radio = this.project_details_section.getByTestId(/^IQA0005/);
    this.email_initial_contact_cpms_text = this.project_details_section.getByTestId('IQA0006_Text');
    //Project Scope Section
    this.project_scope_section = this.page.locator('legend').getByText('Project Scope').locator('..');
    this.is_educational_project_radio = this.project_scope_section.getByTestId(/^IQA0012/);
    this.activities_involved_checkbox = this.project_scope_section.getByTestId(/^IQA0061/);
    this.is_research_bioresource_radio = this.project_scope_section.getByTestId(/^IQA0014/);
    this.bioresource_established_nhs_hsc_radio = this.project_scope_section.getByTestId(/^IQA0015/);
    this.is_ctimp_radio = this.project_scope_section.getByTestId(/^IQA0017/);
    this.options_applied_for_project_radio = this.project_scope_section.getByTestId(/^IQA0018/);
    this.product_contain_genetically_modified_organism_radio = this.project_scope_section.getByTestId(/^IQA03282/);
    this.is_clinical_or_medical_devices_radio = this.project_scope_section.getByTestId(/^IQA0020/);
    this.exposing_ionising_radiation_radio = this.project_scope_section.getByTestId(/^IQA0021/);
    this.using_human_biological_samples_radio = this.project_scope_section.getByTestId(/^IQA0022/);
    this.patient_data_accessed_outside_radio = this.project_scope_section.getByTestId(/^IQA0024/);
    this.research_with_adults_lacking_capacity_to_consent_radio = this.project_scope_section.getByTestId(/^IQA0025/);
    this.include_children_radio = this.project_scope_section.getByTestId(/^IQA0026/);
    this.include_prisoners_offenders_radio = this.project_scope_section.getByTestId(/^IQA0027/);
    this.involve_ministry_of_defence_radio = this.project_scope_section.getByTestId(/^IQA0028/);
    this.involve_hfea_radio = this.project_scope_section.getByTestId(/^IQA0029/);
    //Research Location Section
    this.reserch_location_section = this.page.locator('legend').getByText('Research Location').locator('..');
    this.is_outside_uk_radio = this.reserch_location_section.getByTestId(/^IQA0142/);
    this.places_in_uk_for_project_checkbox = this.reserch_location_section.getByTestId(/^IQA0032/);
    this.where_human_sample_held_checkbox = this.reserch_location_section.getByTestId(/^IQA0033/);
    this.where_human_sample_obtained_checkbox = this.reserch_location_section.getByTestId(/^IQA0034/);
    this.where_project_take_place_checkbox = this.reserch_location_section.getByTestId(/^IQA0144/);
    this.details_other_organisation_text = this.reserch_location_section.getByTestId('IQA0145_Text');
    this.use_pic_radio = this.reserch_location_section.getByTestId(/^IQA0146/);
  }

  //Page Methods
  async goto() {
    await this.page.goto('questionnaire/displayquestionnaire?categoryId=A');
  }

  async assertOnProjectFilterPage(activeStage: Locator) {
    const expectedSectionHeadingsText = projectFilterPageTestData.Project_Filter.section_headings;
    expect(await activeStage.textContent()).toBe(this.projectFilterPageTestData.Project_Filter.page_name);
    const actualSectionHeadings = await getTextFromElementArray(await this.project_filter_section_headings.all());
    expectedSectionHeadingsText.forEach((expectedHeadingText) => {
      expect(actualSectionHeadings).toContainEqual(expectedHeadingText);
    });
    expect(await this.page.title()).toBe(this.projectFilterPageTestData.Project_Filter.title);
  }
}
