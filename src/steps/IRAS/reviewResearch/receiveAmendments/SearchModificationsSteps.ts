import { createBdd } from 'playwright-bdd';
import { expect, test } from '../../../../hooks/CustomFixtures';
import { confirmArrayNotNull } from '../../../../utils/UtilFunctions';
const { When, Then } = createBdd(test);

When(
  'I select advanced filters in the search modifications page using {string}',
  async ({ searchModificationsPage, commonItemsPage }, irasIdDatasetName: string) => {
    const dataset =
      searchModificationsPage.searchModificationsPageTestData.Search_Modifications_Page[irasIdDatasetName];
    // I open the list of filters by clicking the Advanced Filter chevron,if not opened by default (for handling JS Enabled and Disabled)
    for (const key in dataset) {
      if (Object.prototype.hasOwnProperty.call(dataset, key)) {
        // I open each filter one by one by clicking the corresponding Filter chevron,if not opened by default (for handling JS Enabled and Disabled)
        await commonItemsPage.fillUIComponent(dataset, key, searchModificationsPage);
      }
    }
  }
);

Then(
  'the system displays modification records matching the search {string} and filter criteria {string}',
  async (
    { userListReviewBodyPage, commonItemsPage, searchModificationsPage },
    irasIdDatasetName: string,
    filterDatasetName: string
  ) => {
    const dataset =
      searchModificationsPage.searchModificationsPageTestData.Search_Modifications_Page[irasIdDatasetName];
    console.log(dataset);
    const dataset1 =
      searchModificationsPage.searchModificationsPageTestData.Search_Modifications_Page[filterDatasetName];
    console.log(dataset1);
    const searchKey = await userListReviewBodyPage.getSearchKey();
    const searchTerms = await commonItemsPage.splitSearchTerm(searchKey);
    const userList = await commonItemsPage.getAllUsersFromTheTable();
    const userListAfterSearch: string[] = confirmArrayNotNull(userList.get('searchResultValues'));
    const searchResult = await commonItemsPage.validateSearchResultsMultipleWordsSearchKey(
      userListAfterSearch,
      searchTerms
    );
    expect(searchResult).toBeTruthy();
    expect(userListAfterSearch).toHaveLength(searchResult.length);
    await userListReviewBodyPage.updateUserInfo();
  }
);

Then(
  'the system displays modification records matching the search criteria of {string}',
  async ({ userListReviewBodyPage, commonItemsPage, searchModificationsPage }, irasIdDatasetName: string) => {
    const dataset =
      searchModificationsPage.searchModificationsPageTestData.Search_Modifications_Page[irasIdDatasetName];
    console.log(dataset);
    const searchKey = await userListReviewBodyPage.getSearchKey();
    const searchTerms = await commonItemsPage.splitSearchTerm(searchKey);
    const userList = await commonItemsPage.getAllUsersFromTheTable();
    const userListAfterSearch: string[] = confirmArrayNotNull(userList.get('searchResultValues'));
    const searchResult = await commonItemsPage.validateSearchResultsMultipleWordsSearchKey(
      userListAfterSearch,
      searchTerms
    );
    expect(searchResult).toBeTruthy();
    expect(userListAfterSearch).toHaveLength(searchResult.length);
    await userListReviewBodyPage.updateUserInfo();
  }
);

Then(
  'the system displays modification records matching the filter criteria of {string}',
  async ({ userListReviewBodyPage, commonItemsPage, searchModificationsPage }, filterDatasetName: string) => {
    const dataset =
      searchModificationsPage.searchModificationsPageTestData.Search_Modifications_Page[filterDatasetName];
    console.log(dataset);
    const searchKey = await userListReviewBodyPage.getSearchKey();
    const searchTerms = await commonItemsPage.splitSearchTerm(searchKey);
    const userList = await commonItemsPage.getAllUsersFromTheTable();
    const userListAfterSearch: string[] = confirmArrayNotNull(userList.get('searchResultValues'));
    const searchResult = await commonItemsPage.validateSearchResultsMultipleWordsSearchKey(
      userListAfterSearch,
      searchTerms
    );
    expect(searchResult).toBeTruthy();
    expect(userListAfterSearch).toHaveLength(searchResult.length);
    await userListReviewBodyPage.updateUserInfo();
  }
);

Then(
  'I can see the list is sorted by default in the descending order of the {string}',
  async ({ manageUsersPage, manageReviewBodiesPage }, sortField: string) => {
    let actualList: string[];
    switch (sortField.toLowerCase()) {
      case 'first name':
        actualList = await manageUsersPage.getFirstNamesListFromUI();
        break;
      case 'organisation name':
        actualList = await manageReviewBodiesPage.getOrgNamesListFromUI();
        break;
      default:
        throw new Error(`${sortField} is not a valid option`);
    }
    const sortedList = [...actualList].sort((a, b) => a.localeCompare(b, 'en', { sensitivity: 'base' }));
    expect.soft(actualList).toEqual(sortedList);
  }
);
