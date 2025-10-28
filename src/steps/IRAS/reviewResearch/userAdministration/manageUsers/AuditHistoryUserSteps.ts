import { createBdd } from 'playwright-bdd';
import { expect, test } from '../../../../../hooks/CustomFixtures';
import {
  confirmArrayNotNull,
  confirmStringNotNull,
  getAuthState,
  returnDataFromJSON,
} from '../../../../../utils/UtilFunctions';
import * as fs from 'node:fs';

const { Given, When, Then } = createBdd(test);

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
  async ({ auditHistoryUserPage, createUserProfilePage, commonItemsPage }, datasetName: string) => {
    const datasetCreateUser = createUserProfilePage.createUserProfilePageTestData.Create_User_Profile[datasetName];
    const datasetAudit = auditHistoryUserPage.auditHistoryUserPageTestData.Audit_History_User_Page;
    const auditLog = await commonItemsPage.getAuditLog();
    const timeExpected = await auditHistoryUserPage.getUpdatedTime();
    const rolesInExpectedOrder: string[] = datasetCreateUser.role_checkbox.slice().reverse();
    const userEmail = await returnDataFromJSON().then((data) => {
      return data.Create_User_Profile.email_address_unique;
    });
    const createdEventDescriptionExpectedValue = userEmail + datasetAudit.Create_User.event_description_text;
    const timeValues = confirmArrayNotNull(auditLog.get('timeValues'));

    for (let index = 0; index < timeValues.length; index++) {
      let eventDescriptionExpectedValue: string;
      if (timeValues.length - index == 1) {
        eventDescriptionExpectedValue = createdEventDescriptionExpectedValue;
      } else {
        eventDescriptionExpectedValue =
          userEmail +
          datasetAudit.Assign_User.event_description_prefix_text +
          rolesInExpectedOrder[index].toLowerCase() +
          datasetAudit.Assign_User.event_description_suffix_text;
      }
      expect(timeValues[index]).toBe(timeExpected);
      expect(confirmArrayNotNull(auditLog.get('eventValues'))[index]).toBe(eventDescriptionExpectedValue);
      expect(confirmArrayNotNull(auditLog.get('adminEmailValues'))[index]).toBe(datasetAudit.system_admin_email_text);
    }
  }
);

Then(
  'I can see the users audit history with the expected events displayed',
  async ({ auditHistoryUserPage, userProfilePage, commonItemsPage }) => {
    const auditLog = await commonItemsPage.getAuditLog();
    const expectedAuditLog = await auditHistoryUserPage.sqlGetUserAuditHistoryById(await userProfilePage.getUserId());
    await auditHistoryUserPage.page.pause();
    expect(auditLog).toEqual(expectedAuditLog);
  }
);

