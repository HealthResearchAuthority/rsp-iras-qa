import { createBdd } from 'playwright-bdd';
import { expect, test } from '../../../../hooks/CustomFixtures';
import { getRandomNumber } from '../../../../utils/UtilFunctions';
const { When, Then } = createBdd(test);

Then('I can see the modifications ready to assign page', async ({ modificationsReadyToAssignPage }) => {
  await modificationsReadyToAssignPage.assertOnModificationsReadyToAssignPage();
});

Then(
  'I can see the tasklist of modifications ready to assign is sorted by {string} order of the {string}',
  async (
    { modificationsReadyToAssignPage, searchModificationsPage, commonItemsPage },
    sortDirection: string,
    sortField: string
  ) => {
    let sortedList: string[];
    let columnIndex: number;
    switch (sortField.toLowerCase()) {
      case 'modification id':
        columnIndex = 1;
        break;
      case 'short project title':
        columnIndex = 2;
        break;
      case 'modification type':
        columnIndex = 3;
        break;
      case 'date submitted':
        columnIndex = 4;
        break;
      case 'days since submission':
        columnIndex = 5;
        break;
      default:
        throw new Error(`${sortField} is not a valid option`);
    }
    const actualList = await searchModificationsPage.getActualListValues(commonItemsPage.tableBodyRows, columnIndex);
    if (sortField.toLowerCase() == 'modification id') {
      sortedList = await searchModificationsPage.sortModificationIdListValues(actualList, sortDirection);
    } else if (sortField.toLowerCase() == 'date submitted') {
      sortedList = await modificationsReadyToAssignPage.sortDateSubmittedListValues(actualList, sortDirection);
    } else if (sortField.toLowerCase() == 'days since submission') {
      sortedList = await modificationsReadyToAssignPage.sortDaysSinceSubmittedListValues(actualList, sortDirection);
    } else if (sortDirection.toLowerCase() == 'ascending') {
      sortedList = [...actualList].sort((a, b) => a.localeCompare(b, 'en', { sensitivity: 'base' }));
    } else {
      sortedList = [...actualList].sort((a, b) => b.localeCompare(a, 'en', { sensitivity: 'base' }));
    }
    expect(actualList).toEqual(sortedList);
  }
);

Then(
  'I can see the {string} ui labels on the modifications ready to assign page',
  async ({ commonItemsPage, modificationsReadyToAssignPage }, datasetName: string) => {
    const dataset = modificationsReadyToAssignPage.modificationsReadyToAssignPageData[datasetName];
    for (const key in dataset) {
      if (Object.prototype.hasOwnProperty.call(dataset, key)) {
        const labelVal = await commonItemsPage.getUiLabel(key, modificationsReadyToAssignPage);
        expect(labelVal).toBe(dataset[key]);
      }
    }
  }
);

Then(
  'I confirm checkbox exists in every row across all pages',
  async ({ commonItemsPage, modificationsReadyToAssignPage }) => {
    while (true) {
      const rows = commonItemsPage.tableRows;
      const rowCount = await rows.count();
      for (let i = 2; i < rowCount; i++) {
        await modificationsReadyToAssignPage.modification_checkbox.nth(i).isVisible();
      }
      const isDisabled = await commonItemsPage.next_button.isDisabled();
      if (isDisabled !== null) {
        break;
      }
      await commonItemsPage.next_button.click();
    }
  }
);

