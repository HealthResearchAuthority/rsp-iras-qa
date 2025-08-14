import { createBdd } from 'playwright-bdd';
import { expect, test } from '../../../../../hooks/CustomFixtures';
const { When, Then } = createBdd(test);
import { returnDataFromJSON } from '../../../../../utils/UtilFunctions';

Then('I can see the check and create user profile page', async ({ checkCreateUserProfilePage }) => {
  await checkCreateUserProfilePage.assertOnCheckCreateUserProfilePage();
});

Then(
  'I can see previously filled values in the new user profile page for {string} displayed on the check and create user profile page',
  async ({ createUserProfilePage, checkCreateUserProfilePage, commonItemsPage }, datasetName: string) => {
    const dataset = createUserProfilePage.createUserProfilePageTestData.Create_User_Profile[datasetName];
    for (const key in dataset) {
      if (Object.prototype.hasOwnProperty.call(dataset, key)) {
        const fieldValActual = await commonItemsPage.getSelectedValues(key, checkCreateUserProfilePage);
        if (key === 'email_address_text') {
          const data = await returnDataFromJSON();
          expect(fieldValActual).toBe(data.Create_User_Profile.email_address_unique);
        } else if (key === 'country_checkbox' || key === 'review_body_checkbox' || key === 'role_checkbox') {
          const fieldValActuals = fieldValActual.split(', ');
          fieldValActuals.forEach((val, index) => {
            expect(val).toBe(dataset[key][index]);
          });
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
