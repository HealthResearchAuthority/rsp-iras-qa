import { createBdd } from 'playwright-bdd';
import { expect, test } from '../../../../hooks/CustomFixtures';
import { confirmArrayNotNull, confirmStringNotNull, sortArray } from '../../../../utils/UtilFunctions';
import config from '../../../../../playwright.config';
const { When, Then } = createBdd(test);

When(
  'I select advanced filters in the search modifications page using {string}',
  async ({ searchModificationsPage, commonItemsPage, $tags }, filterDatasetName: string) => {
    const dataset =
      searchModificationsPage.searchModificationsPageTestData.Search_Modifications_Page[filterDatasetName];
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
            // if (!(filterDatasetName == 'Sponsor_Organisation_Text_Blank')) {
            //   await searchModificationsPage.sponsor_organisation_jsdisabled_search_button.click();
            //   await searchModificationsPage.page.waitForTimeout(2000);
            //   await searchModificationsPage.sponsor_organisation_jsdisabled_search_results_radio_button.isVisible();
            // }
            // if (!(filterDatasetName == 'Sponsor_Organisation_Text_Blank')) {
            //   await searchModificationsPage.sponsor_organisation_jsdisabled_search_results_radio_button.first().click();
            // }
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
    const dataset =
      searchModificationsPage.searchModificationsPageTestData.Search_Modifications_Page[filterDatasetName];
    // await searchModificationsPage.clickAdvancedFilterChevron();
    for (const key in dataset) {
      if (Object.prototype.hasOwnProperty.call(dataset, key)) {
        await searchModificationsPage.clickFilterChevron(dataset, key, searchModificationsPage);
      }
    }
  }
);

Then(
  'I can see the selected filters {string} are displayed under active filters',
  async ({ searchModificationsPage }, filterDatasetName: string) => {
    let activeCheckboxFiltersMap: { get: (arg0: string) => any };
    let activeFiltersMap;
    let filterCheckboxValuesExpected;
    let filterValuesExpected;
    const dataset =
      searchModificationsPage.searchModificationsPageTestData.Search_Modifications_Page[filterDatasetName];
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
    const normalize = (str: string) =>
      str
        .split(',')
        .map((s) => s.trim())
        .sort();

    const fieldValActual: string[] = await searchModificationsPage.getSelectedFilterValues();
    if (filterValuesExpected !== undefined && filterCheckboxValuesExpected !== undefined) {
      const expected = normalize(filterValuesExpected + ', ' + filterCheckboxValuesExpected);
      const actual = normalize(fieldValActual.flat().join(', '));
      expect(actual).toEqual(expected);

      // expect(fieldValActual.flat().join(', ')).toEqual(filterValuesExpected + ', ' + filterCheckboxValuesExpected);
      // expect([fieldValActual]).toEqual(filterValuesExpected + ', ' + filterCheckboxValuesExpected);
    } else if (filterValuesExpected !== undefined && filterCheckboxValuesExpected === undefined) {
      // expect(fieldValActual).toEqual(filterValuesExpected);
      const expected = normalize(filterValuesExpected);
      const actual = normalize(fieldValActual.flat().join(', '));
      expect(actual).toEqual(expected);
      // expect([fieldValActual]).toEqual(filterValuesExpected);
    } else if (filterValuesExpected === undefined && filterCheckboxValuesExpected !== undefined) {
      expect([fieldValActual]).toEqual(filterCheckboxValuesExpected);
    }
  }
);

