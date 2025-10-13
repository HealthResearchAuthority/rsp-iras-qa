import { createBdd } from 'playwright-bdd';
import { expect, test } from '../../../../../hooks/CustomFixtures';
const { Then } = createBdd(test);

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
  'I can see the audit history for the review body {string} event for {string} with {string}',
  async (
    { auditHistoryReviewBodyPage, createReviewBodyPage, reviewBodyProfilePage, commonItemsPage },
    eventName: string,
    datasetName: string,
    datasetValName: string
  ) => {
    const datasetCreateReviewBody = createReviewBodyPage.createReviewBodyPageData.Create_Review_Body[datasetName];
    const datasetAudit =
      auditHistoryReviewBodyPage.auditHistoryReviewBodyPageTestData.Review_Body_Audit_History_Page[datasetValName];
    const auditLog = await commonItemsPage.getAuditLog();
    const timeExpected = await auditHistoryReviewBodyPage.getUpdatedTime();
    const rowIndex = Number.parseInt(
      auditHistoryReviewBodyPage.auditHistoryReviewBodyPageTestData.Review_Body_Audit_History_Page.first_row_index,
      10
    );
    let organisationName = await reviewBodyProfilePage.getOrgName();
    if (eventName === 'created') {
      if (datasetName.startsWith('Valid_')) {
        organisationName = await createReviewBodyPage.getUniqueOrgName();
      } else {
        organisationName = datasetCreateReviewBody.organisation_name_text;
      }
    }
    await expect(auditHistoryReviewBodyPage.page_heading).toHaveText(
      auditHistoryReviewBodyPage.auditHistoryReviewBodyPageTestData.Review_Body_Audit_History_Page.page_heading +
        organisationName
    );
    const eventDescriptionExpectedValue = organisationName + datasetAudit.event_description_text;
    const timeValues: any = auditLog.get('timeValues');
    const eventValues: any = auditLog.get('eventValues');
    const adminEmailValues: any = auditLog.get('adminEmailValues');
    expect(timeValues[rowIndex]).toBe(timeExpected);
    expect(eventValues[rowIndex]).toBe(eventDescriptionExpectedValue);
    expect(adminEmailValues[rowIndex]).toBe(
      auditHistoryReviewBodyPage.auditHistoryReviewBodyPageTestData.Review_Body_Audit_History_Page
        .system_admin_email_text
    );
  }
);

Then('I can see the audit history page heading', async ({ auditHistoryReviewBodyPage, reviewBodyProfilePage }) => {
  const organisationName = await reviewBodyProfilePage.getOrgName();
  await expect(auditHistoryReviewBodyPage.page_heading).toHaveText(
    auditHistoryReviewBodyPage.auditHistoryReviewBodyPageTestData.Review_Body_Audit_History_Page.page_heading +
      organisationName
  );
});

Then(
  'I can see the audit history for {string} edited event with {string}',
  async (
    { auditHistoryReviewBodyPage, reviewBodyProfilePage, commonItemsPage },
    fieldName: string,
    datasetName: string
  ) => {
    const dataset =
      auditHistoryReviewBodyPage.auditHistoryReviewBodyPageTestData.Review_Body_Audit_History_Page[datasetName];
    const auditLog = await commonItemsPage.getAuditLog();
    const timeExpected = await auditHistoryReviewBodyPage.getUpdatedTime();
    const rowIndex = Number.parseInt(
      auditHistoryReviewBodyPage.auditHistoryReviewBodyPageTestData.Review_Body_Audit_History_Page.first_row_index,
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
      const eventDescriptionExpectedValue = await auditHistoryReviewBodyPage.getAuditEventDescriptionValue(
        dataset.event_description_text,
        valuePrevious,
        valueCurrent
      );
      const timeValues: any = auditLog.get('timeValues');
      const eventValues: any = auditLog.get('eventValues');
      const adminEmailValues: any = auditLog.get('adminEmailValues');
      expect(timeValues[rowIndex]).toBe(timeExpected);
      expect(eventValues[rowIndex]).toBe(eventDescriptionExpectedValue);
      expect(adminEmailValues[rowIndex]).toBe(
        auditHistoryReviewBodyPage.auditHistoryReviewBodyPageTestData.Review_Body_Audit_History_Page
          .system_admin_email_text
      );
    }
  }
);

