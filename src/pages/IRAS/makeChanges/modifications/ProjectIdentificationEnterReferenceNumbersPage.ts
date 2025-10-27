import { expect, Locator, Page } from '@playwright/test';
import * as projectIdentificationEnterReferenceNumbersPageTestData from '../../../../resources/test_data/iras/make_changes/modifications/project_identification_enter_reference_numbers_data.json';
import CommonItemsPage from '../../../Common/CommonItemsPage';

//Declare Page Objects
export default class ProjectIdentificationEnterReferenceNumbersPage {
  readonly page: Page;
  readonly projectIdentificationEnterReferenceNumbersPageTestData: typeof projectIdentificationEnterReferenceNumbersPageTestData;
  readonly pageHeading: Locator;
  readonly isrctn_reference_number_textbox: Locator;
  readonly nct_reference_number_textbox: Locator;
  readonly funder_name_textbox: Locator;
  readonly funder_reference_number_textbox: Locator;
  readonly other_reference_number_textbox: Locator;
  readonly what_other_is_textbox: Locator;
  readonly current_short_project_title_label: Locator;
  readonly new_short_project_title_text: Locator;
  readonly new_full_project_title_text: Locator;

  //Initialize Page Objects
  constructor(page: Page) {
    this.page = page;
    this.projectIdentificationEnterReferenceNumbersPageTestData =
      projectIdentificationEnterReferenceNumbersPageTestData;

    //Locators
    this.pageHeading = this.page.getByRole('heading', {
      name: projectIdentificationEnterReferenceNumbersPageTestData.Project_Identification_Enter_Reference_Numbers_Page
        .heading_label,
    });

    this.isrctn_reference_number_textbox = this.page
      .getByText(
        projectIdentificationEnterReferenceNumbersPageTestData.Project_Identification_Enter_Reference_Numbers_Page
          .isrctn_reference_number_textbox_label
      )
      .locator('..')
      .getByTestId('IQA0832_Text');

    this.nct_reference_number_textbox = this.page
      .getByText(
        projectIdentificationEnterReferenceNumbersPageTestData.Project_Identification_Enter_Reference_Numbers_Page
          .nct_reference_number_textbox_label
      )
      .locator('..')
      .getByTestId('IQA0833_Text');

    this.funder_name_textbox = this.page
      .getByText(
        projectIdentificationEnterReferenceNumbersPageTestData.Project_Identification_Enter_Reference_Numbers_Page
          .funder_name_textbox_label
      )
      .locator('..')
      .getByTestId('IQA0834_Text');

    this.funder_reference_number_textbox = this.page
      .getByText(
        projectIdentificationEnterReferenceNumbersPageTestData.Project_Identification_Enter_Reference_Numbers_Page
          .funder_reference_number_textbox_label
      )
      .locator('..')
      .getByTestId('IQA0835_Text');

    this.other_reference_number_textbox = this.page
      .getByText(
        projectIdentificationEnterReferenceNumbersPageTestData.Project_Identification_Enter_Reference_Numbers_Page
          .other_reference_number_textbox_label
      )
      .locator('..')
      .getByTestId('IQA0836_Text');

    this.what_other_is_textbox = this.page
      .getByText(
        projectIdentificationEnterReferenceNumbersPageTestData.Project_Identification_Enter_Reference_Numbers_Page
          .what_other_is_textbox_label
      )
      .locator('..')
      .getByTestId('IQA0837_Text');

    this.current_short_project_title_label = this.page
      .getByText(
        projectIdentificationEnterReferenceNumbersPageTestData.Project_Identification_Enter_Reference_Numbers_Page
          .current_short_project_title_label
      )
      .locator('..')
      .locator('.govuk-body');

    this.new_short_project_title_text = this.page
      .getByText(
        projectIdentificationEnterReferenceNumbersPageTestData.Project_Identification_Enter_Reference_Numbers_Page
          .new_short_project_title_textbox_label
      )
      .locator('..')
      .getByTestId('IQA0002_Text');

    this.new_short_project_title_text = this.page.locator('input[type ="text"]').nth(0);

    this.new_full_project_title_text = this.page
      .getByText(
        projectIdentificationEnterReferenceNumbersPageTestData.Project_Identification_Enter_Reference_Numbers_Page
          .new_full_project_title_textbox_label
      )
      .locator('..')
      .getByTestId('IQA0789_Text');
  }

  //Page Methods
  async assertOnProjectIdentificationEnterReferenceNumbersPage() {
    await expect(this.pageHeading).toBeVisible();
    const currentUrl = this.page.url();
    expect.soft(currentUrl).toContain('prn-reference-numbers');
  }

  async fillProjectIdentificationEnterReferenceNumbersPage(dataset: any) {
    const commonItemsPage = new CommonItemsPage(this.page);
    const referenceNumbersDataset = dataset['Project_Reference'];
    for (const key in referenceNumbersDataset) {
      if (Object.hasOwn(referenceNumbersDataset, key)) {
        await commonItemsPage.fillUIComponent(referenceNumbersDataset, key, this);
      }
    }
  }
}
