import { createBdd } from 'playwright-bdd';
import { expect, test } from '../../../../../hooks/CustomFixtures';

const { Then } = createBdd(test);

Then(
  'I can see the create Review body confirmation page for {string}',
  async ({ createReviewBodyConfirmationPage, createReviewBodyPage }, datasetName: string) => {
    const dataset = createReviewBodyPage.createReviewBodyPageData.Create_Review_Body[datasetName];
    let orgName: string;
    if (datasetName.startsWith('Valid_')) {
      orgName = await createReviewBodyPage.getUniqueOrgName();
    } else {
      orgName = dataset.organisation_name_text;
    }
    const expectedConfirmationEmailNote =
      createReviewBodyConfirmationPage.createReviewBodyConfirmationPageData.Create_Review_Body_Confirmation_Page
        .confirmation_email_note_start +
      orgName +
      createReviewBodyConfirmationPage.createReviewBodyConfirmationPageData.Create_Review_Body_Confirmation_Page
        .confirmation_email_note_end;
    await createReviewBodyConfirmationPage.assertOnCreateReviewbodyConfirmationPage();
    await expect
      .soft(createReviewBodyConfirmationPage.confirmation_email_note)
      .toHaveText(expectedConfirmationEmailNote);
  }
);
