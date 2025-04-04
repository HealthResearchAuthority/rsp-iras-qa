import { createBdd } from 'playwright-bdd';
import { expect, test } from '../../../../../hooks/CustomFixtures';

const { When, Then } = createBdd(test);

When(
  'I fill the new review body page using {string}',
  async ({ createReviewBodyPage, commonItemsPage }, datasetName: string) => {
    const dataset = createReviewBodyPage.createReviewBodyPageData.Create_Review_Body[datasetName];
    for (const key in dataset) {
      if (Object.prototype.hasOwnProperty.call(dataset, key)) {
        await commonItemsPage.fillUIComponent(dataset, key, createReviewBodyPage);
      }
    }
  }
);

Then('I can see the Add a new review body page', async ({ createReviewBodyPage }) => {
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
