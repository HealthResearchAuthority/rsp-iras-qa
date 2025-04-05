import { createBdd } from 'playwright-bdd';
import { expect, test } from '../../../../../hooks/CustomFixtures';
import { confirmStringNotNull } from '../../../../../utils/UtilFunctions';
const { Then } = createBdd(test);
import path from 'path';
import * as fse from 'fs-extra';
const pathToTestDataJson =
  './src/resources/test_data/iras/reviewResearch/userAdministration/manageReviewBodies/create_review_body_page_data.json';

Then(
  'I can see the create Review body confirmation page for {string}',
  async ({ createReviewBodyConfirmationPage }) => {
    // const dataset = createReviewBodyPage.createReviewBodyPageData.Create_Review_Body[datasetName];
    const filePath = path.resolve(pathToTestDataJson);
    const data = await fse.readJson(filePath);
    const expectedConfirmationEmailNote =
      createReviewBodyConfirmationPage.createReviewBodyConfirmationPageData.Create_Review_Body_Confirmation_Page
        .confirmation_email_note_start +
      data.Create_Review_Body.organisation_name_unique +
      createReviewBodyConfirmationPage.createReviewBodyConfirmationPageData.Create_Review_Body_Confirmation_Page
        .confirmation_email_note_end;

    await createReviewBodyConfirmationPage.assertOnCreateReviewbodyConfirmationPage();
    expect(confirmStringNotNull(await createReviewBodyConfirmationPage.confirmation_email_note.textContent())).toBe(
      expectedConfirmationEmailNote
    );
    //bug - missing full stop in display text
  }
);
