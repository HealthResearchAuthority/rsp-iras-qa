import { expect, Locator, Page } from '@playwright/test';
import * as linkTextData from '../../../../resources/test_data/common/link_text_data.json';
import * as searchProjectsPageTestData from '../../../../resources/test_data/iras/reviewResearch/receiveAmendments/search_projects_page_data.json';
import path from 'node:path';
import * as fse from 'fs-extra';
import { confirmStringNotNull, returnDataFromJSON } from '../../../../utils/UtilFunctions';
import { connect } from '../../../../utils/DbConfig';
import * as dbConfigData from '../../../../resources/test_data/common/database/db_config_data.json';
const pathToTestDataJson =
  './src/resources/test_data/iras/reviewResearch/receiveAmendments/search_projects_page_data.json';

//Declare Page Objects
export default class SearchProjectsPage {
  readonly page: Page;
  readonly searchProjectsPageTestData: typeof searchProjectsPageTestData;
  readonly linkTextData: typeof linkTextData;
  private _projects_list_after_search: string[];
  private _iras_id: string;
  private _short_title: string;
  readonly mainPageContent: Locator;
  readonly page_heading: Locator;
  readonly page_guidance_text: Locator;
  readonly iras_id_search_text: Locator;
  readonly search_box: Locator;
  readonly search_button_label: Locator;
  readonly next_button: Locator;
  readonly search_box_label: Locator;
  readonly listCell: Locator;
  readonly chief_investigator_name_text: Locator;
  readonly short_project_title_text: Locator;
  readonly lead_nation_label: Locator;
  readonly lead_nation_fieldset: Locator;
  readonly lead_nation_checkbox: Locator;
  readonly chief_investigator_name_text_chevron: Locator;
  readonly lead_nation_checkbox_chevron: Locator;
  readonly modification_type_checkbox_chevron: Locator;
  readonly short_project_title_text_chevron: Locator;
  readonly sponsor_organisation_text_chevron: Locator;
  readonly tableRows: Locator;
  readonly chief_investigator_name_label: Locator;
  readonly chief_investigator_name_fieldset: Locator;
  readonly short_project_title_fieldset: Locator;
  readonly sponsor_organisation_jsdisabled_result_hint_label: Locator;
  readonly sponsor_organisation_jsdisabled_search_results_labels: Locator;
  readonly sponsor_organisation_jsdisabled_narrow_down_label: Locator;
  readonly sponsor_organisation_jsdisabled_no_suggestions_label: Locator;
  readonly lead_nation_checkbox_hint_label: Locator;
  readonly modification_type_checkbox_hint_label: Locator;
  readonly lead_nation_checkbox_selected_hint_label: Locator;
  readonly modification_type_checkbox_selected_hint_label: Locator;
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
    this.searchProjectsPageTestData = searchProjectsPageTestData;
    this._projects_list_after_search = [];
    this._iras_id = '';
    this._short_title = '';

