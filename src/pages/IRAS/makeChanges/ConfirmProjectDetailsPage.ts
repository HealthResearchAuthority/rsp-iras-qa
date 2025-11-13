import { expect, Locator, Page } from '@playwright/test';
import * as confirmProjectDetailsPageTestData from '../../../resources/test_data/iras/make_changes/confirm_project_details_data.json';

//Declare Page Objects
export default class ConfirmProjectDetailsPage {
  readonly page: Page;
  readonly confirmProjectDetailsPageTestData: typeof confirmProjectDetailsPageTestData;
  readonly pageHeading: Locator;
  readonly pageSubHeading: Locator;
  readonly list_row: Locator;
  readonly iras_id_row: Locator;
  readonly short_project_title_row: Locator;
  readonly full_project_title_row: Locator;

  //Initialize Page Objects
  constructor(page: Page) {
    this.page = page;
    this.confirmProjectDetailsPageTestData = confirmProjectDetailsPageTestData;

    //Locators
    this.pageHeading = this.page
      .getByRole('heading')
      .getByText(this.confirmProjectDetailsPageTestData.Confirm_Project_Details_Page.heading);
    this.pageSubHeading = this.page
      .getByRole('heading')
      .getByText(this.confirmProjectDetailsPageTestData.Confirm_Project_Details_Page.add_project_sub_heading);
    this.list_row = this.page.locator('.govuk-summary-list__row');
    this.iras_id_row = this.list_row.filter({
      has: this.page.getByText(this.confirmProjectDetailsPageTestData.Label_Texts.iras_id_label),
    });
    this.short_project_title_row = this.list_row.filter({
      has: this.page.getByText(this.confirmProjectDetailsPageTestData.Label_Texts.short_project_label),
    });
    this.full_project_title_row = this.list_row.filter({
      has: this.page.getByText(this.confirmProjectDetailsPageTestData.Label_Texts.full_project_label),
    });
  }

  //Page Methods
  async assertOnConfirmProjectDetailsPage() {
    await expect(this.pageHeading).toBeVisible();
    await expect(
      this.page.getByText(this.confirmProjectDetailsPageTestData.Confirm_Project_Details_Page.guidance_text_one)
    ).toBeVisible();
    await expect(this.pageSubHeading).toBeVisible();
    await expect(
      this.page.getByText(this.confirmProjectDetailsPageTestData.Confirm_Project_Details_Page.guidance_text_two)
    ).toBeVisible();
  }
}
