import { expect, Locator, Page } from '@playwright/test';
import * as createModificationErrorPageTestData from '../../../../resources/test_data/iras/make_changes/modifications/create_modification_error_data.json';
import * as buttonTextData from '../../../../resources/test_data/common/button_text_data.json';
import * as linkTextData from '../../../../resources/test_data/common/link_text_data.json';

//Declare Page Objects
export default class ModificationsSelectAreaOfChangePage {
  readonly page: Page;
  readonly createModificationErrorPageTestData: typeof createModificationErrorPageTestData;
  readonly buttonTextData: typeof buttonTextData;
  readonly linkTextData: typeof linkTextData;
  readonly pageHeading: Locator;
  // readonly pageSubHeading: Locator;
  readonly iras_id_row: Locator;
  readonly iras_id_text: Locator;
  readonly short_project_title_text_row: Locator;
  readonly short_project_title_text: Locator;
  readonly error_message_line_one: Locator;
  readonly error_message_line_two: Locator;

  //Initialize Page Objects
  constructor(page: Page) {
    this.page = page;
    this.createModificationErrorPageTestData = createModificationErrorPageTestData;
    this.linkTextData = linkTextData;
    this.buttonTextData = buttonTextData;

    //Locators
    this.pageHeading = this.page.getByRole('heading', {
      name: createModificationErrorPageTestData.Create_Modification_Error_Page.heading,
    });
    // this.pageSubHeading = this.page.getByRole('heading', {
    //   name: createModificationErrorPageTestData.Create_Modification_Error_Page.sub_heading,
    // });
    this.iras_id_row = this.page.getByText(createModificationErrorPageTestData.Label_Texts.iras_id_label);
    this.iras_id_text = this.iras_id_row.locator('..').locator('.govuk-summary-list__value');

    this.short_project_title_text_row = this.page.getByText(
      createModificationErrorPageTestData.Label_Texts.short_project_title_label
    );
    this.short_project_title_text = this.short_project_title_text_row
      .locator('..')
      .locator('.govuk-summary-list__value');
    this.error_message_line_one = this.page.getByTestId('main-content');
    this.error_message_line_two = this.page.getByTestId('main-content');
  }

  //Page Methods
  async assertOnCreateModificationErrorPage() {
    await expect(this.pageHeading).toBeVisible();
    //await expect(this.pageSubHeading).toBeVisible();
  }
}
