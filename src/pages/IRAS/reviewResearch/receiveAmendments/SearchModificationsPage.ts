import { expect, Locator, Page } from '@playwright/test';
import * as linkTextData from '../../../../resources/test_data/common/link_text_data.json';
import * as searchModificationsPageTestData from '../../../../resources/test_data/iras/reviewResearch/receiveAmendments/search_modifications_page_data.json';
import { confirmStringNotNull } from '../../../../utils/UtilFunctions';
import CommonItemsPage from '../../../Common/CommonItemsPage';

//Declare Page Objects
export default class SearchModificationsPage {
  readonly page: Page;
  readonly searchModificationsPageTestData: typeof searchModificationsPageTestData;
  readonly linkTextData: typeof linkTextData;
  private _modifications_list_after_search: string[];
  readonly page_heading: Locator;
  readonly page_guidance_text: Locator;
  readonly iras_id_search_text: Locator;
  readonly search_box: Locator;
  readonly search_button_label: Locator;
  readonly next_button: Locator;
  readonly search_box_label: Locator;
  readonly listCell: Locator;
  readonly chief_investigator_name_text: Locator;
  readonly date_submitted_from_day_text: Locator;
  readonly date_submitted_from_month_dropdown: Locator;
  readonly date_submitted_from_year_text: Locator;
  readonly date_submitted_to_day_text: Locator;
  readonly date_submitted_to_month_dropdown: Locator;
  readonly date_submitted_to_year_text: Locator;
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
  readonly date_submitted_from_day_text_chevron: Locator;
  readonly date_submitted_to_day_text_chevron: Locator;
  readonly lead_nation_checkbox_chevron: Locator;
  readonly modification_type_checkbox_chevron: Locator;
  readonly short_project_title_text_chevron: Locator;
  readonly sponsor_organisation_text_chevron: Locator;
  readonly tableRows: Locator;
  readonly chief_investigator_name_label: Locator;
  readonly chief_investigator_name_fieldset: Locator;
  readonly date_submitted_from_date_fieldset: Locator;
  readonly date_submitted_to_date_fieldset: Locator;
  readonly short_project_title_fieldset: Locator;
  readonly sponsor_organisation_fieldset: Locator;
  readonly sponsor_organisation_jsdisabled_result_hint_label: Locator;
  readonly sponsor_organisation_jsdisabled_search_results_labels: Locator;
  readonly sponsor_organisation_jsdisabled_narrow_down_label: Locator;
  readonly sponsor_organisation_jsdisabled_no_suggestions_label: Locator;
  readonly sponsor_organisation_jsdisabled_min_error_message: Locator;
  readonly date_submitted_to_date_error: Locator;
  readonly lead_nation_checkbox_hint_label: Locator;
  readonly modification_type_checkbox_hint_label: Locator;
  readonly date_submitted_to_date_help_text: Locator;
  readonly date_submitted_from_date_help_text: Locator;
  readonly lead_nation_checkbox_selected_hint_label: Locator;
  readonly modification_type_checkbox_selected_hint_label: Locator;
  readonly date_submitted_from_date_error: Locator;
  readonly results_table: Locator;
  readonly participating_nation_label: Locator;
  readonly participating_nation_fieldset: Locator;
  readonly participating_nation_checkbox: Locator;
  readonly participating_nation_checkbox_chevron: Locator;
  readonly participating_nation_checkbox_hint_label: Locator;
  readonly participating_nation_checkbox_selected_hint_label: Locator;

