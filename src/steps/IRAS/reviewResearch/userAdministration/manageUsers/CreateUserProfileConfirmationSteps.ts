import { createBdd } from 'playwright-bdd';
import { expect, test } from '../../../../../hooks/CustomFixtures';

const { Then } = createBdd(test);

Then(
  'I can see the create user profile confirmation page for {string}',
  async ({ createUserProfileConfirmationPage, createUserProfilePage }, datasetName: string) => {
    //update
    const dataset = createUserProfilePage.createUserProfilePageData.Create_User_Profile[datasetName];
    await createUserProfileConfirmationPage.assertOnCreateUserProfileConfirmationPage();
    const expectedConsent =
      'A confirmation email will be sent to ' +
      dataset.organisation_name +
      ' to confirm that their profile has been added. Their status is now active. ';
    const actualConsent = await createUserProfileConfirmationPage.consentVal.nth(1).textContent();
    expect(actualConsent).toBe(expectedConsent);
  }
);
