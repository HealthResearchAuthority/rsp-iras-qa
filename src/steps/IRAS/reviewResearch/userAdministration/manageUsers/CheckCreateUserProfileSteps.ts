import { createBdd } from 'playwright-bdd';
import { expect, test } from '../../../../../hooks/CustomFixtures';
const { When, Then } = createBdd(test);
import path from 'path';
import * as fse from 'fs-extra';
const pathToTestDataJson =
  './src/resources/test_data/iras/reviewResearch/userAdministration/manageUsers/create_user_profile_page_data.json';

Then('I can see the check and create user profile page', async ({ checkCreateUserProfilePage }) => {
  await checkCreateUserProfilePage.assertOnCheckCreateUserProfilePage();
});

Then(
  'I can see previously filled values in the new user profile page for {string} displayed on the check and create user profile page',
  async ({ createUserProfilePage, checkCreateUserProfilePage }, datasetName: string) => {
    const dataset = createUserProfilePage.createUserProfilePageTestData.Create_User_Profile[datasetName];
    for (const key in dataset) {
      if (Object.prototype.hasOwnProperty.call(dataset, key)) {
        const fieldValActual = await checkCreateUserProfilePage.getSelectedValues(
          dataset,
          key,
          checkCreateUserProfilePage
        );
        if (key === 'email_address_text') {
          const filePath = path.resolve(pathToTestDataJson);
          const data = await fse.readJson(filePath);
          expect(fieldValActual).toBe(data.Create_User_Profile.email_address_unique);
        } else if (key === 'country_checkbox' || key === 'access_required_checkbox') {
          expect(fieldValActual).toBe(dataset[key][0]);
        } else {
          expect(fieldValActual).toBe(dataset[key]);
        }
      }
    }
  }
);

When(
  'I click the change link against {string} on the check and create user profile page',
  async ({ checkCreateUserProfilePage }, fieldKey: string) => {
    checkCreateUserProfilePage.clickOnChangeButtonRoleOperations(fieldKey);
  }
);

Then(
  'I can see the {string} ui labels on the check and create user profile page for {string}',
  async ({ commonItemsPage, checkCreateUserProfilePage }, datasetName: string) => {
    const dataset =
      checkCreateUserProfilePage.checkCreateUserProfilePageTestData.Check_Create_User_Profile_Page[datasetName];
    for (const key in dataset) {
      if (Object.prototype.hasOwnProperty.call(dataset, key)) {
        const labelVal = await commonItemsPage.validateUILabels(dataset, key, checkCreateUserProfilePage);
        expect(labelVal).toBe(dataset[key]);
      }
    }
  }
);
