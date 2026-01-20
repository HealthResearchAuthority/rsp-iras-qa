import { expect, Locator, Page } from '@playwright/test';
import * as linkTextData from '../../../../resources/test_data/common/link_text_data.json';
import * as searchModificationsPageTestData from '../../../../resources/test_data/iras/reviewResearch/receiveAmendments/search_modifications_page_data.json';
import { confirmStringNotNull, returnDataFromJSON } from '../../../../utils/UtilFunctions';
import CommonItemsPage from '../../../Common/CommonItemsPage';
import { connect } from '../../../../utils/DbConfig';
import * as dbConfigData from '../../../../resources/test_data/common/database/db_config_data.json';
const pathToTestDataJson =
  './src/resources/test_data/iras/reviewResearch/receiveAmendments/search_modifications_page_data.json';
import path from 'node:path';
import * as fse from 'fs-extra';

//Declare Page Objects
export default class SearchModificationsPage {
  readonly page: Page;
  readonly searchModificationsPageTestData: typeof searchModificationsPageTestData;
  readonly linkTextData: typeof linkTextData;
  private _modifications_list_after_search: string[];
  private _modification_id: string;
  private _iras_id: string;
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
  readonly sponsor_organisation_jsdisabled_result_hint_label: Locator;
  readonly sponsor_organisation_jsdisabled_search_results_labels: Locator;
  readonly sponsor_organisation_jsdisabled_narrow_down_label: Locator;
  readonly sponsor_organisation_jsdisabled_no_suggestions_label: Locator;
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
  readonly mainPageContent: Locator;

