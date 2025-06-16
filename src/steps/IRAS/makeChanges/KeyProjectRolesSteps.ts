import { createBdd } from 'playwright-bdd';
import { expect, test } from '../../../hooks/CustomFixtures';
import { sortArray } from '../../../utils/UtilFunctions';
import config from '../../../../playwright.config';

const { Then } = createBdd(test);

Then('I can see the key project roles page', async ({ keyProjectRolesPage }) => {
  await keyProjectRolesPage.assertOnKeyProjectRolesPage();
});

Then(
  'I fill the key project roles page with {string}',
  async ({ commonItemsPage, keyProjectRolesPage, $tags }, datasetName: string) => {
    const dataset = keyProjectRolesPage.keyProjectRolesPageTestData[datasetName];
    for (const key in dataset) {
      if (Object.prototype.hasOwnProperty.call(dataset, key)) {
        if (key === 'primary_sponsor_organisation_text') {
          dataset['primary_sponsor_organisation_jsenabled_text'] = dataset['primary_sponsor_organisation_text'];
          await commonItemsPage.fillUIComponent(
            dataset,
            'primary_sponsor_organisation_jsenabled_text',
            keyProjectRolesPage
          );
          if ($tags.includes('@jsEnabled') || config.projects?.[1].use?.javaScriptEnabled) {
            if (await keyProjectRolesPage.primary_sponsor_organisation_suggestion_list_labels.first().isVisible()) {
              await keyProjectRolesPage.primary_sponsor_organisation_suggestion_list_labels.first().click();
            }
          } else {
            // new code to handle
            console.log('Running inside the js disabled block');
            keyProjectRolesPage.searchSponsorOrganisation();
          }
          delete dataset['primary_sponsor_organisation_jsenabled_text'];
        } else {
          await commonItemsPage.fillUIComponent(dataset, key, keyProjectRolesPage);
        }
      }
    }
  }
);

Then(
  'I can see the {string} ui labels on the key project roles page',
  async ({ commonItemsPage, keyProjectRolesPage }, datasetName: string) => {
    const dataset = keyProjectRolesPage.keyProjectRolesPageTestData[datasetName];
    for (const key in dataset) {
      if (Object.prototype.hasOwnProperty.call(dataset, key)) {
        if (
          key === 'primary_sponsor_organisation_jsdisabled_search_hint_label' &&
          config.projects?.[1].use?.javaScriptEnabled === true
        ) {
          continue;
        }
        const labelVal = await commonItemsPage.getUiLabel(key, keyProjectRolesPage);
        expect(labelVal).toBe(dataset[key]);
      }
    }
  }
);

Then(
  'I can see previously saved values for {string} displayed on the key project roles page',
  async ({ commonItemsPage, keyProjectRolesPage }, datasetName: string) => {
    const dataset = keyProjectRolesPage.keyProjectRolesPageTestData[datasetName];
    for (const key in dataset) {
      if (Object.prototype.hasOwnProperty.call(dataset, key)) {
        await commonItemsPage.validateUIComponentValues(dataset, key, keyProjectRolesPage);
      }
    }
  }
);

Then(
  'I validate {string} and {string} displayed on key project roles page for {string}',
  async (
    { commonItemsPage, keyProjectRolesPage },
    errorMessageFieldDatasetName: string,
    errorMessageSummaryDatasetName: string,
    invalidFieldsDatasetName: string
  ) => {
    const errorMessageFieldDataset = keyProjectRolesPage.keyProjectRolesPageTestData[errorMessageFieldDatasetName];
    const errorMessageSummaryDataset = keyProjectRolesPage.keyProjectRolesPageTestData[errorMessageSummaryDatasetName];
    const invalidFieldsDataset = keyProjectRolesPage.keyProjectRolesPageTestData[invalidFieldsDatasetName];
    for (const key in invalidFieldsDataset) {
      if (Object.prototype.hasOwnProperty.call(invalidFieldsDataset, key)) {
        await commonItemsPage.validateErrorMessage(
          errorMessageFieldDataset,
          errorMessageSummaryDataset,
          key,
          keyProjectRolesPage
        );
      }
    }
  }
);

