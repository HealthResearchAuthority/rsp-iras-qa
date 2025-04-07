import { createBdd } from 'playwright-bdd';
import { test, expect } from '../../../../../hooks/CustomFixtures';

const { Then } = createBdd(test);

Then(
  'I can see the status of the review body is {string}',
  async ({ manageReviewBodiesPage, createReviewBodyPage }, status: string) => {
    const dataset = manageReviewBodiesPage.manageReviewBodiesPageData.Manage_Review_Body_Page;
    const createdReviewBodyRow = await manageReviewBodiesPage.getRowByOrgName(
      await createReviewBodyPage.getUniqueOrgName()
    );
    if (status.toLowerCase() == 'disabled') {
      expect(createdReviewBodyRow.locator('td strong')).toHaveText(dataset.disabled_status);
    } else {
      expect(createdReviewBodyRow.locator('td strong')).toHaveText(dataset.enabled_status);
    }
  }
);

Then(
  'I click the view edit link for the newly created review body',
  async ({ manageReviewBodiesPage, createReviewBodyPage }) => {
    const createdReviewBodyRow = await manageReviewBodiesPage.getRowByOrgName(
      await createReviewBodyPage.getUniqueOrgName()
    );
    await createdReviewBodyRow.locator(manageReviewBodiesPage.viewEditLink).click();
  }
);

Then(
  'I can see the {string} ui labels on the manage review body profile page',
  async ({ commonItemsPage, manageReviewBodiesPage }, datasetName: string) => {
    const dataset = manageReviewBodiesPage.manageReviewBodiesPageData[datasetName];
    for (const key in dataset) {
      if (Object.prototype.hasOwnProperty.call(dataset, key)) {
        const labelVal = await commonItemsPage.getUiLabel(dataset, key, manageReviewBodiesPage);
        expect(labelVal).toBe(dataset[key]);
      }
    }
  }
);