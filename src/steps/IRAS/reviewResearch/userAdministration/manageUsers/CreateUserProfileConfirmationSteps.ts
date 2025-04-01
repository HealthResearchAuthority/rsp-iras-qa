import { createBdd } from 'playwright-bdd';
import { expect, test } from '../../../../../hooks/CustomFixtures';
import * as createUserProfileConfirmationPageTestData from '../../../../../resources/test_data/iras/reviewResearch/userAdministration/manageUsers/create_user_profile_confirmation_page_data.json';

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
      createUserProfileConfirmationPageTestData.Create_User_Profile_Confirmation_Page.consent;
    const valConsentUI: string | null = await createUserProfileConfirmationPage.consentVal.textContent();
    const safeValConsentUI = valConsentUI ?? 'default value';
    const actualConsent = safeValConsentUI.replace(/\s+/g, ' ').trim();
    expect(actualConsent).toBe(expectedConsent);
  }
);
