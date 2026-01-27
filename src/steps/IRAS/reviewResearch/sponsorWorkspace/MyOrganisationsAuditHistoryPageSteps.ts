import { createBdd } from 'playwright-bdd';
import { expect, test } from '../../../../hooks/CustomFixtures';

const { Given, When, Then } = createBdd(test);

Given(
  'I can see the sponsor organisations audit history page from my organisations',
  async ({ myOrganisationsAuditHistoryPage }) => {
    await myOrganisationsAuditHistoryPage.assertOnMyOrgAuditHistory();
  }
);

When(
  'I can see the table column ui labels on my organisations audit history page',
  async ({ commonItemsPage, myOrganisationsAuditHistoryPage }) => {
    const dataset = myOrganisationsAuditHistoryPage.myOrganisationsAuditHistoryPageTestData.Table_Columns;
    for (const key in dataset) {
      if (Object.hasOwn(dataset, key)) {
        const labelVal = await commonItemsPage.getUiLabel(key, myOrganisationsAuditHistoryPage);
        expect.soft(labelVal).toBe(dataset[key]);
      }
    }
  }
);

Then(
  'I can see the events on my organisations audit history page are sorted by date with most recent at the top',
  async ({ myOrganisationsAuditHistoryPage, commonItemsPage }) => {
    const columnIndex = 0;
    const actualList = await commonItemsPage.getActualListValues(commonItemsPage.tableBodyRows, columnIndex);
    const sortedList = await myOrganisationsAuditHistoryPage.sortAuditDateListValues(actualList);
    expect.soft(actualList).toEqual(sortedList);
  }
);

Then(
  'I can see my organisations audit history with {string} by {string}',
  async (
    { myOrganisationsAuditHistoryPage, myOrgSponsorOrgProfilePage, commonItemsPage, loginPage },
    datasetName: string,
    adminUserDataset: string
  ) => {
    const datasetAudit = myOrganisationsAuditHistoryPage.myOrganisationsAuditHistoryPageTestData[datasetName];
    const auditLog = await commonItemsPage.getAuditLog();
    const expectedOrganisationName = await myOrgSponsorOrgProfilePage.getOrgName();
    const expectedUsername = await commonItemsPage.getSearchKey();
    const expectedAdminUsername = loginPage.loginPageTestData[adminUserDataset].username;
    const actualEventValues: string[] = auditLog.get('eventValues');

    for (const key in datasetAudit) {
      let expectedEvent: string = '';
      if (Object.hasOwn(datasetAudit, key)) {
        if (key.startsWith('user_')) {
          expectedEvent = `${expectedUsername}${datasetAudit[key]}`;
        } else if (key.startsWith('organisation_')) {
          expectedEvent = `${expectedOrganisationName}${datasetAudit[key]}`;
        } else {
          expectedEvent = datasetAudit[key];
        }
        expect.soft(actualEventValues.includes(expectedEvent), `Expecting value: ${expectedEvent}`).toBeTruthy();
        expect
          .soft(
            actualEventValues.filter((event) => event == expectedEvent),
            `Expecting a single instance of ${expectedEvent}`
          )
          .toHaveLength(1);
      }
    }

    const actualAdminUsernameValues: string[] = auditLog.get('adminEmailValues');
    for (const actualUsername of actualAdminUsernameValues) {
      expect.soft(actualUsername.toLowerCase()).toEqual(expectedAdminUsername.toLowerCase());
    }
  }
);
