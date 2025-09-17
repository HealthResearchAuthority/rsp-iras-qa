import { createBdd } from 'playwright-bdd';
import { test, expect } from '../../../../../hooks/CustomFixtures';
import { generateUniqueValue, generatePhoneNumber } from '../../../../../utils/UtilFunctions';
import { Locator } from 'playwright/test';

const { Then, When } = createBdd(test);

Then('I can see the edit user profile page', async ({ editUserProfilePage }) => {
  await editUserProfilePage.assertOnEditUserProfilePage();
});

When('I edit to remove {string} mandatory field value', async ({ editUserProfilePage }, userEditField: string) => {
  await editUserProfilePage.removeUserProfileMandatoryFields(userEditField);
});

Then(
  'I can see the {string} ui labels on the edit user profile page',
  async ({ commonItemsPage, editUserProfilePage }, datasetName: string) => {
    const dataset = editUserProfilePage.editUserProfilePageTestData[datasetName];
    for (const key in dataset) {
      if (Object.hasOwn(dataset, key)) {
        const labelVal = await commonItemsPage.getUiLabel(key, editUserProfilePage);
        expect(labelVal).toBe(dataset[key]);
      }
    }
  }
);

When(
  'I edit the users {string} field with {string}',
  async ({ commonItemsPage, editUserProfilePage, userProfilePage }, fieldName: string, datasetName: string) => {
    const dataset = editUserProfilePage.editUserProfilePageTestData[datasetName];
    let keyIndex = 1;
    let keyValue: any;
    const uniqueValues: Record<string, string> = {};
    if (fieldName.toLowerCase() == 'country' || fieldName.toLowerCase() == 'role') {
      const datasetNameClear: string = 'Edit_User_Profile_Page';
      const clearDataset = editUserProfilePage.editUserProfilePageTestData[datasetNameClear];
      await commonItemsPage.clearUIComponent(clearDataset, `${fieldName.toLowerCase()}_checkbox`, editUserProfilePage);
    }
    for (const key in dataset) {
      if (keyIndex == 1) {
        keyValue = dataset[key];
      }
      if (Object.hasOwn(dataset, key)) {
        const locator: Locator = editUserProfilePage[key];
        switch (key) {
          case 'title_text':
          case 'first_name_text':
          case 'last_name_text':
          case 'organisation_text':
          case 'job_title_text':
            uniqueValues[key] = await generateUniqueValue('', dataset[key]);
            await locator.fill(uniqueValues[key]);
            break;

          case 'telephone_text':
            uniqueValues.telephone = await generatePhoneNumber();
            await locator.fill(uniqueValues.telephone);
            break;

          default:
            await commonItemsPage.fillUIComponent(dataset, key, editUserProfilePage);
        }
      }
      keyIndex++;
    }
    switch (fieldName.toLowerCase()) {
      case 'title':
        await userProfilePage.setNewTitle(uniqueValues['title_text']);
        break;
      case 'first_name':
        await userProfilePage.setNewFirstName(uniqueValues['first_name_text']);
        break;
      case 'last_name':
        await userProfilePage.setNewLastName(uniqueValues['last_name_text']);
        break;
      case 'email_address':
        await userProfilePage.setNewEmail(uniqueValues.email);
        break;
      case 'telephone':
        await userProfilePage.setNewTelephone(uniqueValues.telephone);
        break;
      case 'organisation':
        await userProfilePage.setNewOrganisation(uniqueValues['organisation_text']);
        break;
      case 'job_title':
        await userProfilePage.setNewJobTitle(uniqueValues['job_title_text']);
        break;
      case 'country':
        await userProfilePage.setNewCountries(keyValue);
        break;
      default:
        if (fieldName.toLowerCase() == 'role') {
          break;
        } else {
          throw new Error(`${fieldName} is not a valid option`);
        }
    }
  }
);

