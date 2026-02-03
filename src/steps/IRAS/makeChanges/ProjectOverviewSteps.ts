import { createBdd } from 'playwright-bdd';
import { expect, test } from '../../../hooks/CustomFixtures';
import {
  confirmStringNotNull,
  removeUnwantedWhitespace,
  getRandomNumber,
  confirmArrayNotNull,
  convertDate,
  convertDateMonthToNumber,
} from '../../../utils/UtilFunctions';
import path from 'node:path';
const { When, Then } = createBdd(test);

Then('I can see the project overview page', async ({ projectOverviewPage }) => {
  await projectOverviewPage.assertOnProjectOverviewPage();
});

Then(
  'I can see the {string} project details on project overview page for {string}',
  async ({ projectDetailsIRASPage, projectOverviewPage }, projectType: string, datasetName: string) => {
    let expectedIrasId: string;
    let expectedProjectTitle: string;
    if (projectType.toLowerCase() == 'existing') {
      expectedIrasId = projectOverviewPage.projectOverviewPageTestData[datasetName].Project_Details.iras_id;
      expectedProjectTitle =
        projectOverviewPage.projectOverviewPageTestData[datasetName].Project_Details.short_project_title_text;
    } else {
      expectedIrasId = await projectDetailsIRASPage.getUniqueIrasId();
      expectedProjectTitle = (await projectDetailsIRASPage.getShortProjectTitle()).trim();
    }
    const projectTitle = confirmStringNotNull(await projectOverviewPage.project_overview_heading.textContent());
    const projectDetails = projectTitle.split('\n');
    const irasId = projectDetails[0].split(' ');
    const actualIrasId = irasId[2];
    const shortProjectTitle = projectDetails[3].trim();
    const actualshortProjectTitle = shortProjectTitle.replace('Short project title: ', '').trim();
    expect.soft(actualshortProjectTitle).toBe(expectedProjectTitle);
    expect.soft(actualIrasId).toBe(expectedIrasId);
  }
);

Then(
  'I can see the modification progress saved successful message on project overview page',
  async ({ projectOverviewPage, commonItemsPage }) => {
    await expect.soft(projectOverviewPage.modification_saved_success_message_header_text).toBeVisible();
    await expect.soft(projectOverviewPage.modification_saved_success_message_text).toBeVisible();
    expect
      .soft(
        await projectOverviewPage.information_alert_banner.evaluate((e: any) =>
          getComputedStyle(e).getPropertyValue('border-color')
        )
      )
      .toBe(commonItemsPage.commonTestData.rgb_green_color);
    expect
      .soft(
        await projectOverviewPage.information_alert_banner.evaluate((e: any) =>
          getComputedStyle(e).getPropertyValue('background-color')
        )
      )
      .toBe(commonItemsPage.commonTestData.rgb_green_color);
  }
);

Then(
  'I can see the {string} ui labels on the project overview page',
  async ({ projectOverviewPage, commonItemsPage }, datasetName: string) => {
    const dataset = projectOverviewPage.projectOverviewPageTestData[datasetName];
    for (const key in dataset) {
      if (Object.hasOwn(dataset, key)) {
        const labelValue = await commonItemsPage.getInnerLabel(key, projectOverviewPage);
        expect.soft(labelValue).toBe(dataset[key]);
      }
    }
  }
);

Then('I navigate to a {string} project documents tab', async ({ projectOverviewPage }, status: string) => {
  await projectOverviewPage.sqlGetProjectDocumentsRecordByStatus(status);
  await projectOverviewPage.goto(projectOverviewPage.getProjectRecordID());
  await projectOverviewPage.assertOnProjectOverviewPage();
});

Then(
  'I can see the status of modifications displayed is {string}',
  async ({ commonItemsPage, projectOverviewPage }, datasetName: string) => {
    //Limiting the checks to 2 pages
    const dataset = projectOverviewPage.projectOverviewPageTestData[datasetName];
    const expectedStatus = dataset.status;
    const maxPagesToCheck = projectOverviewPage.projectOverviewPageTestData.Project_Overview_Page.maxPagesToVisit;
    for (let pageIndex = 1; pageIndex <= maxPagesToCheck; pageIndex++) {
      const rowCount = await commonItemsPage.tableRows.count();
      for (let rowIndex = 1; rowIndex < rowCount; rowIndex++) {
        const row = commonItemsPage.tableRows.nth(rowIndex);
        const actualStatus = await projectOverviewPage.getStatus(row);
        expect.soft(actualStatus).toEqual(expectedStatus);
      }
      if (await commonItemsPage.next_button.isVisible()) {
        await commonItemsPage.next_button.click();
      } else {
        break;
      }
    }
  }
);

