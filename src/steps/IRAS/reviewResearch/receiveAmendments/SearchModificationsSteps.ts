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
  async ({ searchModificationsPage }, filterDatasetName: string) => {
    const dataset =
      searchModificationsPage.searchModificationsPageTestData.Search_Modifications_Page[filterDatasetName];
    const datasetLabels = searchModificationsPage.searchModificationsPageTestData.Search_Modifications_Page;
    const activeFiltersMap = await searchModificationsPage.getActiveFiltersLabels(dataset, datasetLabels);
    const filterValuesExpected = activeFiltersMap.get('singleSelectFilter');
    const activeCheckboxFiltersMap = await searchModificationsPage.getActiveFiltersCheckboxLabels(
      dataset,
      datasetLabels
    );
    const filterCheckboxValuesExpected = activeCheckboxFiltersMap.get('multiSelectFilter');
    // const fieldValActual = await searchModificationsPage.getSelectedFilterValues(dataset, searchModificationsPage);
    // expect(fieldValActual).toBe(filterValuesExpected + ', ' + filterCheckboxValuesExpected);

    console.log(
      'Active filters based on the selected advanced filters:- ' +
        filterValuesExpected +
        ', ' +
        filterCheckboxValuesExpected
    );
  }
);

// date_modification_submitted and sponsor_organisation can't validate from UI,need to validate with Database
Then(
  'the system displays modification records matching the search {string} and filter criteria {string}',
  async ({ commonItemsPage, searchModificationsPage }, irasIdDatasetName: string, filterDatasetName: string) => {
    const irasIdDataset =
      searchModificationsPage.searchModificationsPageTestData.Search_Modifications_Page[irasIdDatasetName];
    console.log(irasIdDataset);
    const filterDataset =
      searchModificationsPage.searchModificationsPageTestData.Search_Modifications_Page[filterDatasetName];
    console.log(filterDataset);
    const irasId = irasIdDataset['iras_id_text']; //modificationId contains irasId
    const chiefInvestigatorName = filterDataset['chief_investigator_name_text'];
    const shortProjectTitle = filterDataset['short_project_title_text'];
    const searchKey = irasId + '/' + chiefInvestigatorName + '/' + shortProjectTitle;
    const searchTerms = searchKey.split('/');
    // const searchTerms = await commonItemsPage.splitSearchTerm(searchKey);
    console.log(searchTerms);
    const modificationsList = await searchModificationsPage.getAllModificationsTheTable();
    const modificationsListAfterSearch: string[] = confirmArrayNotNull(modificationsList.get('searchResultValues'));
    const filteredSearchResults = await commonItemsPage.filterResults(modificationsListAfterSearch, searchTerms);
    expect(filteredSearchResults).toEqual(modificationsListAfterSearch);
    // const searchResult = commonItemsPage.validateSearchResults(modificationsListAfterSearch, irasId);
    const searchResult = await commonItemsPage.validateSearchResultsMultipleWordsSearchKey(
      modificationsListAfterSearch,
      searchTerms
    );
    expect(searchResult).toBeTruthy();
    expect(modificationsListAfterSearch).toHaveLength(searchResult.length);

    const leadNations = filterDataset['lead_nation_checkbox'];
    console.log(leadNations);
    const modificationTypes = filterDataset['modification_type_checkbox'];
    console.log(modificationTypes);
    const modificationIdListAfterSearch: string[] = confirmArrayNotNull(modificationsList.get('modificationIdValues'));
    const searchResultIrasID = commonItemsPage.validateSearchResults(modificationIdListAfterSearch, irasId);
    expect(searchResultIrasID).toBeTruthy();
    const shortProjectTitleListAfterSearch: string[] = confirmArrayNotNull(
      modificationsList.get('shortProjectTitleValues')
    );
    const searchResultShortProjectTitle = commonItemsPage.validateSearchResults(
      shortProjectTitleListAfterSearch,
      shortProjectTitle
    );
    expect(searchResultShortProjectTitle).toBeTruthy();
    const chiefInvestigatorNameListAfterSearch: string[] = confirmArrayNotNull(
      modificationsList.get('chiefInvestigatorNameValues')
    );
    const searchResultChiefInvestigatorName = commonItemsPage.validateSearchResults(
      chiefInvestigatorNameListAfterSearch,
      chiefInvestigatorName
    );
    expect(searchResultChiefInvestigatorName).toBeTruthy();
    // leadNations >> a or b or c or d
    // modificationTypes >> a or b
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
