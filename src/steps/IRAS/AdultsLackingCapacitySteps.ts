import { createBdd } from 'playwright-bdd';
import { test } from '../../hooks/CustomFixtures';

const { Then } = createBdd(test);

Then(
  'I fill the adults lacking capacity ctimp section in the adults lacking capacity page with {string}',
  async ({ adultsLackingCapacityPage, commonItemsPage }, datasetName: string) => {
    const dataset =
      adultsLackingCapacityPage.adultsLackingCapacityPageTestData.Adults_Lacking_Capacity_CTIMP[datasetName];
    for (const key in dataset) {
      if (Object.prototype.hasOwnProperty.call(dataset, key)) {
        await commonItemsPage.fillUIComponent(dataset, key, adultsLackingCapacityPage);
      }
    }
  }
);

Then(
  'I fill the adults lacking capacity non ctimp section in the adults lacking capacity page with {string}',
  async ({ adultsLackingCapacityPage, commonItemsPage }, datasetName: string) => {
    const dataset =
      adultsLackingCapacityPage.adultsLackingCapacityPageTestData.Adults_Lacking_Capacity_Non_CTIMP[datasetName];
    for (const key in dataset) {
      if (Object.prototype.hasOwnProperty.call(dataset, key)) {
        await commonItemsPage.fillUIComponent(dataset, key, adultsLackingCapacityPage);
      }
    }
  }
);
