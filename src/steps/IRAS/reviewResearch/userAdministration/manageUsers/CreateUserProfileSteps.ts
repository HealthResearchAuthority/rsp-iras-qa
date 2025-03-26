import { createBdd } from 'playwright-bdd';
import { test } from '../../../../../hooks/CustomFixtures';
const pathToTestDataJson =
  './src/resources/test_data/iras/reviewResearch/userAdministration/manageUsers/pages/create_user_profile_page_data.json';

const { When, Then } = createBdd(test);

When(
  'I fill the new user profile page using {string}',
  async ({ createUserProfilePage, commonItemsPage }, datasetName: string) => {
    const dataset = createUserProfilePage.createUserProfilePageData.Create_User_Profile[datasetName];
    let uniqueEmail: any;
    for (const key in dataset) {
      if (Object.prototype.hasOwnProperty.call(dataset, key)) {
        if (key === 'email_address_text') {
          const prefix = createUserProfilePage.createUserProfilePageData.Create_User_Profile.email_address_prefix;
          uniqueEmail = await commonItemsPage.generateUniqueEmail(dataset[key], prefix, pathToTestDataJson);
          dataset[key] = uniqueEmail;
        }
        await commonItemsPage.fillUIComponent(dataset, key, createUserProfilePage);
      }
    }
  }
);

Then('I can see the Add a new user profile page', async ({ createUserProfilePage }) => {
  //update
  await createUserProfilePage.assertOnCreateUserProfilePage();
});
