import { createBdd } from 'playwright-bdd';
import { expect, test } from '../../../../hooks/CustomFixtures';
import ModificationsReadyToAssignPage from '../../../../pages/IRAS/reviewResearch/receiveAmendments/ModificationsReadyToAssignPage';
import MyModificationsTasklistPage from '../../../../pages/IRAS/reviewResearch/receiveAmendments/MyModificationsTasklistPage';

const { Given, When, Then } = createBdd(test);

Then(
  'I can see the tasklist on the {string} is sorted by {string} order of the {string}',
  async (
    { modificationsReceivedCommonPage, commonItemsPage },
    pageType: string,
    sortDirection: string,
    sortField: string
  ) => {
    let sortedList: string[];
    let actualList: string[];
    const columnIndex = await modificationsReceivedCommonPage.getModificationColumnIndex(pageType, sortField);
    if (
      sortField.toLowerCase() === 'short project title' ||
      sortField.toLowerCase() === 'study-wide reviewer' ||
      sortField.toLowerCase() === 'status'
    ) {
      actualList = await commonItemsPage.getActualListValuesShortProjectTitleSWRStatus(
        commonItemsPage.tableBodyRows,
        columnIndex
      );
    } else {
      actualList = await commonItemsPage.getActualListValues(commonItemsPage.tableBodyRows, columnIndex);
    }
    // const actualList = await commonItemsPage.getActualListValues(commonItemsPage.tableBodyRows, columnIndex);
    if (sortField.toLowerCase() == 'modification id') {
      sortedList = await commonItemsPage.sortModificationIdListValues(actualList, sortDirection);
    } else if (sortField.toLowerCase() == 'date submitted') {
      sortedList = await modificationsReceivedCommonPage.sortDateSubmittedListValues(actualList, sortDirection);
    } else if (sortField.toLowerCase() == 'days since submission') {
      sortedList = await modificationsReceivedCommonPage.sortDaysSinceSubmittedListValues(actualList, sortDirection);
    } else if (sortDirection.toLowerCase() == 'ascending') {
      sortedList = [...actualList].toSorted((a, b) => a.localeCompare(b, 'en', { sensitivity: 'base' }));
    } else {
      sortedList = [...actualList].toSorted((a, b) => b.localeCompare(a, 'en', { sensitivity: 'base' }));
    }
    expect.soft(actualList).toEqual(sortedList);
  }
);

Given(
  'I open each of the {string} filters',
  async ({ modificationsReceivedCommonPage, commonItemsPage, teamManagerDashboardPage }, pageValue: string) => {
    let expectedFilterHeadings: any;
    if (pageValue === 'modification tasklist') {
      expectedFilterHeadings =
        modificationsReceivedCommonPage.modificationsReceivedCommonPagePageTestData.Tasklist_Page.filter_headings;
    } else if (pageValue === 'team manager dashboard') {
      expectedFilterHeadings =
        teamManagerDashboardPage.teamManagerDashboardPageTestData.Team_Manager_Dashboard_Page.filter_headings;
    }
    for (const heading of expectedFilterHeadings) {
      await commonItemsPage.advanced_filter_headings.getByText(heading, { exact: true }).click();
    }
  }
);

