import { createBdd } from 'playwright-bdd';
import { expect, test } from '../../../../../hooks/CustomFixtures';
import { confirmArrayNotNull } from '../../../../../utils/UtilFunctions';
import * as fse from 'fs-extra';
import path from 'path';
const pathToTestDataJson =
  './src/resources/test_data/iras/reviewResearch/userAdministration/manageUsers/create_user_profile_page_data.json';

const { Then } = createBdd(test);

Then('I can see the audit history page of the user profile', async ({ auditHistoryUserPage }) => {
  await auditHistoryUserPage.assertOnAuditHistoryUserPage();
});

Then(
  'I can see the audit history page of the selected {string} user',
  async ({ auditHistoryUserPage, createUserProfilePage }, datasetName: string) => {
    const dataset = createUserProfilePage.createUserProfilePageTestData.Create_User_Profile[datasetName];
    await auditHistoryUserPage.assertOnAuditHistoryUserPage();
    const headingPrefix = auditHistoryUserPage.auditHistoryUserPageTestData.Audit_History_User_Page.page_heading;
    const firstName = dataset.first_name_text;
    const lastName = dataset.last_name_text;
    await expect(auditHistoryUserPage.page_heading).toHaveText(`${headingPrefix} ${firstName} ${lastName}`);
  }
);

Then(
  'I can see the audit history for the newly created {string}',
  async ({ auditHistoryUserPage, createUserProfilePage, auditHistoryReviewBodyPage }, datasetName: string) => {
    const datasetCreateUser = createUserProfilePage.createUserProfilePageTestData.Create_User_Profile[datasetName];
    const datasetAudit = auditHistoryUserPage.auditHistoryUserPageTestData.Audit_History_User_Page;
    const auditLog = await auditHistoryReviewBodyPage.getAuditLog();
    const timeExpected = await auditHistoryUserPage.getUpdatedTime();
    const rolesInExpectedOrder = datasetCreateUser.role_checkbox.reverse();
    const filePath = path.resolve(pathToTestDataJson);
    const data = await fse.readJson(filePath);
    const userEmail = data.Create_User_Profile.email_address_unique;
    const createdEventDescriptionExpectedValue = userEmail + datasetAudit.Create_User.event_description_text;
    const timeValues = confirmArrayNotNull(auditLog.get('timeValues'));
    const eventValues = confirmArrayNotNull(auditLog.get('eventValues'));
    const adminEmailValues = confirmArrayNotNull(auditLog.get('adminEmailValues'));

    for (let index = 0; index < timeValues.length; index++) {
      let eventDescriptionExpectedValue: string;
      if (timeValues.length - index == 1) {
        eventDescriptionExpectedValue = createdEventDescriptionExpectedValue;
      } else {
        eventDescriptionExpectedValue =
          userEmail +
          datasetAudit.Assign_User.event_description_prefix_text +
          rolesInExpectedOrder[index].toUpperCase() +
          datasetAudit.Assign_User.event_description_suffix_text;
      }
      expect(timeValues[index]).toBe(timeExpected);
      expect(eventValues[index]).toBe(eventDescriptionExpectedValue);
      expect(adminEmailValues[index]).toBe(datasetAudit.system_admin_email_text);
    }
  }
);

// Then('I can see the audit history page heading', async ({ auditHistoryReviewBodyPage, reviewBodyProfilePage }) => {
//   const organisationName = await reviewBodyProfilePage.getOrgName();
//   await expect(auditHistoryReviewBodyPage.page_heading).toHaveText(
//     auditHistoryReviewBodyPage.auditHistoryReviewBodyPageTestData.Review_Body_Audit_History_Page.page_heading +
//       organisationName
//   );
// });

Then(
  'I can see the users audit history with the {string} event as the most recent entry',
  async ({ auditHistoryUserPage, auditHistoryReviewBodyPage, userProfilePage }, datasetName: string) => {
    const dataset = auditHistoryUserPage.auditHistoryUserPageTestData.Audit_History_User_Page[datasetName];
    const auditLog = await auditHistoryReviewBodyPage.getAuditLog();
    const timeExpected = await auditHistoryUserPage.getUpdatedTime();
    const adminEmailExpected =
      auditHistoryUserPage.auditHistoryUserPageTestData.Audit_History_User_Page.system_admin_email_text;
    let valuePrevious: string = '';
    let valueCurrent: string = '';
    let eventDescriptionExpectedValue: string;
    if (datasetName == 'Edit_User_Title') {
      valuePrevious = await userProfilePage.getTitle();
      valueCurrent = await userProfilePage.getNewTitle();
    } //else if (fieldName == 'Country') {
    //   valuePrevious = (await reviewBodyProfilePage.getCountries()).join(', ');
    //   valueCurrent = (await reviewBodyProfilePage.getNewCountries()).join(', ');
    // } else if (fieldName == 'Email_Address') {
    //   valuePrevious = await reviewBodyProfilePage.getEmail();
    //   valueCurrent = await reviewBodyProfilePage.getNewEmail();
    // } else if (fieldName == 'Description') {
    //   valuePrevious = await reviewBodyProfilePage.getDescription();
    //   valueCurrent = await reviewBodyProfilePage.getNewDescription();
    // }
    if (datasetName == 'Disable_User' || datasetName == 'Enable_User') {
      const userEmail = await userProfilePage.getEmail();
      eventDescriptionExpectedValue = userEmail + dataset.event_description_text;
    } else {
      eventDescriptionExpectedValue = await auditHistoryUserPage.getUserAuditEventDescriptionValue(
        dataset.event_description_text,
        valuePrevious,
        valueCurrent
      );
    }
    console.log(eventDescriptionExpectedValue);
    await userProfilePage.page.pause();
    const timeValues: any = auditLog.get('timeValues');
    const eventValues: any = auditLog.get('eventValues');
    const adminEmailValues: any = auditLog.get('adminEmailValues');
    expect(timeValues[0]).toBe(timeExpected);
    expect(eventValues[0]).toBe(eventDescriptionExpectedValue);
    expect(adminEmailValues[0]).toBe(adminEmailExpected);
  }
);

