import { createBdd } from 'playwright-bdd';
import { test } from '../../../../hooks/CustomFixtures';

const { Then } = createBdd(test);

Then('I can see the review all changes page', async ({ reviewAllChangesPage }) => {
  await reviewAllChangesPage.assertOnReviewAllChangesPage();
});
