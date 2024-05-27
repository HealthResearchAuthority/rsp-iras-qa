import { expect, Locator, Page } from '@playwright/test';
import { confirmStringNotNull } from '../utils/UtilFunctions';
import * as tasksPageTestData from "../resources/test_data/iras/tasks_page_data.json";

//Declare Page Objects
export default class TasksPage {
  readonly page: Page;
  readonly tasksPageTestData: typeof tasksPageTestData;
  readonly pageTitle: Locator;
  readonly taskTable: Locator;
  readonly taskTableTopBodyRow: Locator;
  readonly taskTableTopBodyCell: Locator;

  //Initialize Page Objects
  constructor(page: Page) {
    this.page = page;
    this.tasksPageTestData = tasksPageTestData;

    //Locators
    this.pageTitle = page.getByText(this.tasksPageTestData.Tasks_Page.header);
    this.taskTable = page.locator('div[id="PEGA_GRID0"]');
    this.taskTableTopBodyRow = page.locator('tr[pl_index="1"]');
    this.taskTableTopBodyCell = this.taskTableTopBodyRow.locator('td');
  }

  //Page Methods
  async goto() {
    await this.page.goto('');
  }

  async assertOnTasksPage() {
    await expect(this.pageTitle).toBeVisible();
  }

  async getUserTaskValues(): Promise<string[]> {
    let actualRowValues: string[] = [];
    for (const cell of await this.taskTableTopBodyCell.all()) {
      actualRowValues.push(confirmStringNotNull(await cell.textContent()));
    }
    return actualRowValues;
  }
}
