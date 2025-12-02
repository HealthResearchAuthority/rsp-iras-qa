import { createBdd } from 'playwright-bdd';
import { expect, test } from '../../../hooks/CustomFixtures';
import { sortArray, confirmStringNotNull } from '../../../utils/UtilFunctions';
import config from '../../../../playwright.config';

const { Then } = createBdd(test);

Then('I can see the project identifiers page', async ({ projectIdentifiersPage }) => {
  await projectIdentifiersPage.assertOnProjectIdentifiersPage();
});

Then(
  'I fill the project identifiers page with {string}',
  async ({ commonItemsPage, projectIdentifiersPage, $tags }, datasetName: string) => {
    const dataset = projectIdentifiersPage.projectIdentifiersPageTestData[datasetName];
    for (const key in dataset) {
      if (Object.hasOwn(dataset, key)) {
        if (key === 'primary_sponsor_organisation_text') {
          if (
            ($tags.includes('@jsEnabled') || config.projects?.[1].use?.javaScriptEnabled) &&
            !$tags.includes('@jsDisabled')
          ) {
            dataset['primary_sponsor_organisation_jsenabled_text'] = dataset['primary_sponsor_organisation_text'];
            await commonItemsPage.fillUIComponent(
              dataset,
              'primary_sponsor_organisation_jsenabled_text',
              projectIdentifiersPage
            );
            try {
              await projectIdentifiersPage.primary_sponsor_organisation_suggestion_list_labels
                .first()
                .waitFor({ state: 'visible', timeout: 5000 });
            } catch {
              /* Element not visible, continue */
            }
            if (await projectIdentifiersPage.primary_sponsor_organisation_suggestion_list_labels.first().isVisible()) {
              await projectIdentifiersPage.primary_sponsor_organisation_suggestion_list_labels.first().click();
            }
          } else {
            await commonItemsPage.fillUIComponent(dataset, key, projectIdentifiersPage);
            await projectIdentifiersPage.primary_sponsor_organisation_jsdisabled_search_button.click({ force: true });
            if (dataset[key] !== '') {
              await projectIdentifiersPage.primary_sponsor_organisation_jsdisabled_search_results_radio_button
                .first()
                .click();
            }
          }
          delete dataset['primary_sponsor_organisation_jsenabled_text'];
        } else {
          await commonItemsPage.fillUIComponent(dataset, key, projectIdentifiersPage);
        }
      }
    }
  }
);

Then(
  'I can see the {string} ui labels on the project identifiers page',
  async ({ commonItemsPage, projectIdentifiersPage }, datasetName: string) => {
    const dataset = projectIdentifiersPage.projectIdentifiersPageTestData[datasetName];
    for (const key in dataset) {
      if (Object.hasOwn(dataset, key)) {
        const labelVal = await commonItemsPage.getUiLabel(key, projectIdentifiersPage);
        expect(labelVal).toBe(dataset[key]);
      }
    }
  }
);

Then(
  'I can see previously saved values for {string} displayed on the project identifiers page',
  async ({ commonItemsPage, projectIdentifiersPage }, datasetName: string) => {
    const dataset = projectIdentifiersPage.projectIdentifiersPageTestData[datasetName];
    for (const key in dataset) {
      if (Object.hasOwn(dataset, key)) {
        if (key === 'primary_sponsor_organisation_text') {
          expect(await projectIdentifiersPage.primary_sponsor_organisation_filled_text.inputValue()).toBe(dataset[key]);
        } else {
          await commonItemsPage.validateUIComponentValues(dataset, key, projectIdentifiersPage);
        }
      }
    }
  }
);

Then(
  'I validate {string} and {string} displayed on project identifiers page for {string}',
  async (
    { commonItemsPage, projectIdentifiersPage },
    errorMessageFieldDatasetName: string,
    errorMessageSummaryDatasetName: string,
    invalidFieldsDatasetName: string
  ) => {
    const errorMessageFieldDataset =
      projectIdentifiersPage.projectIdentifiersPageTestData[errorMessageFieldDatasetName];
    const errorMessageSummaryDataset =
      projectIdentifiersPage.projectIdentifiersPageTestData[errorMessageSummaryDatasetName];
    const invalidFieldsDataset = projectIdentifiersPage.projectIdentifiersPageTestData[invalidFieldsDatasetName];
    for (const key in invalidFieldsDataset) {
      if (Object.hasOwn(invalidFieldsDataset, key)) {
        await commonItemsPage.validateErrorMessage(
          errorMessageFieldDataset,
          errorMessageSummaryDataset,
          key,
          projectIdentifiersPage
        );
      }
    }
  }
);

