import { createBdd } from 'playwright-bdd';
import { test } from '../../../hooks/CustomFixtures';

const { Then } = createBdd(test);

Then(
  'I fill the {string} section in the student page with {string}',
  async ({ studentPage, commonItemsPage }, sectionName: string, datasetName: string) => {
    const dataset = studentPage.studentPageTestData[sectionName][datasetName];
    for (const key in dataset) {
      if (Object.hasOwn(dataset, key)) {
        await commonItemsPage.fillUIComponent(dataset, key, studentPage);
      }
    }
  }
);
