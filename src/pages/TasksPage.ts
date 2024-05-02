import { expect, Locator, Page } from '@playwright/test';
import { confirmStringNotNull } from '../utils/UtilFunctions';
import * as tasksPageTestData from "../resources/test_data/iras/tasks_page_data.json";

// const tasksPageTestDataMap = new Map(Object.entries(tasksPageTestData));

//Declare Page Objects
export default class TasksPage {
  readonly page: Page;
  readonly pageTitle: Locator;
  readonly taskTable: Locator;
  readonly taskTableTopBodyRow: Locator;
  readonly taskTableTopBodyCell: Locator;

  testJSON: typeof tasksPageTestData

  //Initialize Page Objects
  constructor(page: Page) {
    this.page = page;

    //Locators
    this.pageTitle = page.locator('div[class="content-item content-label item-1 flex flex-row dataLabelWrite heading_1_dataLabelWrite"]');
    this.taskTable = page.locator('div[id="PEGA_GRID0"]');
    this.taskTableTopBodyRow = page.locator('tr[pl_index="1"]');
    this.taskTableTopBodyCell = this.taskTableTopBodyRow.locator('td')

    this.testJSON = tasksPageTestData
  }

  //Page Methods
  async goto() {
    await this.page.goto('');
  }

  async assertOnTasksPage(dataset) {
    const headerToValidate = this.testJSON[dataset].header;
    // let headerToValidate = (<any>tasksPageTestDataMap).get(dataset)?.header;
    await expect(this.pageTitle).toBeVisible();
    await expect(this.pageTitle).toHaveText(headerToValidate);
  }

  async getUserTaskValues(): Promise<string[]> {
    let actualRowValues: string[] = [];
    for (const cell of await this.taskTableTopBodyCell.all()) {
      actualRowValues.push(confirmStringNotNull(await cell.textContent()));
    }
    return actualRowValues
  }

  // async getProjectRowValuesFromDataset(dataset: string): Promise<string[]> {
  //   let actualRowValues: string[] = [];
  //   // actualRowValues.push(confirmStringNotNull((<any>tasksPageTestDataMap).get(dataset)?.task))
  //   // actualRowValues.push(confirmStringNotNull((<any>tasksPageTestDataMap).get(dataset)?.task_id))
  //   // actualRowValues.push(confirmStringNotNull((<any>tasksPageTestDataMap).get(dataset)?.iras_id))
  //   // actualRowValues.push(confirmStringNotNull((<any>tasksPageTestDataMap).get(dataset)?.short_project_title))
  //   // actualRowValues.push(confirmStringNotNull((<any>tasksPageTestDataMap).get(dataset)?.chief_investigator))
  //   return actualRowValues
  // }
}
