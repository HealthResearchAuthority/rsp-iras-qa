import { createBdd } from 'playwright-bdd';
import { test } from '../../../../../hooks/CustomFixtures';
const { Given } = createBdd(test);

Given('I can see the search for user to add to review body page', async ({ searchAddUserReviewBodyPage }) => {
  await searchAddUserReviewBodyPage.assertOnSearchAddUserReviewBodyPage();
});
