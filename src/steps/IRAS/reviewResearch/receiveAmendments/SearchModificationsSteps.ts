import { createBdd } from 'playwright-bdd';
import { expect, test } from '../../../../hooks/CustomFixtures';
import { confirmArrayNotNull, confirmStringNotNull, sortArray } from '../../../../utils/UtilFunctions';
import config from '../../../../../playwright.config';
import CommonItemsPage from '../../../../pages/Common/CommonItemsPage';
import { Locator } from 'playwright';
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
            await searchModificationsPage.selectSponsorOrgJsEnabled(
              dataset,
              key,
              commonItemsPage,
              searchModificationsPage
            );
          } else {
            await searchModificationsPage.selectSponsorOrgJsDisabled(
              dataset,
              key,
              commonItemsPage,
              searchModificationsPage
            );
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
          expect(await searchModificationsPage.date_submitted_from_date_help_text.textContent()).toBe(
            searchModificationsPage.searchModificationsPageTestData.Search_Modifications_Page
              .date_submitted_from_date_help_text
          );
        } else if (key.startsWith('date_') && key.endsWith('_to_day_text')) {
          expect(await searchModificationsPage.date_submitted_to_date_help_text.textContent()).toBe(
            searchModificationsPage.searchModificationsPageTestData.Search_Modifications_Page
              .date_submitted_to_date_help_text
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
  'the result count displayed at the top accurately reflects the number of records shown in the search modifications page',
  async ({ commonItemsPage, searchModificationsPage }) => {
    const expectedResultCountLabel = await searchModificationsPage.getExpectedResultsCountLabel();
    const actualResultCountLabel = await searchModificationsPage.getActualResultsCountLabel(commonItemsPage);
    expect(expectedResultCountLabel).toEqual(actualResultCountLabel);
  }
);

// date_submitted, participating nation and sponsor_organisation can't validate from UI,need to validate with Database
Then(
  'the system displays modification records based on the search {string} and filter criteria {string} or shows no results found message if no matching records exist in the search modifications page',
  async ({ commonItemsPage, searchModificationsPage }, irasIdDatasetName, filterDatasetName) => {
    const testData = searchModificationsPage.searchModificationsPageTestData;
    const irasId = testData.Iras_Id?.[irasIdDatasetName]?.iras_id_text;
    const filterDataset = testData.Advanced_Filters?.[filterDatasetName] || {};
    const { chief_investigator_name_text: ciName, short_project_title_text: projectTitle } = filterDataset;
    const modificationsList = await searchModificationsPage.getAllModificationsTheTable();
    const searchResults = confirmArrayNotNull(modificationsList.get('searchResultValues'));
    const modificationIds = confirmArrayNotNull(modificationsList.get('modificationIdValues'));
    await searchModificationsPage.setModificationIdListAfterSearch(modificationIds);

    const validateCombinedSearchTerms = async (
      searchResults: string[],
      searchTerms: string[],
      commonItemsPage: CommonItemsPage
    ) => {
      const filteredResults = await commonItemsPage.filterResults(searchResults, searchTerms);
      expect(filteredResults).toEqual(searchResults);
      const validatedResults = await commonItemsPage.validateSearchResultsMultipleWordsSearchKey(
        searchResults,
        searchTerms
      );
      expect(validatedResults).toBeTruthy();
      expect(searchResults).toHaveLength(validatedResults.length);
    };

    const validateSingleFieldMatch = async (
      modificationsList: Map<string, string[]>,
      fieldKey: string,
      searchTerm: string,
      commonItemsPage: CommonItemsPage
    ) => {
      const values = confirmArrayNotNull(modificationsList.get(fieldKey));
      const match = await commonItemsPage.validateSearchResults(values, searchTerm);
      expect(match).toBeTruthy();
    };

    const validateMultiWordFieldMatch = async (
      modificationsList: Map<string, string[]>,
      fieldKey: string,
      searchTerm: string,
      commonItemsPage: CommonItemsPage
    ) => {
      const values = confirmArrayNotNull(modificationsList.get(fieldKey));
      const terms = await commonItemsPage.splitSearchTerm(searchTerm);
      const match = await commonItemsPage.validateSearchResultsMultipleWordsSearchKey(values, terms);
      expect(match).toBeTruthy();
      expect(values).toHaveLength(match.length);
    };

    const validateFilterMatch = async (
      modificationsList: Map<string, string[]>,
      fieldKey: string,
      allowedValues: string[],
      commonItemsPage: CommonItemsPage
    ) => {
      const values = confirmArrayNotNull(modificationsList.get(fieldKey));
      const isValid = await commonItemsPage.areSearchResultsValid(values, allowedValues);
      expect(isValid).toBeTruthy();
    };

    if (searchResults.length !== 0) {
      // Combined search validation
      const searchTerms = [irasId, ciName, projectTitle].filter(Boolean);
      if (searchTerms.length > 1) {
        await validateCombinedSearchTerms(searchResults, searchTerms, commonItemsPage);
      }
      // Individual search field validations
      if (irasId) {
        await validateSingleFieldMatch(modificationsList, 'modificationIdValues', irasId, commonItemsPage);
      }
      if (projectTitle) {
        await validateSingleFieldMatch(modificationsList, 'shortProjectTitleValues', projectTitle, commonItemsPage);
      }
      if (ciName) {
        await validateMultiWordFieldMatch(modificationsList, 'chiefInvestigatorNameValues', ciName, commonItemsPage);
      }
      // Filter validations
      const allowedModifications = filterDataset['modification_type_checkbox'];
      if (allowedModifications) {
        await validateFilterMatch(modificationsList, 'modificationTypeValues', allowedModifications, commonItemsPage);
      }
      const allowedLeadNations = filterDataset['lead_nation_checkbox'];
      if (allowedLeadNations) {
        await validateFilterMatch(modificationsList, 'leadNationValues', allowedLeadNations, commonItemsPage);
      }
    } else {
      const pageTestData = searchModificationsPage.searchModificationsPageTestData.Search_Modifications_Page;
      const validateTextMatch = async (locator: Locator, expectedText: string) => {
        await expect(locator).toHaveText(expectedText);
        expect(confirmStringNotNull(await locator.textContent())).toBe(expectedText);
      };
      const expectedResultCount = pageTestData.result_count_heading;
      const actualResultCount = confirmStringNotNull(await commonItemsPage.result_count.textContent());
      expect('0' + expectedResultCount).toBe(actualResultCount);
      await validateTextMatch(commonItemsPage.no_results_heading, pageTestData.no_results_heading);
      await validateTextMatch(commonItemsPage.no_results_guidance_text, pageTestData.no_results_guidance_text);
      const bulletPointsActual = (await commonItemsPage.getNoResultsBulletPoints()).flat().join(', ');
      const bulletPointsExpected = pageTestData.no_results_bullet_points.flat().join(', ');
      expect(bulletPointsActual).toEqual(bulletPointsExpected);
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
  'I can see an empty state that informs me no modifications exist for the search criteria',
  async ({ commonItemsPage, searchModificationsPage }) => {
    await expect(searchModificationsPage.page_heading).toBeVisible();
    await expect(searchModificationsPage.page_guidance_text).toBeVisible();
    await expect(commonItemsPage.advanced_filter_chevron).toBeVisible();
    expect(await searchModificationsPage.page.title()).toBe(
      searchModificationsPage.searchModificationsPageTestData.Search_Modifications_Page.title
    );
    expect(await commonItemsPage.tableRows.count()).toBe(0);
    const expectedResultCountLabel = await searchModificationsPage.getExpectedResultsCountLabelNoResults();
    const actualResultCountLabel = await searchModificationsPage.getActualResultsCountLabel(commonItemsPage);
    expect(expectedResultCountLabel).toEqual(actualResultCountLabel);
    expect(await commonItemsPage.no_results_heading.count()).toBe(0);
    expect(await commonItemsPage.no_results_guidance_text.count()).toBe(0);
    expect(await commonItemsPage.no_results_bullet_points.count()).toBe(0);
    expect(await commonItemsPage.active_filters_list.count()).toBe(0);
    expect(await commonItemsPage.clear_all_filters_link.count()).toBe(0);
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
