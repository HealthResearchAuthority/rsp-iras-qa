import { createBdd } from 'playwright-bdd';
import { expect, test } from '../../../../../hooks/CustomFixtures';
const { When, Then } = createBdd(test);
import path from 'path';
import * as fse from 'fs-extra';
import {
  confirmStringNotNull,
  generateUniqueValue,
  getCurrentTimeFormatted,
  removeUnwantedWhitespace,
} from '../../../../../utils/UtilFunctions';
const pathToTestDataJson =
  './src/resources/test_data/iras/reviewResearch/userAdministration/manageReviewBodies/create_review_body_page_data.json';
const pathToAuditTestDataJson =
  './src/resources/test_data/iras/reviewResearch/userAdministration/manageReviewBodies/audit_history_review_body_page_data.json';

Then('I can see the audit history page of the review body', async ({ auditHistoryReviewBodyPage }) => {
  await auditHistoryReviewBodyPage.assertOnAuditHistoryReviewBodyPage();
});
Then(
  'I can see the audit history page of the selected review body for {string}',
  async ({ auditHistoryReviewBodyPage, createReviewBodyPage }, datasetName: string) => {
    const dataset = createReviewBodyPage.createReviewBodyPageData.Create_Review_Body[datasetName];
    await auditHistoryReviewBodyPage.assertOnAuditHistoryReviewBodyPage();
    let organisationName: string;
    if (datasetName.startsWith('Valid_')) {
      organisationName = await createReviewBodyPage.getUniqueOrgName();
    } else {
      organisationName = dataset.organisation_name_text;
    }
    await expect(auditHistoryReviewBodyPage.page_heading).toHaveText(
      auditHistoryReviewBodyPage.auditHistoryReviewBodyPageTestData.Review_Body_Audit_History_Page.page_heading +
        organisationName
    );
  }
);

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
  'I can see the audit history for the review body created event for {string} with {string}',
  async ({ auditHistoryReviewBodyPage, createReviewBodyPage }, datasetName: string, datasetValName: string) => {
    const datasetCreateReviewBody = createReviewBodyPage.createReviewBodyPageData.Create_Review_Body[datasetName];
    const datasetAudit =
      auditHistoryReviewBodyPage.auditHistoryReviewBodyPageTestData.Review_Body_Audit_History_Page[datasetValName];
    const filePathAuditHistory = path.resolve(pathToAuditTestDataJson);
    const datafilePathAuditHistory = await fse.readJson(filePathAuditHistory);
    const auditLog = await auditHistoryReviewBodyPage.getAuditLog();
    const timeExpected = datafilePathAuditHistory.Review_Body_Audit_History_Page.Create_Review_Body.date_text;
    let organisationName: string;
    if (datasetName.startsWith('Valid_')) {
      organisationName = await createReviewBodyPage.getUniqueOrgName();
    } else {
      organisationName = datasetCreateReviewBody.organisation_name_text;
    }
    const eventDescriptionExpectedValue = organisationName + datasetAudit.event_description_text;
    expect(auditLog[0][0]).toBe(timeExpected);
    expect(auditLog[1][0]).toBe(eventDescriptionExpectedValue);
    expect(auditLog[2][0]).toBe(datasetAudit.system_admin_email_text);
  }
);