// Then(
//   'I can see the audit history for all the fields edited event with {string}',
//   async ({ auditHistoryReviewBodyPage, reviewBodyProfilePage }, datasetName: string) => {
//     // defect: when the previous description was empty
//     const dataset =
//       auditHistoryReviewBodyPage.auditHistoryReviewBodyPageTestData.Review_Body_Audit_History_Page[datasetName];
//     const auditLog = await auditHistoryReviewBodyPage.getAuditLog();
//     const timeExpected = await auditHistoryReviewBodyPage.getUpdatedTime();
//     const orgNameEventDescriptionExpectedValue = await auditHistoryReviewBodyPage.getEventDescriptionValue(
//       dataset.organisation_name_event_description_text,
//       await reviewBodyProfilePage.getOrgName(),
//       await reviewBodyProfilePage.getNewOrgName()
//     );
//     const emailEventDescriptionExpectedValue = await auditHistoryReviewBodyPage.getEventDescriptionValue(
//       dataset.email_address_event_description_text,
//       await reviewBodyProfilePage.getEmail(),
//       await reviewBodyProfilePage.getNewEmail()
//     );
//     const descriptionEventDescriptionExpectedValue = await auditHistoryReviewBodyPage.getEventDescriptionValue(
//       dataset.description_event_description_text,
//       await reviewBodyProfilePage.getDescription(),
//       await reviewBodyProfilePage.getNewDescription()
//     );
//     const countryEventDescriptionExpectedValue = await auditHistoryReviewBodyPage.getEventDescriptionValue(
//       dataset.country_event_description_text,
//       (await reviewBodyProfilePage.getCountries()).join(', '),
//       (await reviewBodyProfilePage.getNewCountries()).join(', ')
//     );
//     const organisationIndex = parseInt(dataset.organisation_index, 10);
//     const emailIndex = parseInt(dataset.email_index, 10);
//     const descriptionIndex = parseInt(dataset.description_index, 10);
//     const countryIndex = parseInt(dataset.country_index, 10);
//     const timeValues: any = auditLog.get('timeValues');
//     const eventValues: any = auditLog.get('eventValues');
//     const adminEmailValues: any = auditLog.get('adminEmailValues');
//     expect(timeValues[organisationIndex]).toBe(timeExpected);
//     expect(eventValues[organisationIndex]).toBe(orgNameEventDescriptionExpectedValue);
//     expect(adminEmailValues[organisationIndex]).toBe(
//       auditHistoryReviewBodyPage.auditHistoryReviewBodyPageTestData.Review_Body_Audit_History_Page
//         .system_admin_email_text
//     );
//     expect(timeValues[emailIndex]).toBe(timeExpected);
//     expect(eventValues[emailIndex]).toBe(emailEventDescriptionExpectedValue);
//     expect(adminEmailValues[emailIndex]).toBe(
//       auditHistoryReviewBodyPage.auditHistoryReviewBodyPageTestData.Review_Body_Audit_History_Page
//         .system_admin_email_text
//     );
//     expect(timeValues[descriptionIndex]).toBe(timeExpected);
//     if ((await reviewBodyProfilePage.getDescription()) !== '') {
//       expect(eventValues[descriptionIndex]).toBe(descriptionEventDescriptionExpectedValue);
//     } else {
//       const descriptionEventDescriptionExpectedValue =
//         dataset.description_event_description_text +
//         '(null)' +
//         ' to ' +
//         (await reviewBodyProfilePage.getNewDescription());
//       expect(eventValues[descriptionIndex]).toBe(descriptionEventDescriptionExpectedValue);
//     }
//     expect(adminEmailValues[descriptionIndex]).toBe(
//       auditHistoryReviewBodyPage.auditHistoryReviewBodyPageTestData.Review_Body_Audit_History_Page
//         .system_admin_email_text
//     );
//     if (
//       (await reviewBodyProfilePage.getCountries()).join(', ') !==
//       (await reviewBodyProfilePage.getNewCountries()).join(', ')
//     ) {
//       expect(timeValues[countryIndex]).toBe(timeExpected);
//       expect(eventValues[countryIndex]).toBe(countryEventDescriptionExpectedValue);
//       expect(adminEmailValues[countryIndex]).toBe(
//         auditHistoryReviewBodyPage.auditHistoryReviewBodyPageTestData.Review_Body_Audit_History_Page
//           .system_admin_email_text
//       );
//     }
//   }
// );

// Then(
//   'I can see the default sort should be the most recent entry first based on date and time',
//   async ({ auditHistoryReviewBodyPage }) => {
//     const auditLog = await auditHistoryReviewBodyPage.getAuditLog();
//     const timeValues: any = auditLog.get('timeValues');
//     const timeDates = timeValues.map((time: any) => new Date(time));
//     const isSortedDesc = timeDates.every((time: number, i: number, arr: number[]) => {
//       if (i === 0) {
//         return true;
//       } else {
//         return arr[i - 1] >= time;
//       }
//     });
//     expect(isSortedDesc).toBe(true);
//   }
// );
