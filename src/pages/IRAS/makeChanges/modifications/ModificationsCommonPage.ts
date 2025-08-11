import { expect, Locator, Page } from '@playwright/test';
import * as modificationsCommonPagePageTestData from '../../../../resources/test_data/iras/make_changes/modifications/modifications_common_data.json';

//Declare Page Objects
export default class ModificationsCommonPage {
  readonly page: Page;
  readonly modificationsCommonPagePageTestData: typeof modificationsCommonPagePageTestData;
  readonly pageHeading: Locator;
  readonly pageComponentLabel: Locator;
  readonly iras_id_label: Locator;
  readonly short_project_title_label: Locator;
  readonly modification_id_label: Locator;

  //Initialize Page Objects
  constructor(page: Page) {
    this.page = page;
    this.modificationsCommonPagePageTestData = modificationsCommonPagePageTestData;

    //Locators
    this.pageHeading = this.page.getByRole('heading');
    this.pageComponentLabel = this.page.getByRole('heading');
    this.iras_id_label = this.page
      .locator('[class$="key"]')
      .getByText(this.modificationsCommonPagePageTestData.Label_Texts.iras_id_label)
      .locator('..')
      .locator('[class$="value"]');
    this.short_project_title_label = this.page
      .locator('[class$="key"]')
      .getByText(this.modificationsCommonPagePageTestData.Label_Texts.short_project_title_label)
      .locator('..')
      .locator('[class$="value"]');
    this.modification_id_label = this.page
      .locator('[class$="key"]')
      .getByText(this.modificationsCommonPagePageTestData.Label_Texts.modification_id_label)
      .locator('..')
      .locator('[class$="value"]');
  }

  //Page Methods
  async assertOnModificationsPage(dataset: any) {
    const pageHeader = dataset['page_header'];
    const pageComponentLabel = dataset['page_component_label'];
    await expect(this.pageHeading.getByText(pageHeader)).toBeVisible();
    await expect(this.page.getByText(pageComponentLabel)).toBeVisible();
  }
}
