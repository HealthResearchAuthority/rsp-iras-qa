import { expect, Locator, Page } from '@playwright/test';
import * as sendModificationToReviewBodyErrorPageTestData from '../../../../resources/test_data/iras/make_changes/modifications/send_modification_to_review_body_error_data.json';
import * as buttonTextData from '../../../../resources/test_data/common/button_text_data.json';

//Declare Page Objects
export default class SendModificationToReviewBodyErrorPage {
  readonly page: Page;
  readonly sendModificationToReviewBodyErrorPageTestData: typeof sendModificationToReviewBodyErrorPageTestData;
  readonly buttonTextData: typeof buttonTextData;
  readonly pageHeading: Locator;
  readonly iras_id_row: Locator;
  readonly iras_id_text: Locator;
  readonly short_project_title_text_row: Locator;
  readonly short_project_title_text: Locator;
  readonly send_modification_to_sponsor_hint_label: Locator;

  //Initialize Page Objects
  constructor(page: Page) {
    this.page = page;
    this.sendModificationToReviewBodyErrorPageTestData = sendModificationToReviewBodyErrorPageTestData;
    this.buttonTextData = buttonTextData;

    //Locators
    this.pageHeading = this.page.getByRole('heading', {
      name: sendModificationToReviewBodyErrorPageTestData.Send_Modification_To_ReviewBody_Error_Page.heading,
    });
    this.iras_id_row = this.page.getByText(sendModificationToReviewBodyErrorPageTestData.Label_Texts.iras_id_label);
    this.iras_id_text = this.iras_id_row.locator('..').locator('.govuk-summary-list__value');

    this.short_project_title_text_row = this.page.getByText(
      sendModificationToReviewBodyErrorPageTestData.Label_Texts.short_project_title_label
    );
    this.short_project_title_text = this.short_project_title_text_row
      .locator('..')
      .locator('.govuk-summary-list__value');
    this.send_modification_to_sponsor_hint_label = this.page
      .getByRole('paragraph')
      .getByText(sendModificationToReviewBodyErrorPageTestData.Label_Texts.send_modification_to_reviewbody_hint_label);
  }

  //Page Methods
  async assertOnSendModificationToReviewBodyErrorPage() {
    await expect(this.pageHeading).toBeVisible();
  }
}
