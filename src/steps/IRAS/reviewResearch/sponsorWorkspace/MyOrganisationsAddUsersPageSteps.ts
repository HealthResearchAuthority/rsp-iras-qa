import { createBdd } from 'playwright-bdd';
import { expect, test } from '../../../../hooks/CustomFixtures';
import { generateUniqueEmail } from '../../../../utils/UtilFunctions';
const { Then, When } = createBdd(test);

Then(
  'I navigate to the add user page for the selected sponsor organisation {string}',
  async ({ mySponsorOrgAddUserPage }, sponsorOrg: string) => {
    await mySponsorOrgAddUserPage.assertOnMySponsorOrgAddUsersPage(sponsorOrg);
  }
);

When(
  'I fill the add user page using {string}',
  async ({ mySponsorOrgAddUserPage, createUserProfilePage, loginPage, commonItemsPage }, datasetName: string) => {
    let valueToFill: string | undefined;
    const prefix = createUserProfilePage.createUserProfilePageTestData.Create_User_Profile.email_address_prefix;
    const dataset =
      await mySponsorOrgAddUserPage.mySponsorOrgAddUserPageTestData.My_Organisations_Add_User_Page[datasetName];
    for (const key in dataset) {
      if (Object.hasOwn(dataset, key)) {
        const locator = mySponsorOrgAddUserPage[key];
        if (datasetName === 'Non_Registered_User') {
          const uniqueEmail = await generateUniqueEmail(dataset[key], prefix);
          valueToFill = uniqueEmail;
        } else if (datasetName.startsWith('Invalid_Email_')) {
          valueToFill = await dataset[key];
        } else if (datasetName === 'Sponsor_Org_Admin_User') {
          valueToFill = loginPage.loginPageTestData.Sponsor_Org_Admin_User.username;
        } else if (datasetName === 'System_Admin') {
          valueToFill = loginPage.loginPageTestData.System_Admin.username;
        } else if (datasetName === 'Sponsor_User') {
          valueToFill = loginPage.loginPageTestData.Sponsor_User.username;
        }
        if (valueToFill) {
          await locator.fill(valueToFill);
        }
      }
    }
    if (datasetName === 'Name_Of_Disabled_User_In_The_System') {
      valueToFill = await commonItemsPage.getFirstUserEmail();
      if (valueToFill) {
        await mySponsorOrgAddUserPage['email_address_text'].fill(valueToFill);
      }
    }
  }
);

Then('I see a notification page stating {string}', async ({ mySponsorOrgAddUserPage }, errorMessage: string) => {
  await mySponsorOrgAddUserPage.assertOnNonRegisteredUserErrorPage(errorMessage);
});

Then(
  'I validate {string} displayed while entering an invalid or blank or existing user email of the selected sponsor organisation in {string} for the selected sponsor organisation {string}',
  async (
    { commonItemsPage, mySponsorOrgAddUserPage },
    errorMessageSummaryDatasetName: string,
    pageKey: string,
    sponsorOrg: string
  ) => {
    let errorMessageFieldDataset: any;
    if (pageKey === 'My_Organisations_Users_Add_User_Page') {
      if (
        errorMessageSummaryDatasetName.endsWith('Email_Address_Error') ||
        errorMessageSummaryDatasetName.endsWith('Disabled_User_Email_Error')
      ) {
        errorMessageFieldDataset =
          mySponsorOrgAddUserPage.mySponsorOrgAddUserPageTestData.My_Organisations_Add_User_Page.Error_Validation[
            errorMessageSummaryDatasetName
          ];
        await expect.soft(commonItemsPage.errorMessageSummaryLabel).toBeVisible();
        const allSummaryErrorExpectedValues = Object.values(errorMessageFieldDataset);
        const summaryErrorActualValues = await commonItemsPage.getSummaryErrorMessages();
        expect.soft(summaryErrorActualValues).toEqual(allSummaryErrorExpectedValues);
      } else if (errorMessageSummaryDatasetName.endsWith('User_Exists_Message')) {
        errorMessageFieldDataset =
          mySponsorOrgAddUserPage.mySponsorOrgAddUserPageTestData.My_Organisations_Add_User_Page.Error_Validation[
            errorMessageSummaryDatasetName
          ];
        const notification_content = errorMessageFieldDataset.user_exists_notification_text + sponsorOrg;
        await expect.soft(mySponsorOrgAddUserPage.banner).toBeVisible();
        await expect.soft(mySponsorOrgAddUserPage.banner_heading).toBeVisible();
        await expect(
          mySponsorOrgAddUserPage.banner.getByRole('heading', { level: 3, name: notification_content })
        ).toBeVisible();
      }
    }
  }
);

