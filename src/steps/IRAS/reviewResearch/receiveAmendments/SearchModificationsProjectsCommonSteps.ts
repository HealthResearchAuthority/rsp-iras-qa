import { createBdd } from 'playwright-bdd';
import { expect, test } from '../../../../hooks/CustomFixtures';
import { confirmArrayNotNull, confirmStringNotNull } from '../../../../utils/UtilFunctions';
const { When, Then } = createBdd(test);
import config from '../../../../../playwright.config';
import CommonItemsPage from '../../../../pages/Common/CommonItemsPage';
Then(
  'I can now see a table of search results for {string}',
  async ({ searchModificationsPage, commonItemsPage }, resultType: string) => {
    if (resultType === 'modifications received for approval' || resultType === 'project records')
      await expect.soft(searchModificationsPage.results_table).toBeVisible();
    expect.soft(await commonItemsPage.tableBodyRows.count()).toBeGreaterThan(0);
  }
);

Then(
  'I can see the list of {string} is sorted by {string} order of the {string}',
  async (
    { commonItemsPage, modificationsReceivedCommonPage },
    resultType: string,
    sortDirection: string,
    sortField: string
  ) => {
    let sortedList: string[];
    let searchColumnIndex: number;
    let actualList: string[];
    if (resultType === 'modifications received for approval') {
      searchColumnIndex = await modificationsReceivedCommonPage.getModificationColumnIndex(
        'Search_Modifications_Page',
        sortField
      );
    } else if (resultType === 'project records') {
      searchColumnIndex = await modificationsReceivedCommonPage.getProjectRecordColumnIndex(
        'Search_Projects_Page',
        sortField
      );
    }
    if (sortField.toLowerCase() === 'short project title') {
      actualList = await commonItemsPage.getActualListValuesShortProjectTitle(
        commonItemsPage.tableBodyRows,
        searchColumnIndex
      );
    } else {
      actualList = await commonItemsPage.getActualListValues(commonItemsPage.tableBodyRows, searchColumnIndex);
    }
    if (sortField.toLowerCase() === 'modification id') {
      sortedList = await commonItemsPage.sortModificationIdListValues(actualList, sortDirection);
    } else if (sortField.toLowerCase() === 'iras id') {
      sortedList = await commonItemsPage.sortIrasIds(actualList, sortDirection);
    } else if (sortDirection.toLowerCase() === 'ascending') {
      sortedList = [...actualList].toSorted((a, b) => a.localeCompare(b, 'en', { sensitivity: 'base' }));
    } else {
      sortedList = [...actualList].toSorted((a, b) => b.localeCompare(a, 'en', { sensitivity: 'base' }));
    }
    expect.soft(actualList).toEqual(sortedList);
  }
);

When(
  'I capture the iras id of the recently added project with status as {string}',
  async ({ searchProjectsPage, projectOverviewUnfinishedProjectsPage }, status: string) => {
    const iIrasIdText = confirmStringNotNull(await projectOverviewUnfinishedProjectsPage.irasid_text.textContent());
    await searchProjectsPage.saveIrasID(iIrasIdText.replaceAll('IRAS ID: ', ''));
    const statusText = confirmStringNotNull(await projectOverviewUnfinishedProjectsPage.status_text.textContent());
    expect.soft(statusText).toBe(status);
  }
);

When(
  'I capture the iras id of the recently added project with status as {string} from the database',
  async ({ searchProjectsPage }, status: string) => {
    const IrasIdByStatus = await searchProjectsPage.sqlGetIrasIdByStatus(status);
    await searchProjectsPage.saveIrasID(IrasIdByStatus.toString());
  }
);

When(
  'I enter {string} into the search field for {string}',
  async ({ searchModificationsPage, searchProjectsPage }, datasetName: string, pageValue: string) => {
    if (pageValue === 'Search_Modifications_Page') {
      const dataset = searchModificationsPage.searchModificationsPageTestData.Iras_Id[datasetName];
      await searchModificationsPage.iras_id_search_text.fill(dataset['iras_id_text']);
    } else if (pageValue === 'Search_Projects_Page') {
      const dataset = searchProjectsPage.searchProjectsPageTestData.Search_Queries[datasetName];
      await searchModificationsPage.iras_id_search_text.fill(dataset['search_input_text']);
    }
  }
);

