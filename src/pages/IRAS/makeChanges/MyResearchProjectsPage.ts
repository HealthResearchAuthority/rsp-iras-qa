import { expect, Locator, Page } from '@playwright/test';
import * as myResearchProjectsPageTestData from '../../../resources/test_data/iras/make_changes/my_research_projects_data.json';
import * as buttonTextData from '../../../resources/test_data/common/button_text_data.json';
import { confirmStringNotNull, validateDateRange } from '../../../utils/UtilFunctions';

//Declare Page Objects
export default class MyResearchProjectsPage {
  readonly page: Page;
  readonly myResearchProjectsPageTestData: typeof myResearchProjectsPageTestData;
  readonly buttonTextData: typeof buttonTextData;
  readonly page_heading: Locator;
  readonly no_projects_available_label: Locator;
  readonly add_project_record_button_label: Locator;
  readonly project_search_button_label: Locator;
  readonly advanced_filter_label: Locator;
  readonly short_project_title_link: Locator;
  readonly iras_id_title: Locator;
  readonly date_created_title: Locator;
  readonly status_title: Locator;
  readonly projectListRows: Locator;
  readonly listCell: Locator;
  readonly next_button: Locator;
  readonly search: Locator;
  readonly short_project_title: Locator;
  readonly search_text_box: Locator;
  readonly status_label: Locator;
  readonly status_fieldset: Locator;
  readonly status_checkbox: Locator;
  readonly status_checkbox_chevron: Locator;
  readonly status_hint_label: Locator;
  readonly status_selected_hint_label: Locator;
  readonly date_project_created_from_day_text: Locator;
  readonly date_project_created_from_month_dropdown: Locator;
  readonly date_project_created_from_year_text: Locator;
  readonly date_project_created_to_day_text: Locator;
  readonly date_project_created_to_month_dropdown: Locator;
  readonly date_project_created_to_year_text: Locator;
  readonly date_project_created_from_day_text_chevron: Locator;
  readonly date_project_created_to_day_text_chevron: Locator;
  readonly date_project_created_from_date_fieldset: Locator;
  readonly date_project_created_to_date_fieldset: Locator;
  readonly date_project_created_from_date_error_messaage: Locator;
  readonly date_project_created_to_date_error_message: Locator;
  readonly status_checkbox_selected_hint_label: Locator;
  readonly status_checkbox_hint_label: Locator;
  readonly user_search_text: Locator;
  readonly date_project_created_from_date_help_text: Locator;
  readonly date_project_created_to_date_help_text: Locator;

