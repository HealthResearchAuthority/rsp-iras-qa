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
  'I can see the list is sorted by descending order of the {string}',
  async ({ searchModificationsPage, commonItemsPage }, sortField: string) => {
    let actualList = await searchModificationsPage.getModificationIdListValues(commonItemsPage.tableBodyRows);
    switch (sortField.toLowerCase()) {
      case 'modification id':
        actualList = await searchModificationsPage.convertModificationIdListValuesToSortableFormat(
          await searchModificationsPage.getModificationIdListValues(commonItemsPage.tableBodyRows)
        );
        break;
      default:
        throw new Error(`${sortField} is not a valid option`);
    }
    console.log('ACTUAL LIST');
    console.log(actualList);
    const sortedDescending = [...actualList].sort((a, b) => b.localeCompare(a, 'en', { sensitivity: 'base' }));
    console.log('SORTED LIST');
    console.log(sortedDescending);
    expect(actualList).toEqual(sortedDescending);
  }
);

Then(
  'I can see the list is sorted by ascending order of the {string}',
  async ({ searchModificationsPage, commonItemsPage }, sortField: string) => {
    let actualList: string[];
    switch (sortField.toLowerCase()) {
      case 'modification id':
        actualList = await searchModificationsPage.convertModificationIdListValuesToSortableFormat(
          await searchModificationsPage.getModificationIdListValues(commonItemsPage.tableBodyRows)
        );
        break;
      default:
        throw new Error(`${sortField} is not a valid option`);
    }
    console.log('ACTUAL LIST');
    console.log(actualList);
    const sortedAscending = [...actualList].sort((a, b) => a.localeCompare(b, 'en', { sensitivity: 'base' }));
    console.log('SORTED LIST');
    console.log(sortedAscending);
    expect(actualList).toEqual(sortedAscending);
  }
);
