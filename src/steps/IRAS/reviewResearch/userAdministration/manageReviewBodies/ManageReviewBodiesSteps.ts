import { createBdd } from 'playwright-bdd';
import { test } from '../../../../../hooks/CustomFixtures';

const { Then } = createBdd(test);

Then('I can see the Manage review bodies list page', async ({ manageReviewBodiesPage }) => {
  //update
  await manageReviewBodiesPage.assertOnManageReviewBodiesPage();
});