  //Initialize Page Objects
  constructor(page: Page) {
    this.page = page;
    this.myResearchProjectsPageTestData = myResearchProjectsPageTestData;
    this.buttonTextData = buttonTextData;

    //Locators
    this.page_heading = this.page
      .getByRole('heading')
      .getByText(this.myResearchProjectsPageTestData.My_Research_Projects_Page.heading, { exact: true });
    this.add_project_record_button_label = this.page.getByRole('link', {
      name: this.myResearchProjectsPageTestData.My_Research_Projects_Page.add_project_record_button_label,
    });
    this.short_project_title_link = this.page.getByRole('button', {
      name: this.myResearchProjectsPageTestData.Label_Texts.short_project_title_link,
      exact: true,
    });
    this.iras_id_title = this.page.getByRole('button', {
      name: this.myResearchProjectsPageTestData.Label_Texts.iras_id_title,
      exact: true,
    });
    this.date_created_title = this.page.getByRole('button', {
      name: this.myResearchProjectsPageTestData.Label_Texts.date_created_title,
      exact: true,
    });
    this.status_title = this.page.getByRole('button', {
      name: this.myResearchProjectsPageTestData.Label_Texts.status_title,
      exact: true,
    });
    this.projectListRows = this.page.locator('tbody').getByRole('row');
    this.listCell = this.page.getByRole('cell');
    this.next_button = this.page.getByRole('button', {
      name: this.myResearchProjectsPageTestData.My_Research_Projects_Page.next_button,
      exact: true,
    });
    this.short_project_title = this.page.getByRole('link', {
      name: this.myResearchProjectsPageTestData.Valid_Project_Title.short_project_title,
      exact: true,
    });
    this.search_text_box = this.page.getByTestId('SearchTerm');
    this.user_search_text = this.page.getByTestId('SearchTerm');
    this.status_checkbox_chevron = this.page
      .getByRole('heading', { level: 2 })
      .getByText(this.myResearchProjectsPageTestData.My_Research_Projects_Page.status_label, {
        exact: true,
      });

    this.status_label = this.page
      .getByRole('heading', { level: 2 })
      .getByText(this.myResearchProjectsPageTestData.My_Research_Projects_Page.status_label, {
        exact: true,
      });

    this.status_fieldset = this.status_label
      .locator('..')
      .locator('..')
      .locator('.govuk-fieldset')
      .locator('.govuk-form-group', {
        has: this.page.getByText(this.myResearchProjectsPageTestData.Advanced_Filters_Hint_Labels.status_hint_label),
      });
    this.status_checkbox = this.status_fieldset.getByRole('checkbox');
    this.status_label = this.page
      .getByRole('heading', { level: 2 })
      .getByText(this.myResearchProjectsPageTestData.My_Research_Projects_Page.status_label, {
        exact: true,
      });

    this.status_hint_label = this.status_label
      .locator('..')
      .locator('..')
      .locator('.govuk-fieldset')
      .locator('.govuk-form-group')
      .getByText(this.myResearchProjectsPageTestData.Advanced_Filters_Hint_Labels.status_hint_label);

    this.date_project_created_from_day_text_chevron = this.page
      .getByRole('heading')
      .getByText(this.myResearchProjectsPageTestData.My_Research_Projects_Page.date_project_created_label, {
        exact: true,
      });
    this.date_project_created_to_day_text_chevron = this.page
      .getByRole('heading')
      .getByText(this.myResearchProjectsPageTestData.My_Research_Projects_Page.date_project_created_label, {
        exact: true,
      });

    this.date_project_created_from_date_fieldset = this.page.locator('.govuk-fieldset').locator('.govuk-form-group', {
      has: this.page.getByText(
        this.myResearchProjectsPageTestData.My_Research_Projects_Page.date_project_created_from_date_hint_text
      ),
    });

    this.date_project_created_from_day_text = this.date_project_created_from_date_fieldset
      .locator('.govuk-form-group', {
        has: this.page.getByText(
          this.myResearchProjectsPageTestData.My_Research_Projects_Page.date_project_created_day_label
        ),
      })
      .getByRole('textbox');
    this.date_project_created_from_month_dropdown = this.date_project_created_from_date_fieldset
      .locator('.govuk-form-group', {
        has: this.page.getByText(
          this.myResearchProjectsPageTestData.My_Research_Projects_Page.date_project_created_month_label
        ),
      })
      .getByRole('combobox');
    this.date_project_created_from_year_text = this.date_project_created_from_date_fieldset
      .locator('.govuk-form-group', {
        has: this.page.getByText(
          this.myResearchProjectsPageTestData.My_Research_Projects_Page.date_project_created_year_label
        ),
      })
      .getByRole('textbox');

    this.date_project_created_to_date_error_message = this.page
      .locator('.govuk-fieldset')
      .locator('.govuk-form-group')
      .filter({
        hasText: this.myResearchProjectsPageTestData.My_Research_Projects_Page.date_project_created_to_date_hint_text,
      })
      .locator('.govuk-error-message');

    this.date_project_created_from_date_error_messaage = this.page
      .locator('.govuk-fieldset')
      .locator('.govuk-form-group')
      .filter({
        hasText: this.myResearchProjectsPageTestData.My_Research_Projects_Page.date_project_created_from_date_hint_text,
      })
      .locator('.govuk-error-message');

    this.date_project_created_to_date_fieldset = this.page.locator('.govuk-fieldset').locator('.govuk-form-group', {
      has: this.page.getByText(
        this.myResearchProjectsPageTestData.My_Research_Projects_Page.date_project_created_to_date_hint_text
      ),
    });

    this.date_project_created_to_day_text = this.date_project_created_to_date_fieldset
      .locator('.govuk-form-group', {
        has: this.page.getByText(
          this.myResearchProjectsPageTestData.My_Research_Projects_Page.date_project_created_day_label
        ),
      })
      .getByRole('textbox');

    this.date_project_created_to_month_dropdown = this.date_project_created_to_date_fieldset
      .locator('.govuk-form-group', {
        has: this.page.getByText(
          this.myResearchProjectsPageTestData.My_Research_Projects_Page.date_project_created_month_label
        ),
      })
      .getByRole('combobox');
    this.date_project_created_to_year_text = this.date_project_created_to_date_fieldset
      .locator('.govuk-form-group', {
        has: this.page.getByText(
          this.myResearchProjectsPageTestData.My_Research_Projects_Page.date_project_created_year_label
        ),
      })
      .getByRole('textbox');

    this.status_checkbox_hint_label = this.status_fieldset.getByText(
      this.myResearchProjectsPageTestData.Advanced_Filters_Hint_Labels.status_hint_label,
      {
        exact: true,
      }
    );
    this.date_project_created_from_date_help_text = this.page.locator('#Search_FromDate-hint');
    this.date_project_created_to_date_help_text = this.page.locator('#Search_ToDate-hint');
  }

