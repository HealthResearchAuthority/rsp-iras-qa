import { createBdd } from 'playwright-bdd';
import { expect, test } from '../../../hooks/CustomFixtures';
import { Locator } from 'playwright/test';
import * as dbConfigData from '../../../resources/test_data/common/database/db_config_data.json';
import { connect } from '../../../utils/DbConfig';
import { removeUnwantedWhitespace } from '../../../utils/UtilFunctions';

const { Then } = createBdd(test);

Then('I can see the sponsor authorisations page', async ({ sponsorAuthorisationsPage }) => {
  await sponsorAuthorisationsPage.assertOnSponsorAuthorisationsPageTestData();
});

Then(
  'I can see the searched modification to be present in the list with {string} status in the sponsor authorisations page',
  async ({ sponsorAuthorisationsPage, modificationsCommonPage, commonItemsPage }, status: string) => {
    const modificationStatusForSponsor = await modificationsCommonPage.getModificationStatus(status);
    const modificationID = await modificationsCommonPage.getModificationID();
    const foundRecords = await sponsorAuthorisationsPage.findModification(commonItemsPage, modificationID, {
      statusForSponsor: modificationStatusForSponsor,
    });
    expect.soft(foundRecords).toBeDefined();
    expect.soft(foundRecords).toHaveCount(1);
  }
);

Then(
  'I can see the searched modification to be present in the list with date actioned with {string} status in the sponsor authorisations page',
  async ({ sponsorAuthorisationsPage, modificationsCommonPage, commonItemsPage }, status: string) => {
    const modificationStatusForSponsor = await modificationsCommonPage.getModificationStatus(status);

    const dateActionedBySponsor = new Date().toLocaleDateString('en-GB', {
      day: 'numeric',
      month: 'short',
      year: 'numeric',
    });
    const modificationID = await modificationsCommonPage.getModificationID();
    const foundRecords = await sponsorAuthorisationsPage.findModification(commonItemsPage, modificationID, {
      dateActionedSponsor: dateActionedBySponsor,
      statusForSponsor: modificationStatusForSponsor,
    });
    expect.soft(foundRecords).toBeDefined();
    expect.soft(foundRecords).toHaveCount(1);
  }
);

Then(
  'I click on the searched modification id from sponsor authorisations page',
  async ({ sponsorAuthorisationsPage, modificationsCommonPage }) => {
    const modificationID = await modificationsCommonPage.getModificationID();
    await sponsorAuthorisationsPage.page.getByText(modificationID, { exact: true }).click();
  }
);

Then(
  'I can see the list of modifications received for sponsor approval is sorted by {string} order of the {string}',
  async ({ commonItemsPage, sponsorAuthorisationsPage }, sortDirection: string, sortField: string) => {
    const searchColumnIndex = await sponsorAuthorisationsPage.getColumnIndex(sortField);
    const field = sortField.toLowerCase();
    let actualList: any;
    if (field === 'modification id') {
      actualList = await commonItemsPage.getActualListValues(commonItemsPage.tableBodyRows, searchColumnIndex);
    } else {
      actualList = await commonItemsPage.getActualListValuesWithoutTrim(
        commonItemsPage.tableBodyRows,
        searchColumnIndex
      );
    }
    let sortedModsList: string[];
    const direction = sortDirection.toLowerCase();
    if (field === 'modification id') {
      sortedModsList = await commonItemsPage.sortModificationIdListValues(actualList, sortDirection);
    } else {
      const compareFn = (a: string, b: string) =>
        direction === 'ascending'
          ? a.localeCompare(b, undefined, { sensitivity: 'base', ignorePunctuation: false })
          : b.localeCompare(a, undefined, { sensitivity: 'base', ignorePunctuation: false });
      sortedModsList = [...actualList].toSorted(compareFn);
    }
    expect.soft(actualList).toEqual(sortedModsList);
  }
);

