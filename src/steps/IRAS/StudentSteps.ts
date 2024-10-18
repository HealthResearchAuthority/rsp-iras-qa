import { createBdd } from 'playwright-bdd';
import { test } from '../../hooks/CustomFixtures';

const { Then } = createBdd(test);

Then(
  'I fill the educational project section in the student page with {string}',
  async ({ studentPage, commonItemsPage }, datasetName: string) => {
    const dataset = studentPage.studentPageTestData.Educational_Project[datasetName];
    for (const key in dataset) {
      if (Object.prototype.hasOwnProperty.call(dataset, key)) {
        await commonItemsPage.fillUIComponent(dataset, key, studentPage);
      }
    }
  }
);
