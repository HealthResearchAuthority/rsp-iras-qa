import { createBdd } from 'playwright-bdd';
import { expect, test } from '../../../hooks/CustomFixtures';
import { sortArray } from '../../../utils/UtilFunctions';

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
        if (key === 'primary_sponsor_organisation_text' && $tags.includes('@jsEnabled')) {
          dataset['primary_sponsor_organisation_jsenabled_text'] = dataset['primary_sponsor_organisation_text'];
          await commonItemsPage.fillUIComponent(
            dataset,
            'primary_sponsor_organisation_jsenabled_text',
            keyProjectRolesPage
          );
          await keyProjectRolesPage.page.waitForTimeout(2000);
          if (await keyProjectRolesPage.primary_sponsor_organisation_suggestion_list_labels.first().isVisible()) {
            await keyProjectRolesPage.primary_sponsor_organisation_suggestion_list_labels.first().click();
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
    const suggestionsHeaderLabelActual = await keyProjectRolesPage.primary_sponsor_organisation_suggestion_list_labels
      .locator('..')
      .first()
      .getAttribute('data-before-suggestions');
    const suggestionsHeaderLabelExpected = suggestionHeadersDatasetName.suggestion_header;
    expect(suggestionsHeaderLabelActual).toEqual(suggestionsHeaderLabelExpected);
    const suggestionsFooterLabelActual = await keyProjectRolesPage.primary_sponsor_organisation_suggestion_list_labels
      .locator('..')
      .first()
      .getAttribute('data-after-suggestions');
    const suggestionsFooterLabelExpected = suggestionHeadersDatasetName.suggestion_footer;
    expect(suggestionsFooterLabelActual).toEqual(suggestionsFooterLabelExpected);
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
  'I type min characters {string} for primary sponsor organisation suggestion box and validate the suggestion list along with {string}',
  async ({ keyProjectRolesPage }, datasetName: string, suggestionCommonDatasetName) => {
    const dataset = keyProjectRolesPage.keyProjectRolesPageTestData[datasetName];
    const suggestionHeadersDatasetName = keyProjectRolesPage.keyProjectRolesPageTestData[suggestionCommonDatasetName];
    await keyProjectRolesPage.primary_sponsor_organisation_jsenabled_text.fill(
      dataset['primary_sponsor_organisation_text']
    );
    await keyProjectRolesPage.page.waitForTimeout(2000);
    const continueEnteringSuggestionActual =
      await keyProjectRolesPage.primary_sponsor_organisation_suggestion_list_labels
        .locator('..')
        .first()
        .getAttribute('data-before-suggestions');
    const suggestionsHeaderLabelExpected = suggestionHeadersDatasetName.suggestion_footer;
    expect(continueEnteringSuggestionActual).toEqual(suggestionsHeaderLabelExpected);
  }
);
