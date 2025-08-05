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
  }
);

When(
  'I select advanced filters in the search modifications page using {string}',
  async ({ searchModificationsPage, commonItemsPage, $tags }, filterDatasetName: string) => {
    const dataset = searchModificationsPage.searchModificationsPageTestData.Advanced_Filters[filterDatasetName];
    const isJsEnabled =
      ($tags.includes('@jsEnabled') || config.projects?.[1].use?.javaScriptEnabled) && !$tags.includes('@jsDisabled');
    for (const key in dataset) {
      if (Object.hasOwn(dataset, key)) {
        await searchModificationsPage.clickFilterChevronModifications(dataset, key, searchModificationsPage);
        if (key === 'sponsor_organisation_text') {
          if (isJsEnabled) {
            await searchModificationsPage.selectSponsorOrgJsEnabled(dataset, key, commonItemsPage);
          } else {
            await searchModificationsPage.selectSponsorOrgJsDisabled(dataset, key, commonItemsPage);
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
  'I can see the {string} ui labels in search modifications page',
  async ({ searchModificationsPage }, datasetName: string) => {
    const dataset = searchModificationsPage.searchModificationsPageTestData.Search_Modifications_Page[datasetName];
    for (const key in dataset) {
      if (Object.hasOwn(dataset, key)) {
        await expect(searchModificationsPage[key].getByText(dataset[key])).toBeVisible();
      }
    }
  }
);

Then(
  'I verify the hint text based on the {string} for search modifications page',
  async ({ searchModificationsPage }, filterDatasetName: string) => {
    const dataset = searchModificationsPage.searchModificationsPageTestData.Advanced_Filters[filterDatasetName];
    for (const key in dataset) {
      if (Object.hasOwn(dataset, key)) {
        if (key.endsWith('_checkbox')) {
          const hintLabel = await searchModificationsPage.getHintLabel(dataset, key);
          expect(confirmStringNotNull(await searchModificationsPage[key + '_selected_hint_label'].textContent())).toBe(
            hintLabel
          );
          expect(confirmStringNotNull(await searchModificationsPage[key + '_hint_label'].textContent())).toBe(
            searchModificationsPage.searchModificationsPageTestData.Search_Modifications_Page
              .Advanced_Filters_Hint_Labels[key + '_hint_label']
          );
        } else if (key.startsWith('date_') && key.endsWith('_from_day_text')) {
          expect(await searchModificationsPage.date_modification_submitted_from_date_help_text.textContent()).toBe(
            searchModificationsPage.searchModificationsPageTestData.Search_Modifications_Page
              .date_modification_submitted_from_date_help_text
          );
        } else if (key.startsWith('date_') && key.endsWith('_to_day_text')) {
          expect(await searchModificationsPage.date_modification_submitted_to_date_help_text.textContent()).toBe(
            searchModificationsPage.searchModificationsPageTestData.Search_Modifications_Page
              .date_modification_submitted_to_date_help_text
          );
        }
      }
    }
  }
);

When(
  'I expand the chevrons for {string} in search modifications page',
  async ({ searchModificationsPage }, filterDatasetName: string) => {
    const dataset = searchModificationsPage.searchModificationsPageTestData.Advanced_Filters[filterDatasetName];
    for (const key in dataset) {
      if (Object.hasOwn(dataset, key)) {
        await searchModificationsPage.clickFilterChevronModifications(dataset, key, searchModificationsPage);
      }
    }
  }
);

Then(
  '{string} active filters {string} for checkboxes in the search modifications page',
  async ({ searchModificationsPage, commonItemsPage }, actionToPerform: string, filterDatasetName: string) => {
    const filterDataset = searchModificationsPage.searchModificationsPageTestData.Advanced_Filters[filterDatasetName];
    const filterLabels = searchModificationsPage.searchModificationsPageTestData.Search_Modifications_Page;
    const replaceValue = '_label';
    const isCheckboxKey = (key: string) => key.endsWith('_checkbox');
    const isDisplayAction = actionToPerform === 'I can see the selected filters are displayed under';
    const isRemoveAction = actionToPerform === 'I remove the selected filters from';
    const handleDisplayAction = async (labels: string[]) => {
      for (const label of labels) {
        await expect.soft(commonItemsPage.active_filters_list.getByText(label)).toBeVisible();
      }
    };
    const handleRemoveAction = async (labels: string[]) => {
      for (const label of labels) {
        const removedFilterValues = await commonItemsPage.removeSelectedFilterValues(label);
        expect.soft(removedFilterValues).toBe(label);
        await expect.soft(commonItemsPage.active_filters_list.getByText(label)).not.toBeVisible();
      }
    };
    for (const key of Object.keys(filterDataset)) {
      if (isCheckboxKey(key)) {
        const activeFilterLabels = await commonItemsPage.getCheckboxFilterLabels(
          key,
          filterDataset,
          filterLabels,
          replaceValue
        );
        if (isDisplayAction) {
          await handleDisplayAction(activeFilterLabels);
        } else if (isRemoveAction) {
          await handleRemoveAction(activeFilterLabels);
        }
      }
    }
  }
);

Then(
  '{string} active filters {string} for date fields in the search modifications page',
  async ({ searchModificationsPage, commonItemsPage }, actionToPerform: string, filterDatasetName: string) => {
    const filterDataset = searchModificationsPage.searchModificationsPageTestData.Advanced_Filters[filterDatasetName];
    const filterLabels = searchModificationsPage.searchModificationsPageTestData.Search_Modifications_Page;
    const replaceValue = '_label';
    for (const key in filterDataset) {
      if (Object.hasOwn(filterDataset, key)) {
        if (key.startsWith('date_')) {
          const activeFilterLabel = await commonItemsPage.getDateFilterLabel(
            key,
            filterDataset,
            filterLabels,
            replaceValue
          );
          if (activeFilterLabel) {
            if (actionToPerform === 'I can see the selected filters are displayed under') {
              await expect.soft(commonItemsPage.active_filters_list.getByText(activeFilterLabel)).toBeVisible();
            } else if (actionToPerform === 'I remove the selected filters from') {
              const removedFilterValues = await commonItemsPage.removeSelectedFilterValues(activeFilterLabel);
              expect.soft(removedFilterValues).toBe(activeFilterLabel);
              await expect.soft(commonItemsPage.active_filters_list.getByText(activeFilterLabel)).not.toBeVisible();
            }
          }
        }
      }
    }
  }
);

Then(
  '{string} active filters {string} for text fields in the search modifications page',
  async ({ searchModificationsPage, commonItemsPage }, actionToPerform: string, filterDatasetName: string) => {
    const filterDataset = searchModificationsPage.searchModificationsPageTestData.Advanced_Filters[filterDatasetName];
    const filterLabels = searchModificationsPage.searchModificationsPageTestData.Search_Modifications_Page;
    const replaceValue = '_label';
    for (const key in filterDataset) {
      if (Object.hasOwn(filterDataset, key)) {
        const activeFilterLabel = await commonItemsPage.getTextboxFilterLabel(
          key,
          filterDataset,
          filterLabels,
          replaceValue
        );
        if (actionToPerform === 'I can see the selected filters are displayed under') {
          await expect.soft(commonItemsPage.active_filters_list.getByText(activeFilterLabel)).toBeVisible();
        } else if (actionToPerform === 'I remove the selected filters from') {
          const removedFilterValues = await commonItemsPage.removeSelectedFilterValues(activeFilterLabel);
          expect.soft(removedFilterValues).toBe(activeFilterLabel);
          await expect.soft(commonItemsPage.active_filters_list.getByText(activeFilterLabel)).not.toBeVisible();
        }
      }
    }
  }
);

Then(
  'the result count displayed at the top accurately reflects the number of records shown',
  async ({ commonItemsPage, searchModificationsPage }) => {
    const testData = searchModificationsPage.searchModificationsPageTestData;
    const modificationsList = await searchModificationsPage.getAllModificationsTheTable();
    const searchResults = confirmArrayNotNull(modificationsList.get('searchResultValues'));
    const expectedCount = testData.Search_Modifications_Page.result_count_heading;
    const actualCount = confirmStringNotNull(await commonItemsPage.result_count.textContent());
    expect(searchResults.length + expectedCount).toBe(actualCount);
  }
);

// date_modification_submitted, participating nation and sponsor_organisation can't validate from UI,need to validate with Database
Then(
  'the system displays modification records matching the search {string} and filter criteria {string} in the search modifications page',
  async ({ commonItemsPage, searchModificationsPage }, irasIdDatasetName: string, filterDatasetName: string) => {
    const testData = searchModificationsPage.searchModificationsPageTestData;
    const irasId = testData.Iras_Id[irasIdDatasetName]?.iras_id_text;
    const filterDataset = testData.Advanced_Filters[filterDatasetName];
    const { chief_investigator_name_text: ciName, short_project_title_text: projectTitle } = filterDataset;
    const modificationsList = await searchModificationsPage.getAllModificationsTheTable();
    const searchResults = confirmArrayNotNull(modificationsList.get('searchResultValues'));
    // Validate combined search terms
    if (irasId && ciName && projectTitle) {
      const searchTerms = [irasId, ciName, projectTitle];
      const filteredResults = await commonItemsPage.filterResults(searchResults, searchTerms);
      expect(filteredResults).toEqual(searchResults);
      const validatedResults = await commonItemsPage.validateSearchResultsMultipleWordsSearchKey(
        searchResults,
        searchTerms
      );
      expect(validatedResults).toBeTruthy();
      expect(searchResults).toHaveLength(validatedResults.length);
    }
    // Validate IRAS ID
    const modificationIds = confirmArrayNotNull(modificationsList.get('modificationIdValues'));
    await searchModificationsPage.setModificationIdListAfterSearch(modificationIds);
    if (irasId) {
      const irasIdMatch = commonItemsPage.validateSearchResults(modificationIds, irasId);
      expect(irasIdMatch).toBeTruthy();
    }
    // Validate Short Project Title
    if (projectTitle) {
      const projectTitles = confirmArrayNotNull(modificationsList.get('shortProjectTitleValues'));
      const titleMatch = commonItemsPage.validateSearchResults(projectTitles, projectTitle);
      expect(titleMatch).toBeTruthy();
    }
    // Validate Chief Investigator Name
    if (ciName) {
      const ciNames = confirmArrayNotNull(modificationsList.get('chiefInvestigatorNameValues'));
      const ciSearchTerms = await commonItemsPage.splitSearchTerm(ciName);
      const ciMatch = await commonItemsPage.validateSearchResultsMultipleWordsSearchKey(ciNames, ciSearchTerms);
      expect(ciMatch).toBeTruthy();
      expect(ciNames).toHaveLength(ciMatch.length);
    }
    // Validate Modification Types
    const allowedModifications: string[] = filterDataset['modification_type_checkbox'];
    if (allowedModifications) {
      const modificationTypeListAfterSearch: string[] = confirmArrayNotNull(
        modificationsList.get('modificationTypeValues')
      );
      const isValid = await commonItemsPage.areSearchResultsValid(
        modificationTypeListAfterSearch,
        allowedModifications
      );
      expect(isValid).toBeTruthy();
    }
    // Validate Lead Nations
    const allowedLeadNations: string[] = filterDataset['lead_nation_checkbox'];
    if (allowedLeadNations) {
      const leadNationValuesAfterSearch = confirmArrayNotNull(modificationsList.get('leadNationValues'));
      const isValid = await commonItemsPage.areSearchResultsValid(leadNationValuesAfterSearch, allowedLeadNations);
      expect(isValid).toBeTruthy();
    }
  }
);

Then(
  'the system displays modification records matching the search criteria of {string} in the search modifications page',
  async ({ commonItemsPage, searchModificationsPage }, irasIdDatasetName: string) => {
    const testData = searchModificationsPage.searchModificationsPageTestData;
    const irasId = testData.Iras_Id[irasIdDatasetName]?.iras_id_text;
    const modificationsList = await searchModificationsPage.getAllModificationsTheTable();
    const searchResults = confirmArrayNotNull(modificationsList.get('searchResultValues'));
    if (irasId) {
      const filteredResults = await commonItemsPage.filterResults(searchResults, irasId);
      expect(filteredResults).toEqual(searchResults);
      const validatedResults = await commonItemsPage.validateSearchResultsMultipleWordsSearchKey(searchResults, irasId);
      expect(validatedResults).toBeTruthy();
      expect(searchResults).toHaveLength(validatedResults.length);
    }
    const modificationIds = confirmArrayNotNull(modificationsList.get('modificationIdValues'));
    await searchModificationsPage.setModificationIdListAfterSearch(modificationIds);
    if (irasId) {
      const irasIdMatch = await commonItemsPage.validateSearchResults(modificationIds, irasId);
      expect(irasIdMatch).toBeTruthy();
    }
  }
);

Then(
  'the system displays modification records matching the filter criteria of {string} in the search modifications page',
  async ({ commonItemsPage, searchModificationsPage }, filterDatasetName: string) => {
    const testData = searchModificationsPage.searchModificationsPageTestData;
    const filterDataset = testData.Advanced_Filters[filterDatasetName];
    const { chief_investigator_name_text: ciName, short_project_title_text: projectTitle } = filterDataset;
    const modificationsList = await searchModificationsPage.getAllModificationsTheTable();
    const searchResults = confirmArrayNotNull(modificationsList.get('searchResultValues'));
    // Combined search term validation
    if (ciName && projectTitle) {
      const searchTerms = [ciName, projectTitle];
      const filteredResults = await commonItemsPage.filterResults(searchResults, searchTerms);
      expect(filteredResults).toEqual(searchResults);
      const validatedResults = await commonItemsPage.validateSearchResultsMultipleWordsSearchKey(
        searchResults,
        searchTerms
      );
      expect(validatedResults).toBeTruthy();
      expect(searchResults).toHaveLength(validatedResults.length);
    }
    // Individual field validations
    const modificationIds = confirmArrayNotNull(modificationsList.get('modificationIdValues'));
    await searchModificationsPage.setModificationIdListAfterSearch(modificationIds);
    if (projectTitle) {
      const projectTitles = confirmArrayNotNull(modificationsList.get('shortProjectTitleValues'));
      const match = commonItemsPage.validateSearchResults(projectTitles, projectTitle);
      expect(match).toBeTruthy();
    }
    if (ciName) {
      const ciNames = confirmArrayNotNull(modificationsList.get('chiefInvestigatorNameValues'));
      const ciSearchTerms = await commonItemsPage.splitSearchTerm(ciName);
      const match = await commonItemsPage.validateSearchResultsMultipleWordsSearchKey(ciNames, ciSearchTerms);
      expect(match).toBeTruthy();
      expect(ciNames).toHaveLength(match.length);
    }
    // Validate Modification Types
    const allowedModifications: string[] = filterDataset['modification_type_checkbox'];
    if (allowedModifications) {
      const modificationTypeListAfterSearch: string[] = confirmArrayNotNull(
        modificationsList.get('modificationTypeValues')
      );
      const isValid = await commonItemsPage.areSearchResultsValid(
        modificationTypeListAfterSearch,
        allowedModifications
      );
      expect(isValid).toBeTruthy();
    }
    // Validate Lead Nations
    const allowedLeadNations: string[] = filterDataset['lead_nation_checkbox'];
    if (allowedLeadNations) {
      const leadNationValuesAfterSearch = confirmArrayNotNull(modificationsList.get('leadNationValues'));
      const isValid = await commonItemsPage.areSearchResultsValid(leadNationValuesAfterSearch, allowedLeadNations);
      expect(isValid).toBeTruthy();
    }
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
  async (
    { commonItemsPage, searchModificationsPage },
    errorMessageFieldAndSummaryDatasetName: string,
    pageKey: string
  ) => {
    let errorMessageFieldDataset: JSON;
    let page: any;
    if (pageKey === 'Search_Modifications_Page') {
      errorMessageFieldDataset =
        searchModificationsPage.searchModificationsPageTestData.Search_Modifications_Page[
          errorMessageFieldAndSummaryDatasetName
        ];
      page = searchModificationsPage;
    }
    await expect(commonItemsPage.errorMessageSummaryLabel).toBeVisible();
    const allSummaryErrorExpectedValues = Object.values(errorMessageFieldDataset);
    const summaryErrorActualValues = await commonItemsPage.getSummaryErrorMessages();
    expect(summaryErrorActualValues).toEqual(allSummaryErrorExpectedValues);
    for (const key in errorMessageFieldDataset) {
      if (Object.hasOwn(errorMessageFieldDataset, key)) {
        const expectedMessage = errorMessageFieldDataset[key];
        if (
          errorMessageFieldAndSummaryDatasetName === 'Date_Modification_Submitted_To_date_Before_From_Date_Error' ||
          errorMessageFieldAndSummaryDatasetName === 'Date_Modification_Submitted_No_Month_Selected_To_Date_Error'
        ) {
          const actualMessage = await searchModificationsPage.date_modification_submitted_to_date_error.textContent();
          expect(actualMessage).toEqual(expectedMessage);
        } else if (
          errorMessageFieldAndSummaryDatasetName === 'Date_Modification_Submitted_No_Month_Selected_From_Date_Error'
        ) {
          const actualMessage = await searchModificationsPage.date_modification_submitted_from_date_error.textContent();
          expect(actualMessage).toEqual(expectedMessage);
        } else if (errorMessageFieldAndSummaryDatasetName === 'Sponsor_Organisation_Min_Char_Error') {
          const actualMessage =
            await searchModificationsPage.sponsor_organisation_jsdisabled_min_error_message.textContent();
          expect(actualMessage).toEqual(expectedMessage);
        } else {
          throw new Error(`Unhandled error message dataset name: ${errorMessageFieldAndSummaryDatasetName}`);
        }
        const element = await commonItemsPage.clickErrorSummaryLink(errorMessageFieldDataset, key, page);
        await expect(element).toBeInViewport();
      }
    }
  }
);

Then(
  'I can see an empty state that informs me no modifications exist for the search criteria',
  async ({ commonItemsPage, searchModificationsPage }) => {
    await expect(searchModificationsPage.page_heading).toBeVisible();
    await expect(searchModificationsPage.page_guidance_text).toBeVisible();
    await expect(commonItemsPage.advanced_filter_chevron).toBeVisible();
    expect(await searchModificationsPage.page.title()).toBe(
      searchModificationsPage.searchModificationsPageTestData.Search_Modifications_Page.title
    );
    expect(await commonItemsPage.tableRows.count()).toBe(0);
    const expectedResultCount =
      searchModificationsPage.searchModificationsPageTestData.Search_Modifications_Page.result_count_heading;
    const actualResultCount = confirmStringNotNull(await commonItemsPage.result_count.textContent());
    expect('0' + expectedResultCount).toBe(actualResultCount);
    expect(await commonItemsPage.no_results_heading.count()).toBe(0);
    expect(await commonItemsPage.no_results_guidance_text.count()).toBe(0);
    expect(await commonItemsPage.no_results_bullet_points.count()).toBe(0);
    expect(await commonItemsPage.active_filters_list.count()).toBe(0);
  }
);

Then(
  'the search button appears with a green background in the sponsor Organisation filter',
  async ({ searchModificationsPage, commonItemsPage }) => {
    expect(
      await searchModificationsPage.sponsor_organisation_jsdisabled_search_button.evaluate(
        (e: any) => getComputedStyle(e).backgroundColor
      )
    ).toBe(commonItemsPage.commonTestData.rgb_green_color);
  }
);

Then(
  'I can now see a table of search results for modifications received for approval',
  async ({ searchModificationsPage, commonItemsPage }) => {
    await expect(searchModificationsPage.results_table).toBeVisible();
    expect(await commonItemsPage.tableBodyRows.count()).toBeGreaterThan(0);
  }
);

Then(
  'I can see the list of modifications received for approval is sorted by {string} order of the {string}',
  async ({ searchModificationsPage, commonItemsPage }, sortDirection: string, sortField: string) => {
    let sortedList: string[];
    let columnIndex: number;
    switch (sortField.toLowerCase()) {
      case 'modification id':
        columnIndex = 0;
        break;
      case 'short project title':
        columnIndex = 1;
        break;
      case 'modification type':
        columnIndex = 2;
        break;
      case 'chief investigator':
        columnIndex = 3;
        break;
      case 'lead nation':
        columnIndex = 4;
        break;
      default:
        throw new Error(`${sortField} is not a valid option`);
    }
    const actualList = await searchModificationsPage.getActualListValues(commonItemsPage.tableBodyRows, columnIndex);
    if (sortField.toLowerCase() == 'modification id') {
      sortedList = await searchModificationsPage.sortModificationIdListValues(actualList, sortDirection);
    } else if (sortDirection.toLowerCase() == 'ascending') {
      sortedList = [...actualList].sort((a, b) => a.localeCompare(b, 'en', { sensitivity: 'base' }));
    } else {
      sortedList = [...actualList].sort((a, b) => b.localeCompare(a, 'en', { sensitivity: 'base' }));
    }
    expect.soft(actualList).toEqual(sortedList);
  }
);
