import { createBdd } from 'playwright-bdd';
import { test } from '../../hooks/CustomFixtures';

const { Then } = createBdd(test);

Then(
  'I fill the {string} section in the children page with {string}',
  async ({ childrenPage, commonItemsPage }, sectionName: string, datasetName: string) => {
    let dataset: any;
    if (sectionName === 'children') {
      dataset = childrenPage.childrenPageTestData.Children_Section[datasetName];
    }
    for (const key in dataset) {
      if (Object.prototype.hasOwnProperty.call(dataset, key)) {
        await commonItemsPage.fillUIComponent(dataset, key, childrenPage);
      }
    }
  }
);

Then(
  'I validate error displayed using {string} when no data entered on mandatory fields for {string} section in the children page with {string}',
  async (
    { childrenPage, commonItemsPage },
    datasetErrorMessage: string,
    sectionName: string,
    datasetFieldNames: string
  ) => {
    let dataset: any;
    if (sectionName === 'children') {
      dataset = childrenPage.childrenPageTestData.Children_Section[datasetFieldNames];
    }
    const errorMessageSummaryEachQuestion = childrenPage.childrenPageTestData.ValidationObject[datasetErrorMessage];
    for (const key in dataset) {
      if (Object.prototype.hasOwnProperty.call(dataset, key)) {
        if (dataset[key].length === 0) {
          await commonItemsPage.validateQsetErrorMessage(errorMessageSummaryEachQuestion, key, childrenPage);
        }
      }
    }
  }
);