Then(
  'I validate the {string} data for {string} is displayed in the project details tab of project overview page',
  async ({ projectDetailsIRASPage, projectOverviewPage }, projectType: string, datasetName: string) => {
    let expectedIrasId: string;
    let expectedProjectTitle: string;
    await expect(projectOverviewPage.project_details_heading).toBeVisible();
    if (projectType.toLowerCase() == 'existing') {
      expectedIrasId = projectOverviewPage.projectOverviewPageTestData[datasetName].Project_Details.iras_id;
      expectedProjectTitle =
        projectOverviewPage.projectOverviewPageTestData[datasetName].Project_Details.short_project_title_text;
    } else {
      expectedIrasId = await projectDetailsIRASPage.getUniqueIrasId();
      expectedProjectTitle = (await projectDetailsIRASPage.getShortProjectTitle()).trim();
    }
    const actualProjectTitle = confirmStringNotNull(
      await projectOverviewPage.project_details_tab_short_project_title.textContent()
    );
    const actualIrasId = confirmStringNotNull(await projectOverviewPage.project_details_tab_iras_id.textContent());
    expect.soft(actualProjectTitle).toBe(expectedProjectTitle);
    expect.soft(actualIrasId).toBe(expectedIrasId);
  }
);

Then(
  'I validate the {string} data for {string} is displayed in the project team tab of project overview page',
  async ({ projectOverviewPage, chiefInvestigatorPage }, projectType: string, datasetName: string) => {
    let dataset: any;
    await expect(projectOverviewPage.project_team_heading).toBeVisible();
    if (projectType.toLowerCase() == 'existing') {
      dataset = projectOverviewPage.projectOverviewPageTestData[datasetName].Project_Team;
    } else {
      dataset = chiefInvestigatorPage.chiefInvestigatorPageTestData[datasetName];
    }
    const expectedChiefInvestigatorFirstName = dataset.chief_investigator_first_name_text;
    const expectedChiefInvestigatorLastName = dataset.chief_investigator_last_name_text;
    const expectedChiefInvestigatorEmail = dataset.chief_investigator_email_text;
    const actualChiefInvestigatorFirstName = confirmStringNotNull(
      await projectOverviewPage.project_team_tab_chief_investigator_first_name.textContent()
    );
    const actualChiefInvestigatorLastName = confirmStringNotNull(
      await projectOverviewPage.project_team_tab_chief_investigator_last_name.textContent()
    );
    const actualChiefInvestigatorEmail = confirmStringNotNull(
      await projectOverviewPage.project_team_tab_chief_investigator_email.textContent()
    );
    expect.soft(actualChiefInvestigatorFirstName).toBe(expectedChiefInvestigatorFirstName);
    expect.soft(actualChiefInvestigatorLastName).toBe(expectedChiefInvestigatorLastName);
    expect.soft(actualChiefInvestigatorEmail).toBe(expectedChiefInvestigatorEmail);
  }
);

