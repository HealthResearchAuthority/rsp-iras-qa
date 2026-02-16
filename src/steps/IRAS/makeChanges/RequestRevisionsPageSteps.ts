import { createBdd } from 'playwright-bdd';
import { test } from '../../../hooks/CustomFixtures';

const { Then } = createBdd(test);

Then('I can see the request revisions page', async ({ requestRevisionsPage }) => {
  await requestRevisionsPage.assertOnRequestRevisionsPage();
});

Then(
  'I fill the request revisions page with {string}',
  async ({ commonItemsPage, requestRevisionsPage }, datasetName: string) => {
    const dataset = requestRevisionsPage.requestRevisionsPageTestData[datasetName];
    for (const key in dataset) {
      if (Object.hasOwn(dataset, key)) {
        await commonItemsPage.fillUIComponent(dataset, key, requestRevisionsPage);
      }
    }
  }
);
