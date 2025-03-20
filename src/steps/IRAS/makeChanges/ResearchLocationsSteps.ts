import { createBdd } from 'playwright-bdd';
import { test } from '../../../hooks/CustomFixtures';

const { Then } = createBdd(test);

Then('I can see the research locations page', async ({ reseachLocationsPage }) => {
  await reseachLocationsPage.assertOnResearchLocationsPage();
});

Then(
  'I fill the research locations page with {string}',
  async ({ commonItemsPage, reseachLocationsPage }, datasetName: string) => {
    const dataset = reseachLocationsPage.researchLocationsPageTestData[datasetName];
    for (const key in dataset) {
      if (Object.prototype.hasOwnProperty.call(dataset, key)) {
        await commonItemsPage.fillUIComponent(dataset, key, reseachLocationsPage);
      }
    }
  }
);
