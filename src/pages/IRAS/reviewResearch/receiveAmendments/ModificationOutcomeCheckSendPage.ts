import { expect, Locator, Page } from '@playwright/test';
import * as modificationOutcomeCheckSendPageTestData from '../../../../resources/test_data/iras/reviewResearch/receiveAmendments/modification_outcome_check_send_page_data.json';

//Declare Page Objects
export default class ModificationOutcomeCheckSendPage {
  readonly page: Page;
  readonly modificationOutcomeCheckSendPageTestData: typeof modificationOutcomeCheckSendPageTestData;
  readonly page_heading: Locator;
  readonly page_guidance_text: Locator;
  readonly summary_list_heading: Locator;
  readonly summary_list: Locator;
  readonly summary_list_row: Locator;
  readonly short_project_title_row: Locator;
  readonly short_project_title_value: Locator;
  readonly modification_id_row: Locator;
  readonly modification_id_value: Locator;
  readonly decision_row: Locator;
  readonly decision_value: Locator;
  readonly decision_change_link: Locator;
  readonly reason_row: Locator;
  readonly reason_value: Locator;
  readonly reason_change_link: Locator;

  //Initialize Page Objects
  constructor(page: Page) {
    this.page = page;
    this.modificationOutcomeCheckSendPageTestData = modificationOutcomeCheckSendPageTestData;

    //Locators
    this.page_heading = this.page
      .getByRole('heading')
      .getByText(this.modificationOutcomeCheckSendPageTestData.Modification_Outcome_Check_Send_Page.page_heading);
    this.page_guidance_text = this.page
      .getByRole('paragraph')
      .getByText(this.modificationOutcomeCheckSendPageTestData.Modification_Outcome_Check_Send_Page.page_guidance_text);
    this.summary_list_heading = this.page
      .getByRole('heading')
      .getByText(
        this.modificationOutcomeCheckSendPageTestData.Modification_Outcome_Check_Send_Page.summary_list_heading
      );
    this.summary_list = this.page.locator('.govuk-summary-list');
    this.summary_list_row = this.summary_list.locator('.govuk-summary-list__row');
    this.short_project_title_row = this.summary_list_row.filter({
      has: this.page.getByRole('term').filter({
        hasText: this.modificationOutcomeCheckSendPageTestData.Summary_List_Labels.short_project_title_label,
      }),
    });
    this.short_project_title_value = this.short_project_title_row.getByRole('definition');
    this.modification_id_row = this.summary_list_row.filter({
      has: this.page.getByRole('term').filter({
        hasText: this.modificationOutcomeCheckSendPageTestData.Summary_List_Labels.modification_id_label,
      }),
    });
    this.modification_id_value = this.modification_id_row.getByRole('definition');
    this.decision_row = this.summary_list_row.filter({
      has: this.page.getByRole('term').filter({
        hasText: this.modificationOutcomeCheckSendPageTestData.Summary_List_Labels.decision_label,
      }),
    });
    this.decision_value = this.decision_row.getByRole('definition').first();
    this.decision_change_link = this.decision_row.getByRole('link');
    this.reason_row = this.summary_list_row.filter({
      has: this.page.getByRole('term').filter({
        hasText: this.modificationOutcomeCheckSendPageTestData.Summary_List_Labels.reason_label,
      }),
    });
    this.reason_value = this.reason_row.getByRole('definition').first();
    this.reason_change_link = this.reason_row.getByRole('link');
  }

  async assertOnModificationOutcomeCheckSendPage() {
    await expect.soft(this.page_heading).toBeVisible();
    await expect.soft(this.page_guidance_text).toBeVisible();
    await expect.soft(this.summary_list_heading).toBeVisible();
    await expect.soft(this.summary_list).toBeVisible();
    expect
      .soft(await this.page.title())
      .toBe(this.modificationOutcomeCheckSendPageTestData.Modification_Outcome_Check_Send_Page.title);
  }
}
