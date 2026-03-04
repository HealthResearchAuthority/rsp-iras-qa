import { expect, Locator, Page } from '@playwright/test';
import * as createModificationErrorPageTestData from '../../../../resources/test_data/iras/make_changes/modifications/create_modification_error_data.json';
import * as buttonTextData from '../../../../resources/test_data/common/button_text_data.json';

//Declare Page Objects
export default class CreateModificationErrorPage {
  readonly page: Page;
  readonly createModificationErrorPageTestData: typeof createModificationErrorPageTestData;
  readonly buttonTextData: typeof buttonTextData;
  readonly pageHeading: Locator;
  readonly iras_id_row: Locator;
  readonly iras_id_text: Locator;
  readonly short_project_title_text_row: Locator;
  readonly short_project_title_text: Locator;
  readonly create_modification_hint_label: Locator;

  //Initialize Page Objects
  constructor(page: Page) {
    this.page = page;
    this.createModificationErrorPageTestData = createModificationErrorPageTestData;
    this.buttonTextData = buttonTextData;

    //Locators
    this.pageHeading = this.page.getByRole('heading', {
      name: createModificationErrorPageTestData.Create_Modification_Error_Page.heading,
    });
    this.iras_id_row = this.page.getByText(createModificationErrorPageTestData.Label_Texts.iras_id_label);
    this.iras_id_text = this.iras_id_row.locator('..').locator('.govuk-summary-list__value');

    this.short_project_title_text_row = this.page.getByText(
      createModificationErrorPageTestData.Label_Texts.short_project_title_label
    );
    this.short_project_title_text = this.short_project_title_text_row
      .locator('..')
      .locator('.govuk-summary-list__value');
    this.create_modification_hint_label = this.page
      .getByRole('paragraph')
      .getByText(createModificationErrorPageTestData.Label_Texts.create_modification_hint_label);
  }

  //Page Methods
  async assertOnCreateModificationErrorPage() {
    await expect(this.pageHeading).toBeVisible();
  }
}
