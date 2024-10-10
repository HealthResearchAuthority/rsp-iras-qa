import { expect, Locator, Page } from '@playwright/test';
import * as createApplicationPageData from '../../resources/test_data/iras/create_application_page_data.json';

//Declare Page Objects
export default class CreateApplicationPage {
  readonly page: Page;
  readonly createApplicationPageData: typeof createApplicationPageData;
  readonly pageHeading: Locator;
  readonly applicationNameLbl: Locator;
  readonly applicationNameInput: Locator;
  readonly applicationDescriptionLbl: Locator;
  readonly applicationDescriptionInput: Locator;

  //Initialize Page Objects
  constructor(page: Page) {
    this.page = page;
    this.createApplicationPageData = createApplicationPageData;

    //Locators
    this.pageHeading = this.page.getByTestId('title');
    this.applicationNameLbl = this.page.getByTestId('Name').locator('label');
    this.applicationNameInput = this.page.getByTestId('app-name');
    this.applicationDescriptionLbl = this.page.getByTestId('Description').locator('label');
    this.applicationDescriptionInput = this.page.getByTestId('app-description');
  }

  //Page Methods
  async goto() {
    await this.page.goto('application/startnewapplication');
  }

  async assertOnCreateApplicationPage() {
    await expect(this.pageHeading).toBeVisible();
    await expect(this.pageHeading).toHaveText(this.createApplicationPageData.Create_Application_Page.heading);
    await expect(this.applicationNameLbl).toHaveText(
      this.createApplicationPageData.Create_Application_Page.enter_app_name_label
    );
    await expect(this.applicationDescriptionLbl).toHaveText(
      this.createApplicationPageData.Create_Application_Page.enter_app_desc_label
    );
    expect(await this.page.title()).toBe(this.createApplicationPageData.Create_Application_Page.title);
  }
}
