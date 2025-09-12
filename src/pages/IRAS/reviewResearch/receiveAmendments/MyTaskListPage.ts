import { expect, Locator, Page } from '@playwright/test';
import * as linkTextData from '../../../../resources/test_data/common/link_text_data.json';
import * as myTaskListPageTestData from '../../../../resources/test_data/iras/reviewResearch/receiveAmendments/my_task_list_page_data.json';

//Declare Page Objects
export default class MyTaskListPage {
  readonly page: Page;
  readonly myTaskListPageTestData: typeof myTaskListPageTestData;
  readonly linkTextData: typeof linkTextData;
  readonly page_heading: Locator;
  readonly page_guidance_text: Locator;

  //Initialize Page Objects
  constructor(page: Page) {
    this.page = page;
    this.myTaskListPageTestData = myTaskListPageTestData;

    //Locators
    this.page_heading = this.page
      .getByRole('heading')
      .getByText(this.myTaskListPageTestData.My_Task_List_Page.page_heading);
    this.page_guidance_text = this.page
      .getByRole('paragraph')
      .getByText(this.myTaskListPageTestData.My_Task_List_Page.page_guidance_text);
  }

  //Page Methods

  async assertOnMyTaskListPage() {
    await expect.soft(this.page_heading).toBeVisible();
    await expect.soft(this.page_guidance_text).toBeVisible();
    expect.soft(await this.page.title()).toBe(this.myTaskListPageTestData.My_Task_List_Page.title);
  }

  async goto() {
    await this.page.goto('mytasklist/index');
    await this.assertOnMyTaskListPage();
  }
}
