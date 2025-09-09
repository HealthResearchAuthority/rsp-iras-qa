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
      if (Object.hasOwn(dataset, key)) {
        const labelVal = await commonItemsPage.getUiLabel(key, modificationsReadyToAssignPage);
        expect(labelVal).toBe(dataset[key]);
      }
    }
  }
);

Then(
  'I confirm checkbox exists in every row across pages',
  async ({ commonItemsPage, modificationsReadyToAssignPage }) => {
    //Limiting the checks to 2 pages
    const maxPagesToCheck =
      modificationsReadyToAssignPage.modificationsReadyToAssignPageData.Modifications_Ready_To_Assign_Page
        .maxPagesToVisit;
    for (let pageIndex = 1; pageIndex <= maxPagesToCheck; pageIndex++) {
      const checkboxes = await modificationsReadyToAssignPage.modification_checkbox.all();
      for (const checkbox of checkboxes) {
        await expect(checkbox).toBeVisible();
      }
      if (await commonItemsPage.next_button.isVisible()) {
        await commonItemsPage.next_button.click();
      } else {
        break;
      }
    }
  }
);

Then(
  'I check random row and validate if the row is checked even after navigation',
  async ({ commonItemsPage, modificationsReadyToAssignPage }) => {
    await commonItemsPage.firstPage.click();
    const randomRowToCheck = await getRandomNumber(1, 20);
    const maxPagesToCheck =
      modificationsReadyToAssignPage.modificationsReadyToAssignPageData.Modifications_Ready_To_Assign_Page
        .maxPagesToVisit;

    for (let currentPage = 1; currentPage <= maxPagesToCheck; currentPage++) {
      await modificationsReadyToAssignPage.modification_checkbox.nth(randomRowToCheck).check();
      await commonItemsPage.next_button.click();
    }

    for (let currentPage = maxPagesToCheck + 1; currentPage >= maxPagesToCheck; currentPage--) {
      await commonItemsPage.previous_button.click();

      await expect(modificationsReadyToAssignPage.modification_checkbox.nth(randomRowToCheck)).toBeChecked();
    }
  }
);

Then(
  'I select check all checkbox on the current page and validate all checkboxes are checked',
  async ({ modificationsReadyToAssignPage }) => {
    await modificationsReadyToAssignPage.page.waitForLoadState('domcontentloaded');
    const checkAll = modificationsReadyToAssignPage.checkall_modification_checkbox;
    await checkAll.click();
    const checkboxes = await modificationsReadyToAssignPage.modification_checkbox.all();
    for (const checkbox of checkboxes) {
      await expect(checkbox).toBeChecked();
    }
  }
);

When(
  'JavaScript is disabled I select check all checkbox on the current page and validate all checkboxes are unchecked',
  async ({ modificationsReadyToAssignPage }) => {
    const checkAll = modificationsReadyToAssignPage.checkall_modification_checkbox;
    await checkAll.click();
    const checkboxes = await modificationsReadyToAssignPage.modification_checkbox.all();
    for (const checkbox of checkboxes) {
      await expect(checkbox).not.toBeChecked();
    }
  }
);

When(
  'I navigate by {string} within the Modifications Ready to assign page',
  async ({ commonItemsPage }, paginationLink: string) => {
    if (paginationLink.toLowerCase() === 'clicking on next link') {
      await commonItemsPage.next_button.click();
    } else {
      await commonItemsPage.previous_button.click();
    }
  }
);

When('I confirm all checkboxes are {string}', async ({ modificationsReadyToAssignPage }, checkboxStatus: string) => {
  const checkboxes = await modificationsReadyToAssignPage.modification_checkbox.all();
  for (const checkbox of checkboxes) {
    if (checkboxStatus.toLowerCase() === 'unchecked') {
      await expect(checkbox).not.toBeChecked();
    } else {
      await expect(checkbox).toBeChecked();
    }
  }
});

When(
  'I enter {string} into the search field in the modifications ready to assign page',
  async ({ modificationsReadyToAssignPage }, datasetName: string) => {
    const dataset = modificationsReadyToAssignPage.modificationsReadyToAssignPageData.Iras_Id[datasetName];
    await modificationsReadyToAssignPage.iras_id_search_text.fill(dataset['iras_id_text']);
  }
);

// When(
//   'I select modifications with ids as {string} by clicking the checkbox in the modifications ready to assign page',
//   async ({ modificationsReadyToAssignPage }, datasetName: string) => {
//     const dataset = modificationsReadyToAssignPage.modificationsReadyToAssignPageData.Modification_Id[datasetName];
//     for (const key in dataset) {
//       if (Object.hasOwn(dataset, key)) {
//         for (const modificationId of dataset[key]) {
//           const modificationCheckbox = modificationsReadyToAssignPage.modification_checkbox.filter({
//             has: modificationsReadyToAssignPage.page.locator('[id="`${modificationId}`"]'),
//           });
//           await modificationCheckbox.check();
//         }
//       }
//     }
//   }
// );

When(
  'I select a study wide reviewer in the select a reviewer page using {string}',
  async ({ modificationsReadyToAssignPage, commonItemsPage }, datasetName: string) => {
    const dataset = modificationsReadyToAssignPage.modificationsReadyToAssignPageData.Study_Wide_Reviewer[datasetName];
    for (const key in dataset) {
      if (Object.hasOwn(dataset, key)) {
        await commonItemsPage.fillUIComponent(dataset, key, modificationsReadyToAssignPage);
      }
    }
  }
);