Then(
  'I can see the users audit history with the {string} event as the most recent entry',
  async ({ auditHistoryUserPage, commonItemsPage, userProfilePage }, datasetName: string) => {
    const dataset = auditHistoryUserPage.auditHistoryUserPageTestData.Audit_History_User_Page[datasetName];
    const auditLog = await commonItemsPage.getAuditLog();
    const timeExpected = await auditHistoryUserPage.getUpdatedTime();
    const adminEmailExpected =
      auditHistoryUserPage.auditHistoryUserPageTestData.Audit_History_User_Page.system_admin_email_text;
    let methodType: string = '';
    let eventDescriptionExpectedValue: string;
    if (datasetName == 'Edit_User_Title') {
      methodType = 'Title';
    } else if (datasetName == 'Edit_User_First_Name') {
      methodType = 'FirstName';
    } else if (datasetName == 'Edit_User_Last_Name') {
      methodType = 'LastName';
    } else if (datasetName == 'Edit_User_Email') {
      methodType = 'Email';
    } else if (datasetName == 'Edit_User_Telephone') {
      methodType = 'Telephone';
    } else if (datasetName == 'Edit_User_Organisation') {
      methodType = 'Organisation';
    } else if (datasetName == 'Edit_User_Job_Title') {
      methodType = 'JobTitle';
    } else if (datasetName == 'Edit_User_Country') {
      methodType = 'Countries';
    }
    if (datasetName == 'Disable_User' || datasetName == 'Enable_User') {
      const userEmail = await userProfilePage.getEmail();
      eventDescriptionExpectedValue = userEmail + dataset.event_description_text;
    } else if (datasetName == 'Edit_User_Country') {
      //defect - should be ', ', change after fix is in
      eventDescriptionExpectedValue = await auditHistoryUserPage.getUserAuditEventDescriptionValue(
        dataset.event_description_text,
        (await userProfilePage[`get${methodType}`]()).join(', '),
        (await userProfilePage[`getNew${methodType}`]()).join(', ')
      );
    } else {
      eventDescriptionExpectedValue = await auditHistoryUserPage.getUserAuditEventDescriptionValue(
        dataset.event_description_text,
        await userProfilePage[`get${methodType}`](),
        await userProfilePage[`getNew${methodType}`]()
      );
    }
    expect(confirmArrayNotNull(auditLog.get('timeValues'))[0]).toBe(timeExpected);
    expect(confirmArrayNotNull(auditLog.get('eventValues'))[0]).toBe(eventDescriptionExpectedValue);
    expect(confirmArrayNotNull(auditLog.get('adminEmailValues'))[0]).toBe(adminEmailExpected);
  }
);

When(
  'I can see the {string} user has had their roles unassigned in the audit history',
  async ({ auditHistoryUserPage, createUserProfilePage, commonItemsPage }, datasetName: string) => {
    const datasetUser = createUserProfilePage.createUserProfilePageTestData.Create_User_Profile[datasetName];
    const datasetAuditEvent = auditHistoryUserPage.auditHistoryUserPageTestData.Audit_History_User_Page;
    const actualAuditLog = await commonItemsPage.getAuditLog();
    const timeExpected = await auditHistoryUserPage.getUpdatedTime();
    const expectedOrderedRoles: string[] = datasetUser.role_checkbox.slice().reverse();
    const usersEmail = await returnDataFromJSON().then((data) => {
      return data.Create_User_Profile.email_address_unique;
    });

    for (let index = 0; index < expectedOrderedRoles.length; index++) {
      const eventDescriptionExpectedValue =
        usersEmail +
        datasetAuditEvent.Unassign_User.event_description_prefix_text +
        expectedOrderedRoles[index] +
        datasetAuditEvent.Unassign_User.event_description_suffix_text;
      expect(confirmArrayNotNull(actualAuditLog.get('timeValues'))[index]).toBe(timeExpected);
      expect.soft(confirmArrayNotNull(actualAuditLog.get('eventValues'))[index]).toBe(eventDescriptionExpectedValue);
      expect(confirmArrayNotNull(actualAuditLog.get('adminEmailValues'))[index]).toBe(
        datasetAuditEvent.system_admin_email_text
      );
    }
  }
);

Given(
  'I have navigated to the audit history page for the {string} user as {string}',
  async ({ auditHistoryUserPage, createUserProfilePage, userProfilePage }, profile: string, user: string) => {
    const authStatePath = getAuthState(user);
    const authState = JSON.parse(fs.readFileSync(authStatePath, 'utf-8'));
    let userEmail: string;
    if (profile.toLowerCase() == 'newly created') {
      userEmail = confirmStringNotNull(await createUserProfilePage.getUniqueEmail());
    } else {
      userEmail = auditHistoryUserPage.auditHistoryUserPageTestData.User_Profiles[profile].email_address;
    }
    await userProfilePage.sqlGetUserProfileByEmail(userEmail);
    const userProfileId = await userProfilePage.getUserId();
    await auditHistoryUserPage.page.context().addCookies(authState.cookies);
    await auditHistoryUserPage.goto(userEmail, userProfileId);
    await auditHistoryUserPage.assertOnAuditHistoryUserPage();
  }
);