  //Page Methods
  async goto() {
    await this.page.goto('/application/welcome/');
  }

  async assertOnMyResearchProjectsPage() {
    await expect(this.page_heading).toBeVisible();
    await expect(this.add_project_record_button_label).toBeVisible();
  }

  async findProjectLink(shortProjectTitle: string, irasId: string) {
    let hasNextPage = true;
    while (hasNextPage) {
      const rows = await this.projectListRows.all();
      for (const row of rows) {
        const columns = await row.locator(this.listCell).allInnerTexts();
        const matchesSearchKey = columns[0].trim().includes(shortProjectTitle);
        if (matchesSearchKey && columns[1].trim() === irasId) {
          return row;
        }
      }
      hasNextPage = (await this.next_button.isVisible()) && !(await this.next_button.isDisabled());
      if (hasNextPage) {
        await this.next_button.click();
        await this.page.waitForLoadState('domcontentloaded');
      }
    }
    throw new Error(`No matching record found`);
  }

  async sortIrasIdListValues(irasIds: string[], sortDirection: string): Promise<string[]> {
    const formattedIrasIds = irasIds.map(Number);
    if (formattedIrasIds.some(isNaN)) {
      throw new Error('IRAS ID must be a valid number');
    }
    const sortedListAsNums = formattedIrasIds.toSorted((a, b) =>
      sortDirection.toLowerCase() === 'ascending' ? a - b : b - a
    );
    return sortedListAsNums.map(String);
  }

  async getProjectDetails(expectedIrasId: string): Promise<Map<string, string>> {
    let projectMap: any;
    let displayedIrasId = '';
    let displayedStatusValue = '';
    let displayedProjectValue = '';
    const rows = await this.projectListRows.all();
    for (const row of rows) {
      const columns = await row.locator(this.listCell).allInnerTexts();
      if (columns[1] === expectedIrasId) {
        const irasId = confirmStringNotNull(columns[1]);
        displayedIrasId = irasId;
        const status = confirmStringNotNull(columns[3]);
        displayedStatusValue = status;
        const project = confirmStringNotNull(columns[0]);
        displayedProjectValue = project;
        projectMap = new Map([
          ['displayedStatusValue', displayedStatusValue],
          ['displayedProjectValue', displayedProjectValue],
          ['displayedIrasId', displayedIrasId],
        ]);
      }
      if (displayedIrasId) {
        return projectMap;
      }
    }
  }

  async clickFilterChevronUsers<PageObject>(dataset: JSON, key: string, page: PageObject) {
    const button = page[`${key}_chevron`];
    const fromDate = dataset['date_last_logged_in_from_day_text'];
    const isToDateKey = key === 'date_last_logged_in_to_day_text';
    const shouldClick = !isToDateKey || (isToDateKey && (fromDate === '' || fromDate === undefined));
    if (button && shouldClick) {
      await button.click();
    }
  }

