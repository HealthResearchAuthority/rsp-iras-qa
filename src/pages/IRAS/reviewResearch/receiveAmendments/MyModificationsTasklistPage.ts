import { expect, Locator, Page } from '@playwright/test';
import * as linkTextData from '../../../../resources/test_data/common/link_text_data.json';
import * as myModificationsTasklistPageTestData from '../../../../resources/test_data/iras/reviewResearch/receiveAmendments/my_modifications_tasklist_page_data.json';

//Declare Page Objects
export default class MyModificationsTasklistPage {
  readonly page: Page;
  readonly myModificationsTasklistPageTestData: typeof myModificationsTasklistPageTestData;
  readonly linkTextData: typeof linkTextData;
  readonly page_heading: Locator;
  readonly page_description: Locator;

  //Initialize Page Objects
  constructor(page: Page) {
    this.page = page;
    this.myModificationsTasklistPageTestData = myModificationsTasklistPageTestData;

    //Locators
    this.page_heading = this.page
      .getByRole('heading')
      .getByText(this.myModificationsTasklistPageTestData.My_Modifications_Tasklist_Page.page_heading);
    this.page_description = this.page
      .getByRole('paragraph')
      .getByText(this.myModificationsTasklistPageTestData.My_Modifications_Tasklist_Page.page_description);
  }

  //Page Methods

  async assertOnMyTaskListPage() {
    await expect.soft(this.page_heading).toBeVisible();
    await expect.soft(this.page_description).toBeVisible(); //Not visible due to CMS issue
    expect
      .soft(await this.page.title())
      .toBe(this.myModificationsTasklistPageTestData.My_Modifications_Tasklist_Page.title);
  }

  async goto() {
    await this.page.goto('mytasklist/index');
    await this.assertOnMyTaskListPage();
  }
}
