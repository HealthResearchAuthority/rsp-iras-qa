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
    expect(auditLog[0][0]).toBe(timeExpected);
    expect(auditLog[1][0]).toBe(eventDescriptionExpectedValue);
    expect(auditLog[2][0]).toBe(datasetAudit.system_admin_email_text);
  }
);

Then('I capture the current time', async ({ auditHistoryReviewBodyPage }) => {
  const currentTime = await getCurrentTimeFormatted();
  await auditHistoryReviewBodyPage.setUpdatedTime(currentTime);
});

Then(
  'I can see the audit history for {string} edited event with {string}',
  async ({ auditHistoryReviewBodyPage, reviewBodyProfilePage }, fieldName: string, datasetName: string) => {
    const dataset =
      auditHistoryReviewBodyPage.auditHistoryReviewBodyPageTestData.Review_Body_Audit_History_Page[datasetName];
    const auditLog = await auditHistoryReviewBodyPage.getAuditLog();
    const timeExpected = await auditHistoryReviewBodyPage.getUpdatedTime();
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
      const organisationName = await reviewBodyProfilePage.getOrgName();
      await expect(auditHistoryReviewBodyPage.page_heading).toHaveText(
        auditHistoryReviewBodyPage.auditHistoryReviewBodyPageTestData.Review_Body_Audit_History_Page.page_heading +
          organisationName
      );
    } else if (fieldName == 'Email_Address') {
      valuePrevious = await reviewBodyProfilePage.getEmail();
      valueCurrent = await reviewBodyProfilePage.getNewEmail();
      const organisationName = await reviewBodyProfilePage.getOrgName();
      await expect(auditHistoryReviewBodyPage.page_heading).toHaveText(
        auditHistoryReviewBodyPage.auditHistoryReviewBodyPageTestData.Review_Body_Audit_History_Page.page_heading +
          organisationName
      );
    } else if (fieldName == 'Description') {
      valuePrevious = await reviewBodyProfilePage.getDescription();
      valueCurrent = await reviewBodyProfilePage.getNewDescription();
      const organisationName = await reviewBodyProfilePage.getOrgName();
      await expect(auditHistoryReviewBodyPage.page_heading).toHaveText(
        auditHistoryReviewBodyPage.auditHistoryReviewBodyPageTestData.Review_Body_Audit_History_Page.page_heading +
          organisationName
      );
    }
    const eventDescriptionPart1 = dataset.event_description_text;
    const eventDescriptionPart2 = valuePrevious;
    const eventDescriptionPart3 = ' to ' + valueCurrent;
    const eventDescriptionExpectedValue = eventDescriptionPart1 + eventDescriptionPart2 + eventDescriptionPart3;
    expect(auditLog[0][0]).toBe(timeExpected);
    expect(auditLog[1][0]).toBe(eventDescriptionExpectedValue);
    expect(auditLog[2][0]).toBe(dataset.system_admin_email_text);
  }
);

Then(
  'I can see the audit history for all the fields edited event with {string}',
  async ({ auditHistoryReviewBodyPage, reviewBodyProfilePage }, datasetName: string) => {
    const dataset =
      auditHistoryReviewBodyPage.auditHistoryReviewBodyPageTestData.Review_Body_Audit_History_Page[datasetName];
    const auditLog = await auditHistoryReviewBodyPage.getAuditLog();
    const timeExpected = await auditHistoryReviewBodyPage.getUpdatedTime();
    const descriptionPrevious = await reviewBodyProfilePage.getDescription();
    const descriptionCurrent = await reviewBodyProfilePage.getNewDescription();
    const descriptionEventDescriptionPart1 = dataset.description_event_description_text;
    const descriptionEventDescriptionPart2 = descriptionPrevious;
    const descriptionEventDescriptionPart3 = ' to ' + descriptionCurrent;
    const descriptionEventDescriptionExpectedValue =
      descriptionEventDescriptionPart1 + descriptionEventDescriptionPart2 + descriptionEventDescriptionPart3;
    const emailPrevious = await reviewBodyProfilePage.getEmail();
    const emailCurrent = await reviewBodyProfilePage.getNewEmail();
    const emailEventDescriptionPart1 = dataset.email_address_event_description_text;
    const emailEventDescriptionPart2 = emailPrevious;
    const emailEventDescriptionPart3 = ' to ' + emailCurrent;
    const emailEventDescriptionExpectedValue =
      emailEventDescriptionPart1 + emailEventDescriptionPart2 + emailEventDescriptionPart3;
    const countryNamesPrevious: string = (await reviewBodyProfilePage.getCountries()).join(',');
    const countryNamesCurrent = (await reviewBodyProfilePage.getNewCountries()).join(',');
    const CountryEventDescriptionPart1 = dataset.country_event_description_text;
    const countryEventDescriptionPart2 = countryNamesPrevious;
    const countryEventDescriptionPart3 = ' to ' + countryNamesCurrent;
    const countryEventDescriptionExpectedValue =
      CountryEventDescriptionPart1 + countryEventDescriptionPart2 + countryEventDescriptionPart3;
    const organisationNamePrevious = await reviewBodyProfilePage.getOrgName();
    const organisationNameCurrent = await reviewBodyProfilePage.getNewOrgName();
    const orgNameEventDescriptionPart1 = dataset.organisation_name_event_description_text;
    const orgNameEventDescriptionPart2 = organisationNamePrevious;
    const orgNameEventDescriptionPart3 = ' to ' + organisationNameCurrent;
    const orgNameEventDescriptionExpectedValue =
      orgNameEventDescriptionPart1 + orgNameEventDescriptionPart2 + orgNameEventDescriptionPart3;
    await expect(auditHistoryReviewBodyPage.page_heading).toHaveText(
      auditHistoryReviewBodyPage.auditHistoryReviewBodyPageTestData.Review_Body_Audit_History_Page.page_heading +
        organisationNameCurrent
    );
    expect(auditLog[0][0]).toBe(timeExpected);
    expect(auditLog[1][0]).toBe(countryEventDescriptionExpectedValue);
    expect(auditLog[2][0]).toBe(dataset.system_admin_email_text);

    expect(auditLog[0][1]).toBe(timeExpected);
    //fail in this case when the previous description was empty
    // Description was changed from (null) to qaauto_Responsible for confirmation of research governance compliance Test Update all fields
    expect(auditLog[1][1]).toBe(descriptionEventDescriptionExpectedValue);
    expect(auditLog[2][1]).toBe(dataset.system_admin_email_text);

    expect(auditLog[0][2]).toBe(timeExpected);
    expect(auditLog[1][2]).toBe(emailEventDescriptionExpectedValue);
    expect(auditLog[2][2]).toBe(dataset.system_admin_email_text);

    expect(auditLog[0][3]).toBe(timeExpected);
    expect(auditLog[1][3]).toBe(orgNameEventDescriptionExpectedValue);
    expect(auditLog[2][3]).toBe(dataset.system_admin_email_text);
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
