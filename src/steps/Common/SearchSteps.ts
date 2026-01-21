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
      myModificationsTasklistPage,
      commonItemsPage,
      participatingOrganisationsPage,
      manageSponsorOrganisationPage,
      userListSponsorOrganisationPage,
      myResearchProjectsPage,
      projectOverviewPage,
      searchProjectsPage,
      teamManagerDashboardPage,
    },
    searchType: string,
    searchQueryName: string
  ) => {
    let searchQueryDataset: any;
    if (searchType.toLowerCase() == 'users') {
      searchQueryDataset =
        await manageUsersPage.manageUsersPageTestData.Search_For_Users.Search_Queries[searchQueryName];
    } else if (searchType.toLowerCase() == 'review bodies') {
      searchQueryDataset =
        await manageReviewBodiesPage.manageReviewBodiesPageData.Search_For_Review_Bodies.Search_Queries[
          searchQueryName
        ];
    } else if (searchType.toLowerCase() == 'adding users') {
      searchQueryDataset =
        await searchAddUserReviewBodyPage.searchAddUserReviewBodyPageData.Search_Add_User_Review_Body.Search_Queries[
          searchQueryName
        ];
    } else if (searchType.toLowerCase() == 'modifications') {
      searchQueryDataset =
        await searchModificationsPage.searchModificationsPageTestData.Search_Queries[searchQueryName];
    } else if (searchType.toLowerCase() == 'project records') {
      searchQueryDataset = await searchProjectsPage.searchProjectsPageTestData.Search_Queries[searchQueryName];
    } else if (searchType.toLowerCase() == 'tasklist') {
      searchQueryDataset =
        await modificationsReadyToAssignPage.modificationsReadyToAssignPageTestData.Search_Queries[searchQueryName];
    } else if (searchType.toLowerCase() == 'my tasklist') {
      searchQueryDataset =
        await myModificationsTasklistPage.myModificationsTasklistPageTestData.Search_Queries[searchQueryName];
    } else if (searchType.toLowerCase() == 'organisations') {
      searchQueryDataset =
        await participatingOrganisationsPage.participatingOrganisationsPageTestData.Search_Queries[searchQueryName];
    } else if (searchType.toLowerCase() == 'sponsor organisations') {
      searchQueryDataset =
        await manageSponsorOrganisationPage.manageSponsorOrganisationsPageTestData.Search_For_Sponsor_Organisations
          .Search_Queries[searchQueryName];
    } else if (searchType.toLowerCase() == 'users in sponsor organisations') {
      searchQueryDataset =
        await userListSponsorOrganisationPage.userListSponsorOrgPageTestData.Search_For_Users_In_Sponsor_Organisations
          .Search_Queries[searchQueryName];
    } else if (searchType.toLowerCase() == 'my research') {
      searchQueryDataset = await myResearchProjectsPage.myResearchProjectsPageTestData.Search_Queries[searchQueryName];
    } else if (searchType.toLowerCase() == 'modifications in post approval') {
      searchQueryDataset =
        await projectOverviewPage.projectOverviewPageTestData.Post_Approval_Search_Queries[searchQueryName];
    } else if (searchType.toLowerCase() == 'team manager dashboard') {
      searchQueryDataset =
        await teamManagerDashboardPage.teamManagerDashboardPageTestData.Search_Queries[searchQueryName];
    } else if ((await commonItemsPage.tableBodyRows.count()) < 1) {
      throw new Error(`There are no items in list to search`);
    }
    let searchKey: string;
    if (searchQueryName.toLowerCase().startsWith('same') || searchQueryName.toLowerCase().includes('newly added')) {
      searchKey = await searchAddUserReviewBodyPage.getUserEmail();
    } else if (searchQueryName === 'Valid_Full_Iras_Id of recently added project') {
      searchKey = await searchProjectsPage.getIrasId();
    } else if (searchQueryName === 'modification with status' && searchType.toLowerCase() == 'team manager dashboard') {
      searchKey = await teamManagerDashboardPage.getModificationId();
    } else if (searchQueryName === 'modification with status' && searchType.toLowerCase() == 'tasklist') {
      searchKey = await modificationsReadyToAssignPage.getModificationId();
    } else if (
      searchQueryName === 'modification assigned by team manager' &&
      searchType.toLowerCase() == 'my tasklist'
    ) {
      searchKey = await teamManagerDashboardPage.getModificationId();
    } else if (
      searchQueryName === 'modification assigned by workflow co-ordinator' &&
      searchType.toLowerCase() == 'my tasklist'
    ) {
      searchKey = await modificationsReadyToAssignPage.getModificationId();
    } else if (searchQueryName === 'modification with status' && searchType.toLowerCase() == 'modifications') {
      searchKey = await searchModificationsPage.getModificationId();
    } else {
      searchKey = await searchQueryDataset['search_input_text'];
    }
    expect.soft(searchKey).toBeTruthy();
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
    await userListReviewBodyPage.updateUserInfo(commonItemsPage);
  }
);

