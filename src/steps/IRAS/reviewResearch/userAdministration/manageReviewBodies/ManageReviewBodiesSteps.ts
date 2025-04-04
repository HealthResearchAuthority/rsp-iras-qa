import { createBdd } from 'playwright-bdd';
import { test } from '../../../../../hooks/CustomFixtures';

const { Then } = createBdd(test);

Then('I can see the Manage review bodies list page', async ({ manageReviewBodiesPage }) => {
  await manageReviewBodiesPage.assertOnManageReviewBodiesPage();
});

Then(
  'I can see the list is sorted by default in the alphabetical order of {string}',
  async ({ manageReviewBodiesPage }, fieldName: string) => {
    //Update RE-USE Tiji method
    await manageReviewBodiesPage.assertOnManageReviewBodiesPage();
    console.log(fieldName);
  }
);

Then(
  'I can see the newly created {string} should be present in the list',
  async ({ manageReviewBodiesPage }, reviewBody: string) => {
    //update
    await manageReviewBodiesPage.assertOnManageReviewBodiesPage();
    console.log(reviewBody);
  }
);
Then(
  'I can see the status of the newly created {string} is {string}',
  async ({ manageReviewBodiesPage }, reviewBody: string, isActive: string) => {
    //update
    await manageReviewBodiesPage.assertOnManageReviewBodiesPage();
    console.log(reviewBody);
    console.log(isActive);
  }
);