Then(
  'I type valid {string} for primary sponsor organisation suggestion box and validate the suggestion list along with {string}',
  async ({ projectIdentifiersPage, rtsPage }, datasetName: string, suggestionCommonDatasetName) => {
    const dataset = projectIdentifiersPage.projectIdentifiersPageTestData[datasetName];
    const suggestionHeadersDatasetName =
      projectIdentifiersPage.projectIdentifiersPageTestData[suggestionCommonDatasetName];
    let sponsorOrganisationNameListExpected = await sortArray(rtsPage.rtsResponseList);
    if (sponsorOrganisationNameListExpected.length > 5) {
      sponsorOrganisationNameListExpected = sponsorOrganisationNameListExpected.slice(0, 5);
    }
    await projectIdentifiersPage.primary_sponsor_organisation_jsenabled_text.fill(
      dataset['primary_sponsor_organisation_text']
    );
    await projectIdentifiersPage.page.waitForTimeout(2000);
    const sponsorOrganisationNameListActual =
      await projectIdentifiersPage.primary_sponsor_organisation_suggestion_list_labels.allTextContents();
    expect(sponsorOrganisationNameListActual).toEqual(sponsorOrganisationNameListExpected);
    const suggestionsHeaderLabelActual = await projectIdentifiersPage.primary_sponsor_organisation_suggestion_listbox
      .first()
      .getAttribute('data-before-suggestions');
    const suggestionsHeaderLabelExpected = suggestionHeadersDatasetName.suggestion_header;
    expect(suggestionsHeaderLabelActual).toEqual(suggestionsHeaderLabelExpected);
    const suggestionsFooterLabelActual = await projectIdentifiersPage.primary_sponsor_organisation_suggestion_listbox
      .first()
      .getAttribute('data-after-suggestions');
    const suggestionsFooterLabelExpected = suggestionHeadersDatasetName.suggestion_footer;
    expect(suggestionsFooterLabelActual).toEqual(suggestionsFooterLabelExpected);
  }
);

Then(
  'With JS disabled, I search with valid {string} for primary sponsor organisation search box and validate the search results along with {string}',
  async ({ projectIdentifiersPage, rtsPage }, datasetName: string, searchHintsDatasetName) => {
    const dataset = projectIdentifiersPage.projectIdentifiersPageTestData[datasetName];
    const searchHintDataset = projectIdentifiersPage.projectIdentifiersPageTestData[searchHintsDatasetName];
    let sponsorOrganisationNameListExpected = await sortArray(rtsPage.rtsResponseList);
    const totalMatchingSponsorOrganisations = sponsorOrganisationNameListExpected.length;
    if (sponsorOrganisationNameListExpected.length > 5) {
      sponsorOrganisationNameListExpected = sponsorOrganisationNameListExpected.slice(0, 5);
    }
    await projectIdentifiersPage.primary_sponsor_organisation_text.fill(dataset['primary_sponsor_organisation_text']);
    await projectIdentifiersPage.primary_sponsor_organisation_jsdisabled_search_button.click();
    const sponsorOrganisationNameListActualWithSpaces =
      await projectIdentifiersPage.primary_sponsor_organisation_jsdisabled_search_results_labels.allTextContents();
    const sponsorOrganisationNameListActual = sponsorOrganisationNameListActualWithSpaces.map((str) => str.trim());
    expect(sponsorOrganisationNameListActual).toEqual(sponsorOrganisationNameListExpected);
    const searchResultHeaderHintLabelActual = confirmStringNotNull(
      await projectIdentifiersPage.primary_sponsor_organisation_jsdisabled_result_hint_label.textContent()
    ).trim();
    const searchResultHeaderHintLabelExpected = `${searchHintDataset.search_hint_header_prefix} '${dataset['primary_sponsor_organisation_text']}'`;
    expect(searchResultHeaderHintLabelActual).toEqual(searchResultHeaderHintLabelExpected);
    if (totalMatchingSponsorOrganisations > 5) {
      const searchResultFooterHintLabelActual = confirmStringNotNull(
        await projectIdentifiersPage.primary_sponsor_organisation_jsdisabled_narrow_down_label.textContent()
      ).trim();
      const searchResultFooterHintLabelExpected = `${totalMatchingSponsorOrganisations} ${searchHintDataset.search_hint_footer_prefix} '${dataset['primary_sponsor_organisation_text']}'${searchHintDataset.search_hint_footer}`;
      expect(searchResultFooterHintLabelActual).toEqual(searchResultFooterHintLabelExpected);
    }
  }
);

