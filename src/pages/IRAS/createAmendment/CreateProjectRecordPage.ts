import { expect, Locator, Page } from '@playwright/test';
import * as createProjectRecordPageTestData from '../../../resources/test_data/iras/make_changes/create_project_record_data.json';

//Declare Page Objects
export default class CreateProjectRecordPage {
  readonly page: Page;
  readonly createProjectRecordPageTestData: typeof createProjectRecordPageTestData;
  readonly pageHeading: Locator;
  readonly guidanceTextLabel: Locator;

  //Initialize Page Objects
  constructor(page: Page) {
    this.page = page;
    this.createProjectRecordPageTestData = createProjectRecordPageTestData;

    //Locators
    this.pageHeading = this.page.getByTestId('page-title');
    this.guidanceTextLabel = this.page.getByTestId('');
  }

  async assertOnCreateProjectRecordPage() {
    await expect(this.pageHeading).toBeVisible();
    await expect(this.pageHeading).toHaveText(this.createProjectRecordPageTestData.Create_Project_Record_Page.heading);
  }
}
