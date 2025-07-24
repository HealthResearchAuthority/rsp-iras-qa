import { createBdd } from 'playwright-bdd';
import { expect, test } from '../../../../hooks/CustomFixtures';
import { confirmArrayNotNull, confirmStringNotNull, sortArray } from '../../../../utils/UtilFunctions';
import config from '../../../../../playwright.config';
const { When, Then } = createBdd(test);

When(
  'I enter {string} into the search field for search modifications page',
  async ({ searchModificationsPage }, datasetName: string) => {
    const dataset = searchModificationsPage.searchModificationsPageTestData.Iras_Id[datasetName];
    await searchModificationsPage.iras_id_search_text.fill(dataset['iras_id_text']);
    //  await commonItemsPage.iras_id_search_text.fill(dataset['iras_id_text']);
    // if (inputType.startsWith('Valid_Iras_Id') || inputType.startsWith('Invalid_Iras_Id')) {
    //   searchValue = searchModificationsPage.searchModificationsPageTestData.Search_Modifications_Page[inputType];
    //   await commonItemsPage.iras_id_search_text.fill(searchValue['iras_id_text']);
    // }
  }
);

When(
  'I select advanced filters in the search modifications page using {string}',
  async ({ searchModificationsPage, commonItemsPage, $tags }, filterDatasetName: string) => {
    const dataset = searchModificationsPage.searchModificationsPageTestData.Advanced_Filters[filterDatasetName];
    // I open the list of filters by clicking the Advanced Filter chevron,if not opened by default (for handling JS Enabled and Disabled)
    await searchModificationsPage.clickAdvancedFilterChevron();
    for (const key in dataset) {
      if (Object.prototype.hasOwnProperty.call(dataset, key)) {
        // I open each filter one by one by clicking the corresponding Filter chevron,if not opened by default (for handling JS Enabled and Disabled)
        await searchModificationsPage.clickFilterChevron(dataset, key, searchModificationsPage);
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
            await searchModificationsPage.sponsor_organisation_jsdisabled_search_button.click();
            if (dataset[key] !== '') {
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

When(
  'I open advanced filter and each filter one by one by clicking the corresponding filter chevron,if not opened by default using {string}',
  async ({ searchModificationsPage }, filterDatasetName: string) => {
    const dataset = searchModificationsPage.searchModificationsPageTestData.Advanced_Filters[filterDatasetName];
    // await searchModificationsPage.clickAdvancedFilterChevron();
    for (const key in dataset) {
      if (Object.prototype.hasOwnProperty.call(dataset, key)) {
        await searchModificationsPage.clickFilterChevron(dataset, key, searchModificationsPage);
      }
    }
  }
);

// Then(
//   'I can see the selected filters {string} are displayed under active filters for search modifications page',
//   async ({ searchModificationsPage, commonItemsPage }, filterDatasetName: string) => {
//     const dataset = searchModificationsPage.searchModificationsPageTestData.Advanced_Filters[filterDatasetName];
//     for (const key in dataset) {
//       if (Object.prototype.hasOwnProperty.call(dataset, key)) {
//         if (key === 'country_checkbox') {
//           for (const filterLabel of dataset[key]) {
//             const activeLabel =
//               manageReviewBodiesPage.manageReviewBodiesPageData.Manage_Review_Body_Page.country_advanced_filter_label +
//               ': ' +
//               filterLabel;
//             await expect(commonItemsPage.advanced_filter_active_filters_label.getByText(activeLabel)).toBeVisible();
//           }
//         } else if (key === 'status_radio') {
//           const activeLabel =
//             manageReviewBodiesPage.manageReviewBodiesPageData.Manage_Review_Body_Page.status_advanced_filter_label +
//             ': ' +
//             dataset[key];
//           await expect(commonItemsPage.advanced_filter_active_filters_label.getByText(activeLabel)).toBeVisible();
//         }
//       }
//     }
//   }
// );

Then(
  'I can see the selected filters {string} are displayed under active filters',
  async ({ searchModificationsPage }, filterDatasetName: string) => {
    let activeCheckboxFiltersMap: { get: (arg0: string) => any };
    let activeFiltersMap;
    let filterCheckboxValuesExpected;
    let filterValuesExpected;
    const dataset = searchModificationsPage.searchModificationsPageTestData.Advanced_Filters[filterDatasetName];
    const datasetLabels = searchModificationsPage.searchModificationsPageTestData.Search_Modifications_Page;
    for (const key in dataset) {
      if (Object.prototype.hasOwnProperty.call(dataset, key)) {
        if (key.endsWith('_checkbox')) {
          activeCheckboxFiltersMap = await searchModificationsPage.getActiveFiltersCheckboxLabels(
            dataset,
            datasetLabels
          );
          filterCheckboxValuesExpected = activeCheckboxFiltersMap.get('multiSelectFilter');
        } else {
          activeFiltersMap = await searchModificationsPage.getActiveFiltersLabels(dataset, datasetLabels);
          filterValuesExpected = activeFiltersMap.get('singleSelectFilter');
        }
      }
    }
    const fieldValActual: string[] = await searchModificationsPage.getSelectedFilterValues();
    if (filterValuesExpected !== undefined && filterCheckboxValuesExpected !== undefined) {
      const expectedFilterValues =
        filterValuesExpected.flat().join(', ') + ', ' + filterCheckboxValuesExpected.flat().join(', ');
      const actualFilterValues = fieldValActual.flat().join(', ');
      expect(actualFilterValues).toEqual(expectedFilterValues);
    } else if (filterValuesExpected !== undefined && filterCheckboxValuesExpected === undefined) {
      const expectedFilterValues = filterValuesExpected.flat().join(', ');
      const actualFilterValues = fieldValActual.flat().join(', ');
      expect(actualFilterValues).toEqual(expectedFilterValues);
    } else if (filterValuesExpected === undefined && filterCheckboxValuesExpected !== undefined) {
      const expectedFilterValues = filterCheckboxValuesExpected.flat().join(', ');
      const actualFilterValues = fieldValActual.flat().join(', ');
      expect(actualFilterValues).toEqual(expectedFilterValues);
    }
  }
);

// Then(
//   'I remove the {string} from the active filters',
//   async ({ searchModificationsPage }, removeFilterDatasetName: string) => {
//     let activeCheckboxFiltersMap: { get: (arg0: string) => any };
//     let activeFiltersMap: any;
//     let filterCheckboxValuesExpected: any;
//     let filterValuesExpected: any;
//     const expectedFilterValues: string[] = [];
//     let removedFilterValues: string[] = [];
//     const dataset = searchModificationsPage.searchModificationsPageTestData.Advanced_Filters[removeFilterDatasetName];
//     const datasetLabels = searchModificationsPage.searchModificationsPageTestData.Search_Modifications_Page;
//     for (const key in dataset) {
//       if (Object.prototype.hasOwnProperty.call(dataset, key)) {
//         if (key.endsWith('_checkbox')) {
//           activeCheckboxFiltersMap = await searchModificationsPage.getActiveFiltersCheckboxLabels(
//             dataset,
//             datasetLabels
//           );
//           filterCheckboxValuesExpected = activeCheckboxFiltersMap.get('multiSelectFilter');
//           const checkboxValues = filterCheckboxValuesExpected.flat().map((item: string) => item.trim());
//           expectedFilterValues.push(...checkboxValues);
//         } else {
//           activeFiltersMap = await searchModificationsPage.getActiveFiltersLabels(dataset, datasetLabels);
//           filterValuesExpected = activeFiltersMap.get('singleSelectFilter');
//           const singleSelectValues = filterValuesExpected.flat().map((item: string) => item.trim());
//           expectedFilterValues.push(...singleSelectValues);
//         }
//       }
//     }

//     // Remove duplicates
//     const uniqueExpectedFilterValues = [...new Set(expectedFilterValues)];
//     removedFilterValues = await searchModificationsPage.removeSelectedFilterValues(uniqueExpectedFilterValues);
//     const fieldValActualAfterRemoval: string[] = await searchModificationsPage.getSelectedFilterValues();
//     const actualFilterValuesAfterRemoval = fieldValActualAfterRemoval.flat().join(', ');
//     for (let i = 0; i < removedFilterValues.length; i++) {
//       expect(actualFilterValuesAfterRemoval).not.toContain(removedFilterValues[i]);
//     }
//   }
// );

Then(
  'I remove the {string} from the active filters',
  async ({ searchModificationsPage }, removeFilterDatasetName: string) => {
    let activeCheckboxFiltersMap: { get: (arg0: string) => any };
    let activeFiltersMap: any;
    let filterCheckboxValuesExpected: any;
    let filterValuesExpected: any;
    const expectedFilterValues: string[] = [];
    let removedFilterValues: string[] = [];
    const dataset = searchModificationsPage.searchModificationsPageTestData.Advanced_Filters[removeFilterDatasetName];
    const datasetLabels = searchModificationsPage.searchModificationsPageTestData.Search_Modifications_Page;
    const seen = new Set<string>();
    for (const key in dataset) {
      if (Object.prototype.hasOwnProperty.call(dataset, key)) {
        if (key.endsWith('_checkbox')) {
          activeCheckboxFiltersMap = await searchModificationsPage.getActiveFiltersCheckboxLabels(
            dataset,
            datasetLabels
          );
          filterCheckboxValuesExpected = activeCheckboxFiltersMap.get('multiSelectFilter');
          const checkboxValues = filterCheckboxValuesExpected.flat().map((item: string) => item.trim());
          checkboxValues.forEach((val: string) => {
            if (!seen.has(val)) {
              seen.add(val);
              expectedFilterValues.push(val);
            }
          });
        } else {
          activeFiltersMap = await searchModificationsPage.getActiveFiltersLabels(dataset, datasetLabels);
          filterValuesExpected = activeFiltersMap.get('singleSelectFilter');
          const singleSelectValues = filterValuesExpected.flat().map((item: string) => item.trim());
          singleSelectValues.forEach((val: string) => {
            if (!seen.has(val)) {
              seen.add(val);
              expectedFilterValues.push(val);
            }
          });
        }
      }
    }
    removedFilterValues = await searchModificationsPage.removeSelectedFilterValues(expectedFilterValues);
    const fieldValActualAfterRemoval: string[] = await searchModificationsPage.getSelectedFilterValues();
    const actualFilterValuesAfterRemoval = fieldValActualAfterRemoval.flat().join(', ');
    for (let i = 0; i < removedFilterValues.length; i++) {
      expect(actualFilterValuesAfterRemoval).not.toContain(removedFilterValues[i]);
    }
  }
);

// date_modification_submitted and sponsor_organisation can't validate from UI,need to validate with Database
Then(
  'the system displays modification records matching the search {string} and filter criteria {string}',
  async ({ commonItemsPage, searchModificationsPage }, irasIdDatasetName: string, filterDatasetName: string) => {
    const irasIdDataset = searchModificationsPage.searchModificationsPageTestData.Iras_Id[irasIdDatasetName];
    const filterDataset = searchModificationsPage.searchModificationsPageTestData.Advanced_Filters[filterDatasetName];
    const irasId = irasIdDataset['iras_id_text'];
    const chiefInvestigatorName = filterDataset['chief_investigator_name_text'];
    const shortProjectTitle = filterDataset['short_project_title_text'];
    let searchTerms: string[] = [];
    const modificationsList = await searchModificationsPage.getAllModificationsTheTable();
    const modificationsListAfterSearch: string[] = confirmArrayNotNull(modificationsList.get('searchResultValues'));
    const expectedResultCount =
      searchModificationsPage.searchModificationsPageTestData.Search_Modifications_Page.result_count_heading;
    const actualResultCount = confirmStringNotNull(await searchModificationsPage.result_count.textContent());
    expect(modificationsListAfterSearch.length + expectedResultCount).toBe(actualResultCount);
    if (irasId !== undefined && chiefInvestigatorName !== undefined && shortProjectTitle !== undefined) {
      const searchKey = irasId + '/' + chiefInvestigatorName + '/' + shortProjectTitle;
      searchTerms = searchKey.split('/');

      const filteredSearchResults = await commonItemsPage.filterResults(modificationsListAfterSearch, searchTerms);
      expect(filteredSearchResults).toEqual(modificationsListAfterSearch);
      const searchResult = await commonItemsPage.validateSearchResultsMultipleWordsSearchKey(
        modificationsListAfterSearch,
        searchTerms
      );
      expect(searchResult).toBeTruthy();
      expect(modificationsListAfterSearch).toHaveLength(searchResult.length);
    }
    const modificationIdListAfterSearch: string[] = confirmArrayNotNull(modificationsList.get('modificationIdValues'));
    await searchModificationsPage.setModificationIdListAfterSearch(modificationIdListAfterSearch);
    if (irasId !== undefined) {
      const searchResultIrasID = commonItemsPage.validateSearchResults(modificationIdListAfterSearch, irasId);
      expect(searchResultIrasID).toBeTruthy();
    }
    if (shortProjectTitle !== undefined) {
      const shortProjectTitleListAfterSearch: string[] = confirmArrayNotNull(
        modificationsList.get('shortProjectTitleValues')
      );
      const searchResultShortProjectTitle = commonItemsPage.validateSearchResults(
        shortProjectTitleListAfterSearch,
        shortProjectTitle
      );
      expect(searchResultShortProjectTitle).toBeTruthy();
    }
    if (chiefInvestigatorName !== undefined) {
      const chiefInvestigatorNameListAfterSearch: string[] = confirmArrayNotNull(
        modificationsList.get('chiefInvestigatorNameValues')
      );
      const searchTermsChiefInvestigatorName = await commonItemsPage.splitSearchTerm(chiefInvestigatorName);
      const searchResultChiefInvestigatorName = await commonItemsPage.validateSearchResultsMultipleWordsSearchKey(
        chiefInvestigatorNameListAfterSearch,
        searchTermsChiefInvestigatorName
      );
      expect(searchResultChiefInvestigatorName).toBeTruthy();
      expect(chiefInvestigatorNameListAfterSearch).toHaveLength(searchResultChiefInvestigatorName.length);
    }

    const modificationTypes: string[] = filterDataset['modification_type_checkbox'];
    if (modificationTypes !== undefined) {
      const modificationTypeListAfterSearch: string[] = confirmArrayNotNull(
        modificationsList.get('modificationTypeValues')
      );
      for (let i = 0; i < modificationTypes.length; i++) {
        const modificationTypesSearchResult = await commonItemsPage.validateSearchResults(
          modificationTypeListAfterSearch,
          modificationTypes[i]
        );
        expect(modificationTypesSearchResult).toBeTruthy();
      }
    }
    const leadNations: string[] = filterDataset['lead_nation_checkbox'];
    if (leadNations !== undefined) {
      const leadNationValuesAfterSearch: string[] = confirmArrayNotNull(modificationsList.get('leadNationValues'));
      for (let i = 0; i < leadNations.length; i++) {
        const leadNationValuesSearchResult = commonItemsPage.validateSearchResults(
          leadNationValuesAfterSearch,
          leadNations[i]
        );
        expect(leadNationValuesSearchResult).toBeTruthy();
      }
    }
  }
);

Then(
  'the system displays modification records matching the search criteria of {string}',
  async ({ commonItemsPage, searchModificationsPage }, irasIdDatasetName: string) => {
    const irasIdDataset = searchModificationsPage.searchModificationsPageTestData.Iras_Id[irasIdDatasetName];
    const irasId = irasIdDataset['iras_id_text'];
    const modificationsList = await searchModificationsPage.getAllModificationsTheTable();
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
  'the system displays modification records matching the filter criteria of {string}',
  async ({ commonItemsPage, searchModificationsPage }, filterDatasetName: string) => {
    const filterDataset = searchModificationsPage.searchModificationsPageTestData.Advanced_Filters[filterDatasetName];
    const chiefInvestigatorName = filterDataset['chief_investigator_name_text'];
    const shortProjectTitle = filterDataset['short_project_title_text'];
    let searchTerms: string[] = [];
    const modificationsList = await searchModificationsPage.getAllModificationsTheTable();
    const modificationsListAfterSearch: string[] = confirmArrayNotNull(modificationsList.get('searchResultValues'));
    const expectedResultCount =
      searchModificationsPage.searchModificationsPageTestData.Search_Modifications_Page.result_count_heading;
    const actualResultCount = confirmStringNotNull(await searchModificationsPage.result_count.textContent());
    expect(modificationsListAfterSearch.length + expectedResultCount).toBe(actualResultCount);
    if (chiefInvestigatorName !== undefined && shortProjectTitle !== undefined) {
      const searchKey = chiefInvestigatorName + '/' + shortProjectTitle;
      searchTerms = searchKey.split('/');
      const filteredSearchResults = await commonItemsPage.filterResults(modificationsListAfterSearch, searchTerms);
      expect(filteredSearchResults).toEqual(modificationsListAfterSearch);
      const searchResult = await commonItemsPage.validateSearchResultsMultipleWordsSearchKey(
        modificationsListAfterSearch,
        searchTerms
      );
      expect(searchResult).toBeTruthy();
      expect(modificationsListAfterSearch).toHaveLength(searchResult.length);
    }
    const modificationIdListAfterSearch: string[] = confirmArrayNotNull(modificationsList.get('modificationIdValues'));
    await searchModificationsPage.setModificationIdListAfterSearch(modificationIdListAfterSearch);
    if (shortProjectTitle !== undefined) {
      const shortProjectTitleListAfterSearch: string[] = confirmArrayNotNull(
        modificationsList.get('shortProjectTitleValues')
      );
      const searchResultShortProjectTitle = commonItemsPage.validateSearchResults(
        shortProjectTitleListAfterSearch,
        shortProjectTitle
      );
      expect(searchResultShortProjectTitle).toBeTruthy();
    }
    if (chiefInvestigatorName !== undefined) {
      const chiefInvestigatorNameListAfterSearch: string[] = confirmArrayNotNull(
        modificationsList.get('chiefInvestigatorNameValues')
      );
      const searchTermsChiefInvestigatorName = await commonItemsPage.splitSearchTerm(chiefInvestigatorName);
      const searchResultChiefInvestigatorName = await commonItemsPage.validateSearchResultsMultipleWordsSearchKey(
        chiefInvestigatorNameListAfterSearch,
        searchTermsChiefInvestigatorName
      );
      expect(searchResultChiefInvestigatorName).toBeTruthy();
      expect(chiefInvestigatorNameListAfterSearch).toHaveLength(searchResultChiefInvestigatorName.length);
    }
    const modificationTypes: string[] = filterDataset['modification_type_checkbox'];
    if (modificationTypes !== undefined) {
      const modificationTypeListAfterSearch: string[] = confirmArrayNotNull(
        modificationsList.get('modificationTypeValues')
      );
      const foundExpectedModificationsModificationTypes = modificationTypes.filter((expected) =>
        modificationTypeListAfterSearch.some((result) => result.toLowerCase().includes(expected.toLowerCase()))
      );
      expect(foundExpectedModificationsModificationTypes.length).toBeGreaterThan(0);
    }
    const leadNations: string[] = filterDataset['lead_nation_checkbox'];
    if (leadNations !== undefined) {
      const leadNationValuesAfterSearch: string[] = confirmArrayNotNull(modificationsList.get('leadNationValues'));
      const foundExpectedModificationsLeadNations = leadNations.filter((expected) =>
        leadNationValuesAfterSearch.some((result) => result.toLowerCase().includes(expected.toLowerCase()))
      );
      expect(foundExpectedModificationsLeadNations.length).toBeGreaterThan(0);
    }
  }
);

Then(
  'I can see the list is sorted by default in the descending order of the {string}',
  async ({ searchModificationsPage }, sortField: string) => {
    let actualList: string[];
    switch (sortField.toLowerCase()) {
      case 'modification id':
        actualList = await searchModificationsPage.getModificationIdListAfterSearch();
        break;
      default:
        throw new Error(`${sortField} is not a valid option`);
    }
    const normalizedList = actualList.map((id) => {
      const [prefix, suffix] = id.split('/');
      return `${prefix.padStart(10, '0')}/${suffix.padStart(4, '0')}`;
    });
    const sortedDescending = [...normalizedList].sort((a, b) => b.localeCompare(a, 'en', { sensitivity: 'base' }));
    expect.soft(normalizedList).toEqual(sortedDescending);
  }
);

Then(
  'I type valid {string} for sponsor organisation suggestion box in advanced filters and validate the suggestion list along with {string}',
  async (
    { searchModificationsPage, rtsPage, commonItemsPage },
    sponsorOrganisationDatasetName: string,
    suggestionCommonDatasetName
  ) => {
    const dataset =
      searchModificationsPage.searchModificationsPageTestData.Sponsor_Organisation[sponsorOrganisationDatasetName];
    const suggestionHeadersDatasetName =
      searchModificationsPage.searchModificationsPageTestData.Search_Modifications_Page[suggestionCommonDatasetName];
    let sponsorOrganisationNameListExpected = await sortArray(rtsPage.rtsResponseList);
    if (sponsorOrganisationNameListExpected.length > 5) {
      sponsorOrganisationNameListExpected = sponsorOrganisationNameListExpected.slice(0, 5);
    }
    dataset['sponsor_organisation_jsenabled_text'] = dataset['sponsor_organisation_text'];
    await commonItemsPage.fillUIComponent(dataset, 'sponsor_organisation_jsenabled_text', searchModificationsPage);
    await searchModificationsPage.page.waitForTimeout(2000);
    const sponsorOrganisationNameListActual =
      await searchModificationsPage.sponsor_organisation_suggestion_list_labels.allTextContents();
    expect(sponsorOrganisationNameListActual).toEqual(sponsorOrganisationNameListExpected);
    const suggestionsHeaderLabelActual = await searchModificationsPage.sponsor_organisation_suggestion_listbox
      .first()
      .getAttribute('data-before-suggestions');
    const suggestionsHeaderLabelExpected = suggestionHeadersDatasetName.suggestion_header;
    expect(suggestionsHeaderLabelActual).toEqual(suggestionsHeaderLabelExpected);
    const suggestionsFooterLabelActual = await searchModificationsPage.sponsor_organisation_suggestion_listbox
      .first()
      .getAttribute('data-after-suggestions');
    const suggestionsFooterLabelExpected = suggestionHeadersDatasetName.suggestion_footer;
    expect(suggestionsFooterLabelActual).toEqual(suggestionsFooterLabelExpected);
  }
);

Then(
  'I type invalid {string} for sponsor organisation suggestion box in advanced filters and validate the suggestion list along with {string}',
  async ({ searchModificationsPage }, sponsorOrganisationDatasetName: string, suggestionCommonDatasetName) => {
    const dataset =
      searchModificationsPage.searchModificationsPageTestData.Sponsor_Organisation[sponsorOrganisationDatasetName];
    const suggestionHeadersDatasetName =
      searchModificationsPage.searchModificationsPageTestData.Search_Modifications_Page[suggestionCommonDatasetName];
    await searchModificationsPage.sponsor_organisation_jsenabled_text.fill(dataset['sponsor_organisation_text']);
    await searchModificationsPage.page.waitForTimeout(2000);
    const noResultFoundSuggestionActual = await searchModificationsPage.sponsor_organisation_suggestion_list_labels
      .first()
      .textContent();
    const suggestionsHeaderLabelExpected = suggestionHeadersDatasetName.no_suggestion_found;
    expect(noResultFoundSuggestionActual).toEqual(suggestionsHeaderLabelExpected);
  }
);

Then(
  'I type min characters {string} for sponsor organisation suggestion box in advanced filters and validate the suggestion list along with {string}',
  async ({ searchModificationsPage }, sponsorOrganisationDatasetName: string, suggestionCommonDatasetName) => {
    const dataset =
      searchModificationsPage.searchModificationsPageTestData.Sponsor_Organisation[sponsorOrganisationDatasetName];
    const suggestionHeadersDatasetName =
      searchModificationsPage.searchModificationsPageTestData.Search_Modifications_Page[suggestionCommonDatasetName];
    await searchModificationsPage.sponsor_organisation_jsenabled_text.fill(dataset['sponsor_organisation_text']);
    await searchModificationsPage.page.waitForTimeout(2000);
    const continueEnteringSuggestionActual = await searchModificationsPage.sponsor_organisation_suggestion_listbox
      .first()
      .getAttribute('data-before-suggestions');
    const suggestionsHeaderLabelExpected = suggestionHeadersDatasetName.suggestion_footer;
    expect(continueEnteringSuggestionActual).toEqual(suggestionsHeaderLabelExpected);
  }
);

Then(
  'With javascript disabled, I search with valid {string} for sponsor organisation search box in advanced filters and validate the search results along with {string}',
  async ({ searchModificationsPage, rtsPage }, sponsorOrganisationDatasetName: string, searchHintsDatasetName) => {
    const dataset =
      searchModificationsPage.searchModificationsPageTestData.Sponsor_Organisation[sponsorOrganisationDatasetName];
    const searchHintDataset =
      searchModificationsPage.searchModificationsPageTestData.Search_Modifications_Page[searchHintsDatasetName];
    let sponsorOrganisationNameListExpected = await sortArray(rtsPage.rtsResponseList);
    const totalMatchingSponsorOrganisations = sponsorOrganisationNameListExpected.length;
    if (sponsorOrganisationNameListExpected.length > 5) {
      sponsorOrganisationNameListExpected = sponsorOrganisationNameListExpected.slice(0, 5);
    }
    await searchModificationsPage.sponsor_organisation_text.fill(dataset['sponsor_organisation_text']);
    await searchModificationsPage.sponsor_organisation_jsdisabled_search_button.click();
    const sponsorOrganisationNameListActualWithSpaces =
      await searchModificationsPage.sponsor_organisation_jsdisabled_search_results_labels.allTextContents();
    const sponsorOrganisationNameListActual = sponsorOrganisationNameListActualWithSpaces.map((str) => str.trim());
    expect(sponsorOrganisationNameListActual).toEqual(sponsorOrganisationNameListExpected);
    const searchResultHeaderHintLabelActual = confirmStringNotNull(
      await searchModificationsPage.sponsor_organisation_jsdisabled_result_hint_label.textContent()
    ).trim();
    const searchResultHeaderHintLabelExpected = `${searchHintDataset.search_hint_header_prefix} '${dataset['sponsor_organisation_text']}'`;
    expect(searchResultHeaderHintLabelActual).toEqual(searchResultHeaderHintLabelExpected);
    if (totalMatchingSponsorOrganisations > 5) {
      const searchResultFooterHintLabelActual = confirmStringNotNull(
        await searchModificationsPage.sponsor_organisation_jsdisabled_narrow_down_label.textContent()
      ).trim();
      const searchResultFooterHintLabelExpected = `${totalMatchingSponsorOrganisations} ${searchHintDataset.search_hint_footer_prefix} '${dataset['sponsor_organisation_text']}'${searchHintDataset.search_hint_footer}`;
      expect.soft(searchResultFooterHintLabelActual).toEqual(searchResultFooterHintLabelExpected);
    }
  }
);

Then(
  'With javascript disabled, I search with invalid {string} for sponsor organisation search box in advanced filters and validate the search results along with {string}',
  async ({ searchModificationsPage }, sponsorOrganisationDatasetName: string, searchHintsDatasetName) => {
    const dataset =
      searchModificationsPage.searchModificationsPageTestData.Sponsor_Organisation[sponsorOrganisationDatasetName];
    const searchHintDataset =
      searchModificationsPage.searchModificationsPageTestData.Search_Modifications_Page[searchHintsDatasetName];
    await searchModificationsPage.sponsor_organisation_text.fill(dataset['sponsor_organisation_text']);
    await searchModificationsPage.sponsor_organisation_jsdisabled_search_button.click();
    const noResultFoundLabelActual = confirmStringNotNull(
      await searchModificationsPage.sponsor_organisation_jsdisabled_no_suggestions_label.textContent()
    ).trim();
    const noResultFoundLabelExpected = `${searchHintDataset.no_suggestion_found} ${dataset['sponsor_organisation_text']}`;
    expect(noResultFoundLabelActual).toEqual(noResultFoundLabelExpected);
  }
);

Then(
  'With javascript disabled, I search with invalid min characters {string} for sponsor organisation search box in advanced filters',
  async ({ searchModificationsPage }, sponsorOrganisationDatasetName: string) => {
    const dataset =
      searchModificationsPage.searchModificationsPageTestData.Sponsor_Organisation[sponsorOrganisationDatasetName];
    await searchModificationsPage.sponsor_organisation_text.fill(dataset['sponsor_organisation_text']);
    await searchModificationsPage.sponsor_organisation_jsdisabled_search_button.click();
  }
);

Then(
  'I validate {string} displayed on {string} in advanced filters',
  async ({ searchModificationsPage }, errorMessageFieldAndSummaryDatasetName: string, pageKey: string) => {
    let errorMessageFieldDataset: any;
    let page: any;
    if (pageKey === 'Search_Modifications_Page') {
      errorMessageFieldDataset =
        searchModificationsPage.searchModificationsPageTestData.Search_Modifications_Page[
          errorMessageFieldAndSummaryDatasetName
        ];
      page = searchModificationsPage;
    }
    if (errorMessageFieldAndSummaryDatasetName === 'Field_Error_Date_Modification_Submitted') {
      for (const key in errorMessageFieldDataset) {
        if (Object.prototype.hasOwnProperty.call(errorMessageFieldDataset, key)) {
          const fieldErrorMessagesActualValues = await page.date_modification_submitted_to_date_error.textContent();
          expect(fieldErrorMessagesActualValues).toEqual(errorMessageFieldDataset[key]);
        }
      }
    } else if (errorMessageFieldAndSummaryDatasetName === 'Field_Error_Sponsor_Organisation') {
      for (const key in errorMessageFieldDataset) {
        if (Object.prototype.hasOwnProperty.call(errorMessageFieldDataset, key)) {
          const fieldErrorMessagesActualValues =
            await page.sponsor_organisation_jsdisabled_min_error_message.textContent();
          expect(fieldErrorMessagesActualValues).toEqual(errorMessageFieldDataset[key]);
        }
      }
    }
  }
);

Then(
  'I can see an empty state that informs me no modifications exist for the search criteria',
  async ({ commonItemsPage, searchModificationsPage }) => {
    await expect(searchModificationsPage.page_heading).toBeVisible();
    await expect(searchModificationsPage.page_guidance_text).toBeVisible();
    await expect(searchModificationsPage.advanced_filter_chevron).toBeVisible();
    expect(await searchModificationsPage.page.title()).toBe(
      searchModificationsPage.searchModificationsPageTestData.Search_Modifications_Page.title
    );
    expect(await commonItemsPage.tableRows.count()).toBe(0);
    const expectedResultCount =
      searchModificationsPage.searchModificationsPageTestData.Search_Modifications_Page.result_count_heading;
    const actualResultCount = confirmStringNotNull(await searchModificationsPage.result_count.textContent());
    expect('0' + expectedResultCount).toBe(actualResultCount);
    expect(await searchModificationsPage.no_results_heading.count()).toBe(0);
    expect(await searchModificationsPage.no_results_guidance_text.count()).toBe(0);
    expect(await searchModificationsPage.no_results_bullet_points.count()).toBe(0);
    expect(await searchModificationsPage.active_filters_list.count()).toBe(0);
  }
);
