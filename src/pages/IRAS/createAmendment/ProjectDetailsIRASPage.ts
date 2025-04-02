import { expect, Locator, Page } from '@playwright/test';
import * as projectDetailsIRASPageTestData from '../../../resources/test_data/iras/make_changes/project_details_iras_data.json';

//Declare Page Objects
export default class ProjectDetailsIRASPage {
  readonly page: Page;
  readonly projectDetailsIRASPageTestData: typeof projectDetailsIRASPageTestData;
  readonly pageHeading: Locator;
  readonly iras_textbox_label: Locator;
  readonly iras_id_text: Locator;
  readonly iras_id_text_summary_error_label: Locator;
  readonly iras_textbox_hint: Locator;

  //Initialize Page Objects
  constructor(page: Page) {
    this.page = page;
    this.projectDetailsIRASPageTestData = projectDetailsIRASPageTestData;

    //Locators
    this.pageHeading = this.page.getByTestId('title');
    this.iras_textbox_label = this.page.locator('label[for="IQA0001_Text"]');
    this.iras_textbox_hint = this.page.getByTestId('rule-hint');
    this.iras_id_text = this.page.getByTestId('IQA0001_Text');
    this.iras_id_text_summary_error_label = this.page.locator('a[href="#Questions[0].AnswerText"]');
  }

  //Page Methods
  async assertOnProjectDetailsIRASPage() {
    await expect(this.pageHeading).toBeVisible();
    await expect(this.pageHeading).toHaveText(this.projectDetailsIRASPageTestData.Project_Details_IRAS_Page.heading);
  }
}
