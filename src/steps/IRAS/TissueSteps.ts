import { createBdd } from 'playwright-bdd';
import { test } from '../../hooks/CustomFixtures';

const { Then } = createBdd(test);

Then(
  'I fill the human biological samples section in the tissue page with {string}',
  async ({ tissuePage, commonItemsPage }, datasetName: string) => {
    const dataset = tissuePage.tissuePageTestData.Human_Biological_Samples[datasetName];
    for (const key in dataset) {
      if (Object.prototype.hasOwnProperty.call(dataset, key)) {
        await commonItemsPage.fillUIComponent(dataset, key, tissuePage);
      }
    }
  }
);

Then(
  'I fill the health related findings section in the tissue page with {string}',
  async ({ tissuePage, commonItemsPage }, datasetName: string) => {
    const dataset = tissuePage.tissuePageTestData.Health_Related_Findings[datasetName];
    for (const key in dataset) {
      if (Object.prototype.hasOwnProperty.call(dataset, key)) {
        await commonItemsPage.fillUIComponent(dataset, key, tissuePage);
      }
    }
  }
);