  //Initialize Page Objects
  constructor(page: Page) {
    this.page = page;
    this.searchModificationsPageTestData = searchModificationsPageTestData;
    this._modifications_list_after_search = [];

    //Locators
    this.page_heading = this.page
      .getByRole('heading')
      .getByText(this.searchModificationsPageTestData.Search_Modifications_Page.page_heading);
    this.page_guidance_text = this.page
      .getByRole('paragraph')
      .getByText(this.searchModificationsPageTestData.Search_Modifications_Page.page_guidance_text);
    this.iras_id_search_text = this.page.getByLabel(
      this.searchModificationsPageTestData.Search_Modifications_Page.iras_id_search_box_label,
      { exact: true }
    );
    this.search_box_label = this.page.locator('label[for="SearchQuery"]');
    this.search_box = this.page.getByTestId('SearchQuery');
    this.search_button_label = this.page.getByText('Search');
    this.next_button = this.page.locator('.govuk-pagination__next a');
    this.tableRows = this.page.getByRole('table').getByRole('row');
    this.listCell = this.page.getByRole('cell');
    this.chief_investigator_name_fieldset = this.page.locator('.govuk-fieldset', {
      has: this.page.getByText(
        this.searchModificationsPageTestData.Search_Modifications_Page.chief_investigator_hint_text
      ),
    });
    this.chief_investigator_name_text = this.chief_investigator_name_fieldset.getByRole('textbox');
    this.chief_investigator_name_text_chevron = this.page
      .getByRole('heading', { level: 2 })
      .getByText(this.searchModificationsPageTestData.Search_Modifications_Page.chief_investigator_name_label, {
        exact: true,
      });

    this.date_submitted_from_day_text_chevron = this.page
      .getByRole('heading')
      .getByText(this.searchModificationsPageTestData.Search_Modifications_Page.date_submitted_label, {
        exact: true,
      });
    this.date_submitted_from_date_fieldset = this.page.locator('.govuk-fieldset').locator('.govuk-form-group', {
      has: this.page.getByText(
        this.searchModificationsPageTestData.Search_Modifications_Page.date_submitted_from_date_hint_text
      ),
    });
    this.date_submitted_from_date_help_text = this.page.locator('#Search_FromDate-hint');
    this.date_submitted_to_date_help_text = this.page.locator('#Search_ToDate-hint');
    this.date_submitted_from_day_text = this.date_submitted_from_date_fieldset
      .locator('.govuk-form-group', {
        has: this.page.getByText(
          this.searchModificationsPageTestData.Search_Modifications_Page.date_submitted_day_label
        ),
      })
      .getByRole('textbox');
    this.date_submitted_from_month_dropdown = this.date_submitted_from_date_fieldset
      .locator('.govuk-form-group', {
        has: this.page.getByText(
          this.searchModificationsPageTestData.Search_Modifications_Page.date_submitted_month_label
        ),
      })
      .getByRole('combobox');
    this.date_submitted_from_year_text = this.date_submitted_from_date_fieldset
      .locator('.govuk-form-group', {
        has: this.page.getByText(
          this.searchModificationsPageTestData.Search_Modifications_Page.date_submitted_year_label
        ),
      })
      .getByRole('textbox');
    this.date_submitted_from_date_error = this.page
      .locator('.govuk-fieldset')
      .locator('.govuk-form-group')
      .filter({
        hasText: this.searchModificationsPageTestData.Search_Modifications_Page.date_submitted_from_date_hint_text,
      })
      .locator('.govuk-error-message');
    this.date_submitted_to_day_text_chevron = this.page
      .getByRole('heading')
      .getByText(this.searchModificationsPageTestData.Search_Modifications_Page.date_submitted_label, {
        exact: true,
      });
    this.date_submitted_to_date_error = this.page
      .locator('.govuk-fieldset')
      .locator('.govuk-form-group')
      .filter({
        hasText: this.searchModificationsPageTestData.Search_Modifications_Page.date_submitted_to_date_hint_text,
      })
      .locator('.govuk-error-message');
    this.date_submitted_to_date_fieldset = this.page.locator('.govuk-fieldset').locator('.govuk-form-group', {
      has: this.page.getByText(
        this.searchModificationsPageTestData.Search_Modifications_Page.date_submitted_to_date_hint_text
      ),
    });
    this.date_submitted_to_day_text = this.date_submitted_to_date_fieldset
      .locator('.govuk-form-group', {
        has: this.page.getByText(
          this.searchModificationsPageTestData.Search_Modifications_Page.date_submitted_day_label
        ),
      })
      .getByRole('textbox');
    this.date_submitted_to_month_dropdown = this.date_submitted_to_date_fieldset
      .locator('.govuk-form-group', {
        has: this.page.getByText(
          this.searchModificationsPageTestData.Search_Modifications_Page.date_submitted_month_label
        ),
      })
      .getByRole('combobox');
    this.date_submitted_to_year_text = this.date_submitted_to_date_fieldset
      .locator('.govuk-form-group', {
        has: this.page.getByText(
          this.searchModificationsPageTestData.Search_Modifications_Page.date_submitted_year_label
        ),
      })
      .getByRole('textbox');
    this.lead_nation_label = this.page
      .getByRole('heading', { level: 2 })
      .getByText(this.searchModificationsPageTestData.Search_Modifications_Page.lead_nation_label, { exact: true });
    this.lead_nation_fieldset = this.lead_nation_label
      .locator('..')
      .locator('..')
      .locator('.govuk-fieldset')
      .locator('.govuk-form-group', {
        has: this.page.getByText(this.searchModificationsPageTestData.Search_Modifications_Page.lead_nation_hint_text),
      });
    this.lead_nation_checkbox_hint_label = this.lead_nation_label
      .locator('..')
      .locator('..')
      .locator('.govuk-fieldset')
      .locator('.govuk-form-group')
      .getByText(
        this.searchModificationsPageTestData.Search_Modifications_Page.Advanced_Filters_Hint_Labels
          .lead_nation_checkbox_hint_label,
        { exact: true }
      );
    this.lead_nation_checkbox_selected_hint_label = this.lead_nation_label
      .locator('..')
      .locator('..')
      .locator('.govuk-fieldset')
      .locator('.govuk-form-group')
      .getByText(this.searchModificationsPageTestData.Search_Modifications_Page.selected_checkboxes_hint_label);
    this.lead_nation_checkbox = this.lead_nation_fieldset.getByRole('checkbox');
    this.lead_nation_checkbox_chevron = this.page
      .getByRole('heading')
      .getByText(this.searchModificationsPageTestData.Search_Modifications_Page.lead_nation_label, {
        exact: true,
      });
    this.modification_type_label = this.page
      .getByRole('heading', { level: 2 })
      .getByText(this.searchModificationsPageTestData.Search_Modifications_Page.modification_type_label, {
        exact: true,
      });
    this.modification_type_fieldset = this.modification_type_label
      .locator('..')
      .locator('..')
      .locator('.govuk-fieldset')
      .locator('.govuk-form-group', {
        has: this.page.getByText(
          this.searchModificationsPageTestData.Search_Modifications_Page.modification_type_hint_text
        ),
      });
    this.modification_type_checkbox_hint_label = this.modification_type_label
      .locator('..')
      .locator('..')
      .locator('.govuk-fieldset')
      .locator('.govuk-form-group')
      .getByText(
        this.searchModificationsPageTestData.Search_Modifications_Page.Advanced_Filters_Hint_Labels
          .modification_type_checkbox_hint_label,
        { exact: true }
      );
    this.modification_type_checkbox_selected_hint_label = this.modification_type_label
      .locator('..')
      .locator('..')
      .locator('.govuk-fieldset')
      .locator('.govuk-form-group')
      .getByText(this.searchModificationsPageTestData.Search_Modifications_Page.selected_checkboxes_hint_label);
    this.modification_type_checkbox = this.modification_type_fieldset.getByRole('checkbox');
    this.modification_type_checkbox_chevron = this.page
      .getByRole('heading')
      .getByText(this.searchModificationsPageTestData.Search_Modifications_Page.modification_type_label, {
        exact: true,
      });
    this.participating_nation_label = this.page
      .getByRole('heading', { level: 2 })
      .getByText(this.searchModificationsPageTestData.Search_Modifications_Page.participating_nation_label, {
        exact: true,
      });
    this.participating_nation_fieldset = this.participating_nation_label
      .locator('..')
      .locator('..')
      .locator('.govuk-fieldset')
      .locator('.govuk-form-group', {
        has: this.page.getByText(
          this.searchModificationsPageTestData.Search_Modifications_Page.participating_nation_hint_text
        ),
      });
    this.participating_nation_checkbox_hint_label = this.participating_nation_label
      .locator('..')
      .locator('..')
      .locator('.govuk-fieldset')
      .locator('.govuk-form-group')
      .getByText(
        this.searchModificationsPageTestData.Search_Modifications_Page.Advanced_Filters_Hint_Labels
          .participating_nation_checkbox_hint_label,
        { exact: true }
      );
    this.participating_nation_checkbox_selected_hint_label = this.participating_nation_label
      .locator('..')
      .locator('..')
      .locator('.govuk-fieldset')
      .locator('.govuk-form-group')
      .getByText(this.searchModificationsPageTestData.Search_Modifications_Page.selected_checkboxes_hint_label);
    this.participating_nation_checkbox = this.participating_nation_fieldset.getByRole('checkbox');
    this.participating_nation_checkbox_chevron = this.page
      .getByRole('heading')
      .getByText(this.searchModificationsPageTestData.Search_Modifications_Page.participating_nation_label, {
        exact: true,
      });
    this.short_project_title_text_chevron = this.page
      .getByRole('heading')
      .getByText(this.searchModificationsPageTestData.Search_Modifications_Page.short_project_title_label, {
        exact: true,
      });
    this.short_project_title_fieldset = this.page.locator('.govuk-fieldset', {
      has: this.page.getByText(
        this.searchModificationsPageTestData.Search_Modifications_Page.short_project_title_hint_text
      ),
    });
    this.short_project_title_text = this.short_project_title_fieldset.getByRole('textbox');
    this.sponsor_organisation_text_chevron = this.page
      .getByRole('heading')
      .getByText(this.searchModificationsPageTestData.Search_Modifications_Page.sponsor_organisation_label, {
        exact: true,
      });
    this.sponsor_organisation_fieldset = this.page.locator('.govuk-fieldset', {
      has: this.page.getByText(
        this.searchModificationsPageTestData.Search_Modifications_Page.sponsor_organisation_hint_text
      ),
    });
    this.sponsor_organisation_jsenabled_text = this.sponsor_organisation_fieldset.getByRole('combobox');
    this.sponsor_organisation_text = this.sponsor_organisation_fieldset.getByRole('textbox');
    this.sponsor_organisation_suggestion_list_labels = this.sponsor_organisation_jsenabled_text
      .locator('..')
      .getByRole('option');
    this.sponsor_organisation_suggestion_listbox = this.sponsor_organisation_jsenabled_text
      .locator('..')
      .getByRole('listbox');
    this.sponsor_organisation_jsdisabled_search_button = this.sponsor_organisation_fieldset.getByRole('button', {
      name: 'Search',
    });
    this.sponsor_organisation_jsdisabled_search_results_radio_button =
      this.sponsor_organisation_fieldset.getByRole('radio');

    this.sponsor_organisation_jsdisabled_result_hint_label = this.page.getByTestId(
      'Search.SponsorOrgSearch.SelectedOrganisation-hint'
    );
    this.sponsor_organisation_jsdisabled_narrow_down_label = this.page.locator('.govuk-inset-text');
    this.sponsor_organisation_jsdisabled_search_results_labels = this.page
      .locator('.govuk-radios__item')
      .filter({ has: this.page.locator('.govuk-radios__label') });
    this.sponsor_organisation_jsdisabled_no_suggestions_label = this.page.locator('.govuk-inset-text');
    this.sponsor_organisation_jsdisabled_min_error_message = this.page
      .locator('.govuk-fieldset')
      .filter({
        hasText: this.searchModificationsPageTestData.Search_Modifications_Page.sponsor_organisation_hint_text,
      })
      .locator('.govuk-error-message');
    this.results_table = this.page.getByTestId('modificationsTable');
  }