Then(
  'I can see the audit history for the review body disabled event with {string}',
  async ({ auditHistoryReviewBodyPage, reviewBodyProfilePage }, datasetName: string) => {
    const datasetAudit =
      auditHistoryReviewBodyPage.auditHistoryReviewBodyPageTestData.Review_Body_Audit_History_Page[datasetName];
    const filePathAuditHistory = path.resolve(pathToAuditTestDataJson);
    const datafilePathAuditHistory = await fse.readJson(filePathAuditHistory);
    const auditLog = await auditHistoryReviewBodyPage.getAuditLog();
    const timeExpected = datafilePathAuditHistory.Review_Body_Audit_History_Page.Disable_Review_Body.date_text;
    const organisationName = await reviewBodyProfilePage.getOrgName();
    const eventDescriptionExpectedValue = organisationName + datasetAudit.event_description_text;
    await expect(auditHistoryReviewBodyPage.page_heading).toHaveText(
      auditHistoryReviewBodyPage.auditHistoryReviewBodyPageTestData.Review_Body_Audit_History_Page.page_heading +
        organisationName
    );
    expect(auditLog[0][0]).toBe(timeExpected);
    expect(auditLog[1][0]).toBe(eventDescriptionExpectedValue);
    expect(auditLog[2][0]).toBe(datasetAudit.system_admin_email_text);
  }
);

