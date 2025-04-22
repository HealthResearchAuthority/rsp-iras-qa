import { createBdd } from 'playwright-bdd';
import { test, expect } from '../../../../../hooks/CustomFixtures';

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
      if (Object.prototype.hasOwnProperty.call(dataset, key)) {
        const labelVal = await commonItemsPage.getUiLabel(key, editUserProfilePage);
        expect(labelVal).toBe(dataset[key]);
      }
    }
  }
);

Then(
  'I validate {string} is displayed on edit user profile page for {string}',
  async (
    { commonItemsPage, editUserProfilePage },
    errorMessageFieldDatasetName: string,
    invalidFieldsDatasetName: string
  ) => {
    const errorMessageFieldDataset =
      editUserProfilePage.editUserProfilePageTestData.Mandatory_Field_Error_Message[errorMessageFieldDatasetName];
    const invalidFieldsDataset =
      editUserProfilePage.editUserProfilePageTestData.Empty_UserProfile_Mandatory_Data[invalidFieldsDatasetName];
    for (const key in invalidFieldsDataset) {
      if (Object.prototype.hasOwnProperty.call(invalidFieldsDataset, key)) {
        await commonItemsPage.validateErrorMessageWithoutErrorHeading(
          errorMessageFieldDataset,
          key,
          editUserProfilePage
        );
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
    if (fieldName.toLowerCase() == 'country' || fieldName.toLowerCase() == 'role') {
      const datasetNameClear: string = 'Edit_User_Profile_Page';
      const clearDataset = editUserProfilePage.editUserProfilePageTestData[datasetNameClear];
      await commonItemsPage.clearUIComponent(clearDataset, `${fieldName.toLowerCase()}_checkbox`, editUserProfilePage);
    }
    for (const key in dataset) {
      if (keyIndex == 1) {
        keyValue = dataset[key];
      }
      if (Object.prototype.hasOwnProperty.call(dataset, key)) {
        await commonItemsPage.fillUIComponent(dataset, key, editUserProfilePage);
      }
      keyIndex++;
    }
    switch (fieldName.toLowerCase()) {
      case 'title':
        await userProfilePage.setNewTitle(keyValue);
        break;
      case 'first_name':
        await userProfilePage.setNewFirstName(keyValue);
        break;
      case 'last_name':
        await userProfilePage.setNewLastName(keyValue);
        break;
      case 'email_address':
        await userProfilePage.setNewEmail(keyValue);
        break;
      case 'telephone':
        await userProfilePage.setNewTelephone(keyValue);
        break;
      case 'organisation':
        await userProfilePage.setNewOrganisation(keyValue);
        break;
      case 'job_title':
        await userProfilePage.setNewJobTitle(keyValue);
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
  async ({ editUserProfilePage, userProfilePage, commonItemsPage }, fieldName: string) => {
    const defectWorkaroundDatasetName: string = 'User_Access_Required_Checkbox_One';
    const defectWorkaroundDataset = editUserProfilePage.editUserProfilePageTestData[defectWorkaroundDatasetName];
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
    await commonItemsPage.fillUIComponent(defectWorkaroundDataset, 'access_required_checkbox', editUserProfilePage);
  }
);
