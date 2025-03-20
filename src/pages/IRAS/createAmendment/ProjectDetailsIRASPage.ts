import { expect, Locator, Page } from '@playwright/test';
import * as projectDetailsIRASPageTestData from '../../../resources/test_data/iras/make_changes/project_details_iras_data.json';

//Declare Page Objects
export default class ProjectDetailsIRASPage {
  readonly page: Page;
  readonly projectDetailsIRASPageTestData: typeof projectDetailsIRASPageTestData;
  readonly pageHeading: Locator;
  readonly irasIDTextBoxLabel: Locator;
  readonly iras_id_text: Locator;
  readonly irasTextBoxHintLabel: Locator;

  //Initialize Page Objects
  constructor(page: Page) {
    this.page = page;
    this.projectDetailsIRASPageTestData = projectDetailsIRASPageTestData;

    //Locators
    this.pageHeading = this.page.getByTestId('title');
    this.irasIDTextBoxLabel = this.page.getByTestId('rule-hint');
    this.iras_id_text = this.page.getByTestId('IQA0001_Text');
    this.irasTextBoxHintLabel = this.page.locator('label[for="IQA0001_Text"]');
  }

  async assertOnProjectDetailsIRASPage() {
    await expect(this.pageHeading).toBeVisible();
    await expect(this.pageHeading).toHaveText(this.projectDetailsIRASPageTestData.Project_Details_IRAS_Page.heading);
  }
}
