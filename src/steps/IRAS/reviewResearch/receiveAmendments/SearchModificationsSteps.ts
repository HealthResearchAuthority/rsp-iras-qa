import { createBdd } from 'playwright-bdd';
import { expect, test } from '../../../../hooks/CustomFixtures';
import { Locator } from 'playwright/test';
import { confirmArrayNotNull, generateTimeStampedValue } from '../../../../utils/UtilFunctions';
const { When, Then } = createBdd(test);

When(
  'I enter valid iras id and select advanced filters in the search modifications page using {string}',
  async ({ createReviewBodyPage, commonItemsPage }, datasetName: string) => {
    const dataset = createReviewBodyPage.createReviewBodyPageData.Create_Review_Body[datasetName];
    const datasetNameClear: string = 'Create_Review_Body_Page';
    const clearDataset = createReviewBodyPage.createReviewBodyPageData[datasetNameClear];
    await commonItemsPage.clearUIComponent(clearDataset, 'country_checkbox', createReviewBodyPage);
    for (const key in dataset) {
      if (Object.prototype.hasOwnProperty.call(dataset, key)) {
        if (datasetName.startsWith('Valid_') && key == 'organisation_name_text') {
          const orgNameLocator: Locator = createReviewBodyPage[key];
          const uniqueOrgNameValue = await generateTimeStampedValue(dataset[key], ' ');
          await orgNameLocator.fill(uniqueOrgNameValue);
          await createReviewBodyPage.setUniqueOrgName(uniqueOrgNameValue);
        } else {
          await commonItemsPage.fillUIComponent(dataset, key, createReviewBodyPage);
        }
      }
    }
  }
);

When(
  'I enter iras id in the search modifications page using {string}',
  async ({ createReviewBodyPage, commonItemsPage }, datasetName: string) => {
    const dataset = createReviewBodyPage.createReviewBodyPageData.Create_Review_Body[datasetName];
    const datasetNameClear: string = 'Create_Review_Body_Page';
    const clearDataset = createReviewBodyPage.createReviewBodyPageData[datasetNameClear];
    await commonItemsPage.clearUIComponent(clearDataset, 'country_checkbox', createReviewBodyPage);
    for (const key in dataset) {
      if (Object.prototype.hasOwnProperty.call(dataset, key)) {
        if (datasetName.startsWith('Valid_') && key == 'organisation_name_text') {
          const orgNameLocator: Locator = createReviewBodyPage[key];
          const uniqueOrgNameValue = await generateTimeStampedValue(dataset[key], ' ');
          await orgNameLocator.fill(uniqueOrgNameValue);
          await createReviewBodyPage.setUniqueOrgName(uniqueOrgNameValue);
        } else {
          await commonItemsPage.fillUIComponent(dataset, key, createReviewBodyPage);
        }
      }
    }
  }
);

When(
  'I select advanced filters in the search modifications page using {string}',
  async ({ createReviewBodyPage, commonItemsPage }, datasetName: string) => {
    const dataset = createReviewBodyPage.createReviewBodyPageData.Create_Review_Body[datasetName];
    const datasetNameClear: string = 'Create_Review_Body_Page';
    const clearDataset = createReviewBodyPage.createReviewBodyPageData[datasetNameClear];
    await commonItemsPage.clearUIComponent(clearDataset, 'country_checkbox', createReviewBodyPage);
    for (const key in dataset) {
      if (Object.prototype.hasOwnProperty.call(dataset, key)) {
        if (datasetName.startsWith('Valid_') && key == 'organisation_name_text') {
          const orgNameLocator: Locator = createReviewBodyPage[key];
          const uniqueOrgNameValue = await generateTimeStampedValue(dataset[key], ' ');
          await orgNameLocator.fill(uniqueOrgNameValue);
          await createReviewBodyPage.setUniqueOrgName(uniqueOrgNameValue);
        } else {
          await commonItemsPage.fillUIComponent(dataset, key, createReviewBodyPage);
        }
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
