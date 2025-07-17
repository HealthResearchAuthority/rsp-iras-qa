import { expect, Locator, Page } from '@playwright/test';
import * as modificationsReadyToAssignPageData from '../../../../resources/test_data/iras/reviewResearch/receiveAmendments/modifications_ready_to_assign_page_data.json';

//Declare Page Objects
export default class ModificationsReadyToAssignPage {
  readonly page: Page;
  readonly modificationsReadyToAssignPageData: typeof modificationsReadyToAssignPageData;

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

  //Initialize Page Objects
  constructor(page: Page) {
    this.page = page;
    this.modificationsReadyToAssignPageData = modificationsReadyToAssignPageData;

    //Locators
    //this.page_heading = this.page.getByRole('link', { name: 'Approvals', exact: true });

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
    this.modification_checkbox = this.page.getByRole('button', {
      name: this.modificationsReadyToAssignPageData.Modifications_Ready_To_Assign_Page.modification_checkbox,
    });
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
  }

  //Page Methods

  async goto() {
    await this.page.goto('modificationstasklist/index');
  }
  async assertOnModificationsReadyToAssignPage() {
    await expect(this.page_heading).toBeVisible();
  }

  async assertOnNamesOfTheColumns() {
    await expect(this.short_project_title_label).toBeVisible();
    await expect(this.modification_id_label).toBeVisible();
    await expect(this.modification_type_label).toBeVisible();
    await expect(this.date_submitted_label).toBeVisible();
    await expect(this.days_since_submission_label).toBeVisible();
  }
}
