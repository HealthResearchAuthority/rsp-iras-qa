import { createBdd } from 'playwright-bdd';
import { test } from '../../../../../hooks/CustomFixtures';
const { Then } = createBdd(test);

Then('I can see the Check and create user profile page', async ({ checkCreateUserProfilePage }) => {
  await checkCreateUserProfilePage.assertOnCheckCreateUserProfilePage();
});

Then(
  'I can see previously saved values for {string} displayed on the check and create user profile page',
  async ({ commonItemsPage, createUserProfilePage, checkCreateUserProfilePage }, datasetName: string) => {
    const dataset = createUserProfilePage.createUserProfilePageData.Create_User_Profile[datasetName];
    for (const key in dataset) {
      if (Object.prototype.hasOwnProperty.call(dataset, key)) {
        await commonItemsPage.validateSelectedValues(dataset, key, checkCreateUserProfilePage);
      }
    }
  }
);
