import { expect, Locator, Page } from '@playwright/test';
import * as keyProjectRolesPageTestData from '../../../resources/test_data/iras/make_changes/key_project_roles_data.json';

//Declare Page Objects
export default class KeyProjectRolesPage {
  readonly page: Page;
  readonly keyProjectRolesPageTestData: typeof keyProjectRolesPageTestData;
  readonly pageHeading: Locator;
  readonly chief_investigator_header_label: Locator;
  readonly chief_investigator_email_label: Locator;
  readonly sponsor_contact_header_label: Locator;
  readonly sponsor_contact_email_label: Locator;
  readonly chief_investigator_email_text: Locator;
  readonly sponsor_contact_email_text: Locator;
  readonly chief_investigator_email_text_summary_error_label: Locator;
  readonly sponsor_contact_email_text_summary_error_label: Locator;
  readonly primary_sponsor_organisation_text: Locator;
  readonly primary_sponsor_organisation_header_label: Locator;
  readonly primary_sponsor_organisation_jsenabled_text: Locator;
  readonly primary_sponsor_organisation_suggestion_list_labels: Locator;
  readonly primary_sponsor_organisation_suggestion_listbox: Locator;

  //Initialize Page Objects
  constructor(page: Page) {
    this.page = page;
    this.keyProjectRolesPageTestData = keyProjectRolesPageTestData;

    //Locators
    this.pageHeading = this.page.getByTestId('title');
    this.chief_investigator_header_label = this.page.locator('label[for="IQA0311_Text"]');
    this.chief_investigator_email_label = this.page.getByTestId('chief-investigator-hint');
    this.sponsor_contact_header_label = this.page.locator('label[for="IQA0313_Text"]');
    this.sponsor_contact_email_label = this.page.getByTestId('sponsor-contact-hint');
    this.chief_investigator_email_text = this.page.getByTestId('IQA0311_Text');
    this.sponsor_contact_email_text = this.page.getByTestId('IQA0313_Text');
    this.chief_investigator_email_text_summary_error_label = this.page.locator('a[href="#Questions[0].AnswerText"]');
    this.sponsor_contact_email_text_summary_error_label = this.page.locator('a[href="#Questions[1].AnswerText"]');
    this.primary_sponsor_organisation_text = this.page.getByTestId('Questions_1_AnswerText');
    this.primary_sponsor_organisation_header_label = this.page.locator('label[for="IQA0312_Text"]');
    this.primary_sponsor_organisation_jsenabled_text = this.page.getByRole('combobox', {
      name: keyProjectRolesPageTestData.Label_Texts.primary_sponsor_organisation_header_label,
    });
    this.primary_sponsor_organisation_suggestion_list_labels = this.primary_sponsor_organisation_jsenabled_text
      .locator('..')
      .getByRole('option');
    this.primary_sponsor_organisation_suggestion_listbox = this.primary_sponsor_organisation_jsenabled_text
      .locator('..')
      .getByRole('listbox');
  }

  //Page Methods
  async assertOnKeyProjectRolesPage() {
    await expect(this.pageHeading).toBeVisible();
    await expect(this.pageHeading).toHaveText(this.keyProjectRolesPageTestData.Key_Project_roles_Page.heading);
  }
}
