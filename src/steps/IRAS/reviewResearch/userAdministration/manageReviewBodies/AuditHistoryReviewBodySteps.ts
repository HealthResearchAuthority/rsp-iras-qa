import { createBdd } from 'playwright-bdd';
import { expect, test } from '../../../../../hooks/CustomFixtures';
const { Then } = createBdd(test);
import { getCurrentTimeFormatted } from '../../../../../utils/UtilFunctions';

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
  'I can see the audit history for the review body {string} event for {string} with {string}',
  async (
    { auditHistoryReviewBodyPage, createReviewBodyPage, reviewBodyProfilePage },
    eventName: string,
    datasetName: string,
    datasetValName: string
  ) => {
    let organisationName = '';
    const datasetCreateReviewBody = createReviewBodyPage.createReviewBodyPageData.Create_Review_Body[datasetName];
    const datasetAudit =
      auditHistoryReviewBodyPage.auditHistoryReviewBodyPageTestData.Review_Body_Audit_History_Page[datasetValName];
    const auditLog = await auditHistoryReviewBodyPage.getAuditLog();
    const timeExpected = await auditHistoryReviewBodyPage.getUpdatedTime();
    const timeIndex = parseInt(
      auditHistoryReviewBodyPage.auditHistoryReviewBodyPageTestData.Review_Body_Audit_History_Page.time_index,
      10
    );
    const descrIndex = parseInt(
      auditHistoryReviewBodyPage.auditHistoryReviewBodyPageTestData.Review_Body_Audit_History_Page.description_index,
      10
    );
    const emailIndex = parseInt(
      auditHistoryReviewBodyPage.auditHistoryReviewBodyPageTestData.Review_Body_Audit_History_Page.admin_email_index,
      10
    );
    const rowIndex = parseInt(
      auditHistoryReviewBodyPage.auditHistoryReviewBodyPageTestData.Review_Body_Audit_History_Page.index,
      10
    );
    if (eventName === 'created') {
      if (datasetName.startsWith('Valid_')) {
        organisationName = await createReviewBodyPage.getUniqueOrgName();
      } else {
        organisationName = datasetCreateReviewBody.organisation_name_text;
      }
    } else {
      organisationName = await reviewBodyProfilePage.getOrgName();
    }
    await expect(auditHistoryReviewBodyPage.page_heading).toHaveText(
      auditHistoryReviewBodyPage.auditHistoryReviewBodyPageTestData.Review_Body_Audit_History_Page.page_heading +
        organisationName
    );
    const eventDescriptionExpectedValue = organisationName + datasetAudit.event_description_text;
    expect(auditLog[timeIndex][rowIndex]).toBe(timeExpected);
    expect(auditLog[descrIndex][rowIndex]).toBe(eventDescriptionExpectedValue);
    expect(auditLog[emailIndex][rowIndex]).toBe(
      auditHistoryReviewBodyPage.auditHistoryReviewBodyPageTestData.Review_Body_Audit_History_Page
        .system_admin_email_text
    );
  }
);

Then('I capture the current time', async ({ auditHistoryReviewBodyPage }) => {
  const currentTime = await getCurrentTimeFormatted();
  await auditHistoryReviewBodyPage.setUpdatedTime(currentTime);
});

Then('I can see the audit history page heading', async ({ auditHistoryReviewBodyPage, reviewBodyProfilePage }) => {
  const organisationName = await reviewBodyProfilePage.getOrgName();
  await expect(auditHistoryReviewBodyPage.page_heading).toHaveText(
    auditHistoryReviewBodyPage.auditHistoryReviewBodyPageTestData.Review_Body_Audit_History_Page.page_heading +
      organisationName
  );
});

