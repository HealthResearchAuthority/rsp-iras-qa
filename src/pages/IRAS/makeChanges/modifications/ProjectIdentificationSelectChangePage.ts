import { expect, Locator, Page } from '@playwright/test';
import * as projectIdentificationSelectChangePageTestData from '../../../../resources/test_data/iras/make_changes/modifications/project_identification_select_change_data.json';
// import CommonItemsPage from '../../../Common/CommonItemsPage';

//Declare Page Objects
export default class ProjectIdentificationSelectChangePage {
  readonly page: Page;
  readonly projectIdentificationSelectChangePageTestData: typeof projectIdentificationSelectChangePageTestData;
  readonly pageHeading: Locator;
  readonly select_change_label: Locator;
  readonly project_reference_numbers_radio: Locator;
  readonly title_radio: Locator;

  //Initialize Page Objects
  constructor(page: Page) {
    this.page = page;
    this.projectIdentificationSelectChangePageTestData = projectIdentificationSelectChangePageTestData;

    //Locators
    this.pageHeading = this.page.getByRole('heading', {
      name: projectIdentificationSelectChangePageTestData.Project_Identification_Select_Change_Page.heading_label,
    });
    this.select_change_label = this.page.getByText(
      projectIdentificationSelectChangePageTestData.Project_Identification_Select_Change_Page.heading_label
    );
    this.project_reference_numbers_radio = this.page
      .getByText(
        projectIdentificationSelectChangePageTestData.Project_Identification_Select_Change_Page.select_change_label
      )
      .locator('..')
      .getByTestId('IQA0830_OPT0440');
    this.title_radio = this.page
      .getByText(
        projectIdentificationSelectChangePageTestData.Project_Identification_Select_Change_Page.title_radio_label
      )
      .locator('..')
      .getByTestId('IQA0830_OPT0451');
  }

  //Page Methods
  async assertOnProjectIdentificationSelectChangePage() {
    await expect.soft(this.pageHeading).toBeVisible();
    const currentUrl = this.page.url();
    expect.soft(currentUrl).toContain('prn-select-change');
  }

  async fillProjectIdentificationSelectChangePage({ commonItemsPage }, dataset: any) {
    for (const key in dataset) {
      if (Object.hasOwn(dataset, key)) {
        if (key === 'project_reference_numbers_radio' || key === 'title_radio') {
          await commonItemsPage.fillUIComponent(dataset, key, this);
        }
      }
    }
  }
}
