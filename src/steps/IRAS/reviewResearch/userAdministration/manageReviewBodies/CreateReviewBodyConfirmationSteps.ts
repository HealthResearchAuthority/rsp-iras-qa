import { createBdd } from 'playwright-bdd';
import { expect, test } from '../../../../../hooks/CustomFixtures';
import path from 'path';
import * as fse from 'fs-extra';
import { confirmStringNotNull } from '../../../../../utils/UtilFunctions';
const pathToTestDataJson =
  './src/resources/test_data/iras/reviewResearch/userAdministration/manageReviewBodies/create_review_body_page_data.json';

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
    await expect(createReviewBodyConfirmationPage.confirmation_email_note).toHaveText(expectedConfirmationEmailNote);
  }
);

Then(
  'I can see the create Review body confirmation page for audit {string}',
  async ({ createReviewBodyConfirmationPage }) => {
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
  }
);
