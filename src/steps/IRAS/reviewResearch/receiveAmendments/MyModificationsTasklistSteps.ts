import { createBdd } from 'playwright-bdd';
import { expect, test } from '../../../../hooks/CustomFixtures';
const { Then } = createBdd(test);

Then(
  'I can see the {string} ui labels on the my modifications tasklist page',
  async ({ commonItemsPage, myModificationsTasklistPage }, datasetName: string) => {
    const dataset = myModificationsTasklistPage.myModificationsTasklistPageTestData[datasetName];
    for (const key in dataset) {
      if (Object.hasOwn(dataset, key)) {
        const labelVal = await commonItemsPage.getUiLabel(key, myModificationsTasklistPage);
        expect(labelVal).toBe(dataset[key]);
      }
    }
  }
);
