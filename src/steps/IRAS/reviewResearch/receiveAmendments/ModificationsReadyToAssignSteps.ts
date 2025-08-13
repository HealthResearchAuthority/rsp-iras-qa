import { createBdd } from 'playwright-bdd';
import { expect, test } from '../../../../hooks/CustomFixtures';

const { Given, When, Then } = createBdd(test);

Then('I can see the modifications ready to assign page', async ({ modificationsReadyToAssignPage }) => {
  await modificationsReadyToAssignPage.assertOnModificationsReadyToAssignPage();
});

Then(
  'I can see the tasklist of modifications ready to assign is sorted by {string} order of the {string}',
  async (
    { modificationsReadyToAssignPage, searchModificationsPage, commonItemsPage },
    sortDirection: string,
    sortField: string
  ) => {
    let sortedList: string[];
    let columnIndex: number;
    switch (sortField.toLowerCase()) {
      case 'modification id':
        columnIndex = 1;
        break;
      case 'short project title':
        columnIndex = 2;
        break;
      case 'modification type':
        columnIndex = 3;
        break;
      case 'date submitted':
        columnIndex = 4;
        break;
      case 'days since submission':
        columnIndex = 5;
        break;
      default:
        throw new Error(`${sortField} is not a valid option`);
    }
    const actualList = await searchModificationsPage.getActualListValues(commonItemsPage.tableBodyRows, columnIndex);
    if (sortField.toLowerCase() == 'modification id') {
      sortedList = await searchModificationsPage.sortModificationIdListValues(actualList, sortDirection);
    } else if (sortField.toLowerCase() == 'date submitted') {
      sortedList = await modificationsReadyToAssignPage.sortDateSubmittedListValues(actualList, sortDirection);
    } else if (sortField.toLowerCase() == 'days since submission') {
      sortedList = await modificationsReadyToAssignPage.sortDaysSinceSubmittedListValues(actualList, sortDirection);
    } else if (sortDirection.toLowerCase() == 'ascending') {
      sortedList = [...actualList].sort((a, b) => a.localeCompare(b, 'en', { sensitivity: 'base' }));
    } else {
      sortedList = [...actualList].sort((a, b) => b.localeCompare(a, 'en', { sensitivity: 'base' }));
    }
    expect(actualList).toEqual(sortedList);
  }
);

Given(
  'I can now see the modifications ready to assign table contains the expected search results for {string}',
  async ({ modificationsReadyToAssignPage, commonItemsPage, searchModificationsPage }, searchInput: string) => {
    const searchInputDataset = modificationsReadyToAssignPage.modificationsReadyToAssignPageTestData.Search_Queries;
    await expect(modificationsReadyToAssignPage.results_table).toBeVisible();
    expect(await commonItemsPage.tableBodyRows.count()).toBeGreaterThan(0);
    const noOfResults = await commonItemsPage.extractNumFromSearchResultCount(
      await commonItemsPage.search_results_count.textContent()
    );
    const modificationIds = await searchModificationsPage.getActualListValues(commonItemsPage.tableBodyRows, 1); //this is in common now, merge with latest when work is in
    const visibleIrasIds = await modificationsReadyToAssignPage.getVisibleIrasIds(modificationIds);
    const shortTitles = await searchModificationsPage.getActualListValues(commonItemsPage.tableBodyRows, 2); //this is in common now, merge with latest when work is in
    const datesSubmitted = await searchModificationsPage.getActualListValues(commonItemsPage.tableBodyRows, 3); //this is in common now, merge with latest when work is in
    if (searchInput.toLowerCase().includes('single')) {
      await expect(commonItemsPage.search_results_count).toHaveText(
        commonItemsPage.searchFilterResultsData.search_single_result_count
      );
      expect(await commonItemsPage.tableBodyRows.all()).toHaveLength(1);
      expect(
        await modificationsReadyToAssignPage.checkSingleValueEquals(
          visibleIrasIds,
          shortTitles,
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
      } else {
        expect(
          await modificationsReadyToAssignPage.checkMultiValuesStartsWith(
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
        await modificationsReadyToAssignPage.checkPartialValuesContain(
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

Given(
  'I open each of the modification tasklist filters',
  async ({ modificationsReadyToAssignPage, commonItemsPage }) => {
    const expectedFilterHeadings =
      modificationsReadyToAssignPage.modificationsReadyToAssignPageTestData.Modifications_Ready_To_Assign_Page
        .filter_headings;
    for (const heading of expectedFilterHeadings) {
      await commonItemsPage.advanced_filter_headings.getByText(heading, { exact: true }).click();
    }
  }
);

When(
  'I fill the modifications tasklist search and filter options with {string}',
  async ({ commonItemsPage, modificationsReadyToAssignPage }, datasetName: string) => {
    const dataset = modificationsReadyToAssignPage.modificationsReadyToAssignPageTestData.Search_Queries[datasetName];
    for (const key in dataset) {
      if (Object.hasOwn(dataset, key)) {
        await commonItemsPage.fillUIComponent(dataset, key, modificationsReadyToAssignPage);
      }
    }
    if (datasetName.toLowerCase().includes('title')) {
      await commonItemsPage.setShortProjectTitleFilter(dataset.short_project_title_text);
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
