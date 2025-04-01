import { createBdd } from 'playwright-bdd';
import { expect, test } from '../../../../../hooks/CustomFixtures';

const { Then } = createBdd(test);

Then(
  'I can see the create user profile confirmation page for {string}',
  async ({ createUserProfileConfirmationPage, createUserProfilePage }, datasetName: string) => {
    const dataset = createUserProfilePage.createUserProfilePageTestData.Create_User_Profile[datasetName];
    await createUserProfileConfirmationPage.assertOnCreateUserProfileConfirmationPage();
    const expectedConsent =
      dataset.first_name_text +
      ' ' +
      dataset.last_name_text +
      ' has been sent an email confirming their account details. Their status is now active.';
    const valConsentUI: string | null = await createUserProfileConfirmationPage.consentVal.textContent();
    const safeValConsentUI = valConsentUI ?? 'default value';
    const actualConsent = safeValConsentUI.replace(/\s+/g, ' ').trim();
    expect(actualConsent).toBe(expectedConsent);
  }
);
