import { expect, Locator, Page } from '@playwright/test';
import * as confirmProjectDetailsPageTestData from '../../../resources/test_data/iras/make_changes/confirm_project_details_data.json';

//Declare Page Objects
export default class ProjectDetailsIRASPage {
  readonly page: Page;
  readonly confirmProjectDetailsPageTestData: typeof confirmProjectDetailsPageTestData;
  readonly pageHeading: Locator;
  readonly iras_textbox_label: Locator;

  //Initialize Page Objects
  constructor(page: Page) {
    this.page = page;
    this.confirmProjectDetailsPageTestData = confirmProjectDetailsPageTestData;

    //Locators
    this.pageHeading = this.page
      .getByRole('heading')
      .getByText(this.confirmProjectDetailsPageTestData.Confirm_Project_Details_Page.heading);
  }

  //Page Methods
  async assertOnProjectDetailsIRASPage() {
    await expect(this.pageHeading).toBeVisible();
  }
}
