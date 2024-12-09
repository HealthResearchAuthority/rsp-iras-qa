import { expect, Locator, Page } from '@playwright/test';
import * as tissuePageTestData from '../../../resources/test_data/iras/question_set/pages/tissue_page_data.json';
import { getTextFromElementArray } from '../../../utils/UtilFunctions';

//Declare Page Objects
export default class TissuePage {
  readonly page: Page;
  readonly tissuePageTestData: typeof tissuePageTestData;
  readonly tissue_section_headings: Locator;
  readonly human_biological_samples_section: Locator;
  readonly health_related_findings_section: Locator;
  readonly describe_type_of_material_text: Locator;
  readonly is_sample_collected_from_new_participants_radio: Locator;
  readonly will_samples_provided_extra_with_consent_radio: Locator;
  readonly how_samples_collected_text: Locator;
  readonly participants_living_deceased_radio: Locator;
  readonly samples_removed_deceased_regions_checkbox: Locator;
  readonly details_relevant_human_tissue_authority_license_text: Locator;
  readonly material_identifiable_radio: Locator;
  readonly scope_of_consent_for_use_of_material_radio: Locator;
  readonly will_materials_imported_exported_outside_radio: Locator;
  readonly will_materials_imported_exported_outside_of_scotland_radio: Locator;
  readonly reason_import_export_text: Locator;
  readonly consent_arrangement_for_use_of_sample_radio: Locator;
  readonly details_where_samples_stored_text: Locator;
  readonly how_sample_processed_stored_radio: Locator;
  readonly what_happen_material_end_of_project_checkbox: Locator;
  readonly how_destruction_material_undertaken_text: Locator;
  readonly further_details_proposed_post_study_text: Locator;
  readonly will_project_produce_health_related_findings_radio: Locator;
  readonly will_arrangements_made_notify_individuals_radio: Locator;
  readonly explain_why_not_notified_text: Locator;

  //Initialize Page Objects
  constructor(page: Page) {
    this.page = page;
    this.tissuePageTestData = tissuePageTestData;

    //Locators
    this.tissue_section_headings = this.page.locator('.govuk-fieldset__legend--l');
    //Human Biological Samples Section
    this.human_biological_samples_section = this.page.locator(
      '//legend[contains(text(),"Human biological samples")]/parent::fieldset'
    );
    this.describe_type_of_material_text = this.human_biological_samples_section.getByTestId('IQA0253_Text');
    this.is_sample_collected_from_new_participants_radio =
      this.human_biological_samples_section.getByTestId(/^IQA0254/);
    this.will_samples_provided_extra_with_consent_radio = this.human_biological_samples_section.getByTestId(/^IQA0255/);
    this.how_samples_collected_text = this.human_biological_samples_section.getByTestId('IQA0256_Text');
    this.participants_living_deceased_radio = this.human_biological_samples_section.getByTestId(/^IQA0257/);
    this.samples_removed_deceased_regions_checkbox = this.human_biological_samples_section.getByTestId(/^IQA0258/);
    this.details_relevant_human_tissue_authority_license_text =
      this.human_biological_samples_section.getByTestId('IQA0259_Text');
    this.material_identifiable_radio = this.human_biological_samples_section.getByTestId(/^IQA0260/);
    this.scope_of_consent_for_use_of_material_radio = this.human_biological_samples_section.getByTestId(/^IQA0261/);
    this.will_materials_imported_exported_outside_radio = this.human_biological_samples_section.getByTestId(/^IQA0262/);
    this.will_materials_imported_exported_outside_of_scotland_radio =
      this.human_biological_samples_section.getByTestId(/^IQA0263/);
    this.reason_import_export_text = this.human_biological_samples_section.getByTestId('IQA0264_Text');
    this.consent_arrangement_for_use_of_sample_radio = this.human_biological_samples_section.getByTestId(/^IQA0265/);
    this.details_where_samples_stored_text = this.human_biological_samples_section.getByTestId('IQA0266_Text');
    this.how_sample_processed_stored_radio = this.human_biological_samples_section.getByTestId(/^IQA0267/);
    this.what_happen_material_end_of_project_checkbox = this.human_biological_samples_section.getByTestId(/^IQA0268/);
    this.how_destruction_material_undertaken_text = this.human_biological_samples_section.getByTestId('IQA0269_Text');
    this.further_details_proposed_post_study_text = this.human_biological_samples_section.getByTestId('IQA0270_Text');
    //Health-related findings Section
    this.health_related_findings_section = this.page.locator(
      '//legend[contains(text(),"Health-related findings")]/parent::fieldset'
    );
    this.will_project_produce_health_related_findings_radio =
      this.health_related_findings_section.getByTestId(/^IQA0271/);
    this.will_arrangements_made_notify_individuals_radio = this.health_related_findings_section.getByTestId(/^IQA0272/);
    this.explain_why_not_notified_text = this.health_related_findings_section.getByTestId('IQA0273_Text');
  }

  //Page Methods
  async goto() {
    await this.page.goto('questionnaire/displayquestionnaire?categoryId=C6');
  }

  async assertOnTissuePage(activeStage: Locator) {
    const expectedSectionHeadingsText = this.tissuePageTestData.Tissue.section_headings;
    expect(await activeStage.textContent()).toBe(this.tissuePageTestData.Tissue.page_name);
    await expect(this.tissue_section_headings).toHaveCount(expectedSectionHeadingsText.length);
    const actualSectionHeadings = await getTextFromElementArray(await this.tissue_section_headings.all());
    for await (const expectedHeadingText of expectedSectionHeadingsText) {
      expect(actualSectionHeadings).toContainEqual(expectedHeadingText);
    }
    expect(await this.page.title()).toBe(this.tissuePageTestData.Tissue.title);
  }

  async getQSetSectionLocator(sectionName: string): Promise<Locator> {
    let sectionLocator: Locator;
    if (sectionName === 'Human_Biological_Samples') {
      sectionLocator = this.human_biological_samples_section;
    } else if (sectionName === 'Health_Related_Findings') {
      sectionLocator = this.health_related_findings_section;
    } else {
      throw new Error(
        `${sectionName} is not defined in the tissue page. Create a locator for the section - ${sectionName}`
      );
    }
    return sectionLocator;
  }
}