Then(
  'I verify that the updated project details are reflected at the project level using {string} data',
  async ({ projectOverviewPage, modificationsCommonPage, commonItemsPage }, datasetName: string) => {
    const dataset = modificationsCommonPage.modificationsCommonPageTestData[datasetName];
    const firstKey = Object.keys(dataset)[0];
    const changesDataset = dataset[firstKey];
    if (Object.keys(changesDataset).includes('end_year_text')) {
      await commonItemsPage.clickButton('Project_Overview_Page', 'Project_Details');
      const projectEndDateFormatted = await convertDate(
        changesDataset['planned_project_end_day_text'],
        changesDataset['planned_project_end_month_dropdown'],
        changesDataset['planned_project_end_year_text']
      );
      const actualPlannedEndDate = confirmStringNotNull(
        await projectOverviewPage.project_details_tab_planned_project_end_date.textContent()
      );
      expect.soft(actualPlannedEndDate).toBe(projectEndDateFormatted);
    } else if (
      Object.keys(changesDataset).includes('short_project_title_text') ||
      Object.keys(changesDataset).includes('full_project_title_text')
    ) {
      await commonItemsPage.clickButton('Project_Overview_Page', 'Project_Details');
      const projectRef = changesDataset['Project_Reference'];
      const expectedShortProjectTitle = projectRef['new_short_project_title_text'].trim();
      const expectedFullProjectTitle = projectRef['new_full_project_title_text'].trim();
      const actualShortProjectTitle = confirmStringNotNull(
        (await projectOverviewPage.project_details_tab_short_project_title.textContent())
          ?.replaceAll(/[’‘]/g, "'")
          .replaceAll(/[“”]/g, '"')
      );
      const actualShortProjectTitleUpdated = await removeUnwantedWhitespace(
        actualShortProjectTitle
          .replace(projectOverviewPage.projectOverviewPageTestData.Project_Details_Tab.short_project_title_label, '')
          .trim()
      );
      const actualFullProjectTitle = confirmStringNotNull(
        (await projectOverviewPage.project_details_tab_full_project_title.textContent())
          ?.replaceAll(/[’‘]/g, "'")
          .replaceAll(/[“”]/g, '"')
      );
      const actualFullProjectTitleUpdated = await removeUnwantedWhitespace(
        actualFullProjectTitle
          .replace(projectOverviewPage.projectOverviewPageTestData.Project_Details_Tab.full_project_title_label, '')
          .trim()
      );
      expect.soft(actualShortProjectTitleUpdated).toBe(expectedShortProjectTitle);
      expect.soft(actualFullProjectTitleUpdated).toBe(expectedFullProjectTitle);
    } else if (Object.keys(changesDataset).includes('chief_investigator_first_name_text')) {
      await commonItemsPage.clickButton('Project_Overview_Page', 'Project_Team');
      const actualChiefInvestigatorFirstName = confirmStringNotNull(
        await projectOverviewPage.project_team_tab_chief_investigator_first_name.textContent()
      );
      const actualChiefInvestigatorLastName = confirmStringNotNull(
        await projectOverviewPage.project_team_tab_chief_investigator_last_name.textContent()
      );
      const actualChiefInvestigatorEmail = confirmStringNotNull(
        await projectOverviewPage.project_team_tab_chief_investigator_email.textContent()
      );
      expect.soft(actualChiefInvestigatorFirstName).toBe(dataset.chief_investigator_first_name_text);
      expect.soft(actualChiefInvestigatorLastName).toBe(dataset.chief_investigator_last_name_text);
      expect.soft(actualChiefInvestigatorEmail).toBe(dataset.chief_investigator_email_text);
    }
  }
);

Then(
  'I keep note of the {string} audit event actioned by the user {string} using the dataset {string}',
  async (
    {
      modificationsCommonPage,
      loginPage,
      chiefInvestigatorPage,
      projectOverviewPage,
      projectDetailsIRASPage,
      projectDetailsTitlePage,
    },
    modificationEventDatasetName: string,
    userDatasetName: string,
    datasetName: string
  ) => {
    let modificationEvent = '';
    const dataset = modificationsCommonPage.modificationsCommonPageTestData[datasetName];
    const changeName = Object.keys(dataset);
    const changeDataset = dataset[changeName];
    if (modificationEventDatasetName.toLowerCase() === 'chief_investigator_first_name_changed') {
      modificationEvent = `${modificationsCommonPage.modificationsCommonPageTestData.Audit_History_Events[modificationEventDatasetName]} '${chiefInvestigatorPage.chiefInvestigatorPageTestData['Valid_Data_All_Fields']['chief_investigator_first_name_text']}' to '${changeDataset['new_chief_investigator_first_name_text']}'`;
    } else if (modificationEventDatasetName.toLowerCase() === 'chief_investigator_last_name_changed') {
      modificationEvent = `${modificationsCommonPage.modificationsCommonPageTestData.Audit_History_Events[modificationEventDatasetName]} '${chiefInvestigatorPage.chiefInvestigatorPageTestData['Valid_Data_All_Fields']['chief_investigator_last_name_text']}' to '${changeDataset['new_chief_investigator_last_name_text']}'`;
    } else if (modificationEventDatasetName.toLowerCase() === 'chief_investigator_email_changed') {
      modificationEvent = `${modificationsCommonPage.modificationsCommonPageTestData.Audit_History_Events[modificationEventDatasetName]} '${chiefInvestigatorPage.chiefInvestigatorPageTestData['Valid_Data_All_Fields']['chief_investigator_email_text']}' to '${changeDataset['new_chief_investigator_email_text']}'`;
    } else if (modificationEventDatasetName.toLowerCase() === 'short_project_title_changed') {
      modificationEvent = `${modificationsCommonPage.modificationsCommonPageTestData.Audit_History_Events[modificationEventDatasetName]} '${(await projectDetailsIRASPage.getShortProjectTitle()).trim()}' to '${changeDataset['Project_Reference']['new_short_project_title_text']}'`;
    } else if (modificationEventDatasetName.toLowerCase() === 'full_project_title_changed') {
      modificationEvent = `${modificationsCommonPage.modificationsCommonPageTestData.Audit_History_Events[modificationEventDatasetName]} '${(await projectDetailsIRASPage.getFullProjectTitle()).trim()}' to '${changeDataset['Project_Reference']['new_full_project_title_text']}'`;
    } else if (modificationEventDatasetName.toLowerCase() === 'planned_project_end_date_changed') {
      const plannedEndDateDataset = projectDetailsTitlePage.projectDetailsTitlePageTestData['Valid_Data_All_Fields'];
      const oldPlannedEndDate = await convertDateMonthToNumber(
        plannedEndDateDataset['planned_project_end_day_text'],
        plannedEndDateDataset['planned_project_end_month_dropdown'],
        plannedEndDateDataset['planned_project_end_year_text']
      );
      const newPlannedEndDate = await convertDateMonthToNumber(
        changeDataset['planned_project_end_day_text'],
        changeDataset['planned_project_end_month_dropdown'],
        changeDataset['planned_project_end_year_text']
      );
      modificationEvent = `${modificationsCommonPage.modificationsCommonPageTestData.Audit_History_Events[modificationEventDatasetName]} '${oldPlannedEndDate}' to '${newPlannedEndDate}'`;
    } else {
      modificationEvent = `${modificationsCommonPage.modificationsCommonPageTestData.Audit_History_Events[modificationEventDatasetName]}`;
    }
    let userEmail = '';
    if (userDatasetName.toLowerCase() !== 'blank_user_details') {
      userEmail = loginPage.loginPageTestData[userDatasetName].username.toLowerCase();
    }
    const dateTimeOfEvent = new Date().toLocaleString('en-GB', {
      day: '2-digit',
      month: 'long',
      year: 'numeric',
    });
    const modificationId =
      modificationsCommonPage.modificationsCommonPageTestData.Audit_History_Events['Modification_Id'];
    projectOverviewPage.addAuditHistoryRecord = {
      dateTimeOfEventExpected: dateTimeOfEvent,
      modificationEventExpected: modificationEvent,
      modificationIdExpected: modificationId,
      userEmailExpected: userEmail,
    };
  }
);

