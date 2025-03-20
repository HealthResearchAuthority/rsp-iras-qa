import { createBdd } from 'playwright-bdd';
import { test } from '../../../../../hooks/CustomFixtures';

const { Then } = createBdd(test);

Then('I can see the user profile page', async ({ userProfilePage }) => {
  //update
  await userProfilePage.assertOnUserProfilePage();
});
