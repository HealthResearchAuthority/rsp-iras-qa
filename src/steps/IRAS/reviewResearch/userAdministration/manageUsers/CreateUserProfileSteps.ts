import { createBdd } from 'playwright-bdd';
import { expect, test } from '../../../../../hooks/CustomFixtures';
import path from 'path';
import * as fse from 'fs-extra';
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
          uniqueEmail = await commonItemsPage.generateUniqueEmail(dataset[key], prefix);
          dataset[key] = uniqueEmail;
          const filePath = path.resolve(pathToTestDataJson);
          await commonItemsPage.updateUniqueEmailTestDataJson(filePath, uniqueEmail);
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
Then(
  'I can see the Add user profile page for {string}',
  async ({ createUserProfilePage, commonItemsPage }, datasetName: string) => {
    //update
    const dataset = createUserProfilePage.createUserProfilePageData.Create_User_Profile[datasetName];
    await createUserProfilePage.assertOnCreateUserProfilePage();
    const actualVal_title_text = await createUserProfilePage.title_text.textContent();
    const actual_title_text: string | null = await commonItemsPage.removeUnwantedChars(actualVal_title_text);
    const actualVal_first_name_text = await createUserProfilePage.first_name_text.textContent();
    const actual_first_name_text: string | null = await commonItemsPage.removeUnwantedChars(actualVal_first_name_text);
    const actualVal_last_name_text = await createUserProfilePage.last_name_text.textContent();
    const actual_last_name_text: string | null = await commonItemsPage.removeUnwantedChars(actualVal_last_name_text);
    const actualVal_email_address_text = await createUserProfilePage.email_address_text.textContent();
    const actual_email_address_text: string | null =
      await commonItemsPage.removeUnwantedChars(actualVal_email_address_text);
    expect(actual_title_text).toBe(dataset.title_text);
    expect(actual_first_name_text).toBe(dataset.first_name_text);
    expect(actual_last_name_text).toBe(dataset.last_name_text);
    const filePath = path.resolve(pathToTestDataJson);
    const data = await fse.readJson(filePath);
    const expected_email_address_text = data.Create_User_Profile.email_address_unique;
    expect(actual_email_address_text).toBe(expected_email_address_text);
    //need to update other fields also
    // "telephone_label": "Telephone",
    // "organisation_label": "Organisation",
    // "job_title_label": "Job title",
    // "role_label": "Role",
    // "committee_label": "Committee",
    // "country_label": "Country",
    // "access_required_label": "Access Required",
    // "review_body_label": "Review body",
    // "audit_label": "Audit",
  }
);

Then(
  'I can see the {string} ui labels on the add a new user profile page for {string}',
  async ({ commonItemsPage, createUserProfilePage }, datasetName: string, datasetValName: string) => {
    const datasetVal = createUserProfilePage.createUserProfilePageData.Create_User_Profile[datasetValName];
    if (datasetValName === 'Role_Operations') {
      for (const key in datasetVal) {
        await commonItemsPage.fillUIComponent(datasetVal, key, createUserProfilePage);
      }
    }
    const dataset = createUserProfilePage.createUserProfilePageData.Create_User_Profile[datasetName];
    for (const key in dataset) {
      if (Object.prototype.hasOwnProperty.call(dataset, key)) {
        await commonItemsPage.validateUILabels(dataset, key, createUserProfilePage);
      }
    }
  }
);
