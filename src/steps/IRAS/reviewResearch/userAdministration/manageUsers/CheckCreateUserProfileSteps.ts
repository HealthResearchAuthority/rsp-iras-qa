import { createBdd } from 'playwright-bdd';
import { test } from '../../../../../hooks/CustomFixtures';
const { When, Then } = createBdd(test);

Then('I can see the check and create user profile page', async ({ checkCreateUserProfilePage }) => {
  await checkCreateUserProfilePage.assertOnCheckCreateUserProfilePage();
});

Then(
  'I can see previously filled values in the new user profile page for {string} displayed on the check and create user profile page',
  async ({ commonItemsPage, createUserProfilePage, checkCreateUserProfilePage }, datasetName: string) => {
    const dataset = createUserProfilePage.createUserProfilePageTestData.Create_User_Profile[datasetName];
    for (const key in dataset) {
      if (Object.prototype.hasOwnProperty.call(dataset, key)) {
        await checkCreateUserProfilePage.validateSelectedValues(
          dataset,
          key,
          checkCreateUserProfilePage,
          commonItemsPage
        );
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
  async ({ commonItemsPage, createUserProfilePage }, datasetName: string, datasetValName: string) => {
    const datasetVal = createUserProfilePage.createUserProfilePageTestData.Create_User_Profile[datasetValName];
    if (datasetValName === 'Role_Operations') {
      for (const key in datasetVal) {
        await commonItemsPage.fillUIComponent(datasetVal, key, createUserProfilePage);
      }
    }
    const dataset = createUserProfilePage.createUserProfilePageTestData.Create_User_Profile[datasetName];
    for (const key in dataset) {
      if (Object.prototype.hasOwnProperty.call(dataset, key)) {
        await commonItemsPage.validateUILabels(dataset, key, createUserProfilePage);
      }
    }
  }
);
