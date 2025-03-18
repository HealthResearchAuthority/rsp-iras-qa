import { createBdd } from 'playwright-bdd';
import { expect, test } from '../../../../../hooks/CustomFixtures';

const { Then } = createBdd(test);

Then(
  'I can see the Check and create user profile page for {string}',
  async ({ checkCreateUserProfilePage, createUserProfilePage }, datasetName: string) => {
    //update
    const dataset = createUserProfilePage.createUserProfilePageData.Create_User_Profile[datasetName];
    await checkCreateUserProfilePage.assertOnCheckCreateUserProfilePage();
    const actualOrganisationName = await checkCreateUserProfilePage.organisationNameVal.nth(1).textContent();
    const actualCountry = await checkCreateUserProfilePage.countryVal.textContent();
    const actualEmailAddress = await checkCreateUserProfilePage.emailAddressVal.textContent();
    const actualDescription = await checkCreateUserProfilePage.descriptionVal.textContent();
    expect(actualOrganisationName).toBe(dataset.organisation_name);
    expect(actualCountry).toBe(dataset.country);
    expect(actualEmailAddress).toBe(dataset.email_address);
    expect(actualDescription).toBe(dataset.description);
  }
);