// date_modification_submitted and sponsor_organisation can't validate from UI,need to validate with Database
Then(
  'the system displays modification records matching the search {string} and filter criteria {string}',
  async ({ commonItemsPage, searchModificationsPage }, irasIdDatasetName: string, filterDatasetName: string) => {
    const irasIdDataset =
      searchModificationsPage.searchModificationsPageTestData.Search_Modifications_Page[irasIdDatasetName];
    const filterDataset =
      searchModificationsPage.searchModificationsPageTestData.Search_Modifications_Page[filterDatasetName];
    const irasId = irasIdDataset['iras_id_text'];
    const chiefInvestigatorName = filterDataset['chief_investigator_name_text'];
    const shortProjectTitle = filterDataset['short_project_title_text'];
    let searchTerms: string[] = [];
    const modificationsList = await searchModificationsPage.getAllModificationsTheTable();
    const modificationsListAfterSearch: string[] = confirmArrayNotNull(modificationsList.get('searchResultValues'));
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
    console.log(modificationTypes);
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
  async ({ searchModificationsPage }, sortField: string) => {
    let actualList: string[];
    switch (sortField.toLowerCase()) {
      case 'modification id':
        actualList = await searchModificationsPage.getModificationIdListAfterSearch();
        break;
      default:
        throw new Error(`${sortField} is not a valid option`);
    }

    // Convert IDs like "9800001/4" to a sortable format
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
  async ({ searchModificationsPage, rtsPage, commonItemsPage }, datasetName: string, suggestionCommonDatasetName) => {
    const dataset = searchModificationsPage.searchModificationsPageTestData.Search_Modifications_Page[datasetName];
    const suggestionHeadersDatasetName =
      searchModificationsPage.searchModificationsPageTestData.Search_Modifications_Page[suggestionCommonDatasetName];
    let sponsorOrganisationNameListExpected = await sortArray(rtsPage.rtsResponseList);
    if (sponsorOrganisationNameListExpected.length > 5) {
      sponsorOrganisationNameListExpected = sponsorOrganisationNameListExpected.slice(0, 5);
    }
    // await searchModificationsPage.sponsor_organisation_jsenabled_text.fill(dataset['sponsor_organisation_text']);
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
  async ({ searchModificationsPage }, datasetName: string, suggestionCommonDatasetName) => {
    const dataset = searchModificationsPage.searchModificationsPageTestData.Search_Modifications_Page[datasetName];
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
  async ({ searchModificationsPage }, datasetName: string, suggestionCommonDatasetName) => {
    const dataset = searchModificationsPage.searchModificationsPageTestData.Search_Modifications_Page[datasetName];
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
  async ({ searchModificationsPage, rtsPage }, datasetName: string, searchHintsDatasetName) => {
    const dataset = searchModificationsPage.searchModificationsPageTestData.Search_Modifications_Page[datasetName];
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
  async ({ searchModificationsPage }, datasetName: string, searchHintsDatasetName) => {
    const dataset = searchModificationsPage.searchModificationsPageTestData.Search_Modifications_Page[datasetName];
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
  async ({ searchModificationsPage }, datasetName: string) => {
    const dataset = searchModificationsPage.searchModificationsPageTestData.Search_Modifications_Page[datasetName];
    await searchModificationsPage.sponsor_organisation_text.fill(dataset['sponsor_organisation_text']);
    await searchModificationsPage.sponsor_organisation_jsdisabled_search_button.click();
  }
);

Then(
  'I validate {string} displayed on {string} in advanced filters',
  async (
    { commonItemsPage, searchModificationsPage },
    errorMessageFieldAndSummaryDatasetName: string,
    pageKey: string
  ) => {
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
          const fieldErrorMessagesActualValues =
            await searchModificationsPage.date_modification_submitted_to_date_error.textContent();
          expect(fieldErrorMessagesActualValues).toEqual(errorMessageFieldDataset[key]);
        }
      }
    } else {
      for (const key in errorMessageFieldDataset) {
        if (Object.prototype.hasOwnProperty.call(errorMessageFieldDataset, key)) {
          const fieldErrorMessagesActualValues = await commonItemsPage.getFieldErrorMessages(key, page);
          expect(fieldErrorMessagesActualValues).toEqual(errorMessageFieldDataset[key]);
        }
      }
    }
  }
);