Given(
  'I can now see the table of modifications {string} contains the expected search results for {string} with {string}',
  async (
    {
      modificationsReadyToAssignPage,
      myModificationsTasklistPage,
      modificationsReceivedCommonPage,
      teamManagerDashboardPage,
      commonItemsPage,
    },
    pageType: string,
    searchInput: string,
    statusValue: string
  ) => {
    let searchInputDataset: any;
    let modificationIdIndex: number;
    let shortProjectTitleIndex: number;
    let dateSubmittedIndex: number;
    let daysSinceSubmissionIndex: number;
    let studyWideReviewerIndex: number;
    let statusIndex: number;
    let studyWideReviewers: string[];
    let irasIdSearchKey: string;
    if (pageType.toLowerCase() == 'ready to assign') {
      searchInputDataset = modificationsReadyToAssignPage.modificationsReadyToAssignPageTestData.Search_Queries;
      modificationIdIndex = 1;
      shortProjectTitleIndex = 2;
      dateSubmittedIndex = 3;
      daysSinceSubmissionIndex = 4;
      statusIndex = 5;
      await expect(modificationsReadyToAssignPage.results_table).toBeVisible();
    } else if (pageType.toLowerCase() == 'ready to assign and reassign in team manager dashboard') {
      searchInputDataset = teamManagerDashboardPage.teamManagerDashboardPageTestData.Search_Queries;
      modificationIdIndex = 1;
      shortProjectTitleIndex = 2;
      dateSubmittedIndex = 3;
      daysSinceSubmissionIndex = 4;
      studyWideReviewerIndex = 5;
      statusIndex = 6;
      await expect(modificationsReadyToAssignPage.results_table).toBeVisible();
    } else {
      searchInputDataset = myModificationsTasklistPage.myModificationsTasklistPageTestData.Search_Queries;
      modificationIdIndex = 0;
      shortProjectTitleIndex = 1;
      dateSubmittedIndex = 2;
      daysSinceSubmissionIndex = 3;
      statusIndex = 4;
      await expect.soft(myModificationsTasklistPage.results_table).toBeVisible();
    }
    expect.soft(await commonItemsPage.tableBodyRows.count()).toBeGreaterThan(0);
    const noOfResults = await commonItemsPage.extractNumFromSearchResultCount(
      await commonItemsPage.search_results_count.textContent()
    );
    const modificationIds = await commonItemsPage.getActualListValues(
      commonItemsPage.tableBodyRows,
      modificationIdIndex
    );
    const visibleIrasIds = await modificationsReceivedCommonPage.getVisibleIrasIds(modificationIds);
    const shortTitles = await commonItemsPage.getActualListValues(
      commonItemsPage.tableBodyRows,
      shortProjectTitleIndex
    );
    const datesSubmitted = await commonItemsPage.getActualListValues(commonItemsPage.tableBodyRows, dateSubmittedIndex);
    const daysSinceSubmission = await commonItemsPage.getActualListValues(
      commonItemsPage.tableBodyRows,
      daysSinceSubmissionIndex
    );

    const statuses: string[] = await commonItemsPage.getActualListValues(commonItemsPage.tableBodyRows, statusIndex);
    if (
      pageType.toLowerCase() == 'ready to assign and reassign in team manager dashboard' &&
      statusValue === 'With review body'
    ) {
      const allValidStatuses = statuses.every((s) => {
        const normalized = s.trim().toLowerCase();
        return normalized === 'received' || normalized === 'review in progress';
      });
      expect.soft(allValidStatuses).toBe(true);
    } else if (pageType.toLowerCase() == 'ready to assign' && statusValue === 'With review body') {
      const allValidStatuses = statuses.every((s) => {
        const normalized = s.trim().toLowerCase();
        return normalized === 'received';
      });
      expect.soft(allValidStatuses).toBe(true);
    } else if (pageType.toLowerCase() == 'assigned to me' && statusValue === 'With review body') {
      const allValidStatuses = statuses.every((s) => {
        const normalized = s.trim().toLowerCase();
        return normalized === 'review in progress';
      });
      expect.soft(allValidStatuses).toBe(true);
    }
    if (studyWideReviewerIndex != undefined) {
      studyWideReviewers = await commonItemsPage.getActualListValues(
        commonItemsPage.tableBodyRows,
        studyWideReviewerIndex
      );
    }
    if (searchInput.toLowerCase().includes('single')) {
      await expect
        .soft(commonItemsPage.search_results_count)
        .toHaveText(commonItemsPage.searchFilterResultsData.search_single_result_count);
      expect.soft(await commonItemsPage.tableBodyRows.all()).toHaveLength(1);
      if (pageType === 'ready to assign') {
        irasIdSearchKey = await modificationsReadyToAssignPage.getModificationId();
      }
      expect
        .soft(
          await modificationsReceivedCommonPage.checkSingleValueEquals(
            visibleIrasIds,
            shortTitles,
            daysSinceSubmission,
            datesSubmitted,
            searchInputDataset,
            searchInput,
            irasIdSearchKey,
            studyWideReviewers
          )
        )
        .toBeTruthy();
    } else if (searchInput.toLowerCase().includes('multi')) {
      expect.soft(noOfResults).toBeGreaterThan(1);
      expect.soft(await commonItemsPage.tableBodyRows.count()).toBeGreaterThan(1);
      if (searchInput.toLowerCase().includes('date')) {
        expect
          .soft(commonItemsPage.checkDateMultiDateSearchResultValues(datesSubmitted, searchInputDataset, searchInput))
          .toBeTruthy();
      }
      if (searchInput.toLowerCase().includes('days')) {
        for (const day of daysSinceSubmission) {
          if (Number.parseInt(day) == 1) {
            expect
              .soft(
                day.endsWith(
                  modificationsReceivedCommonPage.modificationsReceivedCommonPagePageTestData.Tasklist_Page
                    .day_since_suffix
                )
              )
              .toBeTruthy();
          } else {
            expect
              .soft(
                day.endsWith(
                  modificationsReceivedCommonPage.modificationsReceivedCommonPagePageTestData.Tasklist_Page
                    .days_since_suffix
                )
              )
              .toBeTruthy();
          }
        }
        expect
          .soft(
            await modificationsReceivedCommonPage.checkDaysSearchResultValues(
              daysSinceSubmission,
              searchInputDataset,
              searchInput
            )
          )
          .toBeTruthy();
      }
      if (searchInput.toLowerCase().includes('title') || searchInput.toLowerCase().includes('iras')) {
        expect
          .soft(
            await modificationsReceivedCommonPage.checkMultiValuesStartsWith(
              visibleIrasIds,
              shortTitles,
              studyWideReviewers,
              searchInputDataset,
              searchInput
            )
          )
          .toBeTruthy();
      }
    } else if (searchInput.toLowerCase().includes('partial')) {
      expect.soft(noOfResults).toBeGreaterThanOrEqual(1);
      expect.soft(await commonItemsPage.tableBodyRows.count()).toBeGreaterThanOrEqual(1);
      expect
        .soft(
          await modificationsReceivedCommonPage.checkPartialValuesContain(
            visibleIrasIds,
            shortTitles,
            studyWideReviewers,
            searchInputDataset,
            searchInput
          )
        )
        .toBeTruthy();
    } else {
      throw new Error(`${searchInput} does not contain any result identifier`);
    }
  }
);