Then('I validate the project level audit history table', async ({ modificationsCommonPage, projectOverviewPage }) => {
  const auditHistoryTableHeadersActual = await projectOverviewPage.auditHistoryTableHeader.allTextContents();
  const auditHistoryTableHeadersExpected =
    projectOverviewPage.projectOverviewPageTestData.Project_Overview_Page.Audit_History_Headers;
  expect.soft(auditHistoryTableHeadersActual).toEqual(auditHistoryTableHeadersExpected);
  const rowCount = await projectOverviewPage.auditHistoryTableBodyRows.count();
  const actualAuditHistoryRows: string[][] = [];
  for (let auditRowIndex = 0; auditRowIndex < rowCount; auditRowIndex++) {
    const row = projectOverviewPage.auditHistoryTableBodyRows.nth(auditRowIndex);
    const cellTexts = await row.locator(modificationsCommonPage.tableCell).allTextContents();
    actualAuditHistoryRows.push(cellTexts.map((text) => text.trim()));
  }
  const expectedAuditHistoryRows = projectOverviewPage.getAuditHistoryRecord
    .slice()
    .reverse()
    .map((record) => [
      record.dateTimeOfEventExpected,
      record.modificationEventExpected,
      record.modificationIdExpected,
      record.userEmailExpected,
    ]);
  expect.soft(actualAuditHistoryRows).toEqual(expectedAuditHistoryRows);
});

Then(
  'I validate the data for {string} is displayed in the research locations tab of project overview page',
  async ({ projectOverviewPage }, datasetName: string) => {
    await expect(projectOverviewPage.research_locations_heading).toBeVisible();
    const dataset = projectOverviewPage.projectOverviewPageTestData[datasetName].Research_Locations;
    const expectedParticipatingNations = dataset.participating_nations;
    const expectedNhsHscOrganisations = dataset.nhs_hsc_organisations;
    const expectedLeadNation = dataset.lead_nation;
    const actualParticipatingNations = confirmStringNotNull(
      await projectOverviewPage.research_locations_tab_participating_nations.textContent()
    );
    const actualNhsHscOrganisations = confirmStringNotNull(
      await projectOverviewPage.research_locations_tab_nhs_hsc_organisations.textContent()
    );
    const actualLeadNation = confirmStringNotNull(
      await projectOverviewPage.research_locations_tab_lead_nation.textContent()
    );
    expect.soft(actualParticipatingNations).toContain(expectedParticipatingNations);
    expect.soft(actualNhsHscOrganisations).toBe(expectedNhsHscOrganisations);
    expect.soft(actualLeadNation).toBe(expectedLeadNation);
  }
);

