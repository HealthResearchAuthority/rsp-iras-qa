import { expect, Locator, Page } from '@playwright/test';
import * as modificationsReadyToAssignPageTestData from '../../../../resources/test_data/iras/reviewResearch/receiveAmendments/modifications_ready_to_assign_page_data.json';
import * as searchFilterResultsData from '../../../../resources/test_data/common/search_filter_results_data.json';
import { connect } from '../../../../utils/DbConfig';
import * as dbConfigData from '../../../../resources/test_data/common/database/db_config_data.json';
import path from 'node:path';
import * as fse from 'fs-extra';
import { returnDataFromJSON } from '../../../../utils/UtilFunctions';
const pathToTestDataJson =
  './src/resources/test_data/iras/reviewResearch/receiveAmendments/modifications_ready_to_assign_page_data.json';

//Declare Page Objects
export default class ModificationsReadyToAssignPage {
  readonly page: Page;
  readonly modificationsReadyToAssignPageTestData: typeof modificationsReadyToAssignPageTestData;
  readonly searchFilterResultsData: typeof searchFilterResultsData;
  private _modification_record: string;
  private _modification_id_title: string[];
  private _modification_id: string;
  private _iras_id: string;
  readonly modifications_tasklist_link: Locator;
  readonly short_project_title_column_label: Locator;
  readonly modification_id_column_label: Locator;
  readonly date_submitted_column_label: Locator;
  readonly days_since_submission_column_label: Locator;
  readonly checkall_modification_checkbox: Locator;
  readonly page_heading: Locator;
  readonly page_description: Locator;
  readonly modification_button_label: Locator;
  readonly search_input_text: Locator;
  readonly advanced_filter_label: Locator;
  readonly date_from_filter_input: Locator;
  readonly day_from_text: Locator;
  readonly month_from_dropdown: Locator;
  readonly year_from_text: Locator;
  readonly date_to_filter_input: Locator;
  readonly day_to_text: Locator;
  readonly month_to_dropdown: Locator;
  readonly year_to_text: Locator;
  readonly days_since_submission_from_text: Locator;
  readonly days_since_submission_to_text: Locator;
  readonly short_project_title_text: Locator;
  readonly search_button_label: Locator;
  readonly modification_checkbox: Locator;
  readonly results_table: Locator;
  readonly iras_id_search_text: Locator;
  readonly study_wide_reviewer_text: Locator;

  //Initialize Page Objects
  constructor(page: Page) {
    this.page = page;
    this.modificationsReadyToAssignPageTestData = modificationsReadyToAssignPageTestData;
    this.searchFilterResultsData = searchFilterResultsData;
    this._modification_record = '';
    this._modification_id_title = [];
    this._modification_id = '';
    this._iras_id = '';

    //Locators
    this.modifications_tasklist_link = this.page.locator('.govuk-heading-s govuk-link hra-card-heading__link');
    this.short_project_title_column_label = this.page
      .getByRole('button')
      .getByText(this.modificationsReadyToAssignPageTestData.Column_Label_Texts.short_project_title_column_label, {
        exact: true,
      });
    this.modification_id_column_label = this.page
      .getByRole('button')
      .getByText(this.modificationsReadyToAssignPageTestData.Column_Label_Texts.modification_id_column_label, {
        exact: true,
      });
    this.date_submitted_column_label = this.page
      .getByRole('button')
      .getByText(this.modificationsReadyToAssignPageTestData.Column_Label_Texts.date_submitted_column_label, {
        exact: true,
      });
    this.days_since_submission_column_label = this.page
      .getByRole('button')
      .getByText(this.modificationsReadyToAssignPageTestData.Column_Label_Texts.days_since_submission_column_label, {
        exact: true,
      });
    this.search_input_text = this.page.getByTestId('Search_IrasId');
    this.checkall_modification_checkbox = this.page.getByTestId('select-all-modifications');
    this.page_heading = this.page.getByTestId('title');
    this.page_description = this.page
      .getByRole('paragraph')
      .getByText(this.modificationsReadyToAssignPageTestData.Modifications_Ready_To_Assign_Page.page_description);
    this.advanced_filter_label = this.page.getByRole('button', {
      name: this.modificationsReadyToAssignPageTestData.Modifications_Ready_To_Assign_Page.advanced_filter_label,
    });
    this.date_from_filter_input = this.page.getByTestId('Search_FromDate_date');
    this.day_from_text = this.date_from_filter_input.getByLabel(
      this.modificationsReadyToAssignPageTestData.Filter_Labels.day_from_label
    );
    this.month_from_dropdown = this.date_from_filter_input.getByLabel(
      this.modificationsReadyToAssignPageTestData.Filter_Labels.month_from_label
    );
    this.year_from_text = this.date_from_filter_input.getByLabel(
      this.modificationsReadyToAssignPageTestData.Filter_Labels.year_from_label
    );
    this.date_to_filter_input = this.page.getByTestId('Search_ToDate_date');
    this.day_to_text = this.date_to_filter_input.getByLabel(
      this.modificationsReadyToAssignPageTestData.Filter_Labels.day_to_label
    );
    this.month_to_dropdown = this.date_to_filter_input.getByLabel(
      this.modificationsReadyToAssignPageTestData.Filter_Labels.month_to_label
    );
    this.year_to_text = this.date_to_filter_input.getByLabel(
      this.modificationsReadyToAssignPageTestData.Filter_Labels.year_to_label
    );
    this.days_since_submission_from_text = this.page.getByTestId('Search.FromDaysSinceSubmission');
    this.days_since_submission_to_text = this.page.getByTestId('Search.ToDaysSinceSubmission');
    // this.short_project_title_text = this.page.getByLabel(
    //   this.modificationsReadyToAssignPageTestData.Filter_Labels.short_project_title_label
    // );
    this.short_project_title_text = this.page.locator('input[name="Search.ShortProjectTitle"]'); //workaround use above after fix
    this.search_button_label = this.page.getByText('Search');
    this.modification_checkbox = this.page.locator('input[name="selectedModificationIds"][type="checkbox"]');
    this.results_table = this.page.getByTestId('modificationsTasklistTable');
    this.iras_id_search_text = this.page.getByLabel(
      this.modificationsReadyToAssignPageTestData.Modifications_Ready_To_Assign_Page.iras_id_search_box_label,
      { exact: true }
    );
    this.study_wide_reviewer_text = this.page.locator('input[name="Search.ReviewerName"]');
  }

