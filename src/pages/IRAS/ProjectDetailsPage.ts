import { expect, Locator, Page } from '@playwright/test';
import * as projectDetailsPageTestData from '../../resources/test_data/iras/project_details_page_data.json';
import { getTextFromElementArray } from '../../utils/UtilFunctions';

//Declare Page Objects
export default class ProjectDetailsPage {
  readonly page: Page;
  readonly projectDetailsPageTestData: typeof projectDetailsPageTestData;

  readonly projectDetailsSectionHeadings: Locator;
  readonly projectInformationSection: Locator;
  readonly projectInformationTextInputField: Locator;
  readonly projectInformationFormGroupLabel: Locator;
  readonly publicInvolvementSection: Locator;
  readonly publicInvolvementTextInputField: Locator;
  readonly publicInvolvementFormGroupLabel: Locator;
  readonly researchDesignSection: Locator;
  readonly researchDesignSectionTextInputField: Locator;
  readonly researchDesignSectionFormGroupLabel: Locator;
  readonly researchActivitiesSection: Locator;
  readonly researchActivitiesSectionTextInputField: Locator;
  readonly researchActivitiesSectionDateInputField: Locator;
  readonly researchActivitiesSectionFormGroupLabel: Locator;
  readonly participantsSection: Locator;
  readonly participantsSectionTextInputField: Locator;
  readonly participantsSectionDateInputField: Locator;
  readonly participantsSectionFormGroupLabel: Locator;

  //Initialize Page Objects
  constructor(page: Page) {
    this.page = page;
    this.projectDetailsPageTestData = projectDetailsPageTestData;

    //Locators
    this.projectDetailsSectionHeadings = page.locator('.govuk-fieldset__legend--l');
    this.projectInformationSection = page.locator('legend').getByText('Project Information').locator('..');
    this.projectInformationTextInputField = this.projectInformationSection.locator('div').locator('.govuk-input');
    this.projectInformationFormGroupLabel = this.projectInformationSection
      .locator('.govuk-form-group')
      .locator('legend');
    this.publicInvolvementSection = page.locator('legend').getByText('Public Involvement').locator('..');
    this.publicInvolvementTextInputField = this.publicInvolvementSection.locator('div').locator('.govuk-input');
    this.publicInvolvementFormGroupLabel = this.publicInvolvementSection.locator('.govuk-form-group').locator('legend');
    this.researchDesignSection = page.locator('legend').getByText('Research Design and Methodology').locator('..');
    this.researchDesignSectionTextInputField = this.researchDesignSection.locator('div').locator('.govuk-input');
    this.researchDesignSectionFormGroupLabel = this.researchDesignSection
      .locator('.govuk-form-group')
      .locator('legend');
    this.researchActivitiesSection = page.locator('legend').getByText('Research Activities').locator('..');
    this.researchActivitiesSectionTextInputField = this.researchActivitiesSection
      .locator('div')
      .locator('.govuk-input');
    this.researchActivitiesSectionDateInputField = this.researchActivitiesSection
      .locator('div')
      .locator('.govuk-date-input');
    this.researchActivitiesSectionFormGroupLabel = this.researchActivitiesSection
      .locator('.govuk-form-group')
      .locator('legend');
    this.participantsSection = page.locator('legend').getByText('Participants').locator('..');
    this.participantsSectionTextInputField = this.participantsSection.locator('div').locator('.govuk-input');
    this.participantsSectionDateInputField = this.participantsSection.locator('div').locator('.govuk-date-input');
    this.participantsSectionFormGroupLabel = this.participantsSection.locator('.govuk-form-group').locator('legend');
  }

  //Page Methods
  async goto() {
    await this.page.goto('questionnaire/displayquestionnaire?categoryId=B');
  }

  async assertOnProjectDetailsPage(activeStage: Locator) {
    const expectedSectionHeadingsText = projectDetailsPageTestData.Project_Details.section_headings;
    expect(await activeStage.textContent()).toBe(this.projectDetailsPageTestData.Project_Details.page_name);
    const actualSectionHeadings = await getTextFromElementArray(await this.projectDetailsSectionHeadings.all());
    expectedSectionHeadingsText.forEach((expectedHeadingText) => {
      expect(actualSectionHeadings).toContainEqual(expectedHeadingText);
    });
    expect(await this.page.title()).toBe(this.projectDetailsPageTestData.Project_Details.title);
  }
}
