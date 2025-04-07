import { createBdd } from 'playwright-bdd';
import { expect, test } from '../../../../../hooks/CustomFixtures';
const { When, Then } = createBdd(test);
import path from 'path';
import * as fse from 'fs-extra';
import { getCurrentTimeFormatted } from '../../../../../utils/UtilFunctions';
const pathToTestDataJson =
  './src/resources/test_data/iras/reviewResearch/userAdministration/manageReviewBodies/create_review_body_page_data.json';
const pathToAuditTestDataJson =
  './src/resources/test_data/iras/reviewResearch/userAdministration/manageReviewBodies/audit_history_review_body_page_data.json';

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

Then(
  'I can see the audit history for the review body created event with {string}',
  async ({ auditHistoryReviewBodyPage }, datasetName: string) => {
    const dataset =
      auditHistoryReviewBodyPage.auditHistoryReviewBodyPageTestData.Review_Body_Audit_History_Page[datasetName];
    const filePathAuditHistory = path.resolve(pathToAuditTestDataJson);
    const datafilePathAuditHistory = await fse.readJson(filePathAuditHistory);
    const auditLog = await auditHistoryReviewBodyPage.getAuditLog();
    const timeExpected = datafilePathAuditHistory.Review_Body_Audit_History_Page.Create_Review_Body.date_text;
    const filePathCreateReviewBody = path.resolve(pathToTestDataJson);
    const dataCreateReviewBody = await fse.readJson(filePathCreateReviewBody);
    const eventDescriptionExpectedValue =
      dataCreateReviewBody.Create_Review_Body.organisation_name_unique + dataset.event_description_text;
    expect(auditLog[0]).toBe(timeExpected);
    expect(auditLog[1]).toBe(eventDescriptionExpectedValue);
    expect(auditLog[2]).toBe(dataset.system_admin_email_text);
  }
);

Then(
  'I can see the audit history for the review body disabled event with {string}',
  async ({ auditHistoryReviewBodyPage }, datasetName: string) => {
    const dataset =
      auditHistoryReviewBodyPage.auditHistoryReviewBodyPageTestData.Review_Body_Audit_History_Page[datasetName];
    const filePathAuditHistory = path.resolve(pathToAuditTestDataJson);
    const datafilePathAuditHistory = await fse.readJson(filePathAuditHistory);
    const auditLog = await auditHistoryReviewBodyPage.getAuditLog();
    const timeExpected = datafilePathAuditHistory.Review_Body_Audit_History_Page.Disable_Review_Body.date_text;
    const filePathCreateReviewBody = path.resolve(pathToTestDataJson);
    const dataCreateReviewBody = await fse.readJson(filePathCreateReviewBody);
    const eventDescriptionExpectedValue =
      dataCreateReviewBody.Create_Review_Body.organisation_name_unique + dataset.event_description_text;
    expect(auditLog[0][0]).toBe(timeExpected);
    expect(auditLog[1][0]).toBe(eventDescriptionExpectedValue);
    expect(auditLog[2][0]).toBe(dataset.system_admin_email_text);
  }
);

Then(
  'I can see the audit history for the review body enabled event with {string}',
  async ({ auditHistoryReviewBodyPage }, datasetName: string) => {
    const dataset =
      auditHistoryReviewBodyPage.auditHistoryReviewBodyPageTestData.Review_Body_Audit_History_Page[datasetName];
    const filePathAuditHistory = path.resolve(pathToAuditTestDataJson);
    const datafilePathAuditHistory = await fse.readJson(filePathAuditHistory);
    const auditLog = await auditHistoryReviewBodyPage.getAuditLog();
    const timeExpected = datafilePathAuditHistory.Review_Body_Audit_History_Page.Enable_Review_Body.date_text;
    const filePathCreateReviewBody = path.resolve(pathToTestDataJson);
    const dataCreateReviewBody = await fse.readJson(filePathCreateReviewBody);
    const eventDescriptionExpectedValue =
      dataCreateReviewBody.Create_Review_Body.organisation_name_unique + dataset.event_description_text;
    expect(auditLog[0][0]).toBe(timeExpected);
    expect(auditLog[1][0]).toBe(eventDescriptionExpectedValue);
    expect(auditLog[2][0]).toBe(dataset.system_admin_email_text);
  }
);
Then('I capture the current time after creating a review body', async ({ createReviewBodyPage }) => {
  const currentTime = await getCurrentTimeFormatted();
  const filePath = path.resolve(pathToAuditTestDataJson);
  await createReviewBodyPage.updateCurrentTimeAfterCreateTestDataJson(filePath, currentTime);
});

Then('I capture the current time after disabling a review body', async ({ createReviewBodyPage }) => {
  const currentTime = await getCurrentTimeFormatted();
  const filePath = path.resolve(pathToAuditTestDataJson);
  await createReviewBodyPage.updateCurrentTimeAfterDisableTestDataJson(filePath, currentTime);
});

Then('I capture the current time after enabling a review body', async ({ createReviewBodyPage }) => {
  const currentTime = await getCurrentTimeFormatted();
  const filePath = path.resolve(pathToAuditTestDataJson);
  await createReviewBodyPage.updateCurrentTimeAfterEnableTestDataJson(filePath, currentTime);
});

When(
  'I click the change link against {string} on the review body profile page',
  async ({ checkCreateReviewBodyPage }, fieldKey: string) => {
    checkCreateReviewBodyPage.clickOnChangeButton(fieldKey);
  }
);

Then('I can see the edit review body page for {string}', async ({ createReviewBodyPage }, datasetName: string) => {
  //update
  const dataset = createReviewBodyPage.createReviewBodyPageData.Create_Review_Body[datasetName];
  // await createReviewBodyPage.assertOnCreateReviewbodyPage();
  const actualOrganisationName = await createReviewBodyPage.organisation_name_text.nth(1).textContent();
  const actualCountry = await createReviewBodyPage.countryVal.textContent(); //selected country
  const actualEmailAddress = await createReviewBodyPage.email_address_text.textContent();
  const actualDescription = await createReviewBodyPage.description_text.textContent();
  const filePathCreateReviewBody = path.resolve(pathToTestDataJson);
  const dataCreateReviewBody = await fse.readJson(filePathCreateReviewBody);
  const expectedOrganisationName = dataCreateReviewBody.Create_Review_Body.organisation_name_unique;
  expect(actualOrganisationName).toBe(expectedOrganisationName);
  expect(actualCountry).toBe(dataset.country);
  expect(actualEmailAddress).toBe(dataset.email_address);
  expect(actualDescription).toBe(dataset.description);
});