Then(
  'I can see the audit history for {string} edited event with {string}',
  async ({ auditHistoryReviewBodyPage, reviewBodyProfilePage }, fieldName: string, datasetName: string) => {
    const dataset =
      auditHistoryReviewBodyPage.auditHistoryReviewBodyPageTestData.Review_Body_Audit_History_Page[datasetName];
    const auditLog = await auditHistoryReviewBodyPage.getAuditLog();
    const timeExpected = await auditHistoryReviewBodyPage.getUpdatedTime();
    const timeIndex = parseInt(
      auditHistoryReviewBodyPage.auditHistoryReviewBodyPageTestData.Review_Body_Audit_History_Page.time_index,
      10
    );
    const descrIndex = parseInt(
      auditHistoryReviewBodyPage.auditHistoryReviewBodyPageTestData.Review_Body_Audit_History_Page.description_index,
      10
    );
    const emailIndex = parseInt(
      auditHistoryReviewBodyPage.auditHistoryReviewBodyPageTestData.Review_Body_Audit_History_Page.admin_email_index,
      10
    );
    const rowIndex = parseInt(
      auditHistoryReviewBodyPage.auditHistoryReviewBodyPageTestData.Review_Body_Audit_History_Page.index,
      10
    );
    let valuePrevious: string = '';
    let valueCurrent: string = '';
    if (fieldName == 'Organisation_Name') {
      valuePrevious = await reviewBodyProfilePage.getOrgName();
      valueCurrent = await reviewBodyProfilePage.getNewOrgName();
      await expect(auditHistoryReviewBodyPage.page_heading).toHaveText(
        auditHistoryReviewBodyPage.auditHistoryReviewBodyPageTestData.Review_Body_Audit_History_Page.page_heading +
          valueCurrent
      );
    } else if (fieldName == 'Country') {
      valuePrevious = (await reviewBodyProfilePage.getCountries()).join(', ');
      valueCurrent = (await reviewBodyProfilePage.getNewCountries()).join(', ');
    } else if (fieldName == 'Email_Address') {
      valuePrevious = await reviewBodyProfilePage.getEmail();
      valueCurrent = await reviewBodyProfilePage.getNewEmail();
    } else if (fieldName == 'Description') {
      valuePrevious = await reviewBodyProfilePage.getDescription();
      valueCurrent = await reviewBodyProfilePage.getNewDescription();
    }
    if (valuePrevious !== valueCurrent) {
      const eventDescriptionExpectedValue = dataset.event_description_text + valuePrevious + ' to ' + valueCurrent;
      expect(auditLog[timeIndex][rowIndex]).toBe(timeExpected);
      expect(auditLog[descrIndex][rowIndex]).toBe(eventDescriptionExpectedValue);
      expect(auditLog[emailIndex][rowIndex]).toBe(
        auditHistoryReviewBodyPage.auditHistoryReviewBodyPageTestData.Review_Body_Audit_History_Page
          .system_admin_email_text
      );
    }
  }
);

