import { createBdd } from 'playwright-bdd';
import { expect, test } from '../../../../../hooks/CustomFixtures';
import { generateTimeStampedValue, getCorrectDeterminer } from '../../../../../utils/UtilFunctions';
import { Locator } from 'playwright/test';

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
    const fieldNameLocator = fieldName.toLowerCase();
    const normalisedFieldName = fieldNameLocator.replaceAll('_', ' ').replace('error', '').trim();
    await expect(createReviewBodyPage.error_summary_alert).toBeVisible();
    await expect(createReviewBodyPage.error_summary_alert_heading).toBeVisible();
    if (fieldName == 'All_Mandatory_Fields') {
      for (const key in dataset[fieldName]) {
        if (Object.prototype.hasOwnProperty.call(dataset[fieldName], key)) {
          const determiner = await getCorrectDeterminer(key);
          await expect(
            createReviewBodyPage.error_summary_list.getByText(
              `${dataset[errorMsg]} ${determiner} ${dataset[fieldName][key]}`
            )
          ).toBeVisible();
          await expect(createReviewBodyPage[key]).toHaveText(
            `${dataset[errorMsg]} ${determiner} ${dataset[fieldName][key]}`
          );
        }
      }
    } else if (errorMsg == 'Mandatory_Field') {
      const determiner = await getCorrectDeterminer(fieldName);
      await expect(
        createReviewBodyPage.error_summary_list.getByText(`${dataset[errorMsg]} ${determiner} ${normalisedFieldName}`)
      ).toBeVisible();
      await expect(createReviewBodyPage[fieldNameLocator]).toHaveText(
        `${dataset[errorMsg]} ${determiner} ${normalisedFieldName}`
      );
    } else if (fieldName == 'Description_Error') {
      await expect(createReviewBodyPage.error_summary_list.getByText(dataset[errorMsg])).toBeVisible();
      await expect(createReviewBodyPage[fieldNameLocator]).toHaveText(dataset[errorMsg]);
      await expect(createReviewBodyPage.description_reason_error).toHaveText(dataset['Max_Description_Reason']);
    } else if (errorMsg == 'Email_Format') {
      await expect(createReviewBodyPage.error_summary_list.getByText(dataset[errorMsg])).toBeVisible();
      await expect(createReviewBodyPage[fieldNameLocator]).toHaveText(dataset[errorMsg]);
    } else {
      const capitilisedFieldName = normalisedFieldName.replace(
        normalisedFieldName.charAt(0),
        normalisedFieldName.charAt(0).toUpperCase()
      );
      await expect(
        createReviewBodyPage.error_summary_list.getByText(`${capitilisedFieldName} ${dataset[errorMsg]}`)
      ).toBeVisible();
      await expect(createReviewBodyPage[fieldNameLocator]).toHaveText(`${capitilisedFieldName} ${dataset[errorMsg]}`);
    }
  }
);