Then(
  'I can see the modifications is sorted by {string} order of the {string}',
  async ({ commonItemsPage }, sortOrder: string, sortColumn: string) => {
    let sortedColumnList: string[];
    let columnIndex: number;
    switch (sortColumn.toLowerCase()) {
      case 'modification id':
        columnIndex = 0;
        break;
      case 'modification type':
        columnIndex = 1;
        break;
      default:
        throw new Error(`${sortColumn} is not a valid option`);
    }
    const actualColumnList = await commonItemsPage.getActualListValues(commonItemsPage.tableBodyRows, columnIndex);
    if (sortColumn.toLowerCase() == 'modification id') {
      sortedColumnList = await commonItemsPage.sortModificationIdListValues(actualColumnList, sortOrder);
    } else if (sortOrder.toLowerCase() == 'ascending') {
      sortedColumnList = [...actualColumnList].sort((a, b) => a.localeCompare(b, 'en', { sensitivity: 'base' }));
    } else {
      sortedColumnList = [...actualColumnList].sort((a, b) => b.localeCompare(a, 'en', { sensitivity: 'base' }));
    }
    expect.soft(actualColumnList).toEqual(sortedColumnList);
  }
);

Then(
  'I can see the project status for {string} displayed on the project overview page',
  async ({ projectOverviewPage }, projectName: string) => {
    await expect(projectOverviewPage.projectStatusTag).toBeVisible();
    expect(await projectOverviewPage.projectStatusTag.textContent()).toBe(
      projectOverviewPage.projectOverviewPageTestData[projectName].status
    );
  }
);

Then(
  'I can now see a table of search results for project documents page',
  async ({ projectOverviewPage, commonItemsPage }) => {
    await expect.soft(projectOverviewPage.results_count_project_documents).toBeVisible();
    expect.soft(await commonItemsPage.tableBodyRows.count()).toBeGreaterThan(0);
  }
);

Then('I click the {string} button on the project documents page', async ({ projectOverviewPage }, button: string) => {
  switch (button.trim().toLowerCase()) {
    case 'document_type':
      await projectOverviewPage.document_type_project_documents.click();
      break;
    case 'document_name':
      await projectOverviewPage.document_name_project_documents.click();
      break;
    case 'document_version':
      await projectOverviewPage.version_project_documents.click();
      break;
    case 'document_date':
      await projectOverviewPage.document_date_project_documents.click();
      break;
    case 'modification_id':
      await projectOverviewPage.modification_id_project_documents.click();
      break;
    default:
      throw new Error(`${button} is not a valid option`);
  }
});

Then(
  'I can see the project status as {string} on the project overview page',
  async ({ projectOverviewPage, createProjectRecordPage }, datasetName: string) => {
    const dataset = createProjectRecordPage.createProjectRecordPageTestData[datasetName];
    const expectedStatus = dataset.status;
    const actualStatus = confirmStringNotNull(await projectOverviewPage.projectStatusTag.textContent());
    expect.soft(actualStatus).toBe(expectedStatus);
  }
);

Then('I validate the delete modification success message', async ({ projectOverviewPage, projectDetailsIRASPage }) => {
  await expect.soft(projectOverviewPage.modification_saved_success_message_header_text).toBeVisible();
  const irasIDExpected = await projectDetailsIRASPage.getUniqueIrasId();
  const modificationIDExpected = irasIDExpected + '/' + 1;
  const expectedDeleteModificationSuccessText =
    projectOverviewPage.projectOverviewPageTestData.Project_Overview_Page.delete_modification_success_message_text.replace(
      '{{modificationNumber}}',
      modificationIDExpected
    );
  const actualDeleteModificationSuccessText = confirmStringNotNull(
    await projectOverviewPage.delete_modification_success_message_text.textContent()
  );
  expect.soft(expectedDeleteModificationSuccessText).toBe(actualDeleteModificationSuccessText);
});

Then(
  'I validate the deleted modification does not appear in the modification in the post approval tab',
  async ({ projectOverviewPage, projectDetailsIRASPage }) => {
    const modificationTableData = await projectOverviewPage.getAllModificationTableData();
    const irasIDExpected = await projectDetailsIRASPage.getUniqueIrasId();
    const modificationIDExpected = irasIDExpected + '/' + 1;
    expect(modificationTableData).not.toContain(modificationIDExpected);
  }
);

When(
  'I click a {string} on the project overview page and validate the downlaoded file in the download folder',
  async ({ page, commonItemsPage, projectOverviewPage }, fieldName: string) => {
    const downloadPath = path.resolve(process.env.HOME || process.env.USERPROFILE || '', 'Downloads');
    const columnIndex = await projectOverviewPage.getProjectColumnIndex(fieldName);
    const rowCount = await commonItemsPage.tableBodyRows.count();
    const testNum = await getRandomNumber(0, rowCount - 1);
    const fieldLocator = commonItemsPage.tableBodyRows
      .nth(testNum)
      .getByRole('cell')
      .nth(columnIndex)
      .getByRole('link');
    const actualFileNameArray = await fieldLocator.allTextContents();
    const actualFileName = actualFileNameArray[0].trim();
    const [download] = await Promise.all([page.waitForEvent('download'), fieldLocator.click()]);
    const suggestedFileName = download.suggestedFilename();
    const filePath = path.join(downloadPath, suggestedFileName);
    await download.saveAs(filePath);
    const expectedFileName = path.basename(filePath);
    expect.soft(actualFileName).toBe(expectedFileName);
  }
);