Then(
  'I can see the audit history for the review body enabled event with {string}',
  async ({ auditHistoryReviewBodyPage, reviewBodyProfilePage }, datasetName: string) => {
    const dataset =
      auditHistoryReviewBodyPage.auditHistoryReviewBodyPageTestData.Review_Body_Audit_History_Page[datasetName];
    const filePathAuditHistory = path.resolve(pathToAuditTestDataJson);
    const datafilePathAuditHistory = await fse.readJson(filePathAuditHistory);
    const timeExpected = datafilePathAuditHistory.Review_Body_Audit_History_Page.Enable_Review_Body.date_text;
    const organisationName = await reviewBodyProfilePage.getOrgName();
    const eventDescriptionExpectedValue = organisationName + dataset.event_description_text;
    const auditLog = await auditHistoryReviewBodyPage.getAuditLog();
    await expect(auditHistoryReviewBodyPage.page_heading).toHaveText(
      auditHistoryReviewBodyPage.auditHistoryReviewBodyPageTestData.Review_Body_Audit_History_Page.page_heading +
        organisationName
    );
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

Then('I capture the current time after editing a review body', async ({ createReviewBodyPage }) => {
  const currentTime = await getCurrentTimeFormatted();
  const filePath = path.resolve(pathToAuditTestDataJson);
  await createReviewBodyPage.updateCurrentTimeAfterEditOrgNameTestDataJson(filePath, currentTime);
});

Then('I can see the edit review body page for audit', async ({ createReviewBodyPage }) => {
  //update
  // const dataset = createReviewBodyPage.createReviewBodyPageData.Create_Review_Body[datasetName];
  // await createReviewBodyPage.assertOnCreateReviewbodyPage();
  // const actualOrganisationName = await createReviewBodyPage.organisation_name_text.nth(1).textContent();
  const actualOrganisationName = await removeUnwantedWhitespace(
    confirmStringNotNull(await createReviewBodyPage.organisation_name_text.getAttribute('value'))
  );
  // const actualCountry = await createReviewBodyPage.countryVal.textContent(); //selected country
  // const actualEmailAddress = await removeUnwantedWhitespace(
  //   confirmStringNotNull(await createReviewBodyPage.email_address_text.getAttribute('value'))
  // );
  // const actualDescription = await createReviewBodyPage.description_text.textContent();
  const filePathCreateReviewBody = path.resolve(pathToTestDataJson);
  const dataCreateReviewBody = await fse.readJson(filePathCreateReviewBody);
  const expectedOrganisationName = dataCreateReviewBody.Create_Review_Body.organisation_name_unique;
  expect(actualOrganisationName).toBe(expectedOrganisationName);
  // expect(actualCountry).toBe(dataset.country);
  // expect(actualEmailAddress).toBe(dataCreateReviewBody.Create_Review_Body.email_address);
  // expect(actualDescription).toBe(dataset.description);
  await createReviewBodyPage.setUniqueOrgName(actualOrganisationName);
  // const filePathAuditHistory = path.resolve(pathToAuditTestDataJson);
  // await createReviewBodyPage.updatePreviousOrgNameTestDataJson(
  //   filePathAuditHistory,
  //   confirmStringNotNull(actualOrganisationName)
  // );
});

Then(
  'I can see the audit history for organisation name edited event with {string}',
  async ({ auditHistoryReviewBodyPage, reviewBodyProfilePage }, datasetName: string) => {
    const dataset =
      auditHistoryReviewBodyPage.auditHistoryReviewBodyPageTestData.Review_Body_Audit_History_Page[datasetName];
    const filePathAuditHistory = path.resolve(pathToAuditTestDataJson);
    const datafilePathAuditHistory = await fse.readJson(filePathAuditHistory);
    const auditLog = await auditHistoryReviewBodyPage.getAuditLog();
    const timeExpected =
      datafilePathAuditHistory.Review_Body_Audit_History_Page.Edit_Review_Body_Organisation_Name.date_text;
    const organisationNamePrevious = await reviewBodyProfilePage.getOrgName();
    const organisationNameCurrent = await reviewBodyProfilePage.getNewOrgName();
    const eventDescriptionPart1 = dataset.event_description_text;
    const eventDescriptionPart2 = organisationNamePrevious;
    const eventDescriptionPart3 = ' to ' + organisationNameCurrent;
    const eventDescriptionExpectedValue = eventDescriptionPart1 + eventDescriptionPart2 + eventDescriptionPart3;
    await expect(auditHistoryReviewBodyPage.page_heading).toHaveText(
      auditHistoryReviewBodyPage.auditHistoryReviewBodyPageTestData.Review_Body_Audit_History_Page.page_heading +
        organisationNameCurrent
    );
    expect(auditLog[0][0]).toBe(timeExpected);
    expect(auditLog[1][0]).toBe(eventDescriptionExpectedValue);
    expect(auditLog[2][0]).toBe(dataset.system_admin_email_text);
  }
);

Then(
  'I can see the audit history for country edited event with {string}',
  async ({ auditHistoryReviewBodyPage, reviewBodyProfilePage }, datasetName: string) => {
    const dataset =
      auditHistoryReviewBodyPage.auditHistoryReviewBodyPageTestData.Review_Body_Audit_History_Page[datasetName];
    const filePathAuditHistory = path.resolve(pathToAuditTestDataJson);
    const datafilePathAuditHistory = await fse.readJson(filePathAuditHistory);
    const auditLog = await auditHistoryReviewBodyPage.getAuditLog();
    const timeExpected =
      datafilePathAuditHistory.Review_Body_Audit_History_Page.Edit_Review_Body_Organisation_Name.date_text;
    const countryNamesPrevious: string = (await reviewBodyProfilePage.getCountries()).join(', ');
    const countryNamesCurrent = (await reviewBodyProfilePage.getNewCountries()).join(', ');
    const eventDescriptionPart1 = dataset.event_description_text;
    const eventDescriptionPart2 = countryNamesPrevious;
    const eventDescriptionPart3 = ' to ' + countryNamesCurrent;
    const eventDescriptionExpectedValue = eventDescriptionPart1 + eventDescriptionPart2 + eventDescriptionPart3;
    const organisationName = await reviewBodyProfilePage.getNewOrgName();
    await expect(auditHistoryReviewBodyPage.page_heading).toHaveText(
      auditHistoryReviewBodyPage.auditHistoryReviewBodyPageTestData.Review_Body_Audit_History_Page.page_heading +
        organisationName
    );
    expect(auditLog[0][0]).toBe(timeExpected);
    expect(auditLog[1][0]).toBe(eventDescriptionExpectedValue);
    expect(auditLog[2][0]).toBe(dataset.system_admin_email_text);
  }
);

Then(
  'I can see the audit history for email address edited event with {string}',
  async ({ auditHistoryReviewBodyPage, createReviewBodyPage }, datasetName: string) => {
    const dataset =
      auditHistoryReviewBodyPage.auditHistoryReviewBodyPageTestData.Review_Body_Audit_History_Page[datasetName];
    const filePathAuditHistory = path.resolve(pathToAuditTestDataJson);
    const datafilePathAuditHistory = await fse.readJson(filePathAuditHistory);
    const auditLog = await auditHistoryReviewBodyPage.getAuditLog();
    const timeExpected =
      datafilePathAuditHistory.Review_Body_Audit_History_Page.Edit_Review_Body_Organisation_Name.date_text;
    const organisationNameUniquePrevious = await createReviewBodyPage.getUniqueOrgName();
    const filePathCreateReviewBody = path.resolve(pathToTestDataJson);
    const dataCreateReviewBody = await fse.readJson(filePathCreateReviewBody);
    const eventDescriptionPart1 = dataset.event_description_text;
    const eventDescriptionPart2 = organisationNameUniquePrevious;
    const eventDescriptionPart3 = ' to ' + dataCreateReviewBody.Create_Review_Body.organisation_name_unique;
    const eventDescriptionExpectedValue = eventDescriptionPart1 + eventDescriptionPart2 + eventDescriptionPart3;
    console.log(eventDescriptionExpectedValue);
    expect(auditLog[0][0]).toBe(timeExpected);
    expect(auditLog[1][0]).toBe(eventDescriptionExpectedValue);
    expect(auditLog[2][0]).toBe(dataset.system_admin_email_text);
  }
);

When(
  'I fill the edit review body page using {string}',
  async ({ createReviewBodyPage, commonItemsPage }, datasetName: string) => {
    const dataset = createReviewBodyPage.createReviewBodyPageData.Create_Review_Body[datasetName];
    for (const key in dataset) {
      if (Object.prototype.hasOwnProperty.call(dataset, key)) {
        if (key === 'organisation_name_text') {
          const prefix = createReviewBodyPage.createReviewBodyPageData.Create_Review_Body.organisation_name_prefix;
          const uniqueOrgName = await generateUniqueValue(dataset[key], prefix);
          const filePath = path.resolve(pathToTestDataJson);
          await createReviewBodyPage.updateUniqueOrgNameTestDataJson(filePath, uniqueOrgName);
          const locator = createReviewBodyPage[key];
          await locator.fill(uniqueOrgName);
        } else {
          await commonItemsPage.fillUIComponent(dataset, key, createReviewBodyPage);
        }
      }
    }
  }
);

Then(
  'I can see the default sort should be the most recent entry first based on date and time',
  async ({ auditHistoryReviewBodyPage }) => {
    const timeValues: string[] = [];
    const auditLog = await auditHistoryReviewBodyPage.getAuditLog();
    const rowCount = auditLog[0].length;
    for (let i = 0; i < rowCount; i++) {
      timeValues.push(auditLog[0][i]);
    }
    const timeDates = timeValues.map((time) => new Date(time));
    const isSortedDesc = timeDates.every((time, i, arr) => {
      if (i === 0) return true;
      return arr[i - 1] >= time;
    });
    expect(isSortedDesc).toBe(true);
  }
);

When(
  'I fill the new review body page for audit using {string}',
  async ({ createReviewBodyPage, commonItemsPage }, datasetName: string) => {
    const dataset = createReviewBodyPage.createReviewBodyPageData.Create_Review_Body[datasetName];
    for (const key in dataset) {
      if (Object.prototype.hasOwnProperty.call(dataset, key)) {
        if (key === 'organisation_name_text') {
          const prefix = createReviewBodyPage.createReviewBodyPageData.Create_Review_Body.organisation_name_prefix;
          const uniqueOrgName = await generateUniqueValue(dataset[key], prefix);
          const filePath = path.resolve(pathToTestDataJson);
          await createReviewBodyPage.updateUniqueOrgNameTestDataJson(filePath, uniqueOrgName);
          const locator = createReviewBodyPage[key];
          await locator.fill(uniqueOrgName);
        } else {
          await commonItemsPage.fillUIComponent(dataset, key, createReviewBodyPage);
        }
      }
    }
  }
);
