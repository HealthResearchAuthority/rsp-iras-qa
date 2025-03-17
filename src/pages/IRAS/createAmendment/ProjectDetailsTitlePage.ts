import { expect, Locator, Page } from '@playwright/test';
import * as projectDetailsTitlePageTestData from '../../../resources/test_data/iras/make_changes/project_details_title_data.json';

//Declare Page Objects
export default class ProjectDetailsTitlePage {
  readonly page: Page;
  readonly projectDetailsTitlePageTestData: typeof projectDetailsTitlePageTestData;
  readonly pageHeading: Locator;
  readonly shortProjectTitleTextBoxLabel: Locator;
  readonly shortProjectTitleTextBox: Locator;
  readonly plannedEndDateLabel: Locator;
  readonly plannedEndDateDayLabel: Locator;
  readonly plannedEndDateMonthLabel: Locator;
  readonly plannedEndDateYearLabel: Locator;
  readonly plannedEndDateTextBox: Locator;

  //Initialize Page Objects
  constructor(page: Page) {
    this.page = page;
    this.projectDetailsTitlePageTestData = projectDetailsTitlePageTestData;

    //Locators
    this.pageHeading = this.page.getByTestId('');
    this.shortProjectTitleTextBoxLabel = this.page.getByTestId('');
    this.shortProjectTitleTextBox = this.page.getByTestId('');
    this.plannedEndDateLabel = this.page.getByTestId('');
    this.plannedEndDateDayLabel = this.page.getByTestId('');
    this.plannedEndDateMonthLabel = this.page.getByTestId('');
    this.plannedEndDateYearLabel = this.page.getByTestId('');
    this.plannedEndDateTextBox = this.page.getByTestId('');
  }

  //Page Methods
  async goto() {
    await this.page.goto('project_Details');
  }

  async assertOnProjectDetailsTitlePage() {
    await expect(this.pageHeading).toBeVisible();
    await expect(this.pageHeading).toHaveText(this.projectDetailsTitlePageTestData.Project_Details_Title_Page.heading);
    expect(await this.page.title()).toBe(this.projectDetailsTitlePageTestData.Project_Details_Title_Page.title);
  }
}
