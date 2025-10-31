import { expect, Locator, Page } from '@playwright/test';
import * as projectIdentificationSelectReferenceToChangePageTestData from '../../../../resources/test_data/iras/make_changes/modifications/project_identification_select_reference_to_change_data.json';
import CommonItemsPage from '../../../Common/CommonItemsPage';

//Declare Page Objects
export default class ProjectIdentificationSelectReferenceToChangePage {
  readonly page: Page;
  readonly projectIdentificationSelectReferenceToChangePageTestData: typeof projectIdentificationSelectReferenceToChangePageTestData;
  readonly pageHeading: Locator;
  readonly which_reference_do_you_need_to_change_checkboxes: Locator;
  readonly which_titles_do_you_need_to_change_checkboxes: Locator;

  //Initialize Page Objects
  constructor(page: Page) {
    this.page = page;
    this.projectIdentificationSelectReferenceToChangePageTestData =
      projectIdentificationSelectReferenceToChangePageTestData;

    //Locators
    this.pageHeading = this.page.getByRole('heading', {
      name: projectIdentificationSelectReferenceToChangePageTestData
        .Project_Identification_Select_Reference_To_Change_Page.heading_label,
    });
    this.which_reference_do_you_need_to_change_checkboxes = this.page
      .getByText(
        projectIdentificationSelectReferenceToChangePageTestData.Project_Identification_Select_Reference_To_Change_Page
          .which_reference_do_you_need_to_change_label
      )
      .locator('~ .govuk-checkboxes')
      .getByRole('checkbox');
    this.which_titles_do_you_need_to_change_checkboxes = this.page.locator('.govuk-checkboxes__input');
  }

  //Page Methods
  async assertOnProjectIdentificationSelectReferenceToChangePage() {
    await expect.soft(this.pageHeading).toBeVisible();
    const currentUrl = this.page.url();
    expect.soft(currentUrl).toContain('prn-reference-numbers');
  }

  async fillProjectIdentificationSelectReferenceToChangePage(dataset: any) {
    const commonItemsPage = new CommonItemsPage(this.page);
    for (const key in dataset) {
      if (Object.hasOwn(dataset, key)) {
        if (
          key === 'which_reference_do_you_need_to_change_checkboxes' ||
          key === 'which_titles_do_you_need_to_change_checkboxes'
        ) {
          await commonItemsPage.fillUIComponent(dataset, key, this);
        }
      }
    }
  }
}
