import { createBdd } from 'playwright-bdd';
import { expect, test } from '../../../../hooks/CustomFixtures';
import ModificationsReadyToAssignPage from '../../../../pages/IRAS/reviewResearch/receiveAmendments/ModificationsReadyToAssignPage';
import MyModificationsTasklistPage from '../../../../pages/IRAS/reviewResearch/receiveAmendments/MyModificationsTasklistPage';

const { Given, When, Then } = createBdd(test);

Then(
  'I can see the tasklist of modifications {string} is sorted by {string} order of the {string}',
  async (
    { modificationsReceivedCommonPage, commonItemsPage },
    pageType: string,
    sortDirection: string,
    sortField: string
  ) => {
    let sortedList: string[];
    let columnIndex: number;
    switch (sortField.toLowerCase()) {
      case 'modification id':
        if (pageType.toLowerCase() == 'ready to assign') {
          columnIndex = 1;
        } else {
          columnIndex = 0;
        }
        break;
      case 'short project title':
        if (pageType.toLowerCase() == 'ready to assign') {
          columnIndex = 2;
        } else {
          columnIndex = 1;
        }
        break;
      case 'date submitted':
        if (pageType.toLowerCase() == 'ready to assign') {
          columnIndex = 3;
        } else {
          columnIndex = 2;
        }
        break;
      case 'days since submission':
        if (pageType.toLowerCase() == 'ready to assign') {
          columnIndex = 4;
        } else {
          columnIndex = 3;
        }
        break;
      default:
        throw new Error(`${sortField} is not a valid option`);
    }
    const actualList = await commonItemsPage.getActualListValues(commonItemsPage.tableBodyRows, columnIndex);
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
    expect(actualList).toEqual(sortedList);
  }
);

Given(
  'I open each of the modification tasklist filters',
  async ({ modificationsReceivedCommonPage, commonItemsPage }) => {
    const expectedFilterHeadings =
      modificationsReceivedCommonPage.modificationsReceivedCommonPagePageTestData.Tasklist_Page.filter_headings;
    for (const heading of expectedFilterHeadings) {
      await commonItemsPage.advanced_filter_headings.getByText(heading, { exact: true }).click();
    }
  }
);