Then('the list displays {string}', async ({ commonItemsPage }, resultsAmount: string) => {
  if (resultsAmount.toLowerCase().includes('single')) {
    await expect(commonItemsPage.tableBodyRows).toHaveCount(1);
  } else {
    expect(await commonItemsPage.tableBodyRows.count()).toBeGreaterThanOrEqual(1);
  }
});

When(
  'I fill the search input for searching {string} with {string} as the search query as {string}',
  async (
    {
      modificationsReadyToAssignPage,
      commonItemsPage,
      teamManagerDashboardPage,
      searchModificationsPage,
      myModificationsTasklistPage,
    },
    searchType: string,
    searchQueryName: string,
    searchKeyType: string
  ) => {
    let searchKey: string;
    let searchQueryDataset: any;
    if (searchQueryName === 'modification with status' && searchType.toLowerCase() == 'team manager dashboard') {
      if (searchKeyType.toLowerCase() === 'full') {
        searchKey = await teamManagerDashboardPage.getIrasId();
      } else if (searchKeyType.toLowerCase() === 'partial') {
        searchKey = (await teamManagerDashboardPage.getModificationId()).substring(0, 2);
        await teamManagerDashboardPage.setModificationId(searchKey);
      }
    } else if (searchQueryName === 'modification with status' && searchType.toLowerCase() == 'tasklist') {
      if (searchKeyType.toLowerCase() === 'full') {
        searchKey = await modificationsReadyToAssignPage.getIrasId();
      } else if (searchKeyType.toLowerCase() === 'partial') {
        searchKey = (await modificationsReadyToAssignPage.getModificationId()).substring(0, 2);
        await modificationsReadyToAssignPage.setModificationId(searchKey);
      }
    } else if (searchQueryName === 'modification with status' && searchType.toLowerCase() == 'modifications') {
      if (searchKeyType.toLowerCase() === 'full') {
        searchKey = await searchModificationsPage.getIrasId();
      } else if (searchKeyType.toLowerCase() === 'partial') {
        searchKey = (await searchModificationsPage.getIrasId()).substring(0, 2);
        await searchModificationsPage.setIrasId(searchKey);
      }
    } else if (searchQueryName === 'modification with status' && searchType.toLowerCase() == 'my tasklist') {
      if (searchKeyType.toLowerCase() === 'full') {
        searchKey = await myModificationsTasklistPage.getIrasId();
      } else if (searchKeyType.toLowerCase() === 'partial') {
        searchKey = (await myModificationsTasklistPage.getModificationId()).substring(0, 2);
      }
    } else if (
      searchQueryName === 'modification assigned by team manager' &&
      searchType.toLowerCase() == 'my tasklist'
    ) {
      searchKey = await teamManagerDashboardPage.getModificationId();
    } else if (
      searchQueryName === 'modification assigned by workflow co-ordinator' &&
      searchType.toLowerCase() == 'my tasklist'
    ) {
      searchKey = await modificationsReadyToAssignPage.getModificationId();
    } else {
      searchKey = await searchQueryDataset['search_input_text'];
    }
    expect.soft(searchKey).toBeTruthy();
    await commonItemsPage.setSearchKey(searchKey);
    await commonItemsPage.search_text.fill(searchKey);
  }
);

When(
  'I enter the the search input for {string} with {string}',
  async ({ searchModificationsPage, searchProjectsPage, commonItemsPage }, searchType: string, datasetName: string) => {
    let searchKey: string;
    if (searchType.toLowerCase() == 'modifications') {
      if (datasetName === 'Valid_Full_Iras_Id') {
        searchKey = await searchModificationsPage.getIrasId();
      } else if (datasetName === 'Existing_Partial_IRAS_ID') {
        searchKey = (await searchModificationsPage.getIrasId()).substring(0, 2);
      }
    } else if (searchType.toLowerCase() == 'project records') {
      if (datasetName === 'Valid_Full_Iras_Id') {
        searchKey = await searchProjectsPage.getIrasId();
      } else if (datasetName === 'Valid_Iras_Id_Prefix') {
        searchKey = (await searchProjectsPage.getIrasId()).substring(0, 2);
      }
    }
    expect.soft(searchKey).toBeTruthy();
    await commonItemsPage.setSearchKey(searchKey);
    await commonItemsPage.search_text.fill(searchKey);
  }
);
