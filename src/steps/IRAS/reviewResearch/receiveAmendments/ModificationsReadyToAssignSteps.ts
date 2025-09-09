import { createBdd } from 'playwright-bdd';
import { expect, test } from '../../../../hooks/CustomFixtures';
import { getRandomNumber } from '../../../../utils/UtilFunctions';
const { Given, When, Then } = createBdd(test);

Then('I can see the modifications ready to assign page', async ({ modificationsReadyToAssignPage }) => {
  await modificationsReadyToAssignPage.assertOnModificationsReadyToAssignPage();
});

Then(
  'I can see the tasklist of modifications ready to assign is sorted by {string} order of the {string}',
  async ({ modificationsReadyToAssignPage, commonItemsPage }, sortDirection: string, sortField: string) => {
    let sortedList: string[];
    let columnIndex: number;
    switch (sortField.toLowerCase()) {
      case 'modification id':
        columnIndex = 1;
        break;
      case 'short project title':
        columnIndex = 2;
        break;
      case 'date submitted':
        columnIndex = 3;
        break;
      case 'days since submission':
        columnIndex = 4;
        break;
      default:
        throw new Error(`${sortField} is not a valid option`);
    }
    const actualList = await commonItemsPage.getActualListValues(commonItemsPage.tableBodyRows, columnIndex);
    if (sortField.toLowerCase() == 'modification id') {
      sortedList = await commonItemsPage.sortModificationIdListValues(actualList, sortDirection);
    } else if (sortField.toLowerCase() == 'date submitted') {
      sortedList = await modificationsReadyToAssignPage.sortDateSubmittedListValues(actualList, sortDirection);
    } else if (sortField.toLowerCase() == 'days since submission') {
      sortedList = await modificationsReadyToAssignPage.sortDaysSinceSubmittedListValues(actualList, sortDirection);
    } else if (sortDirection.toLowerCase() == 'ascending') {
      sortedList = [...actualList].toSorted((a, b) => a.localeCompare(b, 'en', { sensitivity: 'base' }));
    } else {
      sortedList = [...actualList].toSorted((a, b) => b.localeCompare(a, 'en', { sensitivity: 'base' }));
    }
    expect(actualList).toEqual(sortedList);
  }
);

Then(
  'I can see the {string} ui labels on the modifications ready to assign page',
  async ({ commonItemsPage, modificationsReadyToAssignPage }, datasetName: string) => {
    const dataset = modificationsReadyToAssignPage.modificationsReadyToAssignPageTestData[datasetName];
    for (const key in dataset) {
      if (Object.hasOwn(dataset, key)) {
        const labelVal = await commonItemsPage.getUiLabel(key, modificationsReadyToAssignPage);
        expect(labelVal).toBe(dataset[key]);
      }
    }
  }
);

