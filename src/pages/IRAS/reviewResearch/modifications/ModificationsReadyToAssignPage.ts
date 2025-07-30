import { expect, Locator, Page } from '@playwright/test';
import * as modificationsReadyToAssignPageData from '../../../../resources/test_data/iras/reviewResearch/modifications/modifications_ready_to_assign_page_data.json';
import * as buttonTextData from '../../../../resources/test_data/common/button_text_data.json';
import * as linkTextData from '../../../../resources/test_data/common/link_text_data.json';

//Declare Page Objects
export default class ModificationsReadyToAssignPage {
  readonly page: Page;
  readonly modificationsReadyToAssignPageData: typeof modificationsReadyToAssignPageData;
  readonly buttonTextData: typeof buttonTextData;
  readonly linkTextData: typeof linkTextData;
  readonly modifications_tasklist_link: Locator;
  readonly page_heading: Locator;
  readonly page_description: Locator;
  readonly modification_button_label: Locator;
  readonly advanced_filter_label: Locator;
  readonly search_button_label: Locator;
  readonly modification_checkbox: Locator;
  readonly short_project_title_label: Locator;
  readonly modification_id_label: Locator;
  readonly modification_type_label: Locator;
  readonly date_submitted_label: Locator;
  readonly days_since_submission_label: Locator;
  readonly tableRows: Locator;
  readonly next_button: Locator;
  readonly previous_button: Locator;
  readonly checkall_modification_checkbox: Locator;

  //Initialize Page Objects
  constructor(page: Page) {
    this.page = page;
    this.modificationsReadyToAssignPageData = modificationsReadyToAssignPageData;

    //Locators
    this.modifications_tasklist_link = this.page.locator('.govuk-heading-s govuk-link hra-card-heading__link');
    this.page_heading = this.page.getByTestId('title');
    this.modification_button_label = this.page
      .getByRole('button')
      .getByText(this.modificationsReadyToAssignPageData.Modifications_Ready_To_Assign_Page.modification_button_label, {
        exact: true,
      });
    this.advanced_filter_label = this.page.getByRole('button', {
      name: this.modificationsReadyToAssignPageData.Modifications_Ready_To_Assign_Page.advanced_filter_label,
    });
    this.search_button_label = this.page.getByText('Search');
    this.short_project_title_label = this.page
      .getByRole('button')
      .getByText(this.modificationsReadyToAssignPageData.Label_Texts.short_project_title_label, {
        exact: true,
      });
    this.modification_id_label = this.page
      .getByRole('button')
      .getByText(this.modificationsReadyToAssignPageData.Label_Texts.modification_id_label, {
        exact: true,
      });
    this.modification_type_label = this.page
      .getByRole('button')
      .getByText(this.modificationsReadyToAssignPageData.Label_Texts.modification_type_label, {
        exact: true,
      });
    this.date_submitted_label = this.page
      .getByRole('button')
      .getByText(this.modificationsReadyToAssignPageData.Label_Texts.date_submitted_label, {
        exact: true,
      });
    this.days_since_submission_label = this.page
      .getByRole('button')
      .getByText(this.modificationsReadyToAssignPageData.Label_Texts.days_since_submission_label, {
        exact: true,
      });
    this.tableRows = this.page.locator('.govuk-table__row');
    this.next_button = this.page.locator('.govuk-pagination__next');
    this.previous_button = this.page.locator('.govuk-pagination__prev');
    this.modification_checkbox = this.page.locator('input[type="checkbox"]');
    this.checkall_modification_checkbox = this.page.locator('input[id="select-all-modifications"]');
  }

  //Page Methods
  async goto() {
    await this.page.goto('modificationstasklist/index');
  }
  async assertOnModificationsReadyToAssignPage() {
    await expect(this.page_heading).toBeVisible();
  }
  async waitForLoad() {
    await this.page.waitForLoadState('domcontentloaded');
    await this.page.waitForTimeout(3000);
  }
  async selectRandomCheckboxes(): Promise<string> {
    const count = await this.modification_checkbox.count();
    const randomIndex = Math.floor(Math.random() * count);
    const checkbox = this.modification_checkbox.nth(randomIndex);
    await checkbox.check();
    const modificationId = await this.tableRows.locator('td').first().innerText();
    await checkbox.isChecked();
    return modificationId;
  }

  async confirmAllRowsToBeChecked() {
    const checkboxes = this.modification_checkbox;
    const rowCount = await this.tableRows.count();
    for (let i = 1; i < rowCount; i++) {
      expect(await checkboxes.nth(i).isChecked());
    }
  }
}