When(
  'I enter values in the {string} of the post approval page',
  async ({ projectOverviewPage, commonItemsPage }, filterDatasetName: string) => {
    const dataset = projectOverviewPage.projectOverviewPageTestData.Advanced_Filters[filterDatasetName];
    for (const key in dataset) {
      if (Object.hasOwn(dataset, key)) {
        if (key.includes('date')) {
          if (!(await projectOverviewPage.date_submitted_from_day_text.isVisible())) {
            await projectOverviewPage.date_submitted_from_day_text_chevron.click();
          }
          await commonItemsPage.fillUIComponent(dataset, key, projectOverviewPage);
        } else {
          await projectOverviewPage[key + '_chevron'].click();
          await commonItemsPage.fillUIComponent(dataset, key, projectOverviewPage);
        }
      }
    }
  }
);

When(
  'I can see the results matching the search {string} and filter criteria {string} for post approval page',
  async (
    { projectOverviewPage, modificationsCommonPage, commonItemsPage },
    searchDatasetName: string,
    filterDatasetName: string
  ) => {
    const searchCriteriaDataset =
      projectOverviewPage.projectOverviewPageTestData.Post_Approval_Search_Queries[searchDatasetName];
    const filterDataset = projectOverviewPage.projectOverviewPageTestData.Advanced_Filters[filterDatasetName];
    let validateSearch = false;
    if (searchDatasetName !== 'Empty_Search_Data') {
      validateSearch = true;
    }
    await modificationsCommonPage.validateResults(
      commonItemsPage,
      searchCriteriaDataset,
      filterDataset,
      validateSearch
    );
  }
);

Then(
  'I can now see the table of modifications contains the expected search results for {string}',
  async ({ projectOverviewPage, modificationsCommonPage, commonItemsPage }, searchDatasetName: string) => {
    const searchDataset =
      projectOverviewPage.projectOverviewPageTestData.Post_Approval_Search_Queries[searchDatasetName];
    if (searchDatasetName === 'Full_Modification_ID') {
      const modificationIDExpected = await modificationsCommonPage.getModificationID();
      const modificationRecord = await modificationsCommonPage.getModificationPostApprovalPage();
      const modificationIDActual = modificationRecord.get('modificationIdValue');
      expect.soft(modificationIDActual[0]).toBe(modificationIDExpected);
    } else {
      await modificationsCommonPage.validateResults(commonItemsPage, searchDataset, true);
    }
  }
);

Then(
  'I enter {string} into the search field for post approval page',
  async ({ projectOverviewPage, modificationsCommonPage, commonItemsPage }, searchDatasetName: string) => {
    const dataset = projectOverviewPage.projectOverviewPageTestData.Post_Approval_Search_Queries[searchDatasetName];
    if (searchDatasetName === 'Full_Modification_ID') {
      const modificationRecord = await modificationsCommonPage.getModificationPostApprovalPage();
      const modificationIds = modificationRecord.get('modificationIdValue');
      const searchKey: string = modificationIds && modificationIds.length > 0 ? modificationIds[0] : '';
      await modificationsCommonPage.setModificationID(modificationIds[0]);
      expect(searchKey).toBeTruthy();
      await commonItemsPage.setSearchKey(searchKey);
      await commonItemsPage.search_text.fill(searchKey);
    } else {
      await commonItemsPage.search_text.fill(dataset['search_input_text']);
    }
  }
);

When('I open each of the advanced filters in post approval page', async ({ projectOverviewPage, commonItemsPage }) => {
  const expectedFilterHeadings = projectOverviewPage.projectOverviewPageTestData.Post_Approval_Page.filter_headings;
  for (const heading of expectedFilterHeadings) {
    await commonItemsPage.advanced_filter_headings.getByText(heading, { exact: true }).click();
  }
});