When(
  'I select advanced filters in the {string} using {string}',
  async (
    { searchModificationsPage, searchProjectsPage, commonItemsPage, $tags },
    pageName: string,
    filterDatasetName: string
  ) => {
    let dataset: any;
    if (pageName === 'Search_Modifications_Page') {
      dataset = searchModificationsPage.searchModificationsPageTestData.Advanced_Filters[filterDatasetName];
    } else if (pageName === 'Search_Projects_Page') {
      dataset = searchProjectsPage.searchProjectsPageTestData.Advanced_Filters[filterDatasetName];
    }
    const isJsEnabled =
      ($tags.includes('@jsEnabled') || config.projects?.[1].use?.javaScriptEnabled) && !$tags.includes('@jsDisabled');
    for (const key in dataset) {
      if (Object.hasOwn(dataset, key)) {
        await searchModificationsPage.clickFilterChevronModifications(dataset, key, searchModificationsPage);
        if (key === 'sponsor_organisation_text') {
          if (isJsEnabled) {
            await commonItemsPage.selectSponsorOrgJsEnabled(dataset, key, commonItemsPage);
          } else {
            await searchModificationsPage.selectSponsorOrgJsDisabled(dataset, key, commonItemsPage, commonItemsPage);
          }
          delete dataset['sponsor_organisation_jsenabled_text'];
        } else {
          await commonItemsPage.fillUIComponent(dataset, key, searchModificationsPage);
        }
      }
    }
  }
);

// date_submitted, participating nation and sponsor_organisation can't validate from UI,need to validate with Database
Then(
  'the system displays project records based on the search {string} and filter criteria {string}',
  async ({ commonItemsPage, searchProjectsPage }, irasIdDatasetName, filterDatasetName) => {
    const testData = searchProjectsPage.searchProjectsPageTestData;
    const irasId = testData.Search_Queries?.[irasIdDatasetName]?.search_input_text;
    const filterDataset = testData.Advanced_Filters?.[filterDatasetName] || {};
    const { chief_investigator_name_text: ciName, short_project_title_text: projectTitle } = filterDataset;
    const projectsList = await searchProjectsPage.getAllProjectsFromTheTable();
    const searchResults = confirmArrayNotNull(projectsList.get('searchResultValues'));
    const irasIds = confirmArrayNotNull(projectsList.get('irasIdValues'));
    await searchProjectsPage.setIrasIdListAfterSearch(irasIds);

    const validateCombinedSearchTerms = async (
      searchResults: string[],
      searchTerms: string[],
      commonItemsPage: CommonItemsPage
    ) => {
      const filteredResults = await commonItemsPage.filterResults(searchResults, searchTerms);
      expect.soft(filteredResults).toEqual(searchResults);
      const validatedResults = await commonItemsPage.validateSearchResultsMultipleWordsSearchKey(
        searchResults,
        searchTerms
      );
      expect.soft(validatedResults).toBeTruthy();
      expect.soft(searchResults).toHaveLength(validatedResults.length);
    };

    const validateSingleFieldMatch = async (
      modificationsList: Map<string, string[]>,
      fieldKey: string,
      searchTerm: string,
      commonItemsPage: CommonItemsPage
    ) => {
      const values = confirmArrayNotNull(modificationsList.get(fieldKey));
      const match = await commonItemsPage.validateSearchResults(values, searchTerm);
      expect.soft(match).toBeTruthy();
    };

    const validateFilterMatch = async (
      modificationsList: Map<string, string[]>,
      fieldKey: string,
      allowedValues: string[],
      commonItemsPage: CommonItemsPage
    ) => {
      const values = confirmArrayNotNull(modificationsList.get(fieldKey));
      const isValid = await commonItemsPage.areSearchResultsValid(values, allowedValues);
      expect.soft(isValid).toBeTruthy();
    };

    if (searchResults.length !== 0) {
      // Combined search validation
      const searchTerms = [irasId, ciName, projectTitle].filter(Boolean);
      if (searchTerms.length > 1) {
        await validateCombinedSearchTerms(searchResults, searchTerms, commonItemsPage);
      }
      // Individual search field validations
      if (irasId) {
        await validateSingleFieldMatch(projectsList, 'irasIdValues', irasId, commonItemsPage);
      }
      if (projectTitle) {
        await validateSingleFieldMatch(projectsList, 'shortProjectTitleValues', projectTitle, commonItemsPage);
      }
      // Filter validations
      const allowedLeadNations = filterDataset['lead_nation_checkbox'];
      if (allowedLeadNations) {
        await validateFilterMatch(projectsList, 'leadNationValues', allowedLeadNations, commonItemsPage);
      }
    } else {
      throw new Error(`Expected Search Results but No Search Results are Displayed`);
    }
  }
);
