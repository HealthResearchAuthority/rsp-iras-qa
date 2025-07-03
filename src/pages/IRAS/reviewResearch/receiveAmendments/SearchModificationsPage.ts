import { expect, Locator, Page } from '@playwright/test';
import * as linkTextData from '../../../../resources/test_data/common/link_text_data.json';
import * as searchModificationsPageTestData from '../../../../resources/test_data/iras/reviewResearch/receiveAmendments/search_modifications_page_data.json';
import { confirmStringNotNull, removeUnwantedWhitespace } from '../../../../utils/UtilFunctions';

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
  readonly no_results_heading: Locator;
  readonly no_results_guidance_text: Locator;
  readonly listCell: Locator;
  readonly advanced_filter_chevron: Locator;
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
  readonly sponsor_organisation_text: Locator;
  readonly sponsor_organisation_jsenabled_text: Locator;
  readonly sponsor_organisation_suggestion_list_labels: Locator;
  readonly sponsor_organisation_suggestion_listbox: Locator;
  readonly sponsor_organisation_jsdisabled_search_button: Locator;
  readonly sponsor_organisation_jsdisabled_search_results_radio_button: Locator;
  readonly chief_investigator_name_text_chevron: Locator;
  readonly date_modification_submitted_from_date_text_chevron: Locator;
  readonly lead_nation_checkbox_chevron: Locator;
  readonly modification_type_checkbox_chevron: Locator;
  readonly short_project_title_text_chevron: Locator;
  readonly sponsor_organisation_text_chevron: Locator;

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
    this.advanced_filter_chevron = this.page.getByRole('button', {
      name: this.searchModificationsPageTestData.Search_Modifications_Page.advanced_filter_label,
    });
    this.chief_investigator_name_text = this.page.getByLabel(
      this.searchModificationsPageTestData.Search_Modifications_Page.chief_investigator_name_label,
      {
        exact: true,
      }
    );
    this.chief_investigator_name_text_chevron = this.page.getByRole('button', {
      name: this.searchModificationsPageTestData.Search_Modifications_Page.chief_investigator_name_label,
    });

    this.date_modification_submitted_from_date_text_chevron = this.page.getByRole('button', {
      name: this.searchModificationsPageTestData.Search_Modifications_Page.date_modification_submitted_label,
    });

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
    this.lead_nation_checkbox_chevron = this.page.getByRole('button', {
      name: this.searchModificationsPageTestData.Search_Modifications_Page.lead_nation_label,
    });
    this.modification_type_label = this.page
      .locator('.govuk-label')
      .getByText(this.searchModificationsPageTestData.Search_Modifications_Page.modification_type_label, {
        exact: true,
      });
    this.modification_type_fieldset = this.page.locator('.govuk-form-group', { has: this.modification_type_label });
    this.modification_type_checkbox = this.modification_type_fieldset.getByRole('checkbox');
    this.modification_type_checkbox_chevron = this.page.getByRole('button', {
      name: this.searchModificationsPageTestData.Search_Modifications_Page.modification_type_label,
    });
    this.short_project_title_text = this.page.getByLabel(
      this.searchModificationsPageTestData.Search_Modifications_Page.short_project_title_label,
      {
        exact: true,
      }
    );
    this.short_project_title_text_chevron = this.page.getByRole('button', {
      name: this.searchModificationsPageTestData.Search_Modifications_Page.short_project_title_label,
    });
    this.sponsor_organisation_text = this.page.getByRole('textbox', {
      name: searchModificationsPageTestData.Search_Modifications_Page.sponsor_organisation_label,
    });
    this.sponsor_organisation_text_chevron = this.page.getByRole('button', {
      name: this.searchModificationsPageTestData.Search_Modifications_Page.sponsor_organisation_label,
    });
    this.sponsor_organisation_jsenabled_text = this.page.getByRole('combobox', {
      name: searchModificationsPageTestData.Search_Modifications_Page.sponsor_organisation_label,
    });
    this.sponsor_organisation_suggestion_list_labels = this.sponsor_organisation_jsenabled_text
      .locator('..')
      .getByRole('option');
    this.sponsor_organisation_suggestion_listbox = this.sponsor_organisation_jsenabled_text
      .locator('..')
      .getByRole('listbox');
    this.sponsor_organisation_jsdisabled_search_button = this.page.getByRole('button', {
      name: 'Search',
    });
    this.sponsor_organisation_jsdisabled_search_results_radio_button = this.page.locator(
      'input[type="radio"][name="SponsorOrgSearch.SelectedOrganisation"]'
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

  async clickAdvancedFilterChevron() {
    const button = this.advanced_filter_chevron;
    const isExpanded = await button.getAttribute('aria-expanded');
    if (isExpanded !== 'true') {
      await button.click();
    }
  }

  async clickFilterChevron<PageObject>(key: string, page: PageObject) {
    const selectorFn = page[key + '_chevron'];
    if (selectorFn) {
      const button = selectorFn();
      const isExpanded = await button.getAttribute('aria-expanded');
      if (isExpanded !== 'true') {
        await page[key + '_chevron'].click(button);
      }
    } else {
      console.warn(`No selector defined for key: ${key}`);
    }
  }

  async getDateString(dataset: JSON, prefix: string) {
    const day = dataset[`${prefix}_date_text`];
    const month = dataset[`${prefix}_month_dropdown`];
    const year = dataset[`${prefix}_year_text`];
    return day && month && year ? `${day} ${month} ${year}` : null;
  }

  async getActiveFiltersLabels(dataset: JSON, key: string) {
    let filterName: string = '';
    // let fromDate: string = '';
    // let toDate: string = '';
    let value: string = '';
    if (key.startsWith('date_modification_submitted')) {
      filterName = dataset['date_modification_submitted_label'];
      // const fromDay = dataset['date_modification_submitted_from_date_text'];
      // const fromMonth = dataset['date_modification_submitted_from_month_dropdown'];
      // const fromYear = dataset['date_modification_submitted_from_year_text'];
      // const toDay = dataset['date_modification_submitted_to_date_text'];
      // const toMonth = dataset['date_modification_submitted_to_month_dropdown'];
      // const toYear = dataset['date_modification_submitted_to_year_text'];

      const fromDate = this.getDateString(dataset, 'date_modification_submitted_from');
      const toDate = this.getDateString(dataset, 'date_modification_submitted_to');
      value = [fromDate, toDate].filter(Boolean).join(' to ');

      // if (fromDay && fromMonth && fromYear) {
      //   fromDate = `${fromDay} ${fromMonth} ${fromYear}`;
      // }
      // if (toDay && toMonth && toYear) {
      //   toDate = `${toDay} ${toMonth} ${toYear}`;
      // }
      // value = `${fromDate} to ${toDate}`;
    } else if (key.startsWith('chief_investigator_name')) {
      filterName = dataset['chief_investigator_name_label'];
      value = dataset['chief_investigator_name_text'];
    } else if (key.startsWith('short_project_title')) {
      filterName = dataset['short_project_title_label'];
      value = dataset['short_project_title_text'];
    } else if (key.startsWith('sponsor_organisation')) {
      filterName = dataset['sponsor_organisation_label'];
      value = dataset['sponsor_organisation_text'];
    } else if (key.startsWith('lead_nation')) {
      filterName = dataset['lead_nation_label'];
      // value = dataset['lead_nation_checkbox'].toString();
      value = (dataset['lead_nation_checkbox'] || []).join(', ');
    } else if (key.startsWith('modification_type')) {
      filterName = dataset['modification_type_label'];
      // value = dataset['modification_type_checkbox'].toString();
      value = (dataset['modification_type_checkbox'] || []).join(', ');
    }
    const filterText = `${filterName} - ${value}`;
    return filterText;
  }

  async getSelectedFilterValues<PageObject>(key: string, page: PageObject) {
    const locator: Locator = page[key];
    return await removeUnwantedWhitespace(confirmStringNotNull(await locator.textContent()));
  }

  // const filterSelectors = {
  //   chiefInvestigator: () => getByRole('button', { name: /Chief Investigator name/i }),
  //   dateSubmitted: () => getByRole('button', { name: /Date modification submitted/i }),
  //   leadNation: () => getByRole('button', { name: /Lead nation/i }),
  //   modificationType: () => getByRole('button', { name: /Modification type/i }),
  //   shortTitle: () => getByRole('button', { name: /Short project title/i }),
  // };
}