Then(
  'I record the {string} event for the user {string} to store the sponsor organisation audit history triggered by {string}',
  async (
    { loginPage, mySponsorOrgAddUserPage, commonItemsPage },
    eventDescriptionDatasetName,
    userDatasetName,
    targetUser
  ) => {
    const record = await mySponsorOrgAddUserPage.buildAuditHistoryRecord(
      loginPage,
      commonItemsPage,
      eventDescriptionDatasetName,
      userDatasetName,
      targetUser
    );

    mySponsorOrgAddUserPage.addAuditHistoryRecord = record;
  }
);

Then(
  'I record the {string} event for the user {string} to store the sponsor organisation audit history triggered by {string} for {string}',
  async (
    { loginPage, mySponsorOrgAddUserPage, commonItemsPage },
    eventDescriptionDatasetName,
    userDatasetName,
    targetUser,
    workspaceKey
  ) => {
    const record = await mySponsorOrgAddUserPage.buildAuditHistoryRecord(
      loginPage,
      commonItemsPage,
      eventDescriptionDatasetName,
      userDatasetName,
      targetUser,
      workspaceKey
    );

    mySponsorOrgAddUserPage.addAuditHistoryRecord = record;
  }
);

Then('I validate the audit history table for sponsor organisation', async ({ mySponsorOrgAddUserPage }) => {
  const pageUrl = mySponsorOrgAddUserPage.page.url();
  const expectedAuditHistoryURLPart =
    process.env.BASE_URL +
    mySponsorOrgAddUserPage.mySponsorOrgAddUserPageTestData.My_Organisations_Add_User_Page
      .manage_sponsor_org_audit_trial_partial_url;
  if (pageUrl.startsWith(expectedAuditHistoryURLPart)) {
    const auditHistoryTableHeaders = mySponsorOrgAddUserPage.auditHistoryTableHeader;
    const auditHistoryTableHeadersExpected =
      mySponsorOrgAddUserPage.mySponsorOrgAddUserPageTestData.My_Organisations_Add_User_Page
        .Audit_History_Headers_Manage_Sponsor;
    await expect.soft(auditHistoryTableHeaders).toHaveText(auditHistoryTableHeadersExpected);
  } else {
    const auditHistoryTableHeaders = mySponsorOrgAddUserPage.auditHistoryTableHeader;
    const auditHistoryTableHeadersExpected =
      mySponsorOrgAddUserPage.mySponsorOrgAddUserPageTestData.My_Organisations_Add_User_Page.Audit_History_Headers;
    expect.soft(auditHistoryTableHeaders).toHaveText(auditHistoryTableHeadersExpected);
  }
  const rowCount = await mySponsorOrgAddUserPage.auditHistoryTableBodyRows.count();
  let actualAuditHistoryRows: string[][] = [];
  for (let auditRowIndex = 0; auditRowIndex < rowCount; auditRowIndex++) {
    const row = mySponsorOrgAddUserPage.auditHistoryTableBodyRows.nth(auditRowIndex);
    const cellTexts = await row.locator(mySponsorOrgAddUserPage.tableCell).allTextContents();
    actualAuditHistoryRows.push(cellTexts.map((text) => text.trim()));
  }
  const expectedAuditHistoryRows = mySponsorOrgAddUserPage.getAuditHistoryRecord
    .slice()
    .reverse()
    .map((record) => [
      record.dateTimeOfEventExpected,
      record.sponsorOrgEventDescriptionExpected,
      record.userEmailExpected,
    ]);
  actualAuditHistoryRows = actualAuditHistoryRows.filter((row) => row.length > 0);
  expect.soft(actualAuditHistoryRows).toEqual(expectedAuditHistoryRows);
});
