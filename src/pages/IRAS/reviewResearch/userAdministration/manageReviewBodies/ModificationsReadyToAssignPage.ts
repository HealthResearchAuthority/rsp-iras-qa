//import { expect, Locator, Page } from '@playwright/test';
import * as modificationsReadyToAssignPageData from '../../../../../resources/test_data/iras/reviewResearch/receiveAmendments/modifications_ready_to_assign_page_data.json';

//Declare Page Objects
export default class ModificationsReadyToAssignPage {
  readonly page: Page;
  readonly modificationsReadyToAssignPageData: typeof modificationsReadyToAssignPageData;

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
    this.page_heading = this.page
      .getByRole('heading')
      .getByText(this.modificationsReadyToAssignPageData.Modifications_Ready_To_Assign_Page.page_heading, {
        exact: true,
      });
    this.page_description = this.page
      .getByRole('paragraph')
      .getByText(this.modificationsReadyToAssignPageData.Modifications_Ready_To_Assign_Page.page_description, {
        exact: true,
      });
    this.modification_button_label = this.page
      .getByRole('paragraph')
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
      .getByRole('paragraph')
      .getByText(this.modificationsReadyToAssignPageData.Modifications_Ready_To_Assign_Page.short_project_title_label, {
        exact: true,
      });
    this.modification_id_label = this.page
      .getByRole('paragraph')
      .getByText(this.modificationsReadyToAssignPageData.Modifications_Ready_To_Assign_Page.modification_id_label, {
        exact: true,
      });
    this.modification_type_label = this.page
      .getByRole('paragraph')
      .getByText(this.modificationsReadyToAssignPageData.Modifications_Ready_To_Assign_Page.modification_type_label, {
        exact: true,
      });
    this.date_submitted_label = this.page
      .getByRole('paragraph')
      .getByText(this.modificationsReadyToAssignPageData.Modifications_Ready_To_Assign_Page.date_submitted_label, {
        exact: true,
      });
    this.days_since_submission_label = this.page
      .getByRole('paragraph')
      .getByText(
        this.modificationsReadyToAssignPageData.Modifications_Ready_To_Assign_Page.days_since_submission_label,
        {
          exact: true,
        }
      );
  }

  //Getters & Setters for Private Variables
}
