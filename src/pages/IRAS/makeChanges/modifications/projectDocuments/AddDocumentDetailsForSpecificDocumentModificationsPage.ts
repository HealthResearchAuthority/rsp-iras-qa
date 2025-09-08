import { Locator, Page } from '@playwright/test';
import * as addDocumentDetailsForSpecificDocumentModificationsPageTestData from '../../../../../resources/test_data/iras/make_changes/modifications/projectDocuments/add_document_details_modifications_data.json';

//Declare Page Objects
export default class AddDocumentDetailsModificationsPage {
  readonly page: Page;
  readonly addDocumentDetailsForSpecificDocumentModificationsPageTestData: typeof addDocumentDetailsForSpecificDocumentModificationsPageTestData;
  readonly pageHeading: Locator;
  readonly pageLabels: Locator;

  //Initialize Page Objects
  constructor(page: Page) {
    this.page = page;
    this.addDocumentDetailsForSpecificDocumentModificationsPageTestData =
      addDocumentDetailsForSpecificDocumentModificationsPageTestData;

    //Locators
    this.pageHeading = this.page.getByRole('heading');
    this.pageLabels = this.page.getByRole('paragraph');
  }
}
