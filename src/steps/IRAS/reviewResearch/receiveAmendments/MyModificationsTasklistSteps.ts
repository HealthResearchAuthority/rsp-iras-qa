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

Then(
  'I can see the modifications assigned from WFC to SWR are now visible in my task list for {string}',
  async ({ modificationsReadyToAssignPage }, datasetName: string) => {
    const dataset = modificationsReadyToAssignPage.modificationsReadyToAssignPageTestData.Modification_Id[datasetName];
    for (const key in dataset) {
      if (Object.hasOwn(dataset, key)) {
        for (const modificationId of dataset[key]) {
          await expect(
            modificationsReadyToAssignPage.page.getByRole('cell').getByText(`${modificationId}`, { exact: true })
          ).toBeVisible();
        }
      }
    }
  }
);
