import { createBdd } from 'playwright-bdd';
import { expect, test } from '../../../../hooks/CustomFixtures';
const { Then } = createBdd(test);

Then(
  'I can see the modifications assigned from WFC to SWR are now visible in my task list for {string}',
  async ({ modificationsReadyToAssignPage }, datasetName: string) => {
    const dataset = modificationsReadyToAssignPage.modificationsReadyToAssignPageData.Modification_Id[datasetName];
    for (const key in dataset) {
      if (Object.hasOwn(dataset, key)) {
        for (const modificationId of dataset[key]) {
          await expect(
            modificationsReadyToAssignPage.page.getByRole('cell').getByText(`${modificationId}`)
          ).toBeVisible();
        }
      }
    }
  }
);
