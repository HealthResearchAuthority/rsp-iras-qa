import { createBdd } from 'playwright-bdd';
import { expect, test } from '../../../../../hooks/CustomFixtures';
import { generateTimeStampedValue, generateUniqueValue } from '../../../../../utils/UtilFunctions';
import { Locator } from 'playwright/test';
import path from 'path';
const pathToTestDataJson =
  './src/resources/test_data/iras/reviewResearch/userAdministration/manageReviewBodies/create_review_body_page_data.json';

const { When, Then } = createBdd(test);

When(
  'I fill the new review body page using {string}',
  async ({ createReviewBodyPage, commonItemsPage }, datasetName: string) => {
    const dataset = createReviewBodyPage.createReviewBodyPageData.Create_Review_Body[datasetName];
    const datasetNameClear: string = 'Create_Review_Body_Page';
    const clearDataset = createReviewBodyPage.createReviewBodyPageData[datasetNameClear];
    await commonItemsPage.clearUIComponent(clearDataset, 'country_checkbox', createReviewBodyPage);
    for (const key in dataset) {
      if (Object.prototype.hasOwnProperty.call(dataset, key)) {
        if (datasetName.startsWith('Valid_') && key == 'organisation_name_text') {
          const orgNameLocator: Locator = createReviewBodyPage[key];
          const uniqueOrgNameValue = await generateTimeStampedValue(dataset[key], ' ');
          await orgNameLocator.fill(uniqueOrgNameValue);
          await createReviewBodyPage.setUniqueOrgName(uniqueOrgNameValue);
        } else {
          await commonItemsPage.fillUIComponent(dataset, key, createReviewBodyPage);
        }
      }
    }
  }
);

Then('I can see the add a new review body page', async ({ createReviewBodyPage }) => {
  await createReviewBodyPage.assertOnCreateReviewbodyPage();
});

Then('I can see the Add new review body page for {string}', async ({ createReviewBodyPage }, datasetName: string) => {
  const dataset = createReviewBodyPage.createReviewBodyPageData.Create_Review_Body[datasetName];
  await createReviewBodyPage.assertOnCreateReviewbodyPage();
  if (datasetName.startsWith('Valid_')) {
    await expect(createReviewBodyPage.organisation_name_text).toHaveValue(
      await createReviewBodyPage.getUniqueOrgName()
    );
  } else {
    await expect(createReviewBodyPage.organisation_name_text).toHaveValue(dataset.organisation_name_text);
  }
  for (const checkbox of dataset.country_checkbox) {
    await expect(
      createReviewBodyPage.country_checkbox.locator('..').getByLabel(checkbox, { exact: true })
    ).toBeChecked();
  }
  await expect(createReviewBodyPage.email_address_text).toHaveValue(dataset.email_address_text);
  await expect(createReviewBodyPage.description_text).toHaveValue(dataset.description_text);
});

Then(
  'I can see the {string} validation message for {string} on the Add new review body page',
  async ({ createReviewBodyPage }, errorMsg: string, fieldName: string) => {
    const dataset = createReviewBodyPage.createReviewBodyPageData.Create_Review_Body.Validation;
    if (fieldName.toLowerCase() == 'all_mandatory_fields') {
      await expect(createReviewBodyPage.organisation_name_error).toHaveText(dataset.Mandatory_Field);
      await expect(createReviewBodyPage.country_error).toHaveText(dataset.Select_Country);
      await expect(createReviewBodyPage.email_address_error).toHaveText(dataset.Mandatory_Field);
    } else {
      await expect(createReviewBodyPage[fieldName.toLowerCase()]).toHaveText(dataset[errorMsg]);
    }
  }
);

When(
  'I fill the new review body page for audit using {string}',
  async ({ createReviewBodyPage, commonItemsPage }, datasetName: string) => {
    const dataset = createReviewBodyPage.createReviewBodyPageData.Create_Review_Body[datasetName];
    for (const key in dataset) {
      if (Object.prototype.hasOwnProperty.call(dataset, key)) {
        if (key === 'organisation_name_text') {
          const prefix = createReviewBodyPage.createReviewBodyPageData.Create_Review_Body.organisation_name_prefix;
          const uniqueOrgName = await generateUniqueValue(dataset[key], prefix);
          const filePath = path.resolve(pathToTestDataJson);
          await createReviewBodyPage.updateUniqueOrgNameTestDataJson(filePath, uniqueOrgName);
          const locator = createReviewBodyPage[key];
          await locator.fill(uniqueOrgName);
        } else {
          await commonItemsPage.fillUIComponent(dataset, key, createReviewBodyPage);
        }
      }
    }
  }
);
