import { createBdd } from 'playwright-bdd';
import { test } from '../../../hooks/CustomFixtures';

const { Then } = createBdd(test);

Then(
  'I fill the {string} in the children page with {string}',
  async ({ childrenPage, commonItemsPage }, sectionName: string, datasetName: string) => {
    const dataset = childrenPage.childrenPageTestData[sectionName][datasetName];
    for (const key in dataset) {
      if (Object.hasOwn(dataset, key)) {
        await commonItemsPage.fillUIComponent(dataset, key, childrenPage);
      }
    }
  }
);