  //Getters & Setters for Private Variables

  async getSelectedModifications(): Promise<string> {
    return this._modification_record;
  }

  async setSelectedModifications(value: string): Promise<void> {
    this._modification_record = value;
  }

  async getSelectedModificationsIdTitle(): Promise<string[]> {
    return this._modification_id_title;
  }

  async setSelectedModificationsIdTitle(value: string[]): Promise<void> {
    this._modification_id_title = value;
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
  async goto() {
    await this.page.goto('modificationstasklist/index');
  }

  async assertOnModificationsReadyToAssignPage() {
    await expect(this.page_heading).toBeVisible();
    // expect
    //   .soft(await this.page.title())
    //   .toBe(this.modificationsReadyToAssignPageTestData.Modifications_Ready_To_Assign_Page.title);
  }

  async sqlGetModificationByLeadNationAndStatusWFC(lead_nation: string, status: string) {
    const option = 'project_record_answer_option_lead_nation_' + lead_nation.toLowerCase();
    const leadNationOption = modificationsReadyToAssignPageTestData.Modifications_Ready_To_Assign_Page[option];
    const sqlConnection = await connect(dbConfigData.Application_Service);
    const queryResult = await sqlConnection.query(`
  SELECT 
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
        ProjectRecordAnswers.SelectedOptions ='${leadNationOption}' AND
        ProjectRecords.[Status] = 'Active' AND
        ProjectModifications.[Status] = '${status}'   AND ProjectModifications.ReviewerName is NULL
) AS NationQuery
INNER JOIN ProjectRecordAnswers
    ON ProjectRecordAnswers.ProjectRecordId = NationQuery.Id
WHERE
    ProjectRecordAnswers.QuestionId = 'IQA0002'   
ORDER BY NationQuery.CreatedDate DESC;
`);

    await sqlConnection.close();
    if (queryResult.recordset.length == 0) {
      throw new Error(`No suitable modification found in the system with ${leadNationOption} lead nation`);
    }
    return queryResult.recordset.map((row) => row.ModificationIdentifier);
  }

  async sqlGetModificationByLeadNationAndStatusCountWFC(lead_nation: string, status: string, countValue: string) {
    const option = 'project_record_answer_option_lead_nation_' + lead_nation.toLowerCase();
    const leadNationOption = modificationsReadyToAssignPageTestData.Modifications_Ready_To_Assign_Page[option];
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
        ProjectRecordAnswers.SelectedOptions ='${leadNationOption}' AND
        ProjectRecords.[Status] = 'Active' AND
        ProjectModifications.[Status] = '${status}' AND ProjectModifications.ReviewerName is NULL
) AS NationQuery
INNER JOIN ProjectRecordAnswers
    ON ProjectRecordAnswers.ProjectRecordId = NationQuery.Id
WHERE
    ProjectRecordAnswers.QuestionId = 'IQA0002'
    AND NationQuery.IrasIdCount ${countValue} 1
ORDER BY NationQuery.CreatedDate DESC;
`);
    await sqlConnection.close();
    if (queryResult.recordset.length == 0) {
      throw new Error(
        `No suitable modification found in the system with ${leadNationOption} lead nation and ${status} status and ${countValue}`
      );
    }
    return queryResult.recordset.map((row) => row.IrasId);
  }

  async saveModificationIdWFC(modificationId: string, countval: string) {
    await this.setModificationId(modificationId);
    const filePath = path.resolve(pathToTestDataJson);
    await this.updateModificationIdTestDataJson(filePath, modificationId, countval);
  }

  async updateModificationIdTestDataJson(filePath: string, updateVal: string, countval: string) {
    (async () => {
      try {
        const data = await returnDataFromJSON(filePath);
        if (countval === 'Single') {
          data.Search_Queries.Existing_IRAS_ID_Single.search_input_text = updateVal;
        } else if (countval === 'Partial') {
          data.Search_Queries.Existing_Partial_IRAS_ID.search_input_text = updateVal.substring(0, 2);
        } else if (countval === 'Multi') {
          data.Search_Queries.Existing_IRAS_ID_Multi.search_input_text = updateVal;
        }
        await fse.writeJson(filePath, data, { spaces: 2 });
      } catch (error) {
        throw new Error(`${error} Error updating modification id to testdata json file:`);
      }
    })();
  }
}
