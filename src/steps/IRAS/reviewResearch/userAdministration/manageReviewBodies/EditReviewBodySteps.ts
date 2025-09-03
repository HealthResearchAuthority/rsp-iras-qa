import { createBdd } from 'playwright-bdd';
import { expect, test } from '../../../../../hooks/CustomFixtures';
import { generateTimeStampedValue } from '../../../../../utils/UtilFunctions';
import { Locator } from 'playwright/test';

const { When, Then } = createBdd(test);

Then('I can see the edit review body page', async ({ editReviewBodyPage }) => {
  await editReviewBodyPage.assertOnEditReviewbodyPage();
});

When(
  'the edit review body input fields are already populated with the existing data',
  async ({ editReviewBodyPage, reviewBodyProfilePage }) => {
    await editReviewBodyPage.assertOnEditReviewbodyPage();
    const actualCheckedValues = await editReviewBodyPage.getCheckedValues();
    await expect(editReviewBodyPage.organisation_name_text).toHaveValue(await reviewBodyProfilePage.getOrgName());
    expect(actualCheckedValues).toEqual(await reviewBodyProfilePage.getCountries());
    await expect(editReviewBodyPage.email_address_text).toHaveValue(await reviewBodyProfilePage.getEmail());
    await expect(editReviewBodyPage.description_text).toHaveText(await reviewBodyProfilePage.getDescription());
  }
);

When(
  'I fill the edit review body page using {string}',
  async ({ editReviewBodyPage, commonItemsPage }, datasetName: string) => {
    const dataset = editReviewBodyPage.editReviewBodyPageData.Edit_Review_Body[datasetName];
    const datasetNameClear: string = 'Edit_Review_Body_Page';
    const clearDataset = editReviewBodyPage.editReviewBodyPageData[datasetNameClear];
    await commonItemsPage.clearUIComponent(clearDataset, 'country_checkbox', editReviewBodyPage);
    for (const key in dataset) {
      if (Object.hasOwn(dataset, key)) {
        if (
          (datasetName.startsWith('Valid_') || datasetName.startsWith('Review_')) &&
          key == 'organisation_name_text'
        ) {
          const orgNameLocator: Locator = editReviewBodyPage[key];
          const uniqueOrgNameValue = await generateTimeStampedValue(dataset[key], ' ');
          await orgNameLocator.fill(uniqueOrgNameValue);
          await editReviewBodyPage.setUniqueOrgName(uniqueOrgNameValue);
        } else {
          await commonItemsPage.fillUIComponent(dataset, key, editReviewBodyPage);
        }
      }
    }
  }
);

When(
  'I fill the edit review body page using {string} for field {string}',
  async ({ editReviewBodyPage, commonItemsPage }, datasetName: string, fieldName: string) => {
    const dataset = editReviewBodyPage.editReviewBodyPageData.Edit_Review_Body[datasetName];
    for (const key in dataset) {
      if (Object.hasOwn(dataset, key)) {
        if (fieldName == 'Organisation_Name') {
          const orgNameLocator: Locator = editReviewBodyPage[key];
          const uniqueOrgNameValue = await generateTimeStampedValue(dataset[key], ' ');
          await orgNameLocator.fill(uniqueOrgNameValue);
          await editReviewBodyPage.setUniqueOrgName(uniqueOrgNameValue);
        } else if (fieldName == 'Country') {
          const datasetNameClear: string = 'Edit_Review_Body_Page';
          const clearDataset = editReviewBodyPage.editReviewBodyPageData[datasetNameClear];
          await commonItemsPage.clearUIComponent(clearDataset, 'country_checkbox', editReviewBodyPage);
          await commonItemsPage.fillUIComponent(dataset, key, editReviewBodyPage);
        } else {
          await commonItemsPage.fillUIComponent(dataset, key, editReviewBodyPage);
        }
      }
    }
  }
);
