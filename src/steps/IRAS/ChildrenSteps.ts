import { createBdd } from 'playwright-bdd';
import { test } from '../../hooks/CustomFixtures';

const { Then } = createBdd(test);

Then(
  'I fill the {string} section in the children page with {string}',
  async ({ childrenPage, commonItemsPage }, sectionName: string, datasetName: string) => {
    const dataset = await childrenPage.getTestDataForChildren(sectionName, datasetName);
    for (const key in dataset) {
      if (Object.prototype.hasOwnProperty.call(dataset, key)) {
        await commonItemsPage.fillUIComponent(dataset, key, childrenPage);
      }
    }
  }
);

Then(
  'I validate error message using {string} on mandatory fields for {string} section in the children page with {string}',
  async (
    { childrenPage, commonItemsPage },
    datasetErrorMessage: string,
    sectionName: string,
    datasetFieldNames: string
  ) => {
    const dataset = await childrenPage.getTestDataForChildren(sectionName, datasetFieldNames);
    const errorMessageSummaryEachQuestion = childrenPage.childrenPageTestData.ValidationObject[datasetErrorMessage];
    for (const key in dataset) {
      if (Object.prototype.hasOwnProperty.call(dataset, key)) {
        await commonItemsPage.validateQsetErrorMessage(errorMessageSummaryEachQuestion, dataset, key, childrenPage);
      }
    }
  }
);
