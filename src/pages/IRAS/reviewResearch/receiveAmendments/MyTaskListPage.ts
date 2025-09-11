import { expect, Locator, Page } from '@playwright/test';
import * as linkTextData from '../../../../resources/test_data/common/link_text_data.json';
import * as myTaskListPageTestData from '../../../../resources/test_data/iras/reviewResearch/receiveAmendments/my_task_list_page_data.json';

//Declare Page Objects
export default class MyTaskListPage {
  readonly page: Page;
  readonly myTaskListPageTestData: typeof myTaskListPageTestData;
  readonly linkTextData: typeof linkTextData;
  private _modifications_list_after_search: string[];
  readonly page_heading: Locator;
  readonly page_guidance_text: Locator;
  readonly iras_id_search_text: Locator;
  readonly search_box: Locator;
  readonly search_button_label: Locator;
  readonly next_button: Locator;
  readonly search_box_label: Locator;
  readonly listCell: Locator;
  readonly tableRows: Locator;

  //Initialize Page Objects
  constructor(page: Page) {
    this.page = page;
    this.myTaskListPageTestData = myTaskListPageTestData;
    this._modifications_list_after_search = [];

    //Locators
    this.page_heading = this.page
      .getByRole('heading')
      .getByText(this.myTaskListPageTestData.My_Task_List_Page.page_heading);
    this.page_guidance_text = this.page
      .getByRole('paragraph')
      .getByText(this.myTaskListPageTestData.My_Task_List_Page.page_guidance_text);
    this.iras_id_search_text = this.page.getByLabel(
      this.myTaskListPageTestData.My_Task_List_Page.iras_id_search_box_label,
      { exact: true }
    );
    this.search_box_label = this.page.locator('label[for="SearchQuery"]');
    this.search_box = this.page.getByTestId('SearchQuery');
    this.search_button_label = this.page.getByText('Search');
    this.next_button = this.page.locator('.govuk-pagination__next a');
    this.tableRows = this.page.getByRole('table').getByRole('row');
    this.listCell = this.page.getByRole('cell');
  }

  //Getters & Setters for Private Variables

  async getModificationIdListAfterSearch(): Promise<string[]> {
    return this._modifications_list_after_search;
  }

  async setModificationIdListAfterSearch(value: string[]): Promise<void> {
    this._modifications_list_after_search = value;
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
