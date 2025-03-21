import { expect, Locator, Page } from '@playwright/test';
import * as keyProjectRolesPageTestData from '../../../resources/test_data/iras/make_changes/key_project_roles_data.json';

//Declare Page Objects
export default class KeyProjectRolesPage {
  readonly page: Page;
  readonly keyProjectRolesPageTestData: typeof keyProjectRolesPageTestData;
  readonly pageHeading: Locator;

  //Initialize Page Objects
  constructor(page: Page) {
    this.page = page;
    this.keyProjectRolesPageTestData = keyProjectRolesPageTestData;

    //Locators
    this.pageHeading = this.page.getByTestId('title');
  }

  //Page Methods
  async assertOnKeyProjectRolesPage() {
    await expect(this.pageHeading).toBeVisible();
    await expect(this.pageHeading).toHaveText(this.keyProjectRolesPageTestData.Key_Project_roles_Page.heading);
  }
}
