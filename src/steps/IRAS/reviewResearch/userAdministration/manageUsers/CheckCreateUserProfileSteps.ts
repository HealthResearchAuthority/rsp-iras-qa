import { createBdd } from 'playwright-bdd';
import { expect, test } from '../../../../../hooks/CustomFixtures';

const { Then } = createBdd(test);

Then(
  'I can see the Check and create user profile page for {string}',
  async ({ checkCreateUserProfilePage, createUserProfilePage, commonItemsPage }, datasetName: string) => {
    //update
    const dataset = createUserProfilePage.createUserProfilePageData.Create_User_Profile[datasetName];
    await checkCreateUserProfilePage.assertOnCheckCreateUserProfilePage();
    const actualVal_title_text = await checkCreateUserProfilePage.title_text.textContent();
    const actual_title_text: string | null = await commonItemsPage.removeUnwantedChars(actualVal_title_text);
    const actualVal_first_name_text = await checkCreateUserProfilePage.first_name_text.textContent();
    const actual_first_name_text: string | null = await commonItemsPage.removeUnwantedChars(actualVal_first_name_text);
    const actualVal_last_name_text = await checkCreateUserProfilePage.last_name_text.textContent();
    const actual_last_name_text: string | null = await commonItemsPage.removeUnwantedChars(actualVal_last_name_text);
    const actualVal_email_address_text = await checkCreateUserProfilePage.email_address_text.textContent();
    const actual_email_address_text: string | null =
      await commonItemsPage.removeUnwantedChars(actualVal_email_address_text);
    expect(actual_title_text).toBe(dataset.title_text);
    expect(actual_first_name_text).toBe(dataset.first_name_text);
    expect(actual_last_name_text).toBe(dataset.last_name_text);
    expect(actual_email_address_text).toBe(dataset.email_address_text);
    //need to update other fields also
    // "telephone_label": "Telephone",
    // "organisation_label": "Organisation",
    // "job_title_label": "Job title",
    // "role_label": "Role",
    // "committee_label": "Committee",
    // "country_label": "Country",
    // "access_required_label": "Access Required",
    // "review_body_label": "Review body",
    // "audit_label": "Audit",
  }
);
