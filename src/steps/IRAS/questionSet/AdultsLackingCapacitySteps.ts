import { createBdd } from 'playwright-bdd';
import { test } from '../../../hooks/CustomFixtures';

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
