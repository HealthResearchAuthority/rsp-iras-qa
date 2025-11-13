import { createBdd } from 'playwright-bdd';
import { expect, test } from '../../../../hooks/CustomFixtures';
import { confirmStringNotNull } from '../../../../utils/UtilFunctions';
const { When, Then } = createBdd(test);
Then(
  'I can now see a table of search results for {string}',
  async ({ searchModificationsPage, commonItemsPage }, resultType: string) => {
    if (resultType === 'modifications received for approval' || resultType === 'project records')
      await expect.soft(searchModificationsPage.results_table).toBeVisible();
    expect.soft(await commonItemsPage.tableBodyRows.count()).toBeGreaterThan(0);
  }
);

Then(
  'I can see the list of {string} is sorted by {string} order of the {string}',
  async (
    { commonItemsPage, modificationsReceivedCommonPage },
    resultType: string,
    sortDirection: string,
    sortField: string
  ) => {
    let sortedList: string[];
    let searchColumnIndex: number;
    if (resultType === 'modifications received for approval') {
      searchColumnIndex = await modificationsReceivedCommonPage.getModificationColumnIndex(
        'Search_Modifications_Page',
        sortField
      );
    } else if (resultType === 'project records') {
      searchColumnIndex = await modificationsReceivedCommonPage.getProjectRecordColumnIndex(
        'Search_Projects_Page',
        sortField
      );
    }
    const actualList = await commonItemsPage.getActualListValues(commonItemsPage.tableBodyRows, searchColumnIndex);
    if (sortField.toLowerCase() == 'modification id') {
      sortedList = await commonItemsPage.sortModificationIdListValues(actualList, sortDirection);
    } else if (sortField.toLowerCase() == 'iras id') {
      sortedList = await commonItemsPage.sortIrasIds(actualList, sortDirection);
    } else if (sortDirection.toLowerCase() == 'ascending') {
      sortedList = [...actualList].toSorted((a, b) => a.localeCompare(b, 'en', { sensitivity: 'base' }));
    } else {
      sortedList = [...actualList].toSorted((a, b) => b.localeCompare(a, 'en', { sensitivity: 'base' }));
    }
    expect.soft(actualList).toEqual(sortedList);
  }
);

When(
  'I capture the iras id of the recently added project with status as {string}',
  async ({ searchProjectsPage, projectOverviewUnfinishedProjectsPage }, status: string) => {
    const iIrasIdText = confirmStringNotNull(await projectOverviewUnfinishedProjectsPage.irasid_text.textContent());
    await searchProjectsPage.saveIrasID(iIrasIdText.replaceAll('IRAS ID: ', ''));
    const statusText = confirmStringNotNull(await projectOverviewUnfinishedProjectsPage.status_text.textContent());
    expect.soft(statusText).toBe(status);
  }
);
