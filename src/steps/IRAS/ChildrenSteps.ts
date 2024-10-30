import { createBdd } from 'playwright-bdd';
import { test } from '../../hooks/CustomFixtures';

const { Then } = createBdd(test);

Then(
  'I fill the children section in the children page with {string}',
  async ({ childrenPage, commonItemsPage }, datasetName: string) => {
    const dataset = childrenPage.childrenPageTestData.Children_Section[datasetName];
    for (const key in dataset) {
      if (Object.prototype.hasOwnProperty.call(dataset, key)) {
        await commonItemsPage.fillUIComponent(dataset, key, childrenPage);
      }
    }
  }
);
