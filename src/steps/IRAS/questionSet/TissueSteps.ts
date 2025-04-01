import { createBdd } from 'playwright-bdd';
import { test } from '../../../hooks/CustomFixtures';

const { Then } = createBdd(test);

Then(
  'I fill the {string} section in the tissue page with {string}',
  async ({ tissuePage, commonItemsPage }, sectionName: string, datasetName: string) => {
    const dataset = tissuePage.tissuePageTestData[sectionName][datasetName];
    for (const key in dataset) {
      if (Object.prototype.hasOwnProperty.call(dataset, key)) {
        await commonItemsPage.fillUIComponent(dataset, key, tissuePage);
      }
    }
  }
);
