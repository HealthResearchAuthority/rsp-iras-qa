import { createBdd } from 'playwright-bdd';
import { expect, test } from '../../../../hooks/CustomFixtures';
import { confirmArrayNotNull, confirmStringNotNull, sortArray } from '../../../../utils/UtilFunctions';
const { Then } = createBdd(test);

Then(
  'I verify the hint text based on the {string} for search modifications page',
  async ({ searchModificationsPage }, filterDatasetName: string) => {
    const dataset = searchModificationsPage.searchModificationsPageTestData.Advanced_Filters[filterDatasetName];
    for (const key in dataset) {
      if (Object.hasOwn(dataset, key)) {
        if (key.endsWith('_checkbox')) {
          const hintLabel = await searchModificationsPage.getHintLabel(dataset, key);
          expect
            .soft(confirmStringNotNull(await searchModificationsPage[key + '_selected_hint_label'].textContent()))
            .toBe(hintLabel);
          expect
            .soft(confirmStringNotNull(await searchModificationsPage[key + '_hint_label'].textContent()))
            .toBe(
              searchModificationsPage.searchModificationsPageTestData.Search_Modifications_Page
                .Advanced_Filters_Hint_Labels[key + '_hint_label']
            );
        } else if (key.startsWith('date_') && key.endsWith('_from_day_text')) {
          expect
            .soft(await searchModificationsPage.date_submitted_from_date_help_text.textContent())
            .toBe(
              searchModificationsPage.searchModificationsPageTestData.Search_Modifications_Page
                .date_submitted_from_date_help_text
            );
        } else if (key.startsWith('date_') && key.endsWith('_to_day_text')) {
          expect
            .soft(await searchModificationsPage.date_submitted_to_date_help_text.textContent())
            .toBe(
              searchModificationsPage.searchModificationsPageTestData.Search_Modifications_Page
                .date_submitted_to_date_help_text
            );
        }
      }
    }
  }
);

// date_submitted, participating nation and sponsor_organisation can't validate from UI,need to validate with Database
Then(
  'the system displays modification records based on the search {string} and filter criteria {string}',
  async (
    { commonItemsPage, searchModificationsPage, modificationsReceivedCommonPage },
    irasIdDatasetName,
    filterDatasetName
  ) => {
    let irasId: string;
    const testData = searchModificationsPage.searchModificationsPageTestData;
    if (irasIdDatasetName === 'Iras_Id_Retrieved_From_DB_With_Status_Active') {
      irasId = await searchModificationsPage.getIrasId();
    } else if (irasIdDatasetName === 'Partial_Iras_Id_Retrieved_From_DB_With_Status_Active') {
      irasId = (await searchModificationsPage.getIrasId()).substring(0, 2);
    } else {
      irasId = testData.Iras_Id?.[irasIdDatasetName]?.iras_id_text;
    }
    const filterDataset = testData.Advanced_Filters?.[filterDatasetName] || {};
    const { chief_investigator_name_text: ciName, short_project_title_text: projectTitle } = filterDataset;
    const modificationsList = await searchModificationsPage.getAllModificationsTheTable();
    const searchResults = confirmArrayNotNull(modificationsList.get('searchResultValues'));
    const modificationIds = confirmArrayNotNull(modificationsList.get('modificationIdValues'));
    await searchModificationsPage.setModificationIdListAfterSearch(modificationIds);

    if (searchResults.length > 0) {
      // Combined search validation
      const searchTerms = [irasId, ciName, projectTitle].filter(Boolean);
      if (searchTerms.length > 1) {
        await modificationsReceivedCommonPage.validateCombinedSearchTerms(searchResults, searchTerms, commonItemsPage);
      }
      // Individual search field validations
      if (irasId) {
        await modificationsReceivedCommonPage.validateSingleFieldMatch(
          modificationsList,
          'modificationIdValues',
          irasId,
          commonItemsPage
        );
      }
      if (projectTitle) {
        await modificationsReceivedCommonPage.validateSingleFieldMatch(
          modificationsList,
          'shortProjectTitleValues',
          projectTitle,
          commonItemsPage
        );
      }
      if (ciName) {
        await modificationsReceivedCommonPage.validateMultiWordFieldMatch(
          modificationsList,
          'chiefInvestigatorNameValues',
          ciName,
          commonItemsPage
        );
      }
      // Filter validations
      const allowedModifications = filterDataset['modification_type_checkbox'];
      if (allowedModifications) {
        await modificationsReceivedCommonPage.validateFilterMatch(
          modificationsList,
          'modificationTypeValues',
          allowedModifications,
          commonItemsPage
        );
      }
      const allowedLeadNations = filterDataset['lead_nation_checkbox'];
      if (allowedLeadNations) {
        await modificationsReceivedCommonPage.validateFilterMatch(
          modificationsList,
          'leadNationValues',
          allowedLeadNations,
          commonItemsPage
        );
      }
    } else {
      throw new Error(`Expected Search Results but No Search Results are Displayed`);
    }
  }
);

Then(
  'I type valid {string} for sponsor organisation suggestion box and validate the suggestion list along with {string}',
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
    await commonItemsPage.fillUIComponent(dataset, 'sponsor_organisation_jsenabled_text', commonItemsPage);
    await searchModificationsPage.page.waitForTimeout(2000);
    const sponsorOrganisationNameListActual =
      await commonItemsPage.sponsor_organisation_suggestion_list_labels.allTextContents();
    expect.soft(sponsorOrganisationNameListActual).toEqual(sponsorOrganisationNameListExpected);
    const suggestionsHeaderLabelActual = await commonItemsPage.sponsor_organisation_suggestion_listbox
      .first()
      .getAttribute('data-before-suggestions');
    const suggestionsHeaderLabelExpected = suggestionHeadersDatasetName.suggestion_header;
    expect.soft(suggestionsHeaderLabelActual).toEqual(suggestionsHeaderLabelExpected);
    const suggestionsFooterLabelActual = await commonItemsPage.sponsor_organisation_suggestion_listbox
      .first()
      .getAttribute('data-after-suggestions');
    const suggestionsFooterLabelExpected = suggestionHeadersDatasetName.suggestion_footer;
    expect.soft(suggestionsFooterLabelActual).toEqual(suggestionsFooterLabelExpected);
  }
);

Then(
  'I type invalid {string} for sponsor organisation suggestion box and validate the suggestion list along with {string}',
  async (
    { searchModificationsPage, commonItemsPage },
    sponsorOrganisationDatasetName: string,
    suggestionCommonDatasetName
  ) => {
    const dataset =
      searchModificationsPage.searchModificationsPageTestData.Sponsor_Organisation[sponsorOrganisationDatasetName];
    const suggestionHeadersDatasetName =
      searchModificationsPage.searchModificationsPageTestData.Search_Modifications_Page[suggestionCommonDatasetName];
    await commonItemsPage.sponsor_organisation_jsenabled_text.fill(dataset['sponsor_organisation_text']);
    await searchModificationsPage.page.waitForTimeout(2000);
    const noResultFoundSuggestionActual = await commonItemsPage.sponsor_organisation_suggestion_list_labels
      .first()
      .textContent();
    const suggestionsHeaderLabelExpected = suggestionHeadersDatasetName.no_suggestion_found;
    expect.soft(noResultFoundSuggestionActual).toEqual(suggestionsHeaderLabelExpected);
  }
);

Then(
  'I type min characters {string} for sponsor organisation suggestion box and validate the suggestion list along with {string}',
  async (
    { searchModificationsPage, commonItemsPage },
    sponsorOrganisationDatasetName: string,
    suggestionCommonDatasetName
  ) => {
    const dataset =
      searchModificationsPage.searchModificationsPageTestData.Sponsor_Organisation[sponsorOrganisationDatasetName];
    const suggestionHeadersDatasetName =
      searchModificationsPage.searchModificationsPageTestData.Search_Modifications_Page[suggestionCommonDatasetName];
    await commonItemsPage.sponsor_organisation_jsenabled_text.fill(dataset['sponsor_organisation_text']);
    await searchModificationsPage.page.waitForTimeout(2000);
    const continueEnteringSuggestionActual = await commonItemsPage.sponsor_organisation_suggestion_listbox
      .first()
      .getAttribute('data-before-suggestions');
    const suggestionsHeaderLabelExpected = suggestionHeadersDatasetName.suggestion_footer;
    expect.soft(continueEnteringSuggestionActual).toEqual(suggestionsHeaderLabelExpected);
  }
);

