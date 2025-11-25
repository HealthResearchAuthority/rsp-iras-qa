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
  'I can see the modifications assigned from WFC or TM to SWR are now visible in my task list with status {string}',
  async ({ modificationsReadyToAssignPage }, statusValue: string) => {
    const modificationId = await modificationsReadyToAssignPage.getSelectedModifications();
    const modificationRow = modificationsReadyToAssignPage.page.locator('tbody tr', {
      has: modificationsReadyToAssignPage.page.locator('a.govuk-link', { hasText: `${modificationId}` }),
    });
    await expect.soft(modificationRow).toBeVisible();
    const modificationStatus = modificationRow.locator('td', { hasText: `${statusValue}` });
    await expect.soft(modificationStatus).toBeVisible();
  }
);
