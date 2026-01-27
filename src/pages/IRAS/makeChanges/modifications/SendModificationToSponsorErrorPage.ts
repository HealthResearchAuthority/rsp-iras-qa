import { expect, Locator, Page } from '@playwright/test';
import * as sendModificationToSponsorErrorPageTestData from '../../../../resources/test_data/iras/make_changes/modifications/send_modification_error_data.json';
import * as buttonTextData from '../../../../resources/test_data/common/button_text_data.json';
import * as linkTextData from '../../../../resources/test_data/common/link_text_data.json';

//Declare Page Objects
export default class ModificationsSelectAreaOfChangePage {
  readonly page: Page;
  readonly sendModificationErrorPageTestData: typeof sendModificationToSponsorErrorPageTestData;
  readonly buttonTextData: typeof buttonTextData;
  readonly linkTextData: typeof linkTextData;
  readonly pageHeading: Locator;
  readonly iras_id_row: Locator;
  readonly iras_id_text: Locator;
  readonly short_project_title_text_row: Locator;
  readonly short_project_title_text: Locator;
  readonly send_modification_to_sponsor_hint_label: Locator;

  //Initialize Page Objects
  constructor(page: Page) {
    this.page = page;
    this.sendModificationErrorPageTestData = sendModificationToSponsorErrorPageTestData;
    this.linkTextData = linkTextData;
    this.buttonTextData = buttonTextData;

    //Locators
    this.pageHeading = this.page.getByRole('heading', {
      name: sendModificationToSponsorErrorPageTestData.Send_Modification_To_Sponsor_Error_Page.heading,
    });
    this.iras_id_row = this.page.getByText(sendModificationToSponsorErrorPageTestData.Label_Texts.iras_id_label);
    this.iras_id_text = this.iras_id_row.locator('..').locator('.govuk-summary-list__value');

    this.short_project_title_text_row = this.page.getByText(
      sendModificationToSponsorErrorPageTestData.Label_Texts.short_project_title_label
    );
    this.short_project_title_text = this.short_project_title_text_row
      .locator('..')
      .locator('.govuk-summary-list__value');
    this.send_modification_to_sponsor_hint_label = this.page
      .getByRole('paragraph')
      .getByText(sendModificationToSponsorErrorPageTestData.Label_Texts.send_modification_to_sponsor_hint_label);
  }

  //Page Methods
  async assertOnSendModificationToSponsorErrorPage() {
    await expect(this.pageHeading).toBeVisible();
  }
}