Then(
  'I can see the audit history for all the fields edited event with {string}',
  async ({ auditHistoryReviewBodyPage, reviewBodyProfilePage, commonItemsPage }, datasetName: string) => {
    // defect: when the previous description was empty
    const dataset =
      auditHistoryReviewBodyPage.auditHistoryReviewBodyPageTestData.Review_Body_Audit_History_Page[datasetName];
    const auditLog = await commonItemsPage.getAuditLog();
    const timeExpected = await auditHistoryReviewBodyPage.getUpdatedTime();
    const orgNameEventDescriptionExpectedValue = await auditHistoryReviewBodyPage.getAuditEventDescriptionValue(
      dataset.organisation_name_event_description_text,
      await reviewBodyProfilePage.getOrgName(),
      await reviewBodyProfilePage.getNewOrgName()
    );
    const emailEventDescriptionExpectedValue = await auditHistoryReviewBodyPage.getAuditEventDescriptionValue(
      dataset.email_address_event_description_text,
      await reviewBodyProfilePage.getEmail(),
      await reviewBodyProfilePage.getNewEmail()
    );
    const descriptionEventDescriptionExpectedValue = await auditHistoryReviewBodyPage.getAuditEventDescriptionValue(
      dataset.description_event_description_text,
      await reviewBodyProfilePage.getDescription(),
      await reviewBodyProfilePage.getNewDescription()
    );
    const countryEventDescriptionExpectedValue = await auditHistoryReviewBodyPage.getAuditEventDescriptionValue(
      dataset.country_event_description_text,
      (await reviewBodyProfilePage.getCountries()).join(', '),
      (await reviewBodyProfilePage.getNewCountries()).join(', ')
    );
    const organisationIndex = Number.parseInt(dataset.organisation_index, 10);
    const emailIndex = Number.parseInt(dataset.email_index, 10);
    const descriptionIndex = Number.parseInt(dataset.description_index, 10);
    const countryIndex = Number.parseInt(dataset.country_index, 10);
    const timeValues: any = auditLog.get('timeValues');
    const eventValues: any = auditLog.get('eventValues');
    const adminEmailValues: any = auditLog.get('adminEmailValues');
    expect(timeValues[organisationIndex]).toBe(timeExpected);
    expect(eventValues[organisationIndex]).toBe(orgNameEventDescriptionExpectedValue);
    expect(adminEmailValues[organisationIndex]).toBe(
      auditHistoryReviewBodyPage.auditHistoryReviewBodyPageTestData.Review_Body_Audit_History_Page
        .system_admin_email_text
    );
    expect(timeValues[emailIndex]).toBe(timeExpected);
    expect(eventValues[emailIndex]).toBe(emailEventDescriptionExpectedValue);
    expect(adminEmailValues[emailIndex]).toBe(
      auditHistoryReviewBodyPage.auditHistoryReviewBodyPageTestData.Review_Body_Audit_History_Page
        .system_admin_email_text
    );
    expect(timeValues[descriptionIndex]).toBe(timeExpected);
    const description = await reviewBodyProfilePage.getDescription();
    if (description) {
      expect(eventValues[descriptionIndex]).toBe(descriptionEventDescriptionExpectedValue);
    } else {
      const descriptionEventDescriptionExpectedValue =
        dataset.description_event_description_text +
        '(null)' +
        ' to ' +
        (await reviewBodyProfilePage.getNewDescription());
      expect(eventValues[descriptionIndex]).toBe(descriptionEventDescriptionExpectedValue);
    }
    expect(adminEmailValues[descriptionIndex]).toBe(
      auditHistoryReviewBodyPage.auditHistoryReviewBodyPageTestData.Review_Body_Audit_History_Page
        .system_admin_email_text
    );
    if (
      (await reviewBodyProfilePage.getCountries()).join(', ') !==
      (await reviewBodyProfilePage.getNewCountries()).join(', ')
    ) {
      expect(timeValues[countryIndex]).toBe(timeExpected);
      expect(eventValues[countryIndex]).toBe(countryEventDescriptionExpectedValue);
      expect(adminEmailValues[countryIndex]).toBe(
        auditHistoryReviewBodyPage.auditHistoryReviewBodyPageTestData.Review_Body_Audit_History_Page
          .system_admin_email_text
      );
    }
  }
);
