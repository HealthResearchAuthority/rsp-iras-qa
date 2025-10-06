import { createBdd } from 'playwright-bdd';
import { expect, test } from '../../../hooks/CustomFixtures';

const { Then } = createBdd(test);

Then('I can see the chief investigator page', async ({ chiefInvestigatorPage }) => {
  await chiefInvestigatorPage.assertOnChiefInvestigatorPage();
});

Then(
  'I fill the chief investigator page with {string}',
  async ({ commonItemsPage, chiefInvestigatorPage }, datasetName: string) => {
    const dataset = chiefInvestigatorPage.chiefInvestigatorPageTestData[datasetName];
    for (const key in dataset) {
      if (Object.hasOwn(dataset, key)) {
        await commonItemsPage.fillUIComponent(dataset, key, chiefInvestigatorPage);
      }
    }
  }
);

Then(
  'I can see the {string} ui labels on the chief investigator page',
  async ({ commonItemsPage, chiefInvestigatorPage }, datasetName: string) => {
    const dataset = chiefInvestigatorPage.chiefInvestigatorPageTestData[datasetName];
    for (const key in dataset) {
      if (Object.hasOwn(dataset, key)) {
        const labelVal = await commonItemsPage.getUiLabel(key, chiefInvestigatorPage);
        expect(labelVal).toBe(dataset[key]);
      }
    }
  }
);

Then(
  'I can see previously saved values for {string} displayed on the chief investigator page',
  async ({ commonItemsPage, chiefInvestigatorPage }, datasetName: string) => {
    const dataset = chiefInvestigatorPage.chiefInvestigatorPageTestData[datasetName];
    for (const key in dataset) {
      await commonItemsPage.validateUIComponentValues(dataset, key, chiefInvestigatorPage);
    }
  }
);

Then(
  'I validate {string} and {string} displayed on chief investigator page for {string}',
  async (
    { commonItemsPage, chiefInvestigatorPage },
    errorMessageFieldDatasetName: string,
    errorMessageSummaryDatasetName: string,
    invalidFieldsDatasetName: string
  ) => {
    const errorMessageFieldDataset = chiefInvestigatorPage.chiefInvestigatorPageTestData[errorMessageFieldDatasetName];
    const errorMessageSummaryDataset =
      chiefInvestigatorPage.chiefInvestigatorPageTestData[errorMessageSummaryDatasetName];
    const invalidFieldsDataset = chiefInvestigatorPage.chiefInvestigatorPageTestData[invalidFieldsDatasetName];
    for (const key in invalidFieldsDataset) {
      if (Object.hasOwn(invalidFieldsDataset, key)) {
        await commonItemsPage.validateErrorMessage(
          errorMessageFieldDataset,
          errorMessageSummaryDataset,
          key,
          chiefInvestigatorPage
        );
      }
    }
  }
);
