import { createBdd } from 'playwright-bdd';
import { expect, test } from '../../../../../hooks/CustomFixtures';
import { generateUniqueValue } from '../../../../../utils/UtilFunctions';
const { When, Then } = createBdd(test);
import path from 'path';
const pathToTestDataJson =
  './src/resources/test_data/iras/reviewResearch/userAdministration/manageReviewBodies/create_review_body_page_data.json';

// When(
//   'I fill the new review body page using {string}',
//   async ({ createReviewBodyPage, commonItemsPage }, datasetName: string) => {
//     const dataset = createReviewBodyPage.createReviewBodyPageData.Create_Review_Body[datasetName];
//     for (const key in dataset) {
//       if (Object.prototype.hasOwnProperty.call(dataset, key)) {
//         await commonItemsPage.fillUIComponent(dataset, key, createReviewBodyPage);
//       }
//     }
//   }
// );

When(
  'I fill the new review body page using {string}',
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

Then('I can see the add a new review body page', async ({ createReviewBodyPage }) => {
  await createReviewBodyPage.assertOnCreateReviewbodyPage();
});

Then('I can see the Add new review body page for {string}', async ({ createReviewBodyPage }, datasetName: string) => {
  //update
  const dataset = createReviewBodyPage.createReviewBodyPageData.Create_Review_Body[datasetName];
  await createReviewBodyPage.assertOnCreateReviewbodyPage();
  const actualOrganisationName = await createReviewBodyPage.organisation_name_text.nth(1).textContent();
  const actualCountry = await createReviewBodyPage.countryVal.textContent(); //selected country
  const actualEmailAddress = await createReviewBodyPage.email_address_text.textContent();
  const actualDescription = await createReviewBodyPage.description_text.textContent();
  expect(actualOrganisationName).toBe(dataset.organisation_name);
  expect(actualCountry).toBe(dataset.country);
  expect(actualEmailAddress).toBe(dataset.email_address);
  expect(actualDescription).toBe(dataset.description);
});

Then('I can see the error message against {string}', async ({ createReviewBodyPage }, fieldName: string) => {
  //update
  if (fieldName === 'All_Mandatory') {
    await createReviewBodyPage.checkErrorMessageOrganisationName();
    await createReviewBodyPage.checkErrorMessageCountry();
    await createReviewBodyPage.checkErrorMessageEmailAddress();
  } else if (fieldName === 'Organisation_Name') {
    await createReviewBodyPage.checkErrorMessageOrganisationName();
  } else if (fieldName === 'Country') {
    await createReviewBodyPage.checkErrorMessageCountry();
  } else if (fieldName === 'Email_Address') {
    await createReviewBodyPage.checkErrorMessageEmailAddress();
  }
});
