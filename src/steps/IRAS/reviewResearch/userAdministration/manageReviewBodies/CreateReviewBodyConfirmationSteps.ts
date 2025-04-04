import { createBdd } from 'playwright-bdd';
import { expect, test } from '../../../../../hooks/CustomFixtures';
import { confirmStringNotNull } from '../../../../../utils/UtilFunctions';

const { Then } = createBdd(test);

Then(
  'I can see the create Review body confirmation page for {string}',
  async ({ createReviewBodyConfirmationPage, createReviewBodyPage }, datasetName: string) => {
    const dataset = createReviewBodyPage.createReviewBodyPageData.Create_Review_Body[datasetName];
    const expectedConfirmationEmailNote =
      createReviewBodyConfirmationPage.createReviewBodyConfirmationPageData.Create_Review_Body_Confirmation_Page
        .confirmation_email_note_start +
      dataset.organisation_name_text +
      createReviewBodyConfirmationPage.createReviewBodyConfirmationPageData.Create_Review_Body_Confirmation_Page
        .confirmation_email_note_end;

    await createReviewBodyConfirmationPage.assertOnCreateReviewbodyConfirmationPage();
    expect(confirmStringNotNull(await createReviewBodyConfirmationPage.confirmation_email_note.textContent())).toBe(
      expectedConfirmationEmailNote
    ); //bug - missing full stop in display text
  }
);