Then(
  'I check random row and validate if the row is checked even after navigation',
  async ({ commonItemsPage, modificationsReadyToAssignPage }) => {
    const randomRowToCheck = await getRandomNumber(1, 20);
    const totalPages = await commonItemsPage.getTotalPages();

    //if totalPages more than 2 then limit checks to 2
    let maxPagesToCheck = 0;

    if (totalPages > 2) {
      maxPagesToCheck =
        modificationsReadyToAssignPage.modificationsReadyToAssignPageData.Modifications_Ready_To_Assign_Page
          .maxPagesToVisit;
    } else {
      maxPagesToCheck = totalPages;
    }

    for (let currentPage = 1; currentPage <= maxPagesToCheck; currentPage++) {
      if (currentPage == 1) {
        //will have not previous page since first page
        await modificationsReadyToAssignPage.modification_checkbox.nth(randomRowToCheck).check();
        await expect(modificationsReadyToAssignPage.modification_checkbox.nth(randomRowToCheck)).toBeChecked();
      } //will have both previous and next page if currentpage is 2 or more
      else {
        await commonItemsPage.next_button.click();
        await modificationsReadyToAssignPage.modification_checkbox.nth(randomRowToCheck).check();
        await expect(modificationsReadyToAssignPage.modification_checkbox.nth(randomRowToCheck)).toBeChecked();

        //navigate to next page and come back
        await commonItemsPage.next_button.click();
        await commonItemsPage.previous_button.click();
        await expect(modificationsReadyToAssignPage.modification_checkbox.nth(randomRowToCheck)).toBeChecked();

        //navigate to previous page and come to current page
        await commonItemsPage.previous_button.click();
        await commonItemsPage.next_button.click();
        await expect(modificationsReadyToAssignPage.modification_checkbox.nth(randomRowToCheck)).toBeChecked();
      }
    }
  }
);

When(
  'I select check all checkbox on the current page and validate all checkboxes are checked',
  async ({ commonItemsPage, modificationsReadyToAssignPage }) => {
    const checkboxes = modificationsReadyToAssignPage.modification_checkbox;
    const checkAll = modificationsReadyToAssignPage.checkall_modification_checkbox;
    await commonItemsPage.page.waitForLoadState('domcontentloaded');
    await checkAll.click();
    const rowCount = await commonItemsPage.tableRows.count();
    for (let i = 1; i < rowCount; i++) {
      expect(await checkboxes.nth(i).isChecked());
    }
  }
);

When(
  'jsDisabled I select check all checkbox on the current page and validate all checkboxes are unchecked',
  async ({ commonItemsPage, modificationsReadyToAssignPage }) => {
    //const checkboxes = modificationsReadyToAssignPage.modification_checkbox;
    const checkAll = modificationsReadyToAssignPage.checkall_modification_checkbox;
    await commonItemsPage.page.waitForLoadState('domcontentloaded');
    await checkAll.click();
    //const rowCount = await commonItemsPage.tableRows.count();
    //for (let i = 2; i < rowCount; i++)
    const allCheckboxes = await commonItemsPage.tableRows.all();
    for (const checkbox of allCheckboxes.slice(2)) {
      //await expect(checkboxes.nth(i)).not.toBeChecked();
      //await expect(checkboxes.nth(row)).not.toBeChecked();
      await expect(checkbox).not.toBeChecked();
    }
  }
);

When(
  'I navigate by {string} within the Modifications Ready to assign page',
  async ({ commonItemsPage }, paginationLink: string) => {
    if (paginationLink.toLowerCase() === 'clicking on next link') {
      await commonItemsPage.next_button.isEnabled();
      await commonItemsPage.next_button.click();
    } else {
      await commonItemsPage.previous_button.isEnabled();
      await commonItemsPage.previous_button.click();
    }
  }
);

When(
  'I confirm all checkboxes are {string}',
  async ({ commonItemsPage, modificationsReadyToAssignPage }, checkboxStatus: string) => {
    const checkboxes = modificationsReadyToAssignPage.modification_checkbox;
    const rowCount = await commonItemsPage.tableRows.count();
    for (let i = 2; i < rowCount; i++) {
      if (checkboxStatus.toLowerCase() === 'unchecked') {
        await expect(checkboxes.nth(i)).not.toBeChecked();
      } else if (checkboxStatus.toLowerCase() === 'checked') {
        await expect(checkboxes.nth(i)).toBeChecked();
      }
    }
  }
);

When(
  'I navigate to previous page to confirm all checkboxes remain checked',
  async ({ commonItemsPage, modificationsReadyToAssignPage }) => {
    await commonItemsPage.previous_button.click();
    const checkboxes = modificationsReadyToAssignPage.modification_checkbox;
    const rowCount = await commonItemsPage.tableRows.count();
    for (let i = 1; i < rowCount; i++) {
      expect(checkboxes.nth(i)).toBeChecked();
    }
  }
);
