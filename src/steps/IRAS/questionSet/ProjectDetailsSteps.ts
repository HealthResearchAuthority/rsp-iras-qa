import { createBdd } from 'playwright-bdd';
import { test } from '../../../hooks/CustomFixtures';

const { Then } = createBdd(test);

Then(
  'I fill the {string} section on the project details page with {string}',
  async ({ projectDetailsPage, commonItemsPage }, sectionName: string, datasetName: string) => {
    const dataset = projectDetailsPage.projectDetailsPageTestData[sectionName][datasetName];
    for (const key in dataset) {
      if (Object.prototype.hasOwnProperty.call(dataset, key)) {
        await commonItemsPage.fillUIComponent(dataset, key, projectDetailsPage);
      }
    }
  }
);