  //Getters & Setters for Private Variables

  async getModificationIdListAfterSearch(): Promise<string[]> {
    return this._modifications_list_after_search;
  }

  async setModificationIdListAfterSearch(value: string[]): Promise<void> {
    this._modifications_list_after_search = value;
  }

  //Page Methods

  async assertOnSearchModificationsPage() {
    await expect(this.page_heading).toBeVisible();
    await expect(this.page_guidance_text).toBeVisible();
    expect(await this.page.title()).toBe(this.searchModificationsPageTestData.Search_Modifications_Page.title);
  }

  async goto() {
    await this.page.goto('approvals/index');
  }

  async getAllModificationsTheTable(): Promise<Map<string, string[]>> {
    const searchResultValues: string[] = [];
    const modificationIdValues: string[] = [];
    const shortProjectTitleValues: string[] = [];
    const modificationTypeValues: string[] = [];
    const chiefInvestigatorNameValues: string[] = [];
    const leadNationValues: string[] = [];
    await this.page.waitForLoadState('domcontentloaded');
    await this.page.waitForTimeout(3000);
    let dataFound = false;
    while (!dataFound) {
      const rowCount = await this.tableRows.count();
      for (let i = 1; i < rowCount; i++) {
        const columns = this.tableRows.nth(i).getByRole('cell');
        const modificationId = confirmStringNotNull(await columns.nth(0).textContent());
        modificationIdValues.push(modificationId);
        const shortProjectTitle = confirmStringNotNull(await columns.nth(1).textContent());
        shortProjectTitleValues.push(shortProjectTitle);
        const modificationType = confirmStringNotNull(await columns.nth(2).textContent());
        modificationTypeValues.push(modificationType);
        const chiefInvestigatorName = confirmStringNotNull(await columns.nth(3).textContent());
        chiefInvestigatorNameValues.push(chiefInvestigatorName);
        const leadNation = confirmStringNotNull(await columns.nth(4).textContent());
        leadNationValues.push(leadNation);
        searchResultValues.push(
          modificationId +
            '|' +
            shortProjectTitle +
            '|' +
            modificationType +
            '|' +
            chiefInvestigatorName +
            '|' +
            leadNation
        );
      }
      if ((await this.next_button.isVisible()) && !(await this.next_button.isDisabled())) {
        await this.next_button.click();
        await this.page.waitForLoadState('domcontentloaded');
      } else {
        dataFound = true;
      }
    }
    const searchResultMap = new Map([
      ['searchResultValues', searchResultValues],
      ['modificationIdValues', modificationIdValues],
      ['shortProjectTitleValues', shortProjectTitleValues],
      ['modificationTypeValues', modificationTypeValues],
      ['chiefInvestigatorNameValues', chiefInvestigatorNameValues],
      ['leadNationValues', leadNationValues],
    ]);
    return searchResultMap;
  }