Then(
  'I can see the iras id and short project title on project overview page',
  async ({ projectDetailsIRASPage, projectOverviewPage }) => {
    const expectedIrasId = await projectDetailsIRASPage.getUniqueIrasId();
    const actualIrasId = confirmStringNotNull(await projectOverviewPage.project_iras_id_label.textContent());
    const actualIrasIdUpdated = actualIrasId
      .replace(projectOverviewPage.projectOverviewPageTestData.Project_Overview_Page.project_iras_id_label, '')
      .trim();
    const expectedShortProjectTitle = (await projectDetailsIRASPage.getShortProjectTitle()).trim();
    const actualShortProjectTitle = confirmStringNotNull(
      (await projectOverviewPage.project_short_title_label.textContent())
        ?.replaceAll(/[’‘]/g, "'")
        .replaceAll(/[“”]/g, '"')
    );
    const actualShortProjectTitleUpdated = await removeUnwantedWhitespace(
      actualShortProjectTitle
        .replace(projectOverviewPage.projectOverviewPageTestData.Project_Overview_Page.short_project_title_label, '')
        .trim()
    );
    expect.soft(actualIrasIdUpdated).toBe(expectedIrasId);
    expect.soft(actualShortProjectTitleUpdated).toBe(expectedShortProjectTitle);
  }
);

Then(
  'I can see project details along with {string} sponsor organisation and {string} on the project overview page',
  async (
    { projectDetailsIRASPage, projectOverviewPage, projectIdentifiersPage, projectDetailsTitlePage },
    datasetNameSponsorOrg: string,
    datasetNamePlannedProjectEndDate: string
  ) => {
    const datasetSponsorOrg = projectIdentifiersPage.projectIdentifiersPageTestData[datasetNameSponsorOrg];
    const datasetPlannedProjectEndDate =
      projectDetailsTitlePage.projectDetailsTitlePageTestData[datasetNamePlannedProjectEndDate];

    const expectedSponsorOrg = datasetSponsorOrg.primary_sponsor_organisation_text;
    const actualSponsorOrg = confirmStringNotNull(
      await projectOverviewPage.project_details_tab_primary_sponsor_org.textContent()
    );
    const actualSponsorOrgUpdated = actualSponsorOrg
      .replace(projectOverviewPage.projectOverviewPageTestData.Project_Details_Tab.primary_sponsor_org_label, '')
      .trim();

    const expectedPlannedEndDate = datasetPlannedProjectEndDate.planned_project_end_date;
    const actualPlannedEndDate = confirmStringNotNull(
      await projectOverviewPage.project_details_tab_planned_project_end_date.textContent()
    );
    const actualPlannedEndDateUpdated = actualPlannedEndDate
      .replace(projectOverviewPage.projectOverviewPageTestData.Project_Details_Tab.planned_project_end_date_label, '')
      .trim();

    const expectedIrasId = await projectDetailsIRASPage.getUniqueIrasId();
    const actualIrasId = confirmStringNotNull(await projectOverviewPage.project_details_tab_iras_id.textContent());
    const actualIrasIdUpdated = actualIrasId
      .replace(projectOverviewPage.projectOverviewPageTestData.Project_Details_Tab.iras_id_label, '')
      .trim();

    const expectedShortProjectTitle = (await projectDetailsIRASPage.getShortProjectTitle()).trimEnd();
    const actualShortProjectTitle = confirmStringNotNull(
      (await projectOverviewPage.project_details_tab_short_project_title.textContent())
        ?.replaceAll(/[’‘]/g, "'")
        .replaceAll(/[“”]/g, '"')
    );
    const actualShortProjectTitleUpdated = await removeUnwantedWhitespace(
      actualShortProjectTitle
        .replace(projectOverviewPage.projectOverviewPageTestData.Project_Details_Tab.short_project_title_label, '')
        .trim()
    );

    const expectedFullProjectTitle = (await projectDetailsIRASPage.getFullProjectTitle()).trimEnd();
    const actualFullProjectTitle = confirmStringNotNull(
      (await projectOverviewPage.project_details_tab_full_project_title.textContent())
        ?.replaceAll(/[’‘]/g, "'")
        .replaceAll(/[“”]/g, '"')
    );
    const actualFullProjectTitleUpdated = await removeUnwantedWhitespace(
      actualFullProjectTitle
        .replace(projectOverviewPage.projectOverviewPageTestData.Project_Details_Tab.full_project_title_label, '')
        .trim()
    );

    expect.soft(actualIrasIdUpdated).toBe(expectedIrasId);
    expect.soft(actualShortProjectTitleUpdated).toBe(expectedShortProjectTitle);
    expect.soft(actualFullProjectTitleUpdated).toBe(expectedFullProjectTitle);
    expect.soft(actualSponsorOrgUpdated).toBe(expectedSponsorOrg);
    expect.soft(actualPlannedEndDateUpdated).toBe(expectedPlannedEndDate);
  }
);