Then(
  'I am on the {string} page and it should be visually highlighted to indicate the active page the user is on for sponsor workspace authorisations page using {string}',
  async (
    { commonItemsPage, setupNewSponsorOrganisationPage },
    position: string,
    sponsorOrganisationDatasetName: string
  ) => {
    const sponsorOrganisationDataset =
      setupNewSponsorOrganisationPage.setupNewSponsorOrganisationPageTestData.Setup_New_Sponsor_Organisation[
        sponsorOrganisationDatasetName
      ];
    const sponsorOrganisationName = sponsorOrganisationDataset.sponsor_organisation_text;
    let pageLocator: Locator;
    const sqlConnectionRTSService = await connect(dbConfigData.Rts_Service);
    const orgResult = await sqlConnectionRTSService.query(`
      SELECT Org.Id
      FROM OrganisationRole OrgRole
      INNER JOIN Organisation Org
        ON OrgRole.OrganisationId = Org.Id
      WHERE OrgRole.Id = 'CRSPNSR@2.16.840.1.113883.5.110'
        AND Org.Name = '${sponsorOrganisationName}'
        AND OrgRole.Status = 'Active'
    `);
    const orgId = orgResult.recordset[0]?.Id;
    await sqlConnectionRTSService.close();
    if (!orgId) {
      throw new Error('Sponsor organisation not found in database');
    }
    const sqlConnectionApplicationService = await connect(dbConfigData.Application_Service);
    const countResult = await sqlConnectionApplicationService.query(`
      SELECT COUNT(*) AS ModificationCount
      FROM ProjectModifications pm
      WHERE pm.Status = 'With sponsor'
        AND pm.ProjectRecordId IN (
          SELECT pra.ProjectRecordId
          FROM ProjectRecordAnswers pra
          WHERE pra.Response = '${orgId}'
        )
    `);
    await sqlConnectionApplicationService.close();
    const recordsCount = countResult.recordset[0].ModificationCount;
    if (recordsCount > 20) {
      if (position.toLowerCase() === 'first') {
        pageLocator = commonItemsPage.firstPage;
      } else {
        const totalPages = await commonItemsPage.getTotalPages();
        commonItemsPage.setNumberofTotalPages(totalPages);
        pageLocator = await commonItemsPage.clickOnPages(totalPages, 'page number');
      }
      await expect(pageLocator).toHaveAttribute('aria-current', 'page');
    }
  }
);

Then(
  'I {string} the project closure details for sponsor authorisations view along with the {string} user and {string} status',
  async (
    { sponsorAuthorisationsPage, loginPage, projectDetailsIRASPage },
    action: string,
    userDatasetName: string,
    projectStatus: string
  ) => {
    if (action.toLowerCase() === 'keep note of') {
      const shortProjectTitle = await projectDetailsIRASPage.getShortProjectTitle();
      const irasID = await projectDetailsIRASPage.getUniqueIrasId();
      const dateReceived = new Date().toLocaleString('en-GB', {
        day: '2-digit',
        month: 'short',
        year: 'numeric',
      });
      const userEmail = loginPage.loginPageTestData[userDatasetName].username.toLowerCase();
      const dateClosed = '';
      const status = projectStatus;
      sponsorAuthorisationsPage.setProjectClosureDetailsRecord = {
        shortProjectTitle: shortProjectTitle,
        irasID: irasID,
        dateReceived: dateReceived,
        userEmail: userEmail,
        dateClosed: dateClosed,
        status: status,
      };
    } else if (action.toLowerCase() === 'update status of') {
      const recordToUpdate = await projectDetailsIRASPage.getUniqueIrasId();
      const record = sponsorAuthorisationsPage.projectClosureDetails.find((r) => r.irasID === recordToUpdate);
      if (record) {
        record.status = projectStatus;
        if (projectStatus.toLowerCase() === 'authorised') {
          const dateClosed = new Date().toLocaleString('en-GB', {
            day: '2-digit',
            month: 'short',
            year: 'numeric',
          });
          record.dateClosed = dateClosed;
        }
      }
    }
  }
);

