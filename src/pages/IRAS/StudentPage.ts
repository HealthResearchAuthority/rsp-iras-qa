import { expect, Locator, Page } from '@playwright/test';
import * as studentPageTestData from '../../resources/test_data/iras/student_page_data.json';
import { getTextFromElementArray } from '../../utils/UtilFunctions';

//Declare Page Objects
export default class StudentPage {
  readonly page: Page;
  readonly studentPageTestData: typeof studentPageTestData;
  readonly student_section_headings: Locator;
  readonly educational_project_section: Locator;
  readonly role_of_student_text: Locator;
  readonly is_group_project_radio: Locator;
  readonly level_of_course_radio: Locator;
  readonly which_declaration_included_for_submission_radio: Locator;
  readonly university_text: Locator;
  readonly course_text: Locator;
  readonly is_university_sponsor_radio: Locator;
  readonly why_university_not_sponsor_text: Locator;
  readonly first_name_text: Locator;
  readonly last_name_text: Locator;
  readonly email_text: Locator;
  readonly who_is_chief_investigator_radio: Locator;
  readonly ci_first_name_text: Locator;
  readonly ci_last_name_text: Locator;
  readonly ci_job_title_text: Locator;
  readonly ci_university_text: Locator;
  readonly ci_email_text: Locator;

  //Initialize Page Objects
  constructor(page: Page) {
    this.page = page;
    this.studentPageTestData = studentPageTestData;

    //Locators
    this.student_section_headings = this.page.locator('.govuk-fieldset__legend--l');
    //Educational Project Section
    this.educational_project_section = this.page.locator('legend').getByText('Educational Project').locator('..');
    this.role_of_student_text = this.educational_project_section.getByTestId('IQA0218_Text');
    this.is_group_project_radio = this.educational_project_section.getByTestId(/^IQA0219/);
    this.level_of_course_radio = this.educational_project_section.getByTestId(/^IQA0222/);
    this.which_declaration_included_for_submission_radio = this.educational_project_section.getByTestId(/^IQA0223/);
    this.university_text = this.educational_project_section.getByTestId('IQA0220_Text');
    this.course_text = this.educational_project_section.getByTestId('IQA0221_Text');
    this.is_university_sponsor_radio = this.educational_project_section.getByTestId(/^IQA0224/);
    this.why_university_not_sponsor_text = this.educational_project_section.getByTestId('IQA0225_Text');
    this.first_name_text = this.educational_project_section.getByTestId('IQA0227_Text');
    this.last_name_text = this.educational_project_section.getByTestId('IQA0228_Text');
    this.email_text = this.educational_project_section.getByTestId('IQA0229_Text');
    this.who_is_chief_investigator_radio = this.educational_project_section.getByTestId(/^IQA0237/);
    this.ci_first_name_text = this.educational_project_section.getByTestId('IQA0232_Text');
    this.ci_last_name_text = this.educational_project_section.getByTestId('IQA0233_Text');
    this.ci_job_title_text = this.educational_project_section.getByTestId('IQA0234_Text');
    this.ci_university_text = this.educational_project_section.getByTestId('IQA0235_Text');
    this.ci_email_text = this.educational_project_section.getByTestId('IQA0236_Text');
  }

  //Page Methods
  async goto() {
    await this.page.goto('questionnaire/displayquestionnaire?categoryId=C1');
  }

  async assertOnStudentPage(activeStage: Locator) {
    const expectedSectionHeadingsText = this.studentPageTestData.Student.section_headings;
    expect(await activeStage.textContent()).toBe(this.studentPageTestData.Student.page_name);
    const actualSectionHeadings = await getTextFromElementArray(await this.student_section_headings.all());
    expectedSectionHeadingsText.forEach((expectedHeadingText) => {
      expect(actualSectionHeadings).toContainEqual(expectedHeadingText);
    });
    expect(await this.page.title()).toBe(this.studentPageTestData.Student.title);
  }
}
