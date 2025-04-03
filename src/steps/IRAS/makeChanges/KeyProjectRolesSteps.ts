import { createBdd } from 'playwright-bdd';
import { expect, test } from '../../../hooks/CustomFixtures';

const { Then } = createBdd(test);

Then('I can see the key project roles page', async ({ keyProjectRolesPage }) => {
  await keyProjectRolesPage.assertOnKeyProjectRolesPage();
});

Then(
  'I fill the key project roles page with {string}',
  async ({ commonItemsPage, keyProjectRolesPage }, datasetName: string) => {
    const dataset = keyProjectRolesPage.keyProjectRolesPageTestData[datasetName];
    for (const key in dataset) {
      if (Object.prototype.hasOwnProperty.call(dataset, key)) {
        await commonItemsPage.fillUIComponent(dataset, key, keyProjectRolesPage);
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
        const labelVal = await commonItemsPage.getUiLabel(dataset, key, keyProjectRolesPage);
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
