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
