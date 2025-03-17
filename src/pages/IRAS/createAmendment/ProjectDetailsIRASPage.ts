import { expect, Locator, Page } from '@playwright/test';
import * as projectDetailsIRASPageTestData from '../../../resources/test_data/iras/make_changes/project_details_iras_data.json';

//Declare Page Objects
export default class ProjectDetailsIRASPage {
  readonly page: Page;
  readonly projectDetailsIRASPageTestData: typeof projectDetailsIRASPageTestData;
  readonly pageHeading: Locator;
  readonly irasIDTextBoxLabel: Locator;
  readonly irasIDTextBox: Locator;
  readonly irasTextBoxHintLabel: Locator;

  //Initialize Page Objects
  constructor(page: Page) {
    this.page = page;
    this.projectDetailsIRASPageTestData = projectDetailsIRASPageTestData;

    //Locators
    this.pageHeading = this.page.getByTestId('');
    this.irasIDTextBoxLabel = this.page.getByTestId('');
    this.irasIDTextBox = this.page.getByTestId('');
    this.irasTextBoxHintLabel = this.page.getByTestId('');
  }

  //Page Methods
  async goto() {
    await this.page.goto('project_Details');
  }

  async assertOnProjectDetailsIRASPage() {
    await expect(this.pageHeading).toBeVisible();
    await expect(this.pageHeading).toHaveText(this.projectDetailsIRASPageTestData.Project_Details_IRAS_Page.heading);
    expect(await this.page.title()).toBe(this.projectDetailsIRASPageTestData.Project_Details_IRAS_Page.title);
  }
}
