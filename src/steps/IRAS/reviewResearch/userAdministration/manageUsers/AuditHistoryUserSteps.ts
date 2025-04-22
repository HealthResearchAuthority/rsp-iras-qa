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
  'I can see the audit history for the newly created {string} user with roles assigned',
  async ({ auditHistoryUserPage, createUserProfilePage, auditHistoryReviewBodyPage }, datasetName: string) => {
    const datasetCreateUser = createUserProfilePage.createUserProfilePageTestData.Create_User_Profile[datasetName];
    const datasetAudit = auditHistoryUserPage.auditHistoryUserPageTestData.Audit_History_User_Page;
    const auditLog = await auditHistoryReviewBodyPage.getAuditLog();
    const timeExpected = await auditHistoryUserPage.getUpdatedTime();
    const rolesInExpectedOrder: string[] = datasetCreateUser.role_checkbox.slice().reverse();
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
    } else if (datasetName == 'Edit_User_First_Name') {
      valuePrevious = await userProfilePage.getFirstName();
      valueCurrent = await userProfilePage.getNewFirstName();
    } else if (datasetName == 'Edit_User_Last_Name') {
      valuePrevious = await userProfilePage.getLastName();
      valueCurrent = await userProfilePage.getNewLastName();
    } else if (datasetName == 'Edit_User_Email') {
      valuePrevious = await userProfilePage.getEmail();
      valueCurrent = await userProfilePage.getNewEmail();
    } else if (datasetName == 'Edit_User_Telephone') {
      valuePrevious = await userProfilePage.getTelephone();
      valueCurrent = await userProfilePage.getNewTelephone();
    } else if (datasetName == 'Edit_User_Organisation') {
      valuePrevious = await userProfilePage.getOrganisation();
      valueCurrent = await userProfilePage.getNewOrganisation();
    } else if (datasetName == 'Edit_User_Job_Title') {
      valuePrevious = await userProfilePage.getJobTitle();
      valueCurrent = await userProfilePage.getNewJobTitle();
    } else if (datasetName == 'Edit_User_Country') {
      //defect - should be ', ', change after fix is in
      valuePrevious = (await userProfilePage.getCountries()).join(',');
      valueCurrent = (await userProfilePage.getNewCountries()).join(',');
    }
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
    const timeValues: any = auditLog.get('timeValues');
    const eventValues: any = auditLog.get('eventValues');
    const adminEmailValues: any = auditLog.get('adminEmailValues');
    expect(timeValues[0]).toBe(timeExpected);
    expect(eventValues[0]).toBe(eventDescriptionExpectedValue);
    expect(adminEmailValues[0]).toBe(adminEmailExpected);
  }
);

Then(
  'I can see the {string} user has had their roles unassigned in the audit history',
  async ({ auditHistoryUserPage, createUserProfilePage, auditHistoryReviewBodyPage }, datasetName: string) => {
    const datasetCreateUser = createUserProfilePage.createUserProfilePageTestData.Create_User_Profile[datasetName];
    const datasetAudit = auditHistoryUserPage.auditHistoryUserPageTestData.Audit_History_User_Page;
    const auditLog = await auditHistoryReviewBodyPage.getAuditLog();
    const timeExpected = await auditHistoryUserPage.getUpdatedTime();
    const rolesInExpectedOrder: string[] = datasetCreateUser.role_checkbox.slice().reverse();
    const filePath = path.resolve(pathToTestDataJson);
    const data = await fse.readJson(filePath);
    const userEmail = data.Create_User_Profile.email_address_unique;
    const timeValues = confirmArrayNotNull(auditLog.get('timeValues'));
    const eventValues = confirmArrayNotNull(auditLog.get('eventValues'));
    const adminEmailValues = confirmArrayNotNull(auditLog.get('adminEmailValues'));

    for (let index = 0; index < rolesInExpectedOrder.length; index++) {
      const eventDescriptionExpectedValue =
        userEmail +
        datasetAudit.Unassign_User.event_description_prefix_text +
        rolesInExpectedOrder[index].toUpperCase() +
        datasetAudit.Unassign_User.event_description_suffix_text;
      expect(timeValues[index]).toBe(timeExpected);
      expect(eventValues[index]).toBe(eventDescriptionExpectedValue);
      expect(adminEmailValues[index]).toBe(datasetAudit.system_admin_email_text);
    }
  }
);
