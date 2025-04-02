import { expect, Locator, Page } from '@playwright/test';
import * as childrenPageTestData from '../../../resources/test_data/iras/question_set/pages/children_page_data.json';
import { getTextFromElementArray } from '../../../utils/UtilFunctions';

//Declare Page Objects
export default class ChildrenPage {
  readonly page: Page;
  readonly childrenPageTestData: typeof childrenPageTestData;
  readonly children_section_headings: Locator;
  readonly children_section: Locator;
  readonly specify_ages_checkbox: Locator;
  readonly children_unable_understand_details_checkbox: Locator;
  readonly arrangements_obtaining_consent_parental_text: Locator;
  readonly provide_children_information_of_project_text: Locator;
  readonly seek_informed_consent_from_children_text: Locator;
  readonly seek_informed_consent_parental_under_age_text: Locator;
  readonly provide_children_information_about_trial_text: Locator;
  readonly is_child_treated_urgently_radio: Locator;
  readonly justify_need_for_urgent_treatment_text: Locator;
  readonly arrangements_to_seek_consent_text: Locator;
  readonly arrangements_to_seek_consent_reached_age_text: Locator;
  readonly explain_materials_resources_for_explaining_text: Locator;

  //Initialize Page Objects
  constructor(page: Page) {
    this.page = page;
    this.childrenPageTestData = childrenPageTestData;

    //Locators
    this.children_section_headings = this.page.locator('.govuk-fieldset__legend--l');
    //Children Section
    this.children_section = this.page.locator('legend').getByText('Children').locator('..');
    this.specify_ages_checkbox = this.children_section.getByTestId(/^IQA0238/);
    this.children_unable_understand_details_checkbox = this.children_section.getByTestId(/^IQA0239/);
    this.arrangements_obtaining_consent_parental_text = this.children_section.getByTestId('IQA0240_Text');
    this.provide_children_information_of_project_text = this.children_section.getByTestId('IQA0241_Text');
    this.seek_informed_consent_from_children_text = this.children_section.getByTestId('IQA0242_Text');
    this.seek_informed_consent_parental_under_age_text = this.children_section.getByTestId('IQA0243_Text');
    this.provide_children_information_about_trial_text = this.children_section.getByTestId('IQA0245_Text');
    this.is_child_treated_urgently_radio = this.children_section.getByTestId(/^IQA0246/);
    this.justify_need_for_urgent_treatment_text = this.children_section.getByTestId('IQA0247_Text');
    this.arrangements_to_seek_consent_text = this.children_section.getByTestId('IQA0248_Text');
    this.arrangements_to_seek_consent_reached_age_text = this.children_section.getByTestId('IQA0249_Text');
    this.explain_materials_resources_for_explaining_text = this.children_section.getByTestId('IQA0250_Text');
  }

  //Page Methods
  async goto() {
    await this.page.goto('questionnaire/displayquestionnaire?categoryId=C8');
  }

  async assertOnChildrenPage(activeStage: Locator) {
    const expectedSectionHeadingsText = this.childrenPageTestData.Children.section_headings;
    expect(await activeStage.textContent()).toBe(this.childrenPageTestData.Children.page_name);
    await expect(this.children_section_headings).toHaveCount(expectedSectionHeadingsText.length);
    const actualSectionHeadings = await getTextFromElementArray(await this.children_section_headings.all());
    for await (const expectedHeadingText of expectedSectionHeadingsText) {
      expect(actualSectionHeadings).toContainEqual(expectedHeadingText);
    }
    expect(await this.page.title()).toBe(this.childrenPageTestData.Children.title);
  }

  async getQSetSectionLocator(sectionName: string): Promise<Locator> {
    let sectionLocator: Locator;
    if (sectionName === 'Children_Section') {
      sectionLocator = this.children_section;
    } else {
      throw new Error(
        `${sectionName} is not defined in the children page. Create a locator for the section - ${sectionName}`
      );
    }
    return sectionLocator;
  }
}
