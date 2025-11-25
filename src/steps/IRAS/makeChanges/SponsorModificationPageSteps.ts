import { createBdd } from 'playwright-bdd';
import { test } from '../../../hooks/CustomFixtures';

const { Then } = createBdd(test);

Then('I can see the modification page for sponsor view', async ({ sponsorModificationPage }) => {
  await sponsorModificationPage.assertOnSponsorModificationPage();
});