  async sortModificationIdListValues(modificationIds: string[], sortDirection: string): Promise<string[]> {
    let sortedListAsNums: number[][];
    const sortedListAsStrings: string[] = [];
    const formattedModificationIds = modificationIds.map((id) => {
      const [prefix, suffix] = id.split('/');
      return [parseInt(prefix), parseInt(suffix)];
    });
    if (sortDirection.toLowerCase() == 'ascending') {
      sortedListAsNums = formattedModificationIds.toSorted((a, b) => {
        if (a[0] - b[0] == 0) {
          return a[1] - b[1];
        } else {
          return a[0] - b[0];
        }
      });
    } else {
      sortedListAsNums = formattedModificationIds.toSorted((a, b) => {
        if (b[0] - a[0] == 0) {
          return b[1] - a[1];
        } else {
          return b[0] - a[0];
        }
      });
    }
    for (const entry of sortedListAsNums.entries()) {
      sortedListAsStrings.push(entry[1].toString().replace(',', '/'));
    }
    return sortedListAsStrings;
  }

  async getActualListValues(tableBodyRows: Locator, columnIndex: number): Promise<string[]> {
    const actualListValues: string[] = [];
    for (const row of await tableBodyRows.all()) {
      const actualListValue = confirmStringNotNull(await row.getByRole('cell').nth(columnIndex).textContent());
      actualListValues.push(actualListValue);
    }
    return actualListValues;
  }

