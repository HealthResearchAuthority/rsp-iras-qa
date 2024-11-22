import { createBdd } from 'playwright-bdd';
import { test } from '../../hooks/CustomFixtures';

const { Then } = createBdd(test);

Then(
  'I fill the {string} section in the adults lacking capacity page with {string}',
  async ({ adultsLackingCapacityPage, commonItemsPage }, sectionName: string, datasetName: string) => {
    let dataset: any;
    if (sectionName === 'adults lacking capacity ctimp') {
      dataset = adultsLackingCapacityPage.adultsLackingCapacityPageTestData.Adults_Lacking_Capacity_CTIMP[datasetName];
    } else if (sectionName === 'adults lacking capacity non ctimp') {
      dataset =
        adultsLackingCapacityPage.adultsLackingCapacityPageTestData.Adults_Lacking_Capacity_Non_CTIMP[datasetName];
    }
    for (const key in dataset) {
      if (Object.prototype.hasOwnProperty.call(dataset, key)) {
        await commonItemsPage.fillUIComponent(dataset, key, adultsLackingCapacityPage);
      }
    }
  }
);

Then(
  'I validate error displayed using {string} when no data entered on mandatory fields for {string} section in the adults lacking capacity page with {string}',
  async (
    { adultsLackingCapacityPage, commonItemsPage },
    datasetErrorMessage: string,
    sectionName: string,
    datasetFieldNames: string
  ) => {
    let dataset: any;
    if (sectionName === 'adults lacking capacity ctimp') {
      dataset =
        adultsLackingCapacityPage.adultsLackingCapacityPageTestData.Adults_Lacking_Capacity_CTIMP[datasetFieldNames];
    } else if (sectionName === 'adults lacking capacity non ctimp') {
      dataset =
        adultsLackingCapacityPage.adultsLackingCapacityPageTestData.Adults_Lacking_Capacity_Non_CTIMP[
          datasetFieldNames
        ];
    }
    const errorMessageSummaryEachQuestion =
      adultsLackingCapacityPage.adultsLackingCapacityPageTestData.ValidationObject[datasetErrorMessage];
    for (const key in dataset) {
      if (Object.prototype.hasOwnProperty.call(dataset, key)) {
        if (dataset[key].length === 0) {
          await commonItemsPage.validateQsetErrorMessage(
            errorMessageSummaryEachQuestion,
            key,
            adultsLackingCapacityPage
          );
        }
      }
    }
  }
);