Then(
  'I confirm checkbox exists in every row across pages',
  async ({ commonItemsPage, modificationsReadyToAssignPage }) => {
    //Limiting the checks to 2 pages
    const maxPagesToCheck =
      modificationsReadyToAssignPage.modificationsReadyToAssignPageTestData.Modifications_Ready_To_Assign_Page
        .maxPagesToVisit;
    for (let pageIndex = 1; pageIndex <= maxPagesToCheck; pageIndex++) {
      const checkboxes = await modificationsReadyToAssignPage.modification_checkbox.all();
      for (const checkbox of checkboxes) {
        await expect(checkbox).toBeVisible();
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
  'I check random row and validate if the row is checked even after navigation',
  async ({ commonItemsPage, modificationsReadyToAssignPage }) => {
    await commonItemsPage.firstPage.click();
    const randomRowToCheck = await getRandomNumber(1, 20);
    const maxPagesToCheck =
      modificationsReadyToAssignPage.modificationsReadyToAssignPageTestData.Modifications_Ready_To_Assign_Page
        .maxPagesToVisit;

    for (let currentPage = 1; currentPage <= maxPagesToCheck; currentPage++) {
      await modificationsReadyToAssignPage.modification_checkbox.nth(randomRowToCheck).check();
      await commonItemsPage.next_button.click();
    }

    for (let currentPage = maxPagesToCheck + 1; currentPage >= maxPagesToCheck; currentPage--) {
      await commonItemsPage.previous_button.click();

      await expect(modificationsReadyToAssignPage.modification_checkbox.nth(randomRowToCheck)).toBeChecked();
    }
  }
);

Then(
  'I select check all checkbox on the current page and validate all checkboxes are checked',
  async ({ modificationsReadyToAssignPage }) => {
    await modificationsReadyToAssignPage.page.waitForLoadState('domcontentloaded');
    const checkAll = modificationsReadyToAssignPage.checkall_modification_checkbox;
    await checkAll.click();
    const checkboxes = await modificationsReadyToAssignPage.modification_checkbox.all();
    for (const checkbox of checkboxes) {
      await expect(checkbox).toBeChecked();
    }
  }
);

When(
  'JavaScript is disabled I select check all checkbox on the current page and validate all checkboxes are unchecked',
  async ({ modificationsReadyToAssignPage }) => {
    const checkAll = modificationsReadyToAssignPage.checkall_modification_checkbox;
    await checkAll.click();
    const checkboxes = await modificationsReadyToAssignPage.modification_checkbox.all();
    for (const checkbox of checkboxes) {
      await expect(checkbox).not.toBeChecked();
    }
  }
);

When(
  'I navigate by {string} within the Modifications Ready to assign page',
  async ({ commonItemsPage }, paginationLink: string) => {
    if (paginationLink.toLowerCase() === 'clicking on next link') {
      await commonItemsPage.next_button.click();
    } else {
      await commonItemsPage.previous_button.click();
    }
  }
);

When('I confirm all checkboxes are {string}', async ({ modificationsReadyToAssignPage }, checkboxStatus: string) => {
  const checkboxes = await modificationsReadyToAssignPage.modification_checkbox.all();
  for (const checkbox of checkboxes) {
    if (checkboxStatus.toLowerCase() === 'unchecked') {
      await expect(checkbox).not.toBeChecked();
    } else {
      await expect(checkbox).toBeChecked();
    }
  }
});

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
    const daysSinceSubmission = await searchModificationsPage.getActualListValues(commonItemsPage.tableBodyRows, 4); //this is in common now, merge with latest when work is in
    if (searchInput.toLowerCase().includes('single')) {
      await expect(commonItemsPage.search_results_count).toHaveText(
        commonItemsPage.searchFilterResultsData.search_single_result_count
      );
      expect(await commonItemsPage.tableBodyRows.all()).toHaveLength(1);
      expect(
        await modificationsReadyToAssignPage.checkSingleValueEquals(
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
      } else if (searchInput.toLowerCase().includes('days')) {
        for (const day of daysSinceSubmission) {
          expect(
            day.endsWith(
              modificationsReadyToAssignPage.modificationsReadyToAssignPageTestData.Modifications_Ready_To_Assign_Page
                .days_since_suffix
            )
          ).toBeTruthy();
        }
        expect(
          await modificationsReadyToAssignPage.checkDaysSearchResultValues(
            daysSinceSubmission,
            searchInputDataset,
            searchInput
          )
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
  async ({ commonItemsPage, modificationsReadyToAssignPage, searchModificationsPage }, datasetName: string) => {
    const dataset = modificationsReadyToAssignPage.modificationsReadyToAssignPageTestData.Search_Queries[datasetName];
    const daysSinceSubmission = await searchModificationsPage.getActualListValues(commonItemsPage.tableBodyRows, 4); //this is in common now, merge with latest when work is in
    for (const key in dataset) {
      if (Object.hasOwn(dataset, key)) {
        await commonItemsPage.fillUIComponent(dataset, key, modificationsReadyToAssignPage);
      }
    }
    if (datasetName.toLowerCase().includes('title')) {
      await commonItemsPage.setShortProjectTitleFilter(dataset.short_project_title_text);
    }
    if (datasetName.toLowerCase().includes('days')) {
      if (datasetName.toLowerCase().includes('from') || datasetName.toLowerCase().includes('range')) {
        await modificationsReadyToAssignPage.setDaysSinceSubmissionFromFilter(
          parseInt(dataset.days_since_submission_from_text)
        );
      }
      if (datasetName.toLowerCase().includes('to') || datasetName.toLowerCase().includes('range')) {
        await modificationsReadyToAssignPage.setDaysSinceSubmissionToFilter(
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
        await modificationsReadyToAssignPage.setDaysSinceSubmissionFromFilter(parseInt(daysSinceSubmission[0]));
        await modificationsReadyToAssignPage.setDaysSinceSubmissionToFilter(parseInt(daysSinceSubmission[0]));
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
  async ({ modificationsReadyToAssignPage }) => {
    await expect(modificationsReadyToAssignPage.days_since_submission_label).toBeVisible();
    await expect(modificationsReadyToAssignPage.days_since_submission_hint_label).toBeVisible();
    await expect(modificationsReadyToAssignPage.days_since_submission_to_separator).toBeVisible();
    await expect(modificationsReadyToAssignPage.days_since_submission_suffix_label).toBeVisible();
  }
);
