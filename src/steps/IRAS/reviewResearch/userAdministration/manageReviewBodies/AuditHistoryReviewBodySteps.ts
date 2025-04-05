import { createBdd } from 'playwright-bdd';
import { expect, test } from '../../../../../hooks/CustomFixtures';
const { Then } = createBdd(test);
import path from 'path';
import * as fse from 'fs-extra';
const pathToTestDataJson =
  './src/resources/test_data/iras/reviewResearch/userAdministration/manageReviewBodies/create_review_body_page_data.json';

Then('I can see the audit history page of the review body', async ({ auditHistoryReviewBodyPage }) => {
  await auditHistoryReviewBodyPage.assertOnAuditHistoryReviewBodyPage();
});

Then(
  'I can see the {string} ui labels on the audit history page of the review body',
  async ({ commonItemsPage, auditHistoryReviewBodyPage }, datasetName: string) => {
    const dataset =
      auditHistoryReviewBodyPage.auditHistoryReviewBodyPageTestData.Review_Body_Audit_History_Page[datasetName];
    for (const key in dataset) {
      if (Object.prototype.hasOwnProperty.call(dataset, key)) {
        const labelVal = await commonItemsPage.getUiLabel(dataset, key, auditHistoryReviewBodyPage);
        expect(labelVal).toBe(dataset[key]);
      }
    }
  }
);

Then('I can see the audit history for {string}', async ({ auditHistoryReviewBodyPage }, datasetName: string) => {
  const dataset =
    auditHistoryReviewBodyPage.auditHistoryReviewBodyPageTestData.Review_Body_Audit_History_Page[datasetName];
  const filePath = path.resolve(pathToTestDataJson);
  const data = await fse.readJson(filePath);
  const auditLog = await auditHistoryReviewBodyPage.getAuditLog();
  // expect(auditLog[0]).toBe(dataset[key]);
  const eventDescriptionExpectedValue =
    data.Create_Review_Body.organisation_name_unique + dataset.event_description_text;
  expect(auditLog[1]).toBe(eventDescriptionExpectedValue);
  expect(auditLog[2]).toBe(dataset.system_admin_email_text);
});
