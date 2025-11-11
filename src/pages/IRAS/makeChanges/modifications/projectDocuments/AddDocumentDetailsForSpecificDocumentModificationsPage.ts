import { expect, Locator, Page } from '@playwright/test';
import * as addDocumentDetailsForSpecificDocumentModificationsPageTestData from '../../../../../resources/test_data/iras/make_changes/modifications/projectDocuments/add_document_details_modifications_data.json';

//Declare Page Objects
export default class AddDocumentDetailsForSpecificDocumentModificationsPage {
  readonly page: Page;
  readonly addDocumentDetailsForSpecificDocumentModificationsPageTestData: typeof addDocumentDetailsForSpecificDocumentModificationsPageTestData;
  readonly pageHeading: Locator;
  readonly pageLabels: Locator;
  readonly table: Locator;
  readonly rows: Locator;
  readonly document_type_dropdown: Locator;
  readonly sponsor_document_version_text: Locator;
  readonly sponsor_document_date_fieldset: Locator;
  readonly sponsor_document_day_text: Locator;
  readonly sponsor_document_month_dropdown: Locator;
  readonly sponsor_document_year_text: Locator;
  readonly document_previously_approved_fieldset: Locator;
  readonly document_previously_approved_radio: Locator;
  readonly save_and_continue: Locator;
  readonly save_changes: Locator;
  readonly back_link: Locator;
  readonly sub_document_type_dropdown: Locator;
  readonly document_previously_approved_hint_text: Locator;

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
    this.document_type_dropdown = this.page.getByRole('combobox', {
      name: this.addDocumentDetailsForSpecificDocumentModificationsPageTestData
        .Add_Document_Details_For_Specific_Document_Modifications_Page.document_type_dropdown_label,
    });
    this.sponsor_document_version_text = this.page
      .locator('.govuk-form-group', {
        has: this.page.getByText(
          this.addDocumentDetailsForSpecificDocumentModificationsPageTestData
            .Add_Document_Details_For_Specific_Document_Modifications_Page.sponsor_document_version_label
        ),
      })
      .getByRole('textbox');
    this.sponsor_document_date_fieldset = this.page.locator('.govuk-form-group', {
      has: this.page.getByText(
        this.addDocumentDetailsForSpecificDocumentModificationsPageTestData
          .Add_Document_Details_For_Specific_Document_Modifications_Page.sponsor_document_date_label
      ),
    });
    this.sponsor_document_day_text = this.page.getByTestId('Questions[3].Day');
    this.sponsor_document_month_dropdown = this.sponsor_document_date_fieldset
      .locator('.govuk-form-group', {
        has: this.page.getByText(
          this.addDocumentDetailsForSpecificDocumentModificationsPageTestData
            .Add_Document_Details_For_Specific_Document_Modifications_Page.sponsor_document_date_month_label
        ),
      })
      .getByRole('combobox');
    this.sponsor_document_year_text = this.sponsor_document_date_fieldset
      .locator('.govuk-form-group', {
        has: this.page.getByText(
          this.addDocumentDetailsForSpecificDocumentModificationsPageTestData
            .Add_Document_Details_For_Specific_Document_Modifications_Page.sponsor_document_date_year_label
        ),
      })
      .getByRole('textbox');
    this.document_previously_approved_fieldset = this.page.locator('.govuk-form-group', {
      has: this.page.getByText(
        this.addDocumentDetailsForSpecificDocumentModificationsPageTestData
          .Add_Document_Details_For_Specific_Document_Modifications_Page.document_previously_approved_hint_text
      ),
    });
    this.document_previously_approved_hint_text = this.page.getByText(
      this.addDocumentDetailsForSpecificDocumentModificationsPageTestData
        .Add_Document_Details_For_Specific_Document_Modifications_Page.document_previously_approved_hint_text
    );
    this.document_previously_approved_radio = this.document_previously_approved_fieldset.getByRole('radio');
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
    this.back_link = this.page
      .getByRole('link')
      .getByText(
        this.addDocumentDetailsForSpecificDocumentModificationsPageTestData
          .Add_Document_Details_For_Specific_Document_Modifications_Page.back_link
      );
    this.sub_document_type_dropdown = this.page.getByRole('combobox', {
      name: this.addDocumentDetailsForSpecificDocumentModificationsPageTestData
        .Add_Document_Details_For_Specific_Document_Modifications_Page.sub_document_type_label,
    });
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
