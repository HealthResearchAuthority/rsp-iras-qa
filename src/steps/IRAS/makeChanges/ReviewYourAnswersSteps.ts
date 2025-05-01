import { createBdd } from 'playwright-bdd';
import { test } from '../../../hooks/CustomFixtures';

const { Then } = createBdd(test);

Then('I can see the review your answers page', async ({ reviewYourAnswersPage }) => {
  await reviewYourAnswersPage.assertOnReviewYourAnswersPage();
  await reviewYourAnswersPage.short_project_title_change_link.click();
});
