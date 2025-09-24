import { expect, Locator, Page } from '@playwright/test';
import * as addDocumentDetailsForSpecificDocumentModificationsPageTestData from '../../../../../resources/test_data/iras/make_changes/modifications/projectDocuments/add_document_details_modifications_data.json';

//Declare Page Objects
export default class AddDocumentDetailsModificationsPage {
  readonly page: Page;
  readonly addDocumentDetailsForSpecificDocumentModificationsPageTestData: typeof addDocumentDetailsForSpecificDocumentModificationsPageTestData;
  readonly pageHeading: Locator;
  readonly pageLabels: Locator;
  readonly table: Locator;
  readonly rows: Locator;
  readonly document_type_dropdown: Locator;
  readonly sponsor_document_version_text: Locator;
  readonly sponsor_document_day_text: Locator;
  readonly sponsor_document_month_dropdown: Locator;
  readonly sponsor_document_year_text: Locator;
  readonly document_previously_approved_radio: Locator;
  readonly save_and_continue: Locator;
  readonly save_changes: Locator;

  //Initialize Page Objects
  constructor(page: Page) {
    this.page = page;
    this.addDocumentDetailsForSpecificDocumentModificationsPageTestData =
      addDocumentDetailsForSpecificDocumentModificationsPageTestData;

    //Locators
    this.pageHeading = this.page.getByRole('heading');
    this.pageLabels = this.page.getByRole('paragraph');
    this.table = this.page.getByRole('table');
    this.rows = this.page.locator('tr');
    this.document_type_dropdown = this.page.getByTestId('Questions[0].SelectedOption');
    this.sponsor_document_version_text = this.page.getByTestId('IQA0601_Text');
    this.sponsor_document_day_text = this.page.getByTestId('Questions[3].Day');
    this.sponsor_document_month_dropdown = this.page.getByTestId('Questions[3].Month');
    this.sponsor_document_year_text = this.page.getByTestId('Questions[3].Year');
    this.document_previously_approved_radio = this.page.locator('.govuk-radios__input');
    this.save_and_continue = this.page
      .getByRole('button')
      .getByText(
        this.addDocumentDetailsForSpecificDocumentModificationsPageTestData
          .Add_Document_Details_For_Specific_Document_Modifications_Page.save_and_continue,
        {
          exact: true,
        }
      );
    this.save_changes = this.page
      .getByRole('button')
      .getByText(
        this.addDocumentDetailsForSpecificDocumentModificationsPageTestData
          .Add_Document_Details_For_Specific_Document_Modifications_Page.save_changes,
        {
          exact: true,
        }
      );
  }

  //Page Methods
  async assertOnAddDocumentsDetailsForSpecificModificationsPage(filename: string) {
    const trimmedFileName = filename.replace('Add details for ', '').trim();
    const expectedPageHeading =
      this.addDocumentDetailsForSpecificDocumentModificationsPageTestData
        .Add_Document_Details_For_Specific_Document_Modifications_Page.heading +
      ' ' +
      trimmedFileName;
    await expect.soft(this.pageHeading.getByText(expectedPageHeading, { exact: true })).toBeVisible();

    const expectedPageTitle =
      this.addDocumentDetailsForSpecificDocumentModificationsPageTestData
        .Add_Document_Details_For_Specific_Document_Modifications_Page.page_title_first_part +
      ' ' +
      trimmedFileName +
      ' ' +
      this.addDocumentDetailsForSpecificDocumentModificationsPageTestData
        .Add_Document_Details_For_Specific_Document_Modifications_Page.page_title_second_part;
    expect.soft(await this.page.title()).toBe(expectedPageTitle);
  }
}