Then(
  'I can see the audit history for all the fields edited event with {string}',
  async ({ auditHistoryReviewBodyPage, reviewBodyProfilePage }, datasetName: string) => {
    // defect: when the previous description was empty
    const dataset =
      auditHistoryReviewBodyPage.auditHistoryReviewBodyPageTestData.Review_Body_Audit_History_Page[datasetName];
    const auditLog = await auditHistoryReviewBodyPage.getAuditLog();
    const timeExpected = await auditHistoryReviewBodyPage.getUpdatedTime();
    const descriptionPrevious = await reviewBodyProfilePage.getDescription();
    const descriptionCurrent = await reviewBodyProfilePage.getNewDescription();
    const descriptionEventDescriptionExpectedValue =
      dataset.description_event_description_text + descriptionPrevious + ' to ' + descriptionCurrent;
    const emailPrevious = await reviewBodyProfilePage.getEmail();
    const emailCurrent = await reviewBodyProfilePage.getNewEmail();
    const emailEventDescriptionExpectedValue =
      dataset.email_address_event_description_text + emailPrevious + ' to ' + emailCurrent;
    const countryNamesPrevious: string = (await reviewBodyProfilePage.getCountries()).join(', ');
    const countryNamesCurrent = (await reviewBodyProfilePage.getNewCountries()).join(', ');
    const countryEventDescriptionExpectedValue =
      dataset.country_event_description_text + countryNamesPrevious + ' to ' + countryNamesCurrent;
    const organisationNamePrevious = await reviewBodyProfilePage.getOrgName();
    const organisationNameCurrent = await reviewBodyProfilePage.getNewOrgName();
    const orgNameEventDescriptionExpectedValue =
      dataset.organisation_name_event_description_text + organisationNamePrevious + ' to ' + organisationNameCurrent;
    await expect(auditHistoryReviewBodyPage.page_heading).toHaveText(
      auditHistoryReviewBodyPage.auditHistoryReviewBodyPageTestData.Review_Body_Audit_History_Page.page_heading +
        organisationNameCurrent
    );
    const organisationIndex = parseInt(dataset.organisation_index, 10);
    const emailIndex = parseInt(dataset.email_index, 10);
    const descriptionIndex = parseInt(dataset.description_index, 10);
    const countryIndex = parseInt(dataset.country_index, 10);
    const timeIndex = parseInt(
      auditHistoryReviewBodyPage.auditHistoryReviewBodyPageTestData.Review_Body_Audit_History_Page.time_index,
      10
    );
    const descrIndex = parseInt(
      auditHistoryReviewBodyPage.auditHistoryReviewBodyPageTestData.Review_Body_Audit_History_Page.description_index,
      10
    );
    const adminEmailIndex = parseInt(
      auditHistoryReviewBodyPage.auditHistoryReviewBodyPageTestData.Review_Body_Audit_History_Page.admin_email_index,
      10
    );
    expect(auditLog[timeIndex][organisationIndex]).toBe(timeExpected);
    expect(auditLog[descrIndex][organisationIndex]).toBe(orgNameEventDescriptionExpectedValue);
    expect(auditLog[adminEmailIndex][organisationIndex]).toBe(
      auditHistoryReviewBodyPage.auditHistoryReviewBodyPageTestData.Review_Body_Audit_History_Page
        .system_admin_email_text
    );
    expect(auditLog[timeIndex][emailIndex]).toBe(timeExpected);
    expect(auditLog[descrIndex][emailIndex]).toBe(emailEventDescriptionExpectedValue);
    expect(auditLog[adminEmailIndex][emailIndex]).toBe(
      auditHistoryReviewBodyPage.auditHistoryReviewBodyPageTestData.Review_Body_Audit_History_Page
        .system_admin_email_text
    );
    expect(auditLog[timeIndex][descriptionIndex]).toBe(timeExpected);
    if (descriptionPrevious !== '') {
      expect(auditLog[descrIndex][descriptionIndex]).toBe(descriptionEventDescriptionExpectedValue);
    } else {
      const descriptionEventDescriptionExpectedValue =
        dataset.description_event_description_text + '(null)' + ' to ' + descriptionCurrent;
      expect(auditLog[descrIndex][descriptionIndex]).toBe(descriptionEventDescriptionExpectedValue);
    }
    expect(auditLog[adminEmailIndex][descriptionIndex]).toBe(
      auditHistoryReviewBodyPage.auditHistoryReviewBodyPageTestData.Review_Body_Audit_History_Page
        .system_admin_email_text
    );
    if (countryNamesPrevious !== countryNamesCurrent) {
      expect(auditLog[timeIndex][countryIndex]).toBe(timeExpected);
      expect(auditLog[descrIndex][countryIndex]).toBe(countryEventDescriptionExpectedValue);
      expect(auditLog[adminEmailIndex][countryIndex]).toBe(
        auditHistoryReviewBodyPage.auditHistoryReviewBodyPageTestData.Review_Body_Audit_History_Page
          .system_admin_email_text
      );
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
