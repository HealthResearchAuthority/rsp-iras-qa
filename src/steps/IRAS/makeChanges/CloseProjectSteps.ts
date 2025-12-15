import { createBdd } from 'playwright-bdd';
import { test, expect } from '../../../hooks/CustomFixtures';

const { Then } = createBdd(test);

Then('I can see the close project page', async ({ closeProjectPage }) => {
  await closeProjectPage.assertOnCloseProjectPage();
});

Then(
  'I can see the {string} ui labels on the close project page',
  async ({ commonItemsPage, closeProjectPage }, datasetName: string) => {
    const dataset = closeProjectPage.closeProjectPageTestData[datasetName];
    for (const key in dataset) {
      if (Object.hasOwn(dataset, key)) {
        const labelVal = await commonItemsPage.getUiLabel(key, closeProjectPage);
        expect.soft(labelVal).toBe(dataset[key]);
      }
    }
  }
);

Then(
  'I fill the close project page with {string}',
  async ({ commonItemsPage, closeProjectPage }, datasetName: string) => {
    const dataset = closeProjectPage.closeProjectPageTestData[datasetName];
    for (const key in dataset) {
      if (Object.hasOwn(dataset, key)) {
        await commonItemsPage.fillUIComponent(dataset, key, closeProjectPage);
      }
    }
  }
);