When(
  'I revert the {string} update of the user profile',
  async ({ editUserProfilePage, userProfilePage }, fieldName: string) => {
    let currentValue: string = '';
    let newValue: string = '';
    switch (fieldName.toLowerCase()) {
      case 'title':
        currentValue = await userProfilePage.getNewTitle();
        newValue = await userProfilePage.getTitle();
        await editUserProfilePage.title_text.fill(await userProfilePage.getTitle());
        await userProfilePage.setTitle(currentValue);
        await userProfilePage.setNewTitle(newValue);
        break;
      case 'first_name':
        currentValue = await userProfilePage.getNewFirstName();
        newValue = await userProfilePage.getFirstName();
        await editUserProfilePage.first_name_text.fill(await userProfilePage.getFirstName());
        await userProfilePage.setFirstName(currentValue);
        await userProfilePage.setNewFirstName(newValue);
        break;
      case 'last_name':
        currentValue = await userProfilePage.getNewLastName();
        newValue = await userProfilePage.getLastName();
        await editUserProfilePage.last_name_text.fill(await userProfilePage.getLastName());
        await userProfilePage.setLastName(currentValue);
        await userProfilePage.setNewLastName(newValue);
        break;
      case 'email_address':
        currentValue = await userProfilePage.getNewEmail();
        newValue = await userProfilePage.getEmail();
        await editUserProfilePage.email_address_text.fill(await userProfilePage.getEmail());
        await userProfilePage.setEmail(currentValue);
        await userProfilePage.setNewEmail(newValue);
        break;
      case 'telephone':
        currentValue = await userProfilePage.getNewTelephone();
        newValue = await userProfilePage.getTelephone();
        await editUserProfilePage.telephone_text.fill(await userProfilePage.getTelephone());
        await userProfilePage.setTelephone(currentValue);
        await userProfilePage.setNewTelephone(newValue);
        break;
      case 'organisation':
        currentValue = await userProfilePage.getNewOrganisation();
        newValue = await userProfilePage.getOrganisation();
        await editUserProfilePage.organisation_text.fill(await userProfilePage.getOrganisation());
        await userProfilePage.setOrganisation(currentValue);
        await userProfilePage.setNewOrganisation(newValue);
        break;
      case 'job_title':
        currentValue = await userProfilePage.getNewJobTitle();
        newValue = await userProfilePage.getJobTitle();
        await editUserProfilePage.job_title_text.fill(await userProfilePage.getJobTitle());
        await userProfilePage.setJobTitle(currentValue);
        await userProfilePage.setNewJobTitle(newValue);
        break;
      default:
        throw new Error(`${fieldName} is not a valid option`);
    }
  }
);

Then(
  'I uncheck the previously selected checkboxes on the edit user profile page for {string} when the role is selected as study-wide reviewer or team manager or workflow co-ordinator',
  async ({ userProfilePage, editUserProfilePage, commonItemsPage }, datasetName: string) => {
    const dataset = editUserProfilePage.editUserProfilePageTestData.Edit_User_Profile[datasetName];
    const roleValue = (await userProfilePage.getRole()).join(', ');
    if (roleValue === '') {
      await commonItemsPage.fillUIComponent(dataset, 'role_checkbox', editUserProfilePage);
    }
    const selectedCheckboxCount = (await editUserProfilePage.getCheckedCheckboxLabels()).length;
    if (
      dataset['role_checkbox'].includes('Study-wide reviewer') ||
      dataset['role_checkbox'].includes('Team manager') ||
      dataset['role_checkbox'].includes('Workflow co-ordinator') ||
      selectedCheckboxCount > 0
    ) {
      await commonItemsPage.clearCheckboxesUserProfile(dataset, 'country_checkbox', editUserProfilePage);
      await commonItemsPage.clearCheckboxesUserProfile(dataset, 'review_body_checkbox', editUserProfilePage);
      await commonItemsPage.clearCheckboxesUserProfile(dataset, 'role_checkbox', editUserProfilePage);
    }
  }
);

When(
  'I can see that the {string} users data persists on the edit profile page',
  async ({ createUserProfilePage, editUserProfilePage }, datasetName: string) => {
    const dataset = createUserProfilePage.createUserProfilePageTestData.Create_User_Profile[datasetName];

    const getFieldValue = async (key: string): Promise<string | boolean> => {
      if (key === 'review_body_checkbox') {
        return await createUserProfilePage.getSelectedCheckboxCreateUserReviewBody(dataset, createUserProfilePage);
      }
      return await createUserProfilePage.getSelectedValuesCreateUser(dataset, key, editUserProfilePage);
    };

    const assertFieldValue = (key: string, actual: string | boolean) => {
      if (typeof actual === 'string') {
        expect(actual).toBe(dataset[key]);
      } else if (typeof actual === 'boolean') {
        expect(actual).toBeTruthy();
      }
    };

    for (const key in dataset) {
      if (key !== 'email_address_text') {
        if (Object.hasOwn(dataset, key)) {
          const fieldValActual = await getFieldValue(key);
          assertFieldValue(key, fieldValActual);
        }
      }
    }
  }
);

When(
  'I validate {string} is not displayed for edit user profile page',
  async ({ editUserProfilePage }, fieldKey: string) => {
    const locatorName = fieldKey.toLowerCase() + '_text';
    await expect(editUserProfilePage[locatorName]).not.toBeVisible();
  }
);
