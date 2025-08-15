import { createBdd } from 'playwright-bdd';
import { expect, test } from '../../hooks/CustomFixtures';
const { Given, When, Then } = createBdd(test);
import { confirmArrayNotNull } from '../../utils/UtilFunctions';

When(
  'I fill the search input for searching {string} with {string} as the search query',
  async (
    {
      manageReviewBodiesPage,
      manageUsersPage,
      searchAddUserReviewBodyPage,
      searchModificationsPage,
      modificationsReadyToAssignPage,
      commonItemsPage,
    },
    searchType: string,
    searchQueryName: string
  ) => {
    let searchQueryDataset: any;
    if (searchType.toLowerCase() == 'users') {
      searchQueryDataset = manageUsersPage.manageUsersPageTestData.Search_For_Users.Search_Queries[searchQueryName];
    } else if (searchType.toLowerCase() == 'review bodies') {
      searchQueryDataset =
        manageReviewBodiesPage.manageReviewBodiesPageData.Search_For_Review_Bodies.Search_Queries[searchQueryName];
    } else if (searchType.toLowerCase() == 'adding users') {
      searchQueryDataset =
        searchAddUserReviewBodyPage.searchAddUserReviewBodyPageData.Search_Add_User_Review_Body.Search_Queries[
          searchQueryName
        ];
    } else if (searchType.toLowerCase() == 'modifications') {
      searchQueryDataset =
        searchModificationsPage.searchModificationsPageTestData.Search_Modifications_Page[searchQueryName];
    } else if (searchType.toLowerCase() == 'tasklist') {
      searchQueryDataset =
        modificationsReadyToAssignPage.modificationsReadyToAssignPageTestData.Search_Queries[searchQueryName];
    } else if ((await commonItemsPage.tableBodyRows.count()) < 1) {
      throw new Error(`There are no items in list to search`);
    }
    let searchKey: string;
    if (searchQueryName.toLowerCase().startsWith('same') || searchQueryName.toLowerCase().includes('newly added')) {
      searchKey = await searchAddUserReviewBodyPage.getUserEmail();
    } else {
      searchKey = searchQueryDataset['search_input_text'];
    }
    expect(searchKey).toBeTruthy();
    await commonItemsPage.setSearchKey(searchKey);
    await commonItemsPage.search_text.fill(searchKey);
  }
);

Given(
  'the system displays user records matching the search criteria',
  async ({ userListReviewBodyPage, commonItemsPage }) => {
    const searchKey = await commonItemsPage.getSearchKey();
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

Then('the list displays {string}', async ({ commonItemsPage }, resultsAmount: string) => {
  if (resultsAmount.toLowerCase().includes('single')) {
    await expect(commonItemsPage.tableBodyRows).toHaveCount(1);
  } else {
    expect(await commonItemsPage.tableBodyRows.count()).toBeGreaterThan(1);
  }
});
