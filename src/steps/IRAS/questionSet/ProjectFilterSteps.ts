import { createBdd } from 'playwright-bdd';
import { test } from '../../../hooks/CustomFixtures';

const { Then } = createBdd(test);

Then(
  'I fill the {string} section in the project filter page with {string}',
  async ({ projectFilterPage, commonItemsPage }, sectionName: string, datasetName: string) => {
    const dataset = projectFilterPage.projectFilterPageTestData[sectionName][datasetName];
    for (const key in dataset) {
      if (Object.hasOwn(dataset, key)) {
        await commonItemsPage.fillUIComponent(dataset, key, projectFilterPage);
      }
    }
  }
);
