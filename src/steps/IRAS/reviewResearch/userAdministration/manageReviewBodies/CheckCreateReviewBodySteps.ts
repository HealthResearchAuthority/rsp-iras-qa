import { createBdd } from 'playwright-bdd';
import { expect, test } from '../../../../../hooks/CustomFixtures';

const { Then } = createBdd(test);

Then(
  'I can see the Check and create review body page for {string}',
  async ({ checkCreateReviewBodyPage, createReviewBodyPage }, datasetName: string) => {
    //update
    const dataset = createReviewBodyPage.createReviewBodyPageData.Create_Review_Body[datasetName];
    await checkCreateReviewBodyPage.assertOnCheckCreateReviewbodyPage();
    const actualOrganisationName = await checkCreateReviewBodyPage.organisationNameVal.nth(1).textContent();
    const actualCountry = await checkCreateReviewBodyPage.countryVal.textContent();
    const actualEmailAddress = await checkCreateReviewBodyPage.emailAddressVal.textContent();
    const actualDescription = await checkCreateReviewBodyPage.descriptionVal.textContent();
    expect(actualOrganisationName).toBe(dataset.organisation_name);
    expect(actualCountry).toBe(dataset.country);
    expect(actualEmailAddress).toBe(dataset.email_address);
    expect(actualDescription).toBe(dataset.description);
  }
);
