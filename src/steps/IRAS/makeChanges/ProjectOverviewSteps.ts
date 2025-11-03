import { createBdd } from 'playwright-bdd';
import { expect, test } from '../../../hooks/CustomFixtures';
import { confirmStringNotNull, removeUnwantedWhitespace } from '../../../utils/UtilFunctions';
import { Locator } from '@playwright/test';

const { When, Then } = createBdd(test);

Then('I can see the project overview page', async ({ projectOverviewPage }) => {
  await projectOverviewPage.assertOnProjectOverviewPage();
});

Then(
  'I navigate to the project overview page of the {string} project',
  async ({ projectOverviewPage }, projectName: string) => {
    await projectOverviewPage.gotoSpecificProjectPage(projectName);
    await projectOverviewPage.assertOnProjectOverviewPage();
  }
);

Then(
  'I can see the {string} project details on project overview page for {string}',
  async (
    { projectDetailsIRASPage, projectDetailsTitlePage, projectOverviewPage },
    projectType: string,
    datasetName: string
  ) => {
    let dataset: any;
    let expectedIrasId: string;
    if (projectType.toLowerCase() == 'existing') {
      dataset = projectOverviewPage.projectOverviewPageTestData[datasetName].Project_Details;
      expectedIrasId = dataset.iras_id;
    } else {
      dataset = projectDetailsTitlePage.projectDetailsTitlePageTestData[datasetName];
      expectedIrasId = await projectDetailsIRASPage.getUniqueIrasId();
    }
    const expectedProjectTitle = dataset.short_project_title_text;
    const projectTitle = confirmStringNotNull(await projectOverviewPage.project_overview_heading.textContent());
    const projectDetails = projectTitle.split('\n');
    const irasId = projectDetails[0].split(' ');
    const actualIrasId = irasId[2];
    const shortProjectTitle = projectDetails[3].trim();
    const actualshortProjectTitle = shortProjectTitle.replace('Short project title: ', '');
    expect.soft(actualshortProjectTitle).toBe(expectedProjectTitle);
    expect.soft(actualIrasId).toBe(expectedIrasId);
  }
);

Then(
  'I can see the short project title on project overview page for {string}',
  async ({ projectDetailsTitlePage, projectOverviewPage }, datasetName: string) => {
    const dataset = projectDetailsTitlePage.projectDetailsTitlePageTestData[datasetName];
    const expectedProjectTitle = dataset.short_project_title_text;
    const actualProjectTitle = confirmStringNotNull(await projectOverviewPage.project_short_title_label.textContent());
    const actualProjectTitleUpdated = actualProjectTitle
      .replace(projectOverviewPage.projectOverviewPageTestData.Project_Overview_Page.short_project_title_label, '')
      .trim();
    expect.soft(actualProjectTitleUpdated).toBe(expectedProjectTitle);
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
  async ({ projectOverviewPage }, datasetName: string) => {
    const dataset = projectOverviewPage.projectOverviewPageTestData[datasetName];
    for (const key in dataset) {
      if (Object.hasOwn(dataset, key)) {
        const locator: Locator = projectOverviewPage[key];
        await expect(locator).toBeVisible();
      }
    }
  }
);

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
  async (
    { projectDetailsIRASPage, projectDetailsTitlePage, projectOverviewPage },
    projectType: string,
    datasetName: string
  ) => {
    let dataset: any;
    let expectedIrasId: string;
    await expect(projectOverviewPage.project_details_heading).toBeVisible();
    if (projectType.toLowerCase() == 'existing') {
      dataset = projectOverviewPage.projectOverviewPageTestData[datasetName].Project_Details;
      expectedIrasId = dataset.iras_id;
    } else {
      dataset = projectDetailsTitlePage.projectDetailsTitlePageTestData[datasetName];
      expectedIrasId = await projectDetailsIRASPage.getUniqueIrasId();
    }
    const expectedProjectTitle = dataset.short_project_title_text;
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
    const expectedChiefInvestigator = dataset.chief_investigator_email_text;
    const expectedPrimarySponsorOrganisation = dataset.primary_sponsor_organisation_text;
    const expectedSponsorContact = dataset.sponsor_contact_email_text;
    const actualChiefInvestigator = confirmStringNotNull(
      await projectOverviewPage.project_team_tab_chief_investigator.textContent()
    );
    const actualPrimarySponsorOrganisation = confirmStringNotNull(
      await projectOverviewPage.project_team_tab_primary_sponsor_org.textContent()
    );
    const actualSponsorContact = confirmStringNotNull(
      await projectOverviewPage.project_team_tab_sponsor_contact.textContent()
    );
    expect.soft(actualChiefInvestigator).toBe(expectedChiefInvestigator);
    expect.soft(actualPrimarySponsorOrganisation).toBe(expectedPrimarySponsorOrganisation);
    expect.soft(actualSponsorContact).toBe(expectedSponsorContact);
  }
);

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
    const actualTrimmedParticipatingNations = await removeUnwantedWhitespace(
      confirmStringNotNull(actualParticipatingNations)
    );
    const actualNhsHscOrganisations = confirmStringNotNull(
      await projectOverviewPage.research_locations_tab_nhs_hsc_organisations.textContent()
    );
    const actualLeadNation = confirmStringNotNull(
      await projectOverviewPage.research_locations_tab_lead_nation.textContent()
    );
    expect.soft(actualTrimmedParticipatingNations).toContain(expectedParticipatingNations);
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

When(
  'I enter values in the {string} of the post approval page',
  async ({ projectOverviewPage, commonItemsPage }, filterDatasetName: string) => {
    const dataset = projectOverviewPage.projectOverviewPageTestData.Advanced_Filters[filterDatasetName];
    for (const key in dataset) {
      if (Object.hasOwn(dataset, key)) {
        if (key.includes('date')) {
          if (!(await projectOverviewPage.date_submitted_from_day_text.isVisible())) {
            // create locators
            await projectOverviewPage.date_submitted_from_day_text_chevron.click(); // create locators
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
    // if (searchDatasetName !== 'Empty_Search_Data') {
    //   await modificationsCommonPage.validateResults(commonItemsPage, searchCriteriaDataset, filterDataset, true);
    // } else {
    //   await modificationsCommonPage.validateResults(commonItemsPage, searchCriteriaDataset, filterDataset, false);
    // }
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
      //await modificationsCommonPage.validateSearchResults(commonItemsPage, searchDataset, true);
      await modificationsCommonPage.validateResults(commonItemsPage, searchDataset, true);
    }
  }
);

Then(
  'I enter {string} into the search field for post approval page',
  async ({ projectOverviewPage, modificationsCommonPage, commonItemsPage }, searchDatasetName: string) => {
    const dataset = projectOverviewPage.projectOverviewPageTestData.Post_Approval_Search_Queries[searchDatasetName];
    // Get the modification record and extract the first modification ID to use as the search key
    if (searchDatasetName === 'Full_Modification_ID') {
      const modificationRecord = await modificationsCommonPage.getModificationPostApprovalPage();
      const modificationIds = modificationRecord.get('modificationIdValue');
      const searchKey: string = modificationIds && modificationIds.length > 0 ? modificationIds[0] : '';
      await modificationsCommonPage.setModificationID(modificationIds[0]);
      // fill the modification id in the search box
      expect(searchKey).toBeTruthy();
      await commonItemsPage.setSearchKey(searchKey);
      await commonItemsPage.search_text.fill(searchKey); // check search_text locator//done
    } else {
      //await manageUsersPage.user_search_text.fill(dataset['search_input_text']);//create user_search_text locator
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
