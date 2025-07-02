import { createBdd } from 'playwright-bdd';
import { expect, test } from '../../../../hooks/CustomFixtures';
import { confirmArrayNotNull } from '../../../../utils/UtilFunctions';
import config from '../../../../../playwright.config';
const { When, Then } = createBdd(test);

When(
  'I select advanced filters in the search modifications page using {string}',
  async ({ searchModificationsPage, commonItemsPage, $tags }, filterDatasetName: string) => {
    const dataset =
      searchModificationsPage.searchModificationsPageTestData.Search_Modifications_Page[filterDatasetName];
    // I open the list of filters by clicking the Advanced Filter chevron,if not opened by default (for handling JS Enabled and Disabled)
    searchModificationsPage.clickAdvancedFilterChevron();
    for (const key in dataset) {
      if (Object.prototype.hasOwnProperty.call(dataset, key)) {
        // I open each filter one by one by clicking the corresponding Filter chevron,if not opened by default (for handling JS Enabled and Disabled)
        searchModificationsPage.clickFilterChevron(key, searchModificationsPage);
        if (key === 'sponsor_organisation_text') {
          if (
            ($tags.includes('@jsEnabled') || config.projects?.[1].use?.javaScriptEnabled) &&
            !$tags.includes('@jsDisabled')
          ) {
            dataset['sponsor_organisation_jsenabled_text'] = dataset['sponsor_organisation_text'];
            await commonItemsPage.fillUIComponent(
              dataset,
              'sponsor_organisation_jsenabled_text',
              searchModificationsPage
            );
            if (await searchModificationsPage.sponsor_organisation_suggestion_list_labels.first().isVisible()) {
              await searchModificationsPage.sponsor_organisation_suggestion_list_labels.first().click();
            }
          } else {
            await commonItemsPage.fillUIComponent(dataset, key, searchModificationsPage);
            if (!(filterDatasetName == 'Sponsor_Organisation_Text_Blank')) {
              await searchModificationsPage.sponsor_organisation_jsdisabled_search_button.click();
              await searchModificationsPage.page.waitForTimeout(2000);
              await searchModificationsPage.sponsor_organisation_jsdisabled_search_results_radio_button.isVisible();
            }
            if (!(filterDatasetName == 'Sponsor_Organisation_Text_Blank')) {
              await searchModificationsPage.sponsor_organisation_jsdisabled_search_results_radio_button.first().click();
            }
          }
          delete dataset['sponsor_organisation_jsenabled_text'];
        } else {
          await commonItemsPage.fillUIComponent(dataset, key, searchModificationsPage);
        }
      }
    }
  }
);

Then(
  'I can see the selected filters {string} are displayed under active filters',
  async ({ searchModificationsPage, commonItemsPage }, filterDatasetName: string) => {
    const dataset =
      searchModificationsPage.searchModificationsPageTestData.Search_Modifications_Page[filterDatasetName];
    for (const key in dataset) {
      if (Object.prototype.hasOwnProperty.call(dataset, key)) {
        const fieldValActual = await commonItemsPage.getSelectedValues(key, checkCreateUserProfilePage);
        if (key === 'email_address_text') {
          const data = await returnDataFromJSON();
          expect(fieldValActual).toBe(data.Create_User_Profile.email_address_unique);
        } else if (key === 'country_checkbox' || key === 'access_required_checkbox' || key === 'role_checkbox') {
          const fieldValActuals = fieldValActual.split(', ');
          fieldValActuals.forEach((val, index) => {
            expect(val).toBe(dataset[key][index]);
          });
        } else {
          expect(fieldValActual).toBe(dataset[key]);
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