When(
  'I fill the {string} search and filter options with {string}',
  async (
    {
      commonItemsPage,
      modificationsReadyToAssignPage,
      myModificationsTasklistPage,
      modificationsReceivedCommonPage,
      teamManagerDashboardPage,
    },
    pageType: string,
    datasetName: string
  ) => {
    let modificationPage: ModificationsReadyToAssignPage | MyModificationsTasklistPage;
    let dataset: any;
    let daysSinceSubmissionIndex: number;
    if (pageType.toLowerCase() == 'assign modifications tasklist') {
      dataset = modificationsReadyToAssignPage.modificationsReadyToAssignPageTestData.Search_Queries[datasetName];
      daysSinceSubmissionIndex = 4;
      modificationPage = modificationsReadyToAssignPage;
    } else if (pageType.toLowerCase() == 'ready to assign and reassign in team manager dashboard') {
      dataset = teamManagerDashboardPage.teamManagerDashboardPageTestData.Search_Queries[datasetName];
      daysSinceSubmissionIndex = 4;
      modificationPage = modificationsReadyToAssignPage;
    } else {
      dataset = myModificationsTasklistPage.myModificationsTasklistPageTestData.Search_Queries[datasetName];
      daysSinceSubmissionIndex = 3;
      modificationPage = myModificationsTasklistPage;
    }
    const daysSinceSubmission = await commonItemsPage.getActualListValues(
      commonItemsPage.tableBodyRows,
      daysSinceSubmissionIndex
    );
    for (const key in dataset) {
      if (Object.hasOwn(dataset, key)) {
        await commonItemsPage.fillUIComponent(dataset, key, modificationPage);
      }
    }
    if (datasetName.toLowerCase().includes('title')) {
      await commonItemsPage.setShortProjectTitleFilter(dataset.short_project_title_text);
    }
    if (datasetName.toLowerCase().includes('days')) {
      if (datasetName.toLowerCase().includes('from') || datasetName.toLowerCase().includes('range')) {
        await modificationsReceivedCommonPage.setDaysSinceSubmissionFromFilter(
          Number.parseInt(dataset.days_since_submission_from_text)
        );
      }
      if (datasetName.toLowerCase().includes('to') || datasetName.toLowerCase().includes('range')) {
        await modificationsReceivedCommonPage.setDaysSinceSubmissionToFilter(
          Number.parseInt(dataset.days_since_submission_to_text)
        );
      }
      if (datasetName.toLowerCase().includes('specific')) {
        await modificationsReadyToAssignPage.days_since_submission_from_text.fill(
          Number.parseInt(daysSinceSubmission[0]).toString()
        );
        await modificationsReadyToAssignPage.days_since_submission_to_text.fill(
          Number.parseInt(daysSinceSubmission[0]).toString()
        );
        await modificationsReceivedCommonPage.setDaysSinceSubmissionFromFilter(Number.parseInt(daysSinceSubmission[0]));
        await modificationsReceivedCommonPage.setDaysSinceSubmissionToFilter(Number.parseInt(daysSinceSubmission[0]));
      }
    }
    if (datasetName.toLowerCase().includes('date')) {
      if (datasetName.toLowerCase().includes('from') || datasetName.toLowerCase().includes('range')) {
        await commonItemsPage.setDateSubmittedFromFilter(
          `${dataset.day_from_text} ${dataset.month_from_dropdown.substring(0, 3)} ${dataset.year_from_text}`
        );
      }
      if (datasetName.toLowerCase().includes('to') || datasetName.toLowerCase().includes('range')) {
        await commonItemsPage.setDateSubmittedToFilter(
          `${dataset.day_to_text} ${dataset.month_to_dropdown.substring(0, 3)} ${dataset.year_to_text}`
        );
      }
    }
  }
);

