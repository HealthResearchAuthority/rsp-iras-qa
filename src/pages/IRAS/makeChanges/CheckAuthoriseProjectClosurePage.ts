import { expect, Locator, Page } from '@playwright/test';
import * as checkAuthoriseProjectClosurePageTestData from '../../../resources/test_data/iras/make_changes/check_authorise_project_closure_data.json';

//Declare Page Objects
export default class CheckAuthoriseProjectClosurePage {
  readonly page: Page;
  readonly checkAuthoriseProjectClosurePageTestData: typeof checkAuthoriseProjectClosurePageTestData;
  readonly pageHeading: Locator;
  readonly authorisations_radio: Locator;
  readonly planned_end_date_label: Locator;
  readonly actual_closure_date_label: Locator;

  //Initialize Page Objects
  constructor(page: Page) {
    this.page = page;
    this.checkAuthoriseProjectClosurePageTestData = checkAuthoriseProjectClosurePageTestData;

    //Locators
    this.pageHeading = this.page.getByRole('heading', {
      name: checkAuthoriseProjectClosurePageTestData.Check_Authorise_Project_Closure_Page.heading,
    });
    this.authorisations_radio = this.page.getByRole('radio');
    this.planned_end_date_label = this.page
      .getByText(
        this.checkAuthoriseProjectClosurePageTestData.Check_Authorise_Project_Closure_Page
          .planned_project_end_date_label
      )
      .locator('..');
    this.actual_closure_date_label = this.page
      .getByText(
        this.checkAuthoriseProjectClosurePageTestData.Check_Authorise_Project_Closure_Page
          .actual_project_closure_date_label
      )
      .locator('..');
  }

  //Page Methods
  async assertOnCheckAuthoriseProjectClosurePage() {
    await expect(this.pageHeading).toBeVisible();
  }
}
