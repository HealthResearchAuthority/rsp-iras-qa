import { expect, Locator, Page } from '@playwright/test';
import * as projectFilterPageTestData from '../../resources/test_data/iras/project_filter_page_data.json';
import { getTextFromElementArray } from '../../utils/UtilFunctions';

//Declare Page Objects
export default class ProjectFilterPage {
  readonly page: Page;
  readonly projectFilterPageTestData: typeof projectFilterPageTestData;
  readonly projectFilterSectionHeadings: Locator;
  readonly short_project_title_text: Locator;
  readonly full_project_title_text: Locator;
  readonly is_project_managed_commercial_research_radio: Locator;
  readonly is_nihr_funding_radio: Locator;
  readonly access_cpms_services_radio: Locator;
  readonly email_initial_contact_cpms_text: Locator;
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
    this.projectFilterSectionHeadings = page.locator('.govuk-fieldset__legend--l');
    this.short_project_title_text = page.locator('input[id="IQA0002_Text"]');
    this.full_project_title_text = page.locator('input[id="IQA0003_Text"]');
    this.is_project_managed_commercial_research_radio = page.locator('input[id^="IQA0004"]');
    this.is_nihr_funding_radio = page.locator('input[id^="IQA03271"]');
    this.access_cpms_services_radio = page.locator('input[id^="IQA0005"]');
    this.email_initial_contact_cpms_text = page.locator('input[id="IQA0006_Text"]');
    this.is_educational_project_radio = page.locator('input[id^="IQA0012"]');
    this.activities_involved_checkbox = page.locator('input[id^="IQA0061"]');
    this.is_research_bioresource_radio = page.locator('input[id^="IQA0014"]');
    this.bioresource_established_nhs_hsc_radio = page.locator('input[id^="IQA0015"]');
    this.is_ctimp_radio = page.locator('input[id^="IQA0017"]');
    this.options_applied_for_project_radio = page.locator('input[id^="IQA0018"]');
    this.product_contain_genetically_modified_organism_radio = page.locator('input[id^="IQA03282"]');
    this.is_clinical_or_medical_devices_radio = page.locator('input[id^="IQA0020"]');
    this.exposing_ionising_radiation_radio = page.locator('input[id^="IQA0021"]');
    this.using_human_biological_samples_radio = page.locator('input[id^="IQA0022"]');
    this.patient_data_accessed_outside_radio = page.locator('input[id^="IQA0024"]');
    this.research_with_adults_lacking_capacity_to_consent_radio = page.locator('input[id^="IQA0025"]');
    this.include_children_radio = page.locator('input[id^="IQA0026"]');
    this.include_prisoners_offenders_radio = page.locator('input[id^="IQA0027"]');
    this.involve_ministry_of_defence_radio = page.locator('input[id^="IQA0028"]');
    this.involve_hfea_radio = page.locator('input[id^="IQA0029"]');
    this.is_outside_uk_radio = page.locator('input[id^="IQA0142"]');
    this.places_in_uk_for_project_checkbox = page.locator('input[id^="IQA0032"]');
    this.where_human_sample_held_checkbox = page.locator('input[id^="IQA0033"]');
    this.where_human_sample_obtained_checkbox = page.locator('input[id^="IQA0034"]');
    this.where_project_take_place_checkbox = page.locator('input[id^="IQA0144"]');
    this.details_other_organisation_text = page.locator('input[id="IQA0145_Text"]');
    this.use_pic_radio = page.locator('input[id^="IQA0146"]');
  }

  //Page Methods
  async goto() {
    await this.page.goto('');
  }

  async assertOnProjectFilterPage(activeStage: Locator) {
    const expectedSectionHeadingsText = projectFilterPageTestData.Project_Filter.section_headings;
    expect(await activeStage.textContent()).toBe(this.projectFilterPageTestData.Project_Filter.page_name);
    const actualSectionHeadings = await getTextFromElementArray(await this.projectFilterSectionHeadings.all());
    expectedSectionHeadingsText.forEach((expectedHeadingText) => {
      expect(actualSectionHeadings).toContainEqual(expectedHeadingText);
    });
    expect(await this.page.title()).toBe(this.projectFilterPageTestData.Project_Filter.title);
  }
}