Then(
  'I type invalid {string} for primary sponsor organisation suggestion box and validate the suggestion list along with {string}',
  async ({ projectIdentifiersPage }, datasetName: string, suggestionCommonDatasetName) => {
    const dataset = projectIdentifiersPage.projectIdentifiersPageTestData[datasetName];
    const suggestionHeadersDatasetName =
      projectIdentifiersPage.projectIdentifiersPageTestData[suggestionCommonDatasetName];
    await projectIdentifiersPage.primary_sponsor_organisation_jsenabled_text.fill(
      dataset['primary_sponsor_organisation_text']
    );
    await projectIdentifiersPage.page.waitForTimeout(2000);
    const noResultFoundSuggestionActual =
      await projectIdentifiersPage.primary_sponsor_organisation_suggestion_list_labels.first().textContent();
    const suggestionsHeaderLabelExpected = suggestionHeadersDatasetName.no_suggestion_found;
    expect(noResultFoundSuggestionActual).toEqual(suggestionsHeaderLabelExpected);
  }
);

Then(
  'With JS disabled, I search with invalid {string} for primary sponsor organisation search box and validate the search results along with {string}',
  async ({ projectIdentifiersPage }, datasetName: string, searchHintsDatasetName) => {
    const dataset = projectIdentifiersPage.projectIdentifiersPageTestData[datasetName];
    const searchHintDataset = projectIdentifiersPage.projectIdentifiersPageTestData[searchHintsDatasetName];
    await projectIdentifiersPage.primary_sponsor_organisation_text.fill(dataset['primary_sponsor_organisation_text']);
    await projectIdentifiersPage.primary_sponsor_organisation_jsdisabled_search_button.click();
    const noResultFoundLabelActual = confirmStringNotNull(
      await projectIdentifiersPage.primary_sponsor_organisation_jsdisabled_no_suggestions_label.textContent()
    ).trim();
    const noResultFoundLabelExpected = `${searchHintDataset.no_suggestion_found} ${dataset['primary_sponsor_organisation_text']}`;
    expect(noResultFoundLabelActual).toEqual(noResultFoundLabelExpected);
  }
);

Then(
  'With JS disabled, I search with invalid min characters {string} for primary sponsor organisation search box',
  async ({ projectIdentifiersPage }, datasetName: string) => {
    const dataset = projectIdentifiersPage.projectIdentifiersPageTestData[datasetName];
    await projectIdentifiersPage.primary_sponsor_organisation_text.fill(dataset['primary_sponsor_organisation_text']);
    await projectIdentifiersPage.primary_sponsor_organisation_jsdisabled_search_button.click();
  }
);

Then(
  'I type min characters {string} for primary sponsor organisation suggestion box and validate the suggestion list along with {string}',
  async ({ projectIdentifiersPage }, datasetName: string, suggestionCommonDatasetName) => {
    const dataset = projectIdentifiersPage.projectIdentifiersPageTestData[datasetName];
    const suggestionHeadersDataset = projectIdentifiersPage.projectIdentifiersPageTestData[suggestionCommonDatasetName];
    await projectIdentifiersPage.primary_sponsor_organisation_jsenabled_text.fill(
      dataset['primary_sponsor_organisation_text']
    );
    await projectIdentifiersPage.page.waitForTimeout(2000);
    const continueEnteringSuggestionActual =
      await projectIdentifiersPage.primary_sponsor_organisation_suggestion_listbox
        .first()
        .getAttribute('data-before-suggestions');
    const suggestionsHeaderLabelExpected = suggestionHeadersDataset.suggestion_footer;
    expect(continueEnteringSuggestionActual).toEqual(suggestionsHeaderLabelExpected);
  }
);

Then(
  'I validate the guidance content displayed on project identifiers page',
  async ({ commonItemsPage, projectIdentifiersPage }) => {
    const collapsibleDetailsComponent = commonItemsPage.details_component
      .getByText(
        projectIdentifiersPage.projectIdentifiersPageTestData.Project_Identifiers_Page
          .guidance_header_cant_find_organisation
      )
      .locator('..');
    await commonItemsPage.verifyDetailsExpanded('closed', commonItemsPage.details_component);
    await collapsibleDetailsComponent.click();
    await commonItemsPage.verifyDetailsExpanded('open', commonItemsPage.details_component);
    const cantFindOrganisationDetailsBody = (await commonItemsPage.details_component.textContent())
      .replaceAll(/\s+/g, ' ')
      .trim();
    expect(cantFindOrganisationDetailsBody).toContain(
      projectIdentifiersPage.projectIdentifiersPageTestData.Project_Identifiers_Page
        .guidance_body_cant_find_organisation
    );
    await collapsibleDetailsComponent.click();
    await commonItemsPage.verifyDetailsExpanded('closed', commonItemsPage.details_component);
    await collapsibleDetailsComponent.click();
  }
);
