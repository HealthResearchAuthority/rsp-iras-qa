import { createBdd } from 'playwright-bdd';
import { test } from '../../../hooks/CustomFixtures';

const { Given, Then } = createBdd(test);

Given(
  'I navigate to the review all changes page of the {string} modification',
  async ({ reviewAllChangesPage }, modificationName: string) => {
    await reviewAllChangesPage.gotoReviewAllChangesPage(modificationName);
    await reviewAllChangesPage.assertOnReviewAllChangesPage();
  }
);

Then('I can see the review all changes modifications page', async ({ reviewAllChangesPage }) => {
  await reviewAllChangesPage.assertOnReviewAllChangesPage();
});