    //Locators
    this.mainPageContent = this.page.getByTestId('main-content');
    this.page_heading = this.mainPageContent
      .getByRole('heading')
      .getByText(this.searchProjectsPageTestData.Search_Projects_Page.page_heading);
    this.page_guidance_text = this.mainPageContent
      .getByRole('paragraph')
      .getByText(this.searchProjectsPageTestData.Search_Projects_Page.page_guidance_text);
    this.iras_id_search_text = this.page.getByLabel(
      this.searchProjectsPageTestData.Search_Projects_Page.iras_id_search_box_label,
      { exact: true }
    );
    this.search_box_label = this.page.locator('label[for="SearchQuery"]');
    this.search_box = this.page.getByTestId('SearchQuery');
    this.search_button_label = this.page.getByText('Search');
    this.next_button = this.page.locator('.govuk-pagination__next a');
    this.tableRows = this.page.getByRole('table').getByRole('row');
    this.listCell = this.page.getByRole('cell');
    this.chief_investigator_name_fieldset = this.page.locator('.govuk-fieldset', {
      has: this.page.getByText(this.searchProjectsPageTestData.Search_Projects_Page.chief_investigator_hint_text),
    });
    this.chief_investigator_name_text = this.chief_investigator_name_fieldset.getByRole('textbox');
    this.chief_investigator_name_text_chevron = this.page
      .getByRole('heading', { level: 2 })
      .getByText(this.searchProjectsPageTestData.Search_Projects_Page.chief_investigator_name_label, {
        exact: true,
      });
    this.lead_nation_label = this.page
      .getByRole('heading', { level: 2 })
      .getByText(this.searchProjectsPageTestData.Search_Projects_Page.lead_nation_label, { exact: true });
    this.lead_nation_fieldset = this.lead_nation_label
      .locator('..')
      .locator('..')
      .locator('.govuk-fieldset')
      .locator('.govuk-form-group', {
        has: this.page.getByText(this.searchProjectsPageTestData.Search_Projects_Page.lead_nation_hint_text),
      });
    this.lead_nation_checkbox_hint_label = this.lead_nation_label
      .locator('..')
      .locator('..')
      .locator('.govuk-fieldset')
      .locator('.govuk-form-group')
      .getByText(
        this.searchProjectsPageTestData.Search_Projects_Page.Advanced_Filters_Hint_Labels
          .lead_nation_checkbox_hint_label,
        { exact: true }
      );
    this.lead_nation_checkbox_selected_hint_label = this.lead_nation_label
      .locator('..')
      .locator('..')
      .locator('.govuk-fieldset')
      .locator('.govuk-form-group')
      .getByText(this.searchProjectsPageTestData.Search_Projects_Page.selected_checkboxes_hint_label);
    this.lead_nation_checkbox = this.lead_nation_fieldset.getByRole('checkbox');
    this.lead_nation_checkbox_chevron = this.page
      .getByRole('heading')
      .getByText(this.searchProjectsPageTestData.Search_Projects_Page.lead_nation_label, {
        exact: true,
      });
    this.participating_nation_label = this.page
      .getByRole('heading', { level: 2 })
      .getByText(this.searchProjectsPageTestData.Search_Projects_Page.participating_nation_label, {
        exact: true,
      });
    this.participating_nation_fieldset = this.participating_nation_label
      .locator('..')
      .locator('..')
      .locator('.govuk-fieldset')
      .locator('.govuk-form-group', {
        has: this.page.getByText(this.searchProjectsPageTestData.Search_Projects_Page.participating_nation_hint_text),
      });
    this.participating_nation_checkbox_hint_label = this.participating_nation_label
      .locator('..')
      .locator('..')
      .locator('.govuk-fieldset')
      .locator('.govuk-form-group')
      .getByText(
        this.searchProjectsPageTestData.Search_Projects_Page.Advanced_Filters_Hint_Labels
          .participating_nation_checkbox_hint_label,
        { exact: true }
      );
    this.participating_nation_checkbox_selected_hint_label = this.participating_nation_label
      .locator('..')
      .locator('..')
      .locator('.govuk-fieldset')
      .locator('.govuk-form-group')
      .getByText(this.searchProjectsPageTestData.Search_Projects_Page.selected_checkboxes_hint_label);
    this.participating_nation_checkbox = this.participating_nation_fieldset.getByRole('checkbox');
    this.participating_nation_checkbox_chevron = this.page
      .getByRole('heading')
      .getByText(this.searchProjectsPageTestData.Search_Projects_Page.participating_nation_label, {
        exact: true,
      });
    this.short_project_title_text_chevron = this.page
      .getByRole('heading')
      .getByText(this.searchProjectsPageTestData.Search_Projects_Page.short_project_title_label, {
        exact: true,
      });
    this.short_project_title_fieldset = this.page.locator('.govuk-fieldset', {
      has: this.page.getByText(this.searchProjectsPageTestData.Search_Projects_Page.short_project_title_hint_text),
    });
    this.short_project_title_text = this.short_project_title_fieldset.getByRole('textbox');
    this.sponsor_organisation_text_chevron = this.page
      .getByRole('heading')
      .getByText(this.searchProjectsPageTestData.Search_Projects_Page.sponsor_organisation_label, {
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

  async getIrasIdListAfterSearch(): Promise<string[]> {
    return this._projects_list_after_search;
  }

  async setIrasIdListAfterSearch(value: string[]): Promise<void> {
    this._projects_list_after_search = value;
  }

  async getIrasId(): Promise<string> {
    return this._iras_id;
  }

  async setIrasId(value: string): Promise<void> {
    this._iras_id = value;
  }

  async getShortProjectTitle(): Promise<string> {
    return this._short_title;
  }

  async setShortProjectTitle(value: string): Promise<void> {
    this._short_title = value;
  }

  //Page Methods

  async assertOnSearchProjectsPage() {
    await expect.soft(this.page_heading).toBeVisible();
    // await expect.soft(this.page_guidance_text).toBeVisible();//defect @KNOWN-DEFECT-RSP-5909
    expect.soft(await this.page.title()).toBe(this.searchProjectsPageTestData.Search_Projects_Page.title);
  }

  async goto() {
    await this.page.goto('approvals/projectrecordsearch');
    await this.assertOnSearchProjectsPage();
  }

  async saveIrasID(irasId: string) {
    await this.setIrasId(irasId);
    const filePath = path.resolve(pathToTestDataJson);
    await this.updateIrasIdTestDataJson(filePath, irasId);
  }

  async saveIrasIDShortProjectTitle(irasId: string, title: string) {
    await this.setIrasId(irasId);
    await this.setShortProjectTitle(title);
    const filePath = path.resolve(pathToTestDataJson);
    await this.updateIrasIdShortProjectTitleTestDataJson(filePath, irasId, title);
  }

  async updateIrasIdShortProjectTitleTestDataJson(filePath: string, irasId: string, title: string) {
    (async () => {
      try {
        const data = await returnDataFromJSON(filePath);
        data.Search_Queries.Valid_Full_Iras_Id.search_input_text = irasId;
        data.Advanced_Filters.Advanced_Filters_Short_Project_Title.short_project_title_text = title;
        await fse.writeJson(filePath, data, { spaces: 2 });
      } catch (error) {
        throw new Error(`${error} Error updating iras id to testdata json file:`);
      }
    })();
  }

  async updateIrasIdTestDataJson(filePath: string, updateVal: string) {
    (async () => {
      try {
        const data = await returnDataFromJSON(filePath);
        data.Search_Queries.Valid_Full_Iras_Id.search_input_text = updateVal;
        await fse.writeJson(filePath, data, { spaces: 2 });
      } catch (error) {
        throw new Error(`${error} Error updating iras id to testdata json file:`);
      }
    })();
  }

  async saveShortProjectTitle(title: string) {
    await this.setShortProjectTitle(title);
    const filePath = path.resolve(pathToTestDataJson);
    await this.updateShortProjectTitleTestDataJson(filePath, title);
  }

  async updateShortProjectTitleTestDataJson(filePath: string, updateVal: string) {
    (async () => {
      try {
        const data = await returnDataFromJSON(filePath);
        data.Advanced_Filters.Advanced_Filters_Short_Project_Title.short_project_title_text = updateVal;
        await fse.writeJson(filePath, data, { spaces: 2 });
      } catch (error) {
        throw new Error(`${error} Error updating iras id to testdata json file:`);
      }
    })();
  }

  async sqlGetIrasIdShortProjectTitleByStatus(status: string) {
    const sqlConnection = await connect(dbConfigData.Application_Service);
    const queryResult = await sqlConnection.query(`
        SELECT TOP 1
            ProjectRecords.IrasId,
            ProjectRecords.ShortProjectTitle
        FROM ProjectRecords
        INNER JOIN ProjectRecordAnswers ON ProjectRecordAnswers.ProjectRecordId = ProjectRecords.Id
        WHERE 
            ProjectRecordAnswers.QuestionId = 'IQA0005' AND 
            ProjectRecordAnswers.SelectedOptions IN ('OPT0021', 'OPT0020', 'OPT0019','OPT0018') AND 
            ProjectRecords.[Status] = '${status}'
        ORDER BY ProjectRecords.CreatedDate DESC;
    `);
    await sqlConnection.close();
    return queryResult.recordset.map((row) => ({
      IrasId: row.IrasId,
      ShortProjectTitle: row.ShortProjectTitle,
    }));
  }

  async getAllProjectsFromTheTable(totalPagesCount: number): Promise<Map<string, string[]>> {
    const searchResultValues: string[] = [];
    const irasIdValues: string[] = [];
    const shortProjectTitleValues: string[] = [];
    const leadNationValues: string[] = [];
    await this.page.waitForLoadState('domcontentloaded');
    await this.page.waitForTimeout(3000);
    let iteration: number;
    if (totalPagesCount < 3) {
      iteration = totalPagesCount;
    } else {
      iteration = 3;
    }
    //adding this for loop instead of while loop to limit navigation till first 3 pages only,to reduce time and reduce fakiness
    for (let i = 0; i < iteration; i++) {
      const rowCount = await this.tableRows.count();
      for (let i = 1; i < rowCount; i++) {
        const columns = this.tableRows.nth(i).getByRole('cell');
        const irasId = confirmStringNotNull(await columns.nth(0).textContent());
        irasIdValues.push(irasId);
        const shortProjectTitle = confirmStringNotNull(await columns.nth(1).textContent());
        shortProjectTitleValues.push(shortProjectTitle);
        const leadNation = confirmStringNotNull(await columns.nth(2).textContent());
        leadNationValues.push(leadNation);
        searchResultValues.push(irasId + '|' + shortProjectTitle + '|' + leadNation);
      }
      if ((await this.next_button.isVisible()) && !(await this.next_button.isDisabled())) {
        await this.next_button.click();
        await this.page.waitForLoadState('domcontentloaded');
      }
    }
    const searchResultMap = new Map([
      ['searchResultValues', searchResultValues],
      ['irasIdValues', irasIdValues],
      ['shortProjectTitleValues', shortProjectTitleValues],
      ['leadNationValues', leadNationValues],
    ]);
    return searchResultMap;
  }
}
