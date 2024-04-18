import { expect, Locator, Page } from '@playwright/test';
import { confirmStringNotNull } from '../utils/UtilFunctions';

//Declare Page Objects
export default class TasksPage {
  readonly page: Page;
  readonly pageTitle: Locator;
  readonly taskTable: Locator;
  readonly taskTableTopBodyRow: Locator;
  readonly taskTableTopBodyCell: Locator;

  //Initialize Page Objects
  constructor(page: Page) {
    this.page = page;

    //Locators
    this.pageTitle = page.locator('div[class="content-item content-label item-1 flex flex-row dataLabelWrite heading_1_dataLabelWrite"]');
    this.taskTable = page.locator('div[id="PEGA_GRID0"]');
    this.taskTableTopBodyRow = page.locator('tr[pl_index="1"]');
    this.taskTableTopBodyCell = this.taskTableTopBodyRow.locator('td')
  }

  //Page Methods
  async goto() {
    await this.page.goto('');
  }

  async assertOnTasksPage() {
    await expect(this.pageTitle).toBeVisible();
    await expect(this.pageTitle).toHaveText('My outstanding tasks');
  }

  async getUserTaskValues(): Promise<string[]> {
    let actualRowValues: string[] = [];
    for (const cell of await this.taskTableTopBodyCell.all()) {
      actualRowValues.push(confirmStringNotNull(await cell.textContent()));
    }
    return actualRowValues
  }
}
