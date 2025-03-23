import { createBdd } from 'playwright-bdd';
import { test } from '../../../hooks/CustomFixtures';

const { Then } = createBdd(test);

Then('I can see the review your application page', async ({ reviewYourApplicationPage }) => {
  await reviewYourApplicationPage.assertOnReviewYourApplicationPage();
});