Given(
  'I can now see the table of modifications {string} contains the expected search results for {string}',
  async (
    { modificationsReadyToAssignPage, myModificationsTasklistPage, modificationsReceivedCommonPage, commonItemsPage },
    pageType: string,
    searchInput: string
  ) => {
    let searchInputDataset: any;
    let modificationIdIndex: number;
    let shortProjectTitleIndex: number;
    let dateSubmittedIndex: number;
    let daysSinceSubmissionIndex: number;
    if (pageType.toLowerCase() == 'ready to assign') {
      searchInputDataset = modificationsReadyToAssignPage.modificationsReadyToAssignPageTestData.Search_Queries;
      modificationIdIndex = 1;
      shortProjectTitleIndex = 2;
      dateSubmittedIndex = 3;
      daysSinceSubmissionIndex = 4;
      await expect(modificationsReadyToAssignPage.results_table).toBeVisible();
    } else {
      searchInputDataset = myModificationsTasklistPage.myModificationsTasklistPageTestData.Search_Queries;
      modificationIdIndex = 0;
      shortProjectTitleIndex = 1;
      dateSubmittedIndex = 2;
      daysSinceSubmissionIndex = 3;
      await expect(myModificationsTasklistPage.results_table).toBeVisible();
    }
    expect(await commonItemsPage.tableBodyRows.count()).toBeGreaterThan(0);
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
    if (searchInput.toLowerCase().includes('single')) {
      await expect(commonItemsPage.search_results_count).toHaveText(
        commonItemsPage.searchFilterResultsData.search_single_result_count
      );
      expect(await commonItemsPage.tableBodyRows.all()).toHaveLength(1);
      expect(
        await modificationsReceivedCommonPage.checkSingleValueEquals(
          visibleIrasIds,
          shortTitles,
          daysSinceSubmission,
          datesSubmitted,
          searchInputDataset,
          searchInput
        )
      ).toBeTruthy();
    } else if (searchInput.toLowerCase().includes('multi')) {
      expect(noOfResults).toBeGreaterThan(1);
      expect(await commonItemsPage.tableBodyRows.count()).toBeGreaterThan(1);
      if (searchInput.toLowerCase().includes('date')) {
        expect(
          commonItemsPage.checkDateMultiDateSearchResultValues(datesSubmitted, searchInputDataset, searchInput)
        ).toBeTruthy();
      }
      if (searchInput.toLowerCase().includes('days')) {
        for (const day of daysSinceSubmission) {
          if (parseInt(day) == 1) {
            expect(
              day.endsWith(
                modificationsReceivedCommonPage.modificationsReceivedCommonPagePageTestData.Tasklist_Page
                  .day_since_suffix
              )
            ).toBeTruthy();
          } else {
            expect(
              day.endsWith(
                modificationsReceivedCommonPage.modificationsReceivedCommonPagePageTestData.Tasklist_Page
                  .days_since_suffix
              )
            ).toBeTruthy();
          }
        }
        expect(
          await modificationsReceivedCommonPage.checkDaysSearchResultValues(
            daysSinceSubmission,
            searchInputDataset,
            searchInput
          )
        ).toBeTruthy();
      }
      if (searchInput.toLowerCase().includes('title') || searchInput.toLowerCase().includes('iras')) {
        expect(
          await modificationsReceivedCommonPage.checkMultiValuesStartsWith(
            visibleIrasIds,
            shortTitles,
            searchInputDataset,
            searchInput
          )
        ).toBeTruthy();
      }
    } else if (searchInput.toLowerCase().includes('partial')) {
      expect(noOfResults).toBeGreaterThan(1);
      expect(await commonItemsPage.tableBodyRows.count()).toBeGreaterThan(1);
      expect(
        await modificationsReceivedCommonPage.checkPartialValuesContain(
          visibleIrasIds,
          shortTitles,
          searchInputDataset,
          searchInput
        )
      ).toBeTruthy();
    } else {
      throw new Error(`${searchInput} does not contain any result identifier`);
    }
  }
);

When(
  'I fill the {string} modifications tasklist search and filter options with {string}',
  async (
    { commonItemsPage, modificationsReadyToAssignPage, myModificationsTasklistPage, modificationsReceivedCommonPage },
    pageType: string,
    datasetName: string
  ) => {
    let modificationPage: ModificationsReadyToAssignPage | MyModificationsTasklistPage;
    let dataset: any;
    let daysSinceSubmissionIndex: number;
    if (pageType.toLowerCase() == 'assign') {
      dataset = modificationsReadyToAssignPage.modificationsReadyToAssignPageTestData.Search_Queries[datasetName];
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
          parseInt(dataset.days_since_submission_from_text)
        );
      }
      if (datasetName.toLowerCase().includes('to') || datasetName.toLowerCase().includes('range')) {
        await modificationsReceivedCommonPage.setDaysSinceSubmissionToFilter(
          parseInt(dataset.days_since_submission_to_text)
        );
      }
      if (datasetName.toLowerCase().includes('specific')) {
        await modificationsReadyToAssignPage.days_since_submission_from_text.fill(
          parseInt(daysSinceSubmission[0]).toString()
        );
        await modificationsReadyToAssignPage.days_since_submission_to_text.fill(
          parseInt(daysSinceSubmission[0]).toString()
        );
        await modificationsReceivedCommonPage.setDaysSinceSubmissionFromFilter(parseInt(daysSinceSubmission[0]));
        await modificationsReceivedCommonPage.setDaysSinceSubmissionToFilter(parseInt(daysSinceSubmission[0]));
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
    await expect(modificationsReceivedCommonPage.days_since_submission_label).toBeVisible();
    await expect(modificationsReceivedCommonPage.days_since_submission_hint_label).toBeVisible();
    await expect(modificationsReceivedCommonPage.days_since_submission_to_separator).toBeVisible();
    await expect(modificationsReceivedCommonPage.days_since_submission_suffix_label).toBeVisible();
  }
);