Given(
  'I can see the days since submission filter has the expected hint text',
  async ({ modificationsReceivedCommonPage }) => {
    await expect.soft(modificationsReceivedCommonPage.days_since_submission_label).toBeVisible();
    await expect.soft(modificationsReceivedCommonPage.days_since_submission_hint_label).toBeVisible();
    await expect.soft(modificationsReceivedCommonPage.days_since_submission_to_separator).toBeVisible();
    await expect.soft(modificationsReceivedCommonPage.days_since_submission_suffix_label).toBeVisible();
  }
);

When(
  'I enter an iras id for a modification with status {string} into the search field',
  async ({ commonItemsPage, modificationsReceivedCommonPage, modificationsCommonPage }, statusType: string) => {
    const [status, optionalReviewNullQueryInput] = await modificationsReceivedCommonPage.getModificationStatusSqlInput(
      statusType,
      modificationsCommonPage.modificationsCommonPageTestData
    );
    await modificationsReceivedCommonPage.sqlGetSpecificModificationByStatus(status, optionalReviewNullQueryInput);
    await commonItemsPage.search_text.fill(`${await modificationsReceivedCommonPage.getIrasId()}`);
  }
);

When(
  'I enter an iras id for {string} lead nation modification assigned to {string} with status {string} into the search field',
  async (
    { commonItemsPage, modificationsReceivedCommonPage, modificationsCommonPage, loginPage },
    leadNation: string,
    assignedUser: string,
    statusType: string
  ) => {
    const [status, optionalReviewNullQueryInput] = await modificationsReceivedCommonPage.getModificationStatusSqlInput(
      statusType,
      modificationsCommonPage.modificationsCommonPageTestData
    );
    const optionalReviewerIdQueryInput =
      await modificationsReceivedCommonPage.getModificationNationReviewerEmailSqlInput(
        assignedUser,
        loginPage.loginPageTestData
      );
    await modificationsReceivedCommonPage.sqlGetSpecificModificationByNationStatus(
      leadNation,
      status,
      optionalReviewNullQueryInput,
      optionalReviewerIdQueryInput
    );
    await commonItemsPage.search_text.fill(`${await modificationsReceivedCommonPage.getIrasId()}`);
  }
);

Then(
  'I {string} see the modification displayed in the {string} list with {string} status',
  async (
    { commonItemsPage, modificationsReceivedCommonPage, modificationsCommonPage },
    visibility: string,
    pageType: string,
    statusInput: string
  ) => {
    const statusExpected = modificationsCommonPage.modificationsCommonPageTestData[statusInput].status;
    const modIdColumnIndex = await modificationsReceivedCommonPage.getModificationColumnIndex(
      pageType,
      'modification id'
    );
    const rowLocator = commonItemsPage.tableBodyRows.filter({
      has: commonItemsPage.page
        .getByRole('cell')
        .nth(modIdColumnIndex)
        .getByText(`${await modificationsReceivedCommonPage.getModificationId()}`, { exact: true }),
    });
    await modificationsReceivedCommonPage.setRowLocator(rowLocator);
    if (visibility.toLowerCase() == 'cannot') {
      if (await commonItemsPage.tableRows.isVisible()) {
        await expect.soft(rowLocator).toBeHidden();
      } else {
        await expect.soft(commonItemsPage.search_no_results_container).toBeVisible();
      }
    } else {
      await expect.soft(rowLocator).toBeVisible();
      const statusColumnIndex = await modificationsReceivedCommonPage.getModificationColumnIndex(pageType, 'status');
      const actualStatus = await rowLocator.getByRole('cell').nth(statusColumnIndex).textContent();
      expect.soft(actualStatus).toEqual(statusExpected);
    }
  }
);

Then(
  'I click the modification id displayed on the {string}',
  async ({ modificationsReceivedCommonPage }, pageType: string) => {
    const modIdColumnIndex = await modificationsReceivedCommonPage.getModificationColumnIndex(
      pageType,
      'modification id'
    );
    const rowLocator = await modificationsReceivedCommonPage.getRowLocator();
    await rowLocator
      .getByRole('cell')
      .nth(modIdColumnIndex)
      .getByText(`${await modificationsReceivedCommonPage.getModificationId()}`, { exact: true })
      .click();
  }
);

When('I select the modification in order to assign it', async ({ modificationsReceivedCommonPage }) => {
  const rowLocator = await modificationsReceivedCommonPage.getRowLocator();
  await rowLocator.getByTestId(await modificationsReceivedCommonPage.getModificationId()).click();
});