Then('I validate the project closure table for sponsor authorisations view', async ({ sponsorAuthorisationsPage }) => {
  const projectClosureTableHeadersActual = await Promise.all(
    (await sponsorAuthorisationsPage.projectClosureTableHeader.allTextContents()).map(
      async (header) => await removeUnwantedWhitespace(header)
    )
  );
  const projectClosureTableHeadersExpected =
    sponsorAuthorisationsPage.sponsorAuthorisationsPageTestData.Sponsor_Authorisations_Page
      .project_closure_table_headers;
  expect.soft(projectClosureTableHeadersActual).toEqual(projectClosureTableHeadersExpected);
  const rowCount = await sponsorAuthorisationsPage.projectClosureTableBodyRows.count();
  const actualProjectClosureRows: string[][] = [];
  for (let projectClosureRowIndex = 0; projectClosureRowIndex < rowCount; projectClosureRowIndex++) {
    const row = sponsorAuthorisationsPage.projectClosureTableBodyRows.nth(projectClosureRowIndex);
    const cellTexts = await row.locator(sponsorAuthorisationsPage.tableCell).allTextContents();
    actualProjectClosureRows.push(cellTexts.map((text) => text.trim()));
  }
  const expectedProjectClosureRows = sponsorAuthorisationsPage.getProjectClosureDetailsRecord
    .slice()
    .map((record) => [
      record.shortProjectTitle,
      record.irasID,
      record.dateReceived,
      record.userEmail,
      record.dateClosed,
      record.status,
    ]);
  expect.soft(actualProjectClosureRows).toEqual(expectedProjectClosureRows);
});

Then(
  'I can see the associated organisations displaying in the authorisations page for {string}',
  async ({ manageSponsorOrganisationPage, loginPage, sponsorAuthorisationsPage }, user: string) => {
    let userEmailValue: string = '';
    if (user === 'Sponsor_User') {
      userEmailValue = loginPage.loginPageTestData.Sponsor_User.username;
    } else if (user === 'Sponsor_Org_Admin_User') {
      userEmailValue = loginPage.loginPageTestData.Sponsor_Org_Admin_User.username;
    }
    const sponsorIds = new Set(
      await manageSponsorOrganisationPage.sqlGetSponsorRtsIdsByEmailAndActiveAndAuthoriser(userEmailValue)
    );
    const orgInfoList = [];
    for (const rtsId of sponsorIds) {
      const orgName = (await manageSponsorOrganisationPage.sqlGetOrganisationNameFromRTSById(rtsId)).toString();
      orgInfoList.push({
        orgName,
      });
    }
    const rows = sponsorAuthorisationsPage.organisationNameLinks;
    const rowCount = await rows.count();
    const uiList: { orgName: string }[] = [];
    for (let i = 0; i < rowCount; i++) {
      const row = rows.nth(i);
      const orgName = (await row.textContent()).trim();
      uiList.push({ orgName });
    }
    expect.soft(uiList).toEqual(expect.arrayContaining(orgInfoList));
    expect.soft(uiList.length, 'Row count mismatch').toBe(orgInfoList.length);
  }
);
Then(
  'I click the organisation link {string} in the authorisations page',
  async ({ sponsorAuthorisationsPage, setupNewSponsorOrganisationPage }, sponsorDatasetName: string) => {
    const dataSetSponsorOrg =
      setupNewSponsorOrganisationPage.setupNewSponsorOrganisationPageTestData.Setup_New_Sponsor_Organisation[
        sponsorDatasetName
      ];
    const organisationName = dataSetSponsorOrg.sponsor_organisation_text;
    const rows = sponsorAuthorisationsPage.organisationNameLinks;
    const rowCount = await rows.count();
    for (let i = 0; i < rowCount; i++) {
      const row = rows.nth(i);
      const orgName = (await row.textContent()).trim();
      if (orgName === organisationName) {
        await row.click();
        break;
      }
    }
  }
);

Then(
  'I can see the authorisations page for {string}',
  async ({ sponsorAuthorisationsPage, setupNewSponsorOrganisationPage }, sponsorDatasetName: string) => {
    const dataSetSponsorOrg =
      setupNewSponsorOrganisationPage.setupNewSponsorOrganisationPageTestData.Setup_New_Sponsor_Organisation[
        sponsorDatasetName
      ];
    const organisationName = dataSetSponsorOrg.sponsor_organisation_text;
    await sponsorAuthorisationsPage.assertOnSponsorAuthorisationsPageForMultiOrg(organisationName);
  }
);
