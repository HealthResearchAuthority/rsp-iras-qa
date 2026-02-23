import { createBdd } from 'playwright-bdd';
import { test } from '../../../hooks/CustomFixtures';

const { Then } = createBdd(test);

Then('I can see the modification not authorised page', async ({ modificationNotAuthorisedPage }) => {
  await modificationNotAuthorisedPage.assertOnModificationNotAuthorisedPage();
});

Then(
  'I fill the modification not authorised page with {string}',
  async ({ commonItemsPage, modificationNotAuthorisedPage }, datasetName: string) => {
    const dataset = modificationNotAuthorisedPage.modificationNotAuthorisedPageTestData[datasetName];
    for (const key in dataset) {
      if (Object.hasOwn(dataset, key)) {
        await commonItemsPage.fillUIComponent(dataset, key, modificationNotAuthorisedPage);
      }
    }
  }
);
