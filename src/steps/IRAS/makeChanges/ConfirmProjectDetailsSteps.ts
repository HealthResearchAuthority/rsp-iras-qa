import { createBdd } from 'playwright-bdd';
import { test } from '../../../hooks/CustomFixtures';

const { Then } = createBdd(test);

Then('I can see the confirm project details page', async ({ confirmProjectDetailsPage }) => {
  await confirmProjectDetailsPage.assertOnProjectDetailsIRASPage();
});
