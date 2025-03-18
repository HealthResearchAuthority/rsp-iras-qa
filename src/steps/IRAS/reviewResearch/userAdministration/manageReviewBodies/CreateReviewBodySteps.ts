import { createBdd } from 'playwright-bdd';
import { test } from '../../../../../hooks/CustomFixtures';

const { When, Then } = createBdd(test);

When(
  'I fill the new review body page using {string}',
  async ({ createReviewBodyPage, commonItemsPage }, datasetName: string) => {
    const dataset = createReviewBodyPage.createReviewBodyPageData.Create_Review_Body[datasetName];
    for (const key in dataset) {
      if (Object.prototype.hasOwnProperty.call(dataset, key)) {
        await commonItemsPage.fillUIComponent(dataset, key, createReviewBodyPage);
      }
    }
  }
);

Then('I can see the Add a new review body page', async ({ createReviewBodyPage }) => {
  //update
  await createReviewBodyPage.assertOnCreateReviewbodyPage();
});