Then(
  'With javascript disabled, I search with valid {string} for sponsor organisation search box and validate the search results along with {string} in the {string}',
  async (
    { searchModificationsPage, commonItemsPage, rtsPage },
    sponsorOrganisationDatasetName: string,
    searchHintsDatasetName,
    pageValue: string
  ) => {
    let searchResultFooterHintLabelExpected: string;
    const dataset =
      searchModificationsPage.searchModificationsPageTestData.Sponsor_Organisation[sponsorOrganisationDatasetName];
    const searchHintDataset =
      searchModificationsPage.searchModificationsPageTestData.Search_Modifications_Page[searchHintsDatasetName];
    let sponsorOrganisationNameListExpected = await sortArray(rtsPage.rtsResponseList);
    const totalMatchingSponsorOrganisations = sponsorOrganisationNameListExpected.length;
    if (sponsorOrganisationNameListExpected.length > 5) {
      sponsorOrganisationNameListExpected = sponsorOrganisationNameListExpected.slice(0, 5);
    }
    await commonItemsPage.sponsor_organisation_text.fill(dataset['sponsor_organisation_text']);
    if (pageValue === 'Setup_New_Sponsor_Organisation_Page') {
      await commonItemsPage.sponsor_organisation_jsdisabled_search_button.click();
    } else if (pageValue === 'Search_Modifications_Page' || pageValue === 'Search_Projects_Page') {
      await commonItemsPage.search_projects_modifications_sponsor_organisation_jsdisabled_search_button.click();
    }
    const sponsorOrganisationNameListActualWithSpaces =
      await searchModificationsPage.sponsor_organisation_jsdisabled_search_results_labels.allTextContents();
    const sponsorOrganisationNameListActual = sponsorOrganisationNameListActualWithSpaces.map((str) => str.trim());
    expect.soft(sponsorOrganisationNameListActual).toEqual(sponsorOrganisationNameListExpected);
    const searchResultHeaderHintLabelActual = confirmStringNotNull(
      await searchModificationsPage.sponsor_organisation_jsdisabled_result_hint_label.textContent()
    ).trim();
    const searchResultHeaderHintLabelExpected = `${searchHintDataset.search_hint_header_prefix} '${dataset['sponsor_organisation_text']}'`;
    expect.soft(searchResultHeaderHintLabelActual).toEqual(searchResultHeaderHintLabelExpected);
    if (totalMatchingSponsorOrganisations > 5) {
      const searchResultFooterHintLabelActual = confirmStringNotNull(
        await searchModificationsPage.sponsor_organisation_jsdisabled_narrow_down_label.textContent()
      ).trim();
      if (pageValue === 'Setup_New_Sponsor_Organisation_Page') {
        searchResultFooterHintLabelExpected =
          `${totalMatchingSponsorOrganisations} ${searchHintDataset.search_hint_footer_prefix} '${dataset['sponsor_organisation_text']}'${searchHintDataset.search_hint_footer}` +
          '.';
      } else {
        searchResultFooterHintLabelExpected = `${totalMatchingSponsorOrganisations} ${searchHintDataset.search_hint_footer_prefix} '${dataset['sponsor_organisation_text']}'${searchHintDataset.search_hint_footer}`;
      }
      const normalizedActual = searchResultFooterHintLabelActual.replaceAll(/\s+/g, ' ').trim();
      expect.soft(normalizedActual).toEqual(searchResultFooterHintLabelExpected);
    }
  }
);

