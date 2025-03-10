import { expect, Locator, Page } from '@playwright/test';
import * as devicesPageTestData from '../../../resources/test_data/iras/question_set/pages/devices_page_data.json';
import { getTextFromElementArray } from '../../../utils/UtilFunctions';

//Declare Page Objects
export default class DevicesPage {
  readonly page: Page;
  readonly devicesPageTestData: typeof devicesPageTestData;
  readonly devices_section_headings: Locator;
  readonly devices_filter_questions_section: Locator;
  readonly device_investigation_no_mhra_section: Locator;
  readonly is_sponsored_by_device_company_radio: Locator;
  readonly type_of_project_first_radio: Locator;
  readonly type_of_project_second_radio: Locator;
  readonly will_research_conducted_northern_ireland_radio: Locator;
  readonly what_review_needed_first_radio: Locator;
  readonly what_review_needed_second_radio: Locator;
  readonly is_manufacturer_lead_sponsor_radio: Locator;
  readonly name_of_manufacturer_text: Locator;
  readonly trade_name_for_device_text: Locator;
  readonly name_for_device_text: Locator;
  readonly number_for_device_text: Locator;
  readonly generic_name_of_device_text: Locator;
  readonly length_of_time_device_used_text: Locator;
  readonly type_of_research_project_radio: Locator;
  readonly will_device_used_within_intended_population_radio: Locator;
  readonly description_of_any_new_device_text: Locator;
  readonly composition_of_any_new_implantable_materials_text: Locator;
  readonly summary_of_modifications_to_marked_devices_text: Locator;
  readonly summary_of_proposed_changes_to_intended_purpose_text: Locator;
  readonly procedures_involved_non_invasive_radio: Locator;
  readonly arrangements_for_manufacture_of_device_text: Locator;
  readonly what_safety_testing_undertaken_text: Locator;
  readonly sponsors_plan_further_development_text: Locator;
  readonly details_device_manufactures_standards_expected_text: Locator;

  //Initialize Page Objects
  constructor(page: Page) {
    this.page = page;
    this.devicesPageTestData = devicesPageTestData;

    //Locators
    this.devices_section_headings = this.page.locator('.govuk-fieldset__legend--l');
    //Devices Filter Questions Section
    //Check on the below xpath. - Convert this to CSS if possible. Need to investigate further
    this.devices_filter_questions_section = this.page.locator(
      '//legend[contains(text(),"Devices Filter Questions")]/parent::fieldset'
    );
    this.is_sponsored_by_device_company_radio = this.devices_filter_questions_section.getByTestId(/^IQA0309/);
    this.type_of_project_first_radio = this.devices_filter_questions_section.getByTestId(/^IQA03010/);
    this.type_of_project_second_radio = this.devices_filter_questions_section.getByTestId(/^IQA03011/);
    this.will_research_conducted_northern_ireland_radio =
      this.devices_filter_questions_section.getByTestId(/^IQA03012/);
    this.what_review_needed_first_radio = this.devices_filter_questions_section.getByTestId(/^IQA03014/);
    this.what_review_needed_second_radio = this.devices_filter_questions_section.getByTestId(/^IQA03015/);
    //Device investigations not requiring review by MHRA Section
    //Check on the below xpath. - Convert this to CSS if possible. Need to investigate further
    this.device_investigation_no_mhra_section = this.page.locator(
      '//legend[contains(text(),"Device investigations not requiring review by MHRA")]/parent::fieldset'
    );
    this.is_manufacturer_lead_sponsor_radio = this.device_investigation_no_mhra_section.getByTestId(/^IQA03247/);
    this.name_of_manufacturer_text = this.device_investigation_no_mhra_section.getByTestId('IQA03249_Text');
    this.trade_name_for_device_text = this.device_investigation_no_mhra_section.getByTestId('IQA03250_Text');
    this.name_for_device_text = this.device_investigation_no_mhra_section.getByTestId('IQA03252_Text');
    this.number_for_device_text = this.device_investigation_no_mhra_section.getByTestId('IQA03253_Text');
    this.generic_name_of_device_text = this.device_investigation_no_mhra_section.getByTestId('IQA03254_Text');
    this.length_of_time_device_used_text = this.device_investigation_no_mhra_section.getByTestId('IQA03255_Text');
    this.type_of_research_project_radio = this.device_investigation_no_mhra_section.getByTestId(/^IQA03256/);
    this.will_device_used_within_intended_population_radio =
      this.device_investigation_no_mhra_section.getByTestId(/^IQA03257/);
    this.description_of_any_new_device_text = this.device_investigation_no_mhra_section.getByTestId('IQA03258_Text');
    this.composition_of_any_new_implantable_materials_text =
      this.device_investigation_no_mhra_section.getByTestId('IQA03259_Text');
    this.summary_of_modifications_to_marked_devices_text =
      this.device_investigation_no_mhra_section.getByTestId('IQA03260_Text');
    this.summary_of_proposed_changes_to_intended_purpose_text =
      this.device_investigation_no_mhra_section.getByTestId('IQA03261_Text');
    this.procedures_involved_non_invasive_radio = this.device_investigation_no_mhra_section.getByTestId(/^IQA03262/);
    this.arrangements_for_manufacture_of_device_text =
      this.device_investigation_no_mhra_section.getByTestId('IQA03263_Text');
    this.what_safety_testing_undertaken_text = this.device_investigation_no_mhra_section.getByTestId('IQA03264_Text');
    this.sponsors_plan_further_development_text =
      this.device_investigation_no_mhra_section.getByTestId('IQA03265_Text');
    this.details_device_manufactures_standards_expected_text =
      this.device_investigation_no_mhra_section.getByTestId('IQA03266_Text');
  }

  //Page Methods
  async goto() {
    await this.page.goto('questionnaire/displayquestionnaire?categoryId=C4');
  }

  async assertOnDevicesPage(activeStage: Locator) {
    const expectedSectionHeadingsText = this.devicesPageTestData.Devices.section_headings;
    expect(await activeStage.textContent()).toBe(this.devicesPageTestData.Devices.page_name);
    await expect(this.devices_section_headings).toHaveCount(expectedSectionHeadingsText.length);
    const actualSectionHeadings = await getTextFromElementArray(await this.devices_section_headings.all());
    for await (const expectedHeadingText of expectedSectionHeadingsText) {
      expect(actualSectionHeadings).toContainEqual(expectedHeadingText);
    }
    expect(await this.page.title()).toBe(this.devicesPageTestData.Devices.title);
  }

  async getQSetSectionLocator(sectionName: string): Promise<Locator> {
    let sectionLocator: Locator;
    if (sectionName === 'Devices_Filter_Questions') {
      sectionLocator = this.devices_filter_questions_section;
    } else if (sectionName === 'Device_Investigation_No_MHRA') {
      sectionLocator = this.device_investigation_no_mhra_section;
    } else {
      throw new Error(
        `${sectionName} is not defined in the devices page. Create a locator for the section - ${sectionName}`
      );
    }
    return sectionLocator;
  }
}
