import { createBdd } from 'playwright-bdd';
import { expect, test } from '../../../../hooks/CustomFixtures';
import { confirmArrayNotNull, confirmStringNotNull } from '../../../../utils/UtilFunctions';
const { Then } = createBdd(test);

Then(
  'the system displays modification records matching the search criteria of {string}',
  async ({ commonItemsPage, searchModificationsPage }, irasIdDatasetName: string) => {
    const irasIdDataset =
      searchModificationsPage.searchModificationsPageTestData.Search_Modifications_Page[irasIdDatasetName];
    const irasId = irasIdDataset['iras_id_text'];
    const modificationsList = await searchModificationsPage.getAllModificationsTheTable(commonItemsPage.tableRows);
    const modificationsListAfterSearch: string[] = confirmArrayNotNull(modificationsList.get('searchResultValues'));
    const expectedResultCount =
      searchModificationsPage.searchModificationsPageTestData.Search_Modifications_Page.result_count_heading;
    const actualResultCount = confirmStringNotNull(await searchModificationsPage.result_count.textContent());
    expect(modificationsListAfterSearch.length + expectedResultCount).toBe(actualResultCount);
    if (irasId !== undefined) {
      const searchKey = irasId;
      const filteredSearchResults = await commonItemsPage.filterResults(modificationsListAfterSearch, searchKey);
      expect(filteredSearchResults).toEqual(modificationsListAfterSearch);
      const searchResult = await commonItemsPage.validateSearchResultsMultipleWordsSearchKey(
        modificationsListAfterSearch,
        searchKey
      );
      expect(searchResult).toBeTruthy();
      expect(modificationsListAfterSearch).toHaveLength(searchResult.length);
    }
    const modificationIdListAfterSearch: string[] = confirmArrayNotNull(modificationsList.get('modificationIdValues'));
    await searchModificationsPage.setModificationIdListAfterSearch(modificationIdListAfterSearch);
    if (irasId !== undefined) {
      const searchResultIrasID = await commonItemsPage.validateSearchResults(modificationIdListAfterSearch, irasId);
      expect(searchResultIrasID).toBeTruthy();
    }
  }
);

Then(
  'I can see the list is sorted by {string} order of the {string}',
  async ({ searchModificationsPage, commonItemsPage }, sortDirection: string, sortField: string) => {
    let sortedList: string[];
    let columnIndex: number;
    switch (sortField.toLowerCase()) {
      case 'modification id':
        columnIndex = 0;
        break;
      case 'short project title':
        columnIndex = 1;
        break;
      case 'modification type':
        columnIndex = 2;
        break;
      case 'chief investigator':
        columnIndex = 3;
        break;
      case 'lead nation':
        columnIndex = 4;
        break;
      default:
        throw new Error(`${sortField} is not a valid option`);
    }
    const actualList = await searchModificationsPage.getActualListValues(commonItemsPage.tableBodyRows, columnIndex);
    if (sortField.toLowerCase() == 'modification id') {
      sortedList = await searchModificationsPage.sortModificationIdListValues(actualList, sortDirection);
    } else if (sortDirection.toLowerCase() == 'ascending') {
      sortedList = [...actualList].sort((a, b) => a.localeCompare(b, 'en', { sensitivity: 'base' }));
    } else {
      sortedList = [...actualList].sort((a, b) => b.localeCompare(a, 'en', { sensitivity: 'base' }));
    }
    expect(actualList).toEqual(sortedList);
  }
);