  async clickFilterChevronModifications<PageObject>(dataset: JSON, key: string, page: PageObject) {
    const button = page[`${key}_chevron`];
    const fromDate = dataset['date_submitted_from_day_text'];
    const isToDateKey = key === 'date_submitted_to_day_text';
    const shouldClick = !isToDateKey || (isToDateKey && (fromDate === '' || fromDate === undefined));
    if (button && shouldClick) {
      await button.click();
    }
  }

  async selectSponsorOrgJsEnabled<PageObject>(
    dataset: JSON,
    key: string,
    commonItemsPage: CommonItemsPage,
    page: PageObject
  ) {
    dataset['sponsor_organisation_jsenabled_text'] = dataset[key];
    await commonItemsPage.fillUIComponent(dataset, 'sponsor_organisation_jsenabled_text', page);
    await this.page.waitForTimeout(2000);
    const suggestionVisible = await this.sponsor_organisation_suggestion_list_labels.first().isVisible();
    if (suggestionVisible) {
      await this.sponsor_organisation_suggestion_list_labels.first().click();
    }
  }

  async selectSponsorOrgJsDisabled<PageObject>(
    dataset: JSON,
    key: string,
    commonItemsPage: CommonItemsPage,
    page: PageObject
  ) {
    await commonItemsPage.fillUIComponent(dataset, key, page);
    await this.sponsor_organisation_jsdisabled_search_button.click();
    await this.page.waitForTimeout(2000);
    if (dataset[key] !== '') {
      await this.sponsor_organisation_jsdisabled_search_results_radio_button.first().click();
    }
  }

  async getHintLabel(dataset: JSON, key: string): Promise<string> {
    const numberOfCheckboxesSelected = dataset[key].length;
    const hintLabel =
      numberOfCheckboxesSelected +
      ' ' +
      this.searchModificationsPageTestData.Search_Modifications_Page.selected_checkboxes_hint_label;
    return hintLabel;
  }

  async getActualResultsCountLabel(commonItemsPage: CommonItemsPage) {
    return confirmStringNotNull(await commonItemsPage.result_count.textContent());
  }

  async getExpectedResultsCountLabel(commonItemsPage: CommonItemsPage) {
    const testData = commonItemsPage.commonTestData;
    const modificationsList = await this.getModificationIdListAfterSearch();
    const expectedResultCountLabel = testData.result_count_heading;
    return modificationsList.length + expectedResultCountLabel;
  }

  async getExpectedResultsCountLabelNoResults(commonItemsPage: CommonItemsPage) {
    const expectedResultCountLabel = commonItemsPage.commonTestData.result_count_heading;
    return '0' + expectedResultCountLabel;
  }
}
