import { createBdd } from 'playwright-bdd';
import { expect, test } from '../../../hooks/CustomFixtures';

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
  'I can see the searched modification to be present in the list with date actioned in the sponsor authorisations page',
  async ({ sponsorAuthorisationsPage, modificationsCommonPage, commonItemsPage }) => {
    const dateActionedBySponsor = new Date().toLocaleDateString('en-GB', {
      day: 'numeric',
      month: 'short',
      year: 'numeric',
    });
    const modificationID = await modificationsCommonPage.getModificationID();
    const foundRecords = await sponsorAuthorisationsPage.findModification(commonItemsPage, modificationID, {
      dateActionedSponsor: dateActionedBySponsor,
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
    const actualList = await commonItemsPage.getActualListValuesWithoutTrim(
      commonItemsPage.tableBodyRows,
      searchColumnIndex
    );
    let sortedModsList: string[];
    const direction = sortDirection.toLowerCase();
    const field = sortField.toLowerCase();
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
