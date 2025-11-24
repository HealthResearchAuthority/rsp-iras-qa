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
  'I capture the iras id and short project title of the recently added project with status as {string} from the database',
  async ({ searchProjectsPage }, status: string) => {
    const result = await searchProjectsPage.sqlGetIrasIdShortProjectTitleByStatus(status);
    const { IrasId, ShortProjectTitle } = result[0];
    await searchProjectsPage.saveIrasIDShortProjectTitle(IrasId.toString(), ShortProjectTitle.toString());
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

// Chief investigator name, participating nation and sponsor_organisation can't validate from UI,need to validate with Database
Then(
  'the system displays project records based on the search {string} and filter criteria {string}',
  async ({ commonItemsPage, searchProjectsPage }, irasIdDatasetName, filterDatasetName) => {
    const testData = searchProjectsPage.searchProjectsPageTestData;
    const irasId = testData.Search_Queries?.[irasIdDatasetName]?.search_input_text;
    const filterDataset = testData.Advanced_Filters?.[filterDatasetName] || {};
    const { short_project_title_text: projectTitle } = filterDataset;
    const totalPagesCount = await commonItemsPage.getTotalPages();
    const projectsList = await searchProjectsPage.getAllProjectsFromTheTable(totalPagesCount);
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

    if (searchResults.length > 0) {
      // Combined search validation
      const searchTerms = [irasId, projectTitle].filter(Boolean);
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
      await expect.soft(commonItemsPage.tableRows).not.toBeVisible();
      await expect
        .soft(commonItemsPage.search_results_count)
        .toHaveText(commonItemsPage.searchFilterResultsData.search_no_results_count);
      await expect.soft(commonItemsPage.search_no_results_container).toBeVisible();
      await expect.soft(commonItemsPage.search_no_results_header).toBeVisible();
      await expect.soft(commonItemsPage.search_no_results_guidance_text).toBeVisible();
      await expect.soft(commonItemsPage.search_no_results_guidance_points).toBeVisible();
      const actualBulletPoints = commonItemsPage.search_no_results_guidance_points.getByRole('listitem');
      await expect
        .soft(actualBulletPoints)
        .toHaveText(commonItemsPage.searchFilterResultsData.search_no_results_guidance_points);
    }
  }
);

Then(
  'The search projects page returns to its original empty state with no results displayed',
  async ({ commonItemsPage, searchProjectsPage }) => {
    await expect.soft(searchProjectsPage.page_heading).toBeVisible();
    await expect.soft(searchProjectsPage.page_guidance_text).toBeVisible();
    await expect.soft(commonItemsPage.advanced_filter_chevron).toBeVisible();
    await expect.soft(searchProjectsPage.results_table).not.toBeVisible();
    await expect.soft(commonItemsPage.search_no_results_container).not.toBeVisible();
  }
);

When(
  'I expand the chevrons for {string} in {string}',
  async ({ searchModificationsPage, searchProjectsPage }, filterDatasetName: string, pageName: string) => {
    let dataset: any;
    if (pageName === 'Search_Modifications_Page') {
      dataset = searchModificationsPage.searchModificationsPageTestData.Advanced_Filters[filterDatasetName];
    } else if (pageName === 'Search_Projects_Page') {
      dataset = searchProjectsPage.searchProjectsPageTestData.Advanced_Filters[filterDatasetName];
    }
    for (const key in dataset) {
      if (Object.hasOwn(dataset, key)) {
        await searchModificationsPage.clickFilterChevronModifications(dataset, key, searchModificationsPage);
      }
    }
  }
);

Then(
  'the result count displayed at the top accurately reflects the number of records shown in the search {string} page',
  async ({ commonItemsPage, searchModificationsPage }, recordType: string) => {
    if (recordType === 'modifications' || recordType === 'projects') {
      const rowCount = await searchModificationsPage.tableRows.count();
      const totalPagesCount = await commonItemsPage.getTotalPages();
      let expectedResultCount: number;
      if (totalPagesCount > 0) {
        expectedResultCount = (totalPagesCount - 1) * 20 + (rowCount - 1);
      } else if (totalPagesCount == 0) {
        if (rowCount > 0) {
          expectedResultCount = rowCount - 1;
        } else {
          expectedResultCount = rowCount;
        }
      }
      const expectedResultCountLabel = await searchModificationsPage.getExpectedResultsCountLabel(
        commonItemsPage,
        expectedResultCount
      );
      const actualResultCountLabel = await searchModificationsPage.getActualResultsCountLabel(commonItemsPage);
      expect.soft(expectedResultCountLabel).toEqual(actualResultCountLabel);
    }
  }
);

Then(
  'I can see the {string} ui labels in {string}',
  async ({ searchModificationsPage, searchProjectsPage }, datasetName: string, pageName: string) => {
    let dataset: any;
    if (pageName === 'Search_Modifications_Page') {
      dataset = searchModificationsPage.searchModificationsPageTestData.Search_Modifications_Page[datasetName];
    } else if (pageName === 'Search_Projects_Page') {
      dataset = searchProjectsPage.searchProjectsPageTestData.Search_Projects_Page[datasetName];
    }
    for (const key in dataset) {
      if (Object.hasOwn(dataset, key)) {
        await expect.soft(searchModificationsPage[key].getByText(dataset[key])).toBeVisible();
      }
    }
  }
);
