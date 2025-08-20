import { createBdd } from 'playwright-bdd';
import { expect, test } from '../../../../hooks/CustomFixtures';
const { Then } = createBdd(test);

Then(
  'I can now see a table of search results for modifications received for approval',
  async ({ searchModificationsPage, commonItemsPage }) => {
    await expect(searchModificationsPage.results_table).toBeVisible();
    expect(await commonItemsPage.tableBodyRows.count()).toBeGreaterThan(0);
  }
);

Then(
  'I can see the list of modifications received for approval is sorted by {string} order of the {string}',
  async ({ searchModificationsPage, commonItemsPage }, sortDirection: string, sortField: string) => {
    let sortedList: string[];
    let columnIndex: number;
    switch (sortField.toLowerCase()) {
      case 'modification id':
        columnIndex = 0;
        break;
      case 'short project title':
        columnIndex = 1;
        break;
      case 'modification type':
        columnIndex = 2;
        break;
      case 'chief investigator':
        columnIndex = 3;
        break;
      case 'lead nation':
        columnIndex = 4;
        break;
      default:
        throw new Error(`${sortField} is not a valid option`);
    }
    const actualList = await searchModificationsPage.getActualListValues(commonItemsPage.tableBodyRows, columnIndex);
    if (sortField.toLowerCase() == 'modification id') {
      sortedList = await searchModificationsPage.sortModificationIdListValues(actualList, sortDirection);
    } else if (sortDirection.toLowerCase() == 'ascending') {
      sortedList = [...actualList].sort((a, b) => a.localeCompare(b, 'en', { sensitivity: 'base' }));
    } else {
      sortedList = [...actualList].sort((a, b) => b.localeCompare(a, 'en', { sensitivity: 'base' }));
    }
    expect.soft(actualList).toEqual(sortedList);
  }
);
