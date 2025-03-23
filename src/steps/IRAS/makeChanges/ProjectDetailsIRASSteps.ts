import { createBdd } from 'playwright-bdd';
import { test } from '../../../hooks/CustomFixtures';

const { Then } = createBdd(test);

Then('I can see the project details iras page', async ({ projectDetailsIRASPage }) => {
  await projectDetailsIRASPage.assertOnProjectDetailsIRASPage();
});

Then(
  'I can see the {string} ui labels on the project details iras page',
  async ({ commonItemsPage, projectDetailsIRASPage }, datasetName: string) => {
    const dataset = projectDetailsIRASPage.projectDetailsIRASPageTestData[datasetName];
    for (const key in dataset) {
      if (Object.prototype.hasOwnProperty.call(dataset, key)) {
        await commonItemsPage.validateUILabels(dataset, key, projectDetailsIRASPage);
      }
    }
  }
);

Then(
  'I fill the project details iras page with {string}',
  async ({ commonItemsPage, projectDetailsIRASPage }, datasetName: string) => {
    const dataset = projectDetailsIRASPage.projectDetailsIRASPageTestData[datasetName];
    for (const key in dataset) {
      if (Object.prototype.hasOwnProperty.call(dataset, key)) {
        await commonItemsPage.fillUIComponent(dataset, key, projectDetailsIRASPage);
      }
    }
  }
);

Then(
  'I can see previously saved values for {string} displayed on the project details iras page',
  async ({ commonItemsPage, projectDetailsIRASPage }, datasetName: string) => {
    const dataset = projectDetailsIRASPage.projectDetailsIRASPageTestData[datasetName];
    for (const key in dataset) {
      if (Object.prototype.hasOwnProperty.call(dataset, key)) {
        await commonItemsPage.validateUIComponentValues(dataset, key, projectDetailsIRASPage);
      }
    }
  }
);

Then(
  'I validate {string} and {string} displayed on project details iras page for {string}',
  async (
    { commonItemsPage, projectDetailsIRASPage },
    errorMessageFieldDatasetName: string,
    errorMessageSummaryDatasetName: string,
    invalidFieldsDatasetName: string
  ) => {
    const errorMessageFieldDataset =
      projectDetailsIRASPage.projectDetailsIRASPageTestData[errorMessageFieldDatasetName];
    const errorMessageSummaryDataset =
      projectDetailsIRASPage.projectDetailsIRASPageTestData[errorMessageSummaryDatasetName];
    const invalidFieldsDataset = projectDetailsIRASPage.projectDetailsIRASPageTestData[invalidFieldsDatasetName];
    for (const key in invalidFieldsDataset) {
      if (Object.prototype.hasOwnProperty.call(invalidFieldsDataset, key)) {
        await commonItemsPage.validateErrorMessage(
          errorMessageFieldDataset,
          errorMessageSummaryDataset,
          key,
          projectDetailsIRASPage
        );
      }
    }
  }
);