Then(
  'I type valid {string} for primary sponsor organisation suggestion box and validate the suggestion list along with {string}',
  async ({ keyProjectRolesPage, rtsPage }, datasetName: string, suggestionCommonDatasetName) => {
    const dataset = keyProjectRolesPage.keyProjectRolesPageTestData[datasetName];
    const suggestionHeadersDatasetName = keyProjectRolesPage.keyProjectRolesPageTestData[suggestionCommonDatasetName];
    let sponsorOrganisationNameListExpected = await sortArray(rtsPage.rtsResponseList);
    if (sponsorOrganisationNameListExpected.length > 5) {
      sponsorOrganisationNameListExpected = sponsorOrganisationNameListExpected.slice(0, 5);
    }
    await keyProjectRolesPage.primary_sponsor_organisation_jsenabled_text.fill(
      dataset['primary_sponsor_organisation_text']
    );
    await keyProjectRolesPage.page.waitForTimeout(2000);
    const sponsorOrganisationNameListActual =
      await keyProjectRolesPage.primary_sponsor_organisation_suggestion_list_labels.allTextContents();
    expect(sponsorOrganisationNameListActual).toEqual(sponsorOrganisationNameListExpected);
    const suggestionsHeaderLabelActual = await keyProjectRolesPage.primary_sponsor_organisation_suggestion_listbox
      .first()
      .getAttribute('data-before-suggestions');
    const suggestionsHeaderLabelExpected = suggestionHeadersDatasetName.suggestion_header;
    expect(suggestionsHeaderLabelActual).toEqual(suggestionsHeaderLabelExpected);
    const suggestionsFooterLabelActual = await keyProjectRolesPage.primary_sponsor_organisation_suggestion_listbox
      .first()
      .getAttribute('data-after-suggestions');
    const suggestionsFooterLabelExpected = suggestionHeadersDatasetName.suggestion_footer;
    expect(suggestionsFooterLabelActual).toEqual(suggestionsFooterLabelExpected);
  }
);

Then(
  'I type valid {string} for primary sponsor organisation suggestion box and validate the suggestion list along with {string}',
  async ({ keyProjectRolesPage, rtsPage }, datasetName: string, searchHintsDatasetName) => {
    const dataset = keyProjectRolesPage.keyProjectRolesPageTestData[datasetName];
    const searchHintDatasetName = keyProjectRolesPage.keyProjectRolesPageTestData[searchHintsDatasetName];
    let sponsorOrganisationNameListExpected = await sortArray(rtsPage.rtsResponseList);
    const totalMatchingSponsorOrganisations = sponsorOrganisationNameListExpected.length;
    if (sponsorOrganisationNameListExpected.length > 5) {
      sponsorOrganisationNameListExpected = sponsorOrganisationNameListExpected.slice(0, 5);
    }
    await keyProjectRolesPage.primary_sponsor_organisation_text.fill(dataset['primary_sponsor_organisation_text']);
    //update this locator
    await keyProjectRolesPage.primary_sponsor_organisation_jsdisabled_search_button.click();
    await keyProjectRolesPage.page.waitForTimeout(2000);
    const sponsorOrganisationNameListActual =
      await keyProjectRolesPage.primary_sponsor_organisation_jsdisabled_search_results_labels.allTextContents();
    expect(sponsorOrganisationNameListActual).toEqual(sponsorOrganisationNameListExpected);

    //update this locator
    const suggestionsHeaderLabelActual = await keyProjectRolesPage.primary_sponsor_organisation_suggestion_listbox
      .first()
      .getAttribute('data-before-suggestions');

    const searchHintHeaderExpected = `${searchHintDatasetName.search_hint_header_prefix} '${dataset['primary_sponsor_organisation_text']}'`;

    // remove this line
    console.log(
      `searchHintHeaderExpected : ${searchHintHeaderExpected} suggestionsHeaderLabelActual: ${suggestionsHeaderLabelActual}`
    );
    expect(suggestionsHeaderLabelActual).toEqual(searchHintHeaderExpected);
    //update this locator
    const suggestionsFooterLabelActual = await keyProjectRolesPage.primary_sponsor_organisation_suggestion_listbox
      .first()
      .getAttribute('data-after-suggestions');

    const searchResultFooterLabelExpected = `${totalMatchingSponsorOrganisations} ${searchHintDatasetName.search_hint_footer_prefix} '${dataset['primary_sponsor_organisation_text']}'${searchHintDatasetName.search_hint_footer}`;
    //searchHintDatasetName.suggestion_footer;
    expect(suggestionsFooterLabelActual).toEqual(searchResultFooterLabelExpected);
  }
);