  async validateFilters(statusActual: string, createdDateActual: string, filterDataset: any) {
    for (const key in filterDataset) {
      if (Object.hasOwn(filterDataset, key)) {
        if (key === 'status_checkbox') {
          const statusFilterLabelsExpected = filterDataset[key];
          expect(
            statusFilterLabelsExpected.some((statusLabel: string) =>
              statusActual.toLowerCase().includes(statusLabel.toLowerCase())
            )
          ).toBeTruthy();
        }
        if (
          key.includes('date_project_created_from_year_text') ||
          (key.includes('date_project_created_to_year_text') && createdDateActual !== null)
        ) {
          const filterFromDate = `${filterDataset['date_project_created_from_day_text']} ${filterDataset['date_project_created_from_month_dropdown']} ${filterDataset['date_project_created_from_year_text']}`;
          const filterToDate = `${filterDataset['date_project_created_to_day_text']} ${filterDataset['date_project_created_to_month_dropdown']} ${filterDataset['date_project_created_to_year_text']}`;
          if (filterFromDate !== '' && filterToDate !== '') {
            await this.validateDateFilter(filterFromDate, filterToDate, createdDateActual);
          }
        }
      }
    }
  }

  async getRowDataAdvancedFiltersSearch(row: any) {
    return {
      shortProjectTitle: confirmStringNotNull(await row.getByRole('cell').nth(0).textContent()),
      irasId: confirmStringNotNull(await row.getByRole('cell').nth(1).textContent()),
      dateCreated: confirmStringNotNull(await row.getByRole('cell').nth(2).textContent()),
      status: confirmStringNotNull(await row.getByRole('cell').nth(3).textContent()),
    };
  }

  async validateDateFilter(filterFromDate: string, filterToDate: string, lastLoggedInDateActual: string) {
    const lastLoggedInDateActualOnlyDate = lastLoggedInDateActual.substring(0, 11);
    const isLastLoggedInDateInValidRange = await validateDateRange(
      lastLoggedInDateActualOnlyDate,
      filterFromDate,
      filterToDate
    );
    expect(isLastLoggedInDateInValidRange).toBe(true);
  }

  async validateSearchInput(searchDatasetName: any, searchCriteriaDataset: any, shortProjectTitle: any, irasId: any) {
    if (searchDatasetName == 'Existing_Short_Project_Title_Data_One') {
      const shortProjectTitleExpected = searchCriteriaDataset['search_input_text'];
      expect(shortProjectTitle.toLowerCase().includes(shortProjectTitleExpected.toLowerCase()));
    } else if (searchDatasetName == 'Existing_Iras_Id_Data') {
      const irasIdExpected = searchCriteriaDataset['search_input_text'];
      expect(irasId.toLowerCase().includes(irasIdExpected.toLowerCase()));
    }
  }

  async validateResults(
    commonItemsPage: any,
    searchCriteriaDataset: any,
    filterDataset: any,
    searchDatasetName: any,
    validateSearch: boolean = true
  ) {
    for (let pageIndex = 1; pageIndex < 4; pageIndex++) {
      const rowCount = await commonItemsPage.tableRows.count();
      for (let rowIndex = 1; rowIndex < rowCount; rowIndex++) {
        const row = commonItemsPage.tableRows.nth(rowIndex);
        const { shortProjectTitle, irasId, dateCreated, status } = await this.getRowDataAdvancedFiltersSearch(row);
        if (validateSearch && searchCriteriaDataset['search_input_text'] !== '') {
          this.validateSearchInput(searchDatasetName, searchCriteriaDataset, shortProjectTitle, irasId);
        }
        this.validateFilters(status, dateCreated, filterDataset);
      }
      const hasNextPage =
        (await commonItemsPage.pagination_next_link.isVisible()) &&
        !(await commonItemsPage.pagination_next_link.isDisabled());
      if (hasNextPage) {
        await commonItemsPage.pagination_next_link.click();
      }
    }
  }
}