Then(
  'With javascript disabled, I search with invalid {string} for sponsor organisation search box and validate the search results along with {string} in the {string}',
  async (
    { searchModificationsPage, commonItemsPage },
    sponsorOrganisationDatasetName: string,
    searchHintsDatasetName,
    pageValue: string
  ) => {
    const dataset =
      searchModificationsPage.searchModificationsPageTestData.Sponsor_Organisation[sponsorOrganisationDatasetName];
    const searchHintDataset =
      searchModificationsPage.searchModificationsPageTestData.Search_Modifications_Page[searchHintsDatasetName];
    await commonItemsPage.sponsor_organisation_text.fill(dataset['sponsor_organisation_text']);
    if (pageValue === 'Setup_New_Sponsor_Organisation_Page') {
      await commonItemsPage.sponsor_organisation_jsdisabled_search_button.click();
    } else if (pageValue === 'Search_Modifications_Page' || pageValue === 'Search_Projects_Page') {
      await commonItemsPage.search_projects_modifications_sponsor_organisation_jsdisabled_search_button.click();
    }
    const noResultFoundLabelActual = confirmStringNotNull(
      await searchModificationsPage.sponsor_organisation_jsdisabled_no_suggestions_label.textContent()
    ).trim();
    const noResultFoundLabelExpected = `${searchHintDataset.no_suggestion_found} ${dataset['sponsor_organisation_text']}`;
    expect.soft(noResultFoundLabelActual).toEqual(noResultFoundLabelExpected);
  }
);

Then(
  'With javascript disabled, I search with invalid min characters {string} for sponsor organisation search box in the {string}',
  async ({ searchModificationsPage, commonItemsPage }, sponsorOrganisationDatasetName: string, pageValue: string) => {
    const dataset =
      searchModificationsPage.searchModificationsPageTestData.Sponsor_Organisation[sponsorOrganisationDatasetName];
    await commonItemsPage.sponsor_organisation_text.fill(dataset['sponsor_organisation_text']);
    if (pageValue === 'Setup_New_Sponsor_Organisation_Page') {
      await commonItemsPage.sponsor_organisation_jsdisabled_search_button.click();
    } else if (pageValue === 'Search_Modifications_Page' || pageValue === 'Search_Projects_Page') {
      await commonItemsPage.search_projects_modifications_sponsor_organisation_jsdisabled_search_button.click();
    }
  }
);

Then(
  'The search modifications page returns to its original empty state with no results displayed',
  async ({ commonItemsPage, searchModificationsPage }) => {
    await expect.soft(searchModificationsPage.page_heading).toBeVisible();
    await expect.soft(searchModificationsPage.page_guidance_text).toBeVisible();
    await expect.soft(commonItemsPage.advanced_filter_chevron).toBeVisible();
    await expect.soft(searchModificationsPage.results_table).not.toBeVisible();
    await expect.soft(commonItemsPage.search_no_results_container).not.toBeVisible();
  }
);

Then(
  'the search button appears with a green background in the sponsor Organisation filter in the {string}',
  async ({ commonItemsPage }, pageValue: string) => {
    if (pageValue === 'Setup_New_Sponsor_Organisation_Page') {
      expect
        .soft(
          await commonItemsPage.sponsor_organisation_jsdisabled_search_button.evaluate(
            (e: any) => getComputedStyle(e).backgroundColor
          )
        )
        .toBe(commonItemsPage.commonTestData.rgb_green_color);
    } else if (pageValue === 'Search_Modifications_Page' || pageValue === 'Search_Projects_Page') {
      expect
        .soft(
          await commonItemsPage.search_projects_modifications_sponsor_organisation_jsdisabled_search_button.evaluate(
            (e: any) => getComputedStyle(e).backgroundColor
          )
        )
        .toBe(commonItemsPage.commonTestData.rgb_green_color);
    }
  }
);

Then(
  'I capture the modification id of {string} with status {string}',
  async ({ searchModificationsPage }, modificationCount: string, status: string) => {
    let countValue: string;
    if (modificationCount === 'Single' || modificationCount === 'Partial') {
      countValue = '=';
    } else {
      countValue = '>';
    }
    const modificationId = await searchModificationsPage.sqlGetModificationByStatus(status, countValue);
    await searchModificationsPage.saveModificationIdSearch(modificationId.toString(), modificationCount);
    const irasId = modificationId.toString().split('/')[0];
    await searchModificationsPage.setIrasId(irasId);
  }
);
