import { createBdd } from 'playwright-bdd';
import { expect, test } from '../../../hooks/CustomFixtures';
import { Locator } from 'playwright/test';
import * as dbConfigData from '../../../resources/test_data/common/database/db_config_data.json';
import { connect } from '../../../utils/DbConfig';

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
