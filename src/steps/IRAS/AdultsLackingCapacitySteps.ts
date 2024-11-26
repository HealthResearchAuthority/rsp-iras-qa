import { createBdd } from 'playwright-bdd';
import { test } from '../../hooks/CustomFixtures';

const { Then } = createBdd(test);

Then(
  'I fill the {string} section in the adults lacking capacity page with {string}',
  async ({ adultsLackingCapacityPage, commonItemsPage }, sectionName: string, datasetName: string) => {
    const dataset = await adultsLackingCapacityPage.getTestDataForALC(sectionName, datasetName);
    for (const key in dataset) {
      if (Object.prototype.hasOwnProperty.call(dataset, key)) {
        await commonItemsPage.fillUIComponent(dataset, key, adultsLackingCapacityPage);
      }
    }
  }
);

Then(
  'I validate error message using {string} on mandatory fields for {string} section in the adults lacking capacity page with {string}',
  async (
    { adultsLackingCapacityPage, commonItemsPage },
    datasetErrorMessage: string,
    sectionName: string,
    datasetFieldNames: string
  ) => {
    const dataset = await adultsLackingCapacityPage.getTestDataForALC(sectionName, datasetFieldNames);
    const errorMessageSummaryEachQuestion =
      adultsLackingCapacityPage.adultsLackingCapacityPageTestData.ValidationObject[datasetErrorMessage];
    for (const key in dataset) {
      if (Object.prototype.hasOwnProperty.call(dataset, key)) {
        await commonItemsPage.validateQsetErrorMessage(
          errorMessageSummaryEachQuestion,
          dataset,
          key,
          adultsLackingCapacityPage
        );
      }
    }
  }
);
