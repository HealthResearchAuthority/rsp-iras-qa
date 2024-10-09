import { expect, Locator, Page } from '@playwright/test';
import * as projectFilterPageTestData from '../../resources/test_data/iras/project_filter_page_data.json';

//Declare Page Objects
export default class ProjectFilterPage {
  readonly page: Page;
  readonly projectFilterPageTestData: typeof projectFilterPageTestData;
  readonly pageHeadingCaption: Locator;
  readonly pageHeading: Locator;
  readonly short_project_title_text: Locator;
  readonly full_project_title_text: Locator;
  readonly is_project_managed_commercial_research_radio: string;
  readonly is_nihr_funding_radio: string;
  readonly access_cpms_services_radio: string;
  readonly email_initial_contact_cpms_text: Locator;
  readonly is_educational_project_radio: string;
  readonly activities_involved_checkbox: string;
  readonly is_research_bioresource_radio: string;
  readonly bioresource_established_nhs_hsc_radio: string;
  readonly is_ctimp_radio: string;
  readonly options_applied_for_project_radio: string;
  readonly product_contain_genetically_modified_organism_radio: string;
  readonly is_clinical_or_medical_devices_radio: string;
  readonly exposing_ionising_radiation_radio: string;
  readonly using_human_biological_samples_radio: string;
  readonly patient_data_accessed_outside_radio: string;
  readonly research_with_adults_lacking_capacity_to_consent_radio: string;
  readonly include_children_radio: string;
  readonly include_prisoners_offenders_radio: string;
  readonly involve_ministry_of_defence_radio: string;
  readonly involve_hfea_radio: string;
  readonly is_outside_uk_radio: string;
  readonly places_in_uk_for_project_checkbox: string;
  readonly where_human_sample_held_checkbox: string;
  readonly where_human_sample_obtained_checkbox: string;
  readonly where_project_take_place_checkbox: string;
  readonly details_other_organisation_text: Locator;
  readonly use_pic_radio: string;

  //Initialize Page Objects
  constructor(page: Page) {
    this.page = page;
    this.projectFilterPageTestData = projectFilterPageTestData;

    //Locators
    this.pageHeadingCaption = page.locator('legend', {
      hasText: this.projectFilterPageTestData['Project_Filter'].heading_caption,
    });
    this.pageHeading = page.getByText(this.projectFilterPageTestData['Project_Filter'].heading);
    this.short_project_title_text = page.locator('input[id="IQA0002_Text"]');
    this.full_project_title_text = page.locator('input[id="IQA0003_Text"]');
    this.is_project_managed_commercial_research_radio = '//label[contains(@for,"IQA0004") and text()="%s"]';
    this.is_nihr_funding_radio = '//label[contains(@for,"IQA03271") and text()="%s"]';
    this.access_cpms_services_radio = '//label[contains(@for,"IQA0005") and text()="%s"]';
    this.email_initial_contact_cpms_text = page.locator('input[id="IQA0006_Text"]');
    this.is_educational_project_radio = '//label[contains(@for,"IQA0012") and text()="%s"]';
    this.activities_involved_checkbox = '//label[contains(@for,"IQA0061") and text()="%s"]';
    this.is_research_bioresource_radio = '//label[contains(@for,"IQA0014") and text()="%s"]';
    this.bioresource_established_nhs_hsc_radio = '//label[contains(@for,"IQA0015") and text()="%s"]';
    this.is_ctimp_radio = '//label[contains(@for,"IQA0017") and text()="%s"]';
    this.options_applied_for_project_radio = '//label[contains(@for,"IQA0018") and text()="%s"]';
    this.product_contain_genetically_modified_organism_radio = '//label[contains(@for,"IQA03282") and text()="%s"]';
    this.is_clinical_or_medical_devices_radio = '//label[contains(@for,"IQA0020") and text()="%s"]';
    this.exposing_ionising_radiation_radio = '//label[contains(@for,"IQA0021") and text()="%s"]';
    this.using_human_biological_samples_radio = '//label[contains(@for,"IQA0022") and text()="%s"]';
    this.patient_data_accessed_outside_radio = '//label[contains(@for,"IQA0024") and text()="%s"]';
    this.research_with_adults_lacking_capacity_to_consent_radio = '//label[contains(@for,"IQA0025") and text()="%s"]';
    this.include_children_radio = '//label[contains(@for,"IQA0026") and text()="%s"]';
    this.include_prisoners_offenders_radio = '//label[contains(@for,"IQA0027") and text()="%s"]';
    this.involve_ministry_of_defence_radio = '//label[contains(@for,"IQA0028") and text()="%s"]';
    this.involve_hfea_radio = '//label[contains(@for,"IQA0029") and text()="%s"]';
    this.is_outside_uk_radio = '//label[contains(@for,"IQA0142") and text()="%s"]';
    this.places_in_uk_for_project_checkbox = '//label[contains(@for,"IQA0032") and text()="%s"]';
    this.where_human_sample_held_checkbox = '//label[contains(@for,"IQA0033") and text()="%s"]';
    this.where_human_sample_obtained_checkbox = '//label[contains(@for,"IQA0034") and text()="%s"]';
    this.where_project_take_place_checkbox = '//label[contains(@for,"IQA0144") and text()="%s"]';
    this.details_other_organisation_text = page.locator('input[id="IQA0145_Text"]');
    this.use_pic_radio = '//label[contains(@for,"IQA0146") and text()="%s"]';
  }

  //Page Methods
  async goto() {
    await this.page.goto('');
  }

  async assertOnProjectFilterPage() {
    await expect(this.pageHeadingCaption).toBeVisible();
    await expect(this.pageHeading).toBeVisible();
    expect(await this.page.title()).toBe(this.projectFilterPageTestData['Project_Filter'].title);
  }
}
