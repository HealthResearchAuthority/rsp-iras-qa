import { createBdd } from 'playwright-bdd';
import { expect, test } from '../../../../../hooks/CustomFixtures';

const { Then } = createBdd(test);

Then(
  'I can see the create Review body confirmation page for {string}',
  async ({ createReviewBodyConfirmationPage, createReviewBodyPage }, datasetName: string) => {
    //update
    const dataset = createReviewBodyPage.createReviewBodyPageData.Create_Review_Body[datasetName];
    await createReviewBodyConfirmationPage.assertOnCreateReviewbodyConfirmationPage();
    const expectedConsent =
      'A confirmation email will be sent to ' +
      dataset.organisation_name +
      ' to confirm that their profile has been added. Their status is now active. ';
    const actualConsent = await createReviewBodyConfirmationPage.consentVal.nth(1).textContent();
    expect(actualConsent).toBe(expectedConsent);
  }
);