Then(
  'I type invalid {string} for primary sponsor organisation suggestion box and validate the suggestion list along with {string}',
  async ({ keyProjectRolesPage }, datasetName: string, suggestionCommonDatasetName) => {
    const dataset = keyProjectRolesPage.keyProjectRolesPageTestData[datasetName];
    const suggestionHeadersDatasetName = keyProjectRolesPage.keyProjectRolesPageTestData[suggestionCommonDatasetName];
    await keyProjectRolesPage.primary_sponsor_organisation_jsenabled_text.fill(
      dataset['primary_sponsor_organisation_text']
    );
    await keyProjectRolesPage.page.waitForTimeout(2000);
    const noResultFoundSuggestionActual = await keyProjectRolesPage.primary_sponsor_organisation_suggestion_list_labels
      .first()
      .textContent();
    const suggestionsHeaderLabelExpected = suggestionHeadersDatasetName.no_suggestion_found;
    expect(noResultFoundSuggestionActual).toEqual(suggestionsHeaderLabelExpected);
  }
);

Then(
  'I type invalid {string} for primary sponsor organisation suggestion box and validate the suggestion list along with {string}',
  async ({ keyProjectRolesPage }, datasetName: string, searchHintsDatasetName) => {
    const dataset = keyProjectRolesPage.keyProjectRolesPageTestData[datasetName];
    const searchHintDatasetName = keyProjectRolesPage.keyProjectRolesPageTestData[searchHintsDatasetName];
    await keyProjectRolesPage.primary_sponsor_organisation_text.fill(dataset['primary_sponsor_organisation_text']);
    //update this locators
    await keyProjectRolesPage.primary_sponsor_organisation_jsdisabled_search_button.click();
    await keyProjectRolesPage.page.waitForTimeout(2000);
    const noResultFoundLabelActual = await keyProjectRolesPage.primary_sponsor_organisation_suggestion_list_labels
      .first()
      .textContent();
    const searchResultLabelExpected = `${searchHintDatasetName.no_suggestion_found} ${dataset['primary_sponsor_organisation_text']}`;
    expect(noResultFoundLabelActual).toEqual(searchResultLabelExpected);
  }
);

Then(
  'I type min characters {string} for primary sponsor organisation suggestion box and validate the suggestion list along with {string}',
  async ({ keyProjectRolesPage }, datasetName: string, suggestionCommonDatasetName) => {
    const dataset = keyProjectRolesPage.keyProjectRolesPageTestData[datasetName];
    const suggestionHeadersDatasetName = keyProjectRolesPage.keyProjectRolesPageTestData[suggestionCommonDatasetName];
    await keyProjectRolesPage.primary_sponsor_organisation_jsenabled_text.fill(
      dataset['primary_sponsor_organisation_text']
    );
    await keyProjectRolesPage.page.waitForTimeout(2000);
    const continueEnteringSuggestionActual = await keyProjectRolesPage.primary_sponsor_organisation_suggestion_listbox
      .first()
      .getAttribute('data-after-suggestions');
    const suggestionsHeaderLabelExpected = suggestionHeadersDatasetName.suggestion_footer;
    expect(continueEnteringSuggestionActual).toEqual(suggestionsHeaderLabelExpected);
  }
);