Then(
  'I validate the status of each document is {string} in the project documents page',
  async ({ projectOverviewPage, commonItemsPage }, datasetName: string) => {
    const dataset = projectOverviewPage.projectOverviewPageTestData[datasetName];
    const expectedStatus = dataset.status;
    const rowCount = await commonItemsPage.tableRows.count();
    for (let rowIndex = 1; rowIndex < rowCount; rowIndex++) {
      const row = commonItemsPage.tableRows.nth(rowIndex);
      const actualStatus = await projectOverviewPage.getStatus(row);
      expect.soft(actualStatus).toEqual(expectedStatus);
    }
  }
);

Then(
  'I can see the searched modification to be present in the list with {string} status in project overview page',
  async ({ projectOverviewPage, modificationsCommonPage, commonItemsPage }, status: string) => {
    const modificationStatus = await modificationsCommonPage.getModificationStatus(status);
    const modificationID = await modificationsCommonPage.getModificationID();
    const foundRecords = await projectOverviewPage.findModification(commonItemsPage, modificationID, {
      status: modificationStatus,
    });
    expect.soft(foundRecords).toBeDefined();
    expect.soft(foundRecords).toHaveCount(1);
  }
);

Then(
  'I can see the list of modifications submitted for sponsor approval is sorted by {string} order of the {string}',
  async function ({ commonItemsPage, projectOverviewPage }, sortDirection: string, sortField: string) {
    const searchColumnIndex = await projectOverviewPage.getColumnIndexProjectApproval(sortField);
    const actualList: string[] = await commonItemsPage.getActualListValues(
      commonItemsPage.tableBodyRows,
      searchColumnIndex
    );
    let expectedSortedList: string[];
    if (sortDirection.toLowerCase() == 'ascending') {
      expectedSortedList = [...actualList].sort((a, b) => a.localeCompare(b, 'en', { sensitivity: 'base' }));
    } else {
      expectedSortedList = [...actualList].sort((a, b) => b.localeCompare(a, 'en', { sensitivity: 'base' }));
    }
    expect(actualList).toEqual(expectedSortedList);
  }
);

When(
  'I can see the audit history for {string} on project overview history tab',
  async ({ projectOverviewPage, projectIdentifiersPage, reviewYourAnswersPage, loginPage }, actionType: string) => {
    const actualProjectAuditLog = await projectOverviewPage.getProjectAuditLog();
    const modificationIdExpected =
      projectOverviewPage.projectOverviewPageTestData.Project_Overview_Page.audit_modification_id;
    const userEmailExpected = loginPage.loginPageTestData.Applicant_User.username;
    let dateTimeExpected: string;
    let eventDescriptionExpected: string;
    let searchText: string;
    if (actionType === 'draft project') {
      dateTimeExpected = await projectIdentifiersPage.getCurrentDate();
      eventDescriptionExpected =
        projectOverviewPage.projectOverviewPageTestData.Project_Overview_Page.event_description_project_draft;
      searchText = 'Project record draft started';
    } else {
      dateTimeExpected = await reviewYourAnswersPage.getCurrentDate();
      eventDescriptionExpected =
        projectOverviewPage.projectOverviewPageTestData.Project_Overview_Page.event_description_project_created;
      searchText = 'Project record created';
    }
    const eventDescriptions = actualProjectAuditLog.get('eventDescriptionValue');
    const index = eventDescriptions.indexOf(searchText);
    expect.soft(confirmArrayNotNull(actualProjectAuditLog.get('dateTimeValue'))[index]).toBe(dateTimeExpected);
    expect
      .soft(confirmArrayNotNull(actualProjectAuditLog.get('eventDescriptionValue'))[index])
      .toBe(eventDescriptionExpected);
    expect
      .soft(confirmArrayNotNull(actualProjectAuditLog.get('modificationIdValue'))[index])
      .toBe(modificationIdExpected);
    expect.soft(confirmArrayNotNull(actualProjectAuditLog.get('userEmailValue'))[index]).toBe(userEmailExpected);
  }
);

Then(
  'I can see the documents status of project overview page with status as {string}',
  async ({ modificationsCommonPage }, statusExpected: string) => {
    const statusActual = confirmStringNotNull(
      await modificationsCommonPage.tableRows.nth(1).getByRole('cell').nth(5).textContent()
    );
    expect.soft(statusActual).toBe(statusExpected);
  }
);

Then(
  'I click on the modification id hyperlink in the project documents tab of project overview page',
  async ({ projectOverviewPage, commonItemsPage }) => {
    const modificationIDExpected = projectOverviewPage.getModificationRecordID();
    await commonItemsPage.govUkLink.getByText(modificationIDExpected).first().click();
    await projectOverviewPage.page.waitForLoadState('domcontentloaded');
  }
);