  //Initialize Page Objects
  constructor(page: Page) {
    this.page = page;
    this.searchModificationsPageTestData = searchModificationsPageTestData;
    this._modifications_list_after_search = [];
    this._modification_id = '';
    this._iras_id = '';

    //Locators
    this.mainPageContent = this.page.getByTestId('main-content');
    this.page_heading = this.mainPageContent
      .getByRole('heading')
      .getByText(this.searchModificationsPageTestData.Search_Modifications_Page.page_heading);
    this.page_guidance_text = this.mainPageContent
      .getByRole('paragraph')
      .getByText(this.searchModificationsPageTestData.Search_Modifications_Page.page_guidance_text);
    this.iras_id_search_text = this.mainPageContent.getByLabel(
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
    this.sponsor_organisation_jsdisabled_result_hint_label = this.page.locator(
      '[id$="SponsorOrgSearch.SelectedOrganisation-hint"]'
    );
    this.sponsor_organisation_jsdisabled_narrow_down_label = this.page.locator('.govuk-inset-text');
    this.sponsor_organisation_jsdisabled_search_results_labels = this.page
      .locator('.govuk-radios__item')
      .filter({ has: this.page.locator('.govuk-radios__label') });
    this.sponsor_organisation_jsdisabled_no_suggestions_label = this.page.locator('.govuk-inset-text');
    this.results_table = this.page.getByTestId('modificationsTable');
  }

  //Getters & Setters for Private Variables

  async getModificationIdListAfterSearch(): Promise<string[]> {
    return this._modifications_list_after_search;
  }

  async setModificationIdListAfterSearch(value: string[]): Promise<void> {
    this._modifications_list_after_search = value;
  }

  async getModificationId(): Promise<string> {
    return this._modification_id;
  }

  async setModificationId(value: string): Promise<void> {
    this._modification_id = value;
  }

  async getIrasId(): Promise<string> {
    return this._iras_id;
  }

  async setIrasId(value: string): Promise<void> {
    this._iras_id = value;
  }

  //Page Methods

  async assertOnSearchModificationsPage() {
    await expect.soft(this.page_heading).toBeVisible();
    await expect.soft(this.page_guidance_text).toBeVisible();
    expect.soft(await this.page.title()).toBe(this.searchModificationsPageTestData.Search_Modifications_Page.title);
  }

  async goto() {
    await this.page.goto('approvals/index');
    await this.assertOnSearchModificationsPage();
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
    //adding this for loop instead of while loop to limit navigation till first 3 pages only,to reduce time and reduce fakiness
    for (let i = 0; i < 3; i++) {
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

  async clickFilterChevronModifications<PageObject>(dataset: JSON, key: string, page: PageObject) {
    const button = page[`${key}_chevron`];
    const fromDate = dataset['date_submitted_from_day_text'];
    const isToDateKey = key === 'date_submitted_to_day_text';
    const shouldClick = !isToDateKey || (isToDateKey && (fromDate === '' || fromDate === undefined));
    if (button && shouldClick) {
      await button.click();
    }
  }

  async selectSponsorOrgJsDisabled<PageObject>(
    dataset: JSON,
    key: string,
    commonItemsPage: CommonItemsPage,
    page: PageObject
  ) {
    await commonItemsPage.fillUIComponent(dataset, key, page);
    await commonItemsPage.search_projects_modifications_sponsor_organisation_jsdisabled_search_button.click();
    await this.page.waitForTimeout(2000);
    if (dataset[key] !== '') {
      await commonItemsPage.sponsor_organisation_jsdisabled_search_results_radio_button.first().click();
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
    return confirmStringNotNull(await commonItemsPage.search_results_count.textContent());
  }

  async getExpectedResultsCountLabel(commonItemsPage: CommonItemsPage, count: number) {
    const testData = commonItemsPage.commonTestData;
    const expectedResultCountLabel = testData.result_count_heading;
    return count + expectedResultCountLabel;
  }

  async getExpectedResultsCountLabelNoResults(commonItemsPage: CommonItemsPage) {
    const expectedResultCountLabel = commonItemsPage.commonTestData.result_count_heading;
    return '0' + expectedResultCountLabel;
  }

  async sqlGetModificationByStatus(status: string, countValue: string) {
    const sqlConnection = await connect(dbConfigData.Application_Service);
    const queryResult = await sqlConnection.query(`
      SELECT TOP 1
    NationQuery.ModificationIdentifier,
    NationQuery.IrasId,
    ProjectRecordAnswers.Response,
    NationQuery.CreatedDate,
    NationQuery.[Status]
FROM (
    SELECT
        ProjectModifications.ModificationIdentifier,
        ProjectModifications.CreatedDate,
        ProjectModifications.[Status],
        ProjectRecords.Id,
        ProjectRecords.IrasId,
        ProjectRecordAnswers.ProjectRecordId,
        ProjectRecordAnswers.QuestionId,
        ProjectRecordAnswers.SelectedOptions,
        ProjectRecordAnswers.Response,
        ProjectRecords.[Status] AS ProjectRecordStatus,
        COUNT(*) OVER (PARTITION BY ProjectRecords.IrasId) AS IrasIdCount
    FROM ProjectModifications
    INNER JOIN ProjectRecords
        ON ProjectRecords.Id = ProjectModifications.ProjectRecordId
    INNER JOIN ProjectRecordAnswers
        ON ProjectRecordAnswers.ProjectRecordId = ProjectRecords.Id
    WHERE
        ProjectRecordAnswers.QuestionId = 'IQA0005' AND
        ProjectRecordAnswers.SelectedOptions IN ('OPT0021', 'OPT0020', 'OPT0019','OPT0018') AND
        ProjectRecords.[Status] = 'Active' AND
        ProjectModifications.[Status] = '${status}' 
) AS NationQuery
INNER JOIN ProjectRecordAnswers
    ON ProjectRecordAnswers.ProjectRecordId = NationQuery.Id
WHERE
    ProjectRecordAnswers.QuestionId = 'IQA0002'   AND NationQuery.IrasIdCount ${countValue} 1 
ORDER BY NationQuery.CreatedDate DESC;
`);
    await sqlConnection.close();
    if (queryResult.recordset.length == 0) {
      throw new Error(`No suitable modification found in the system with ${status} status`);
    }
    return queryResult.recordset.map((row) => row.ModificationIdentifier);
  }
  async saveModificationIdSearch(modificationId: string, countval: string) {
    await this.setModificationId(modificationId);
    const filePath = path.resolve(pathToTestDataJson);
    await this.updateModificationIdTestDataJson(filePath, modificationId, countval);
  }

  async updateModificationIdTestDataJson(filePath: string, updateVal: string, countval: string) {
    (async () => {
      try {
        const data = await returnDataFromJSON(filePath);
        if (countval === 'Single') {
          data.Search_Queries.Valid_Full_Iras_Id.search_input_text = updateVal;
        } else if (countval === 'Partial') {
          data.Search_Queries.Existing_Partial_IRAS_ID.search_input_text = updateVal.substring(0, 2);
        }
        await fse.writeJson(filePath, data, { spaces: 2 });
      } catch (error) {
        throw new Error(`${error} Error updating modification id to testdata json file:`);
      }
    })();
  }
}
