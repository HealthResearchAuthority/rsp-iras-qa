import { expect, Locator, Page } from '@playwright/test';
import * as linkTextData from '../../../../resources/test_data/common/link_text_data.json';
import * as searchModificationsPageTestData from '../../../../resources/test_data/iras/reviewResearch/receiveAmendments/search_modifications_page_data.json';

//Declare Page Objects
export default class SearchModificationsPage {
  readonly page: Page;
  readonly searchModificationsPageTestData: typeof searchModificationsPageTestData;
  readonly linkTextData: typeof linkTextData;
  readonly page_heading: Locator;
  readonly back_button: Locator;
  readonly search_box: Locator;
  readonly search_button_label: Locator;
  readonly next_button: Locator;
  readonly search_box_label: Locator;
  readonly firstNameFromListLabel: Locator;
  readonly no_results_heading: Locator;
  readonly no_results_guidance_text: Locator;
  readonly listCell: Locator;
  readonly chief_investigator_name_text: Locator;
  readonly date_modification_submitted_from_day_text: Locator;
  readonly date_modification_submitted_from_month_dropdown: Locator;
  readonly date_modification_submitted_from_year_text: Locator;
  readonly date_modification_submitted_to_day_text: Locator;
  readonly date_modification_submitted_to_month_dropdown: Locator;
  readonly date_modification_submitted_to_year_text: Locator;
  readonly short_project_title_text: Locator;
  readonly lead_nation_label: Locator;
  readonly lead_nation_fieldset: Locator;
  readonly lead_nation_checkbox: Locator;
  readonly modification_type_label: Locator;
  readonly modification_type_fieldset: Locator;
  readonly modification_type_checkbox: Locator;

  //Initialize Page Objects
  constructor(page: Page) {
    this.page = page;
    this.searchModificationsPageTestData = searchModificationsPageTestData;

    //Locators
    this.page_heading = this.page
      .getByRole('heading')
      .getByText(this.searchModificationsPageTestData.Search_Modifications_Page.page_heading);
    this.back_button = this.page.getByText('Back');
    this.search_box_label = this.page.locator('label[for="SearchQuery"]');
    this.search_box = this.page.getByTestId('SearchQuery');
    this.search_button_label = this.page.getByText('Search');
    this.next_button = this.page.locator('.govuk-pagination__next a');
    this.no_results_heading = this.page
      .getByRole('heading')
      .getByText(this.searchModificationsPageTestData.Search_Modifications_Page.no_results_heading, { exact: true });
    this.no_results_guidance_text = this.page
      .getByRole('paragraph')
      .getByText(this.searchModificationsPageTestData.Search_Modifications_Page.no_results_guidance_text, {
        exact: true,
      });
    this.listCell = this.page.getByRole('cell');
    this.chief_investigator_name_text = this.page.getByLabel(
      this.searchModificationsPageTestData.Search_Modifications_Page.chief_investigator_name_label,
      {
        exact: true,
      }
    );
    this.chief_investigator_name_text = this.page.getByLabel(
      this.searchModificationsPageTestData.Search_Modifications_Page.chief_investigator_name_label,
      {
        exact: true,
      }
    );

    // this.planned_end_date_textbox_label = this.page.locator('label[for="Questions[1].AnswerText"]');
    // this.planned_end_date_hint_label = this.page.getByTestId('Questions[1]_AnswerText-hint').locator('p');
    // this.day_textbox_label = this.page.locator('label[for="Questions[1].Day"]');
    // this.month_dropdown_label = this.page.locator('label[for="Questions[1].Month"]');
    // this.year_textbox_label = this.page.locator('label[for="Questions[1].Year"]');
    // this.planned_project_end_day_text = this.page.getByTestId('Questions[1].Day');
    // this.planned_project_end_month_dropdown = this.page.getByTestId('Questions[1].Month');
    // this.planned_project_end_year_text = this.page.getByTestId('Questions[1].Year');

    this.lead_nation_label = this.page
      .locator('.govuk-label')
      .getByText(this.searchModificationsPageTestData.Search_Modifications_Page.lead_nation_label, { exact: true });
    this.lead_nation_fieldset = this.page.locator('.govuk-form-group', { has: this.lead_nation_label });
    this.lead_nation_checkbox = this.lead_nation_fieldset.getByRole('checkbox');
    this.modification_type_label = this.page
      .locator('.govuk-label')
      .getByText(this.searchModificationsPageTestData.Search_Modifications_Page.modification_type_label, {
        exact: true,
      });
    this.modification_type_fieldset = this.page.locator('.govuk-form-group', { has: this.modification_type_label });
    this.modification_type_checkbox = this.modification_type_fieldset.getByRole('checkbox');
    this.short_project_title_text = this.page.getByLabel(
      this.searchModificationsPageTestData.Search_Modifications_Page.short_project_title_label,
      {
        exact: true,
      }
    );
  }

  //Getters & Setters for Private Variables

  async assertOnSearchModificationsPage() {
    await expect(this.page_heading).toBeVisible();
    expect(await this.page.title()).toBe(this.searchModificationsPageTestData.Search_Modifications_Page.title);
  }

  async goto(pageSize?: string, searchQuery?: string) {
    if (typeof pageSize !== 'undefined' && typeof searchQuery !== 'undefined') {
      await this.page.goto(`admin/users?SearchQuery=${searchQuery}&PageSize=${pageSize}`);
    } else if (typeof pageSize !== 'undefined') {
      await this.page.goto(`admin/users?pageSize=${pageSize}`);
    } else {
      await this.page.goto('admin/users');
    }
    await this.assertOnSearchModificationsPage();
  }
}
