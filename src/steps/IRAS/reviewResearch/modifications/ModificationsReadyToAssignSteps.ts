import { createBdd } from 'playwright-bdd';
import { expect, test } from '../../../../hooks/CustomFixtures';
//import { getRandomNumber } from '../../../../utils/UtilFunctions';

const { When, Then } = createBdd(test);

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

Then('I confirm checkbox exists in every row across all pages', async ({ modificationsReadyToAssignPage }) => {
  while (true) {
    const rows = await modificationsReadyToAssignPage.tableRows;
    const rowCount = await rows.count();
    for (let i = 2; i < rowCount; i++) {
      await modificationsReadyToAssignPage.modification_checkbox.nth(i).isVisible();
    }
    const isDisabled = await modificationsReadyToAssignPage.next_button.isDisabled();
    if (isDisabled !== null) {
      break;
    }
    await modificationsReadyToAssignPage.next_button.click();
  }
});

// Then(
//   'I check random row and validate if the row is checked even after navigation',
//   async ({ commonItemsPage, modificationsReadyToAssignPage }) => {
//     await modificationsReadyToAssignPage.waitForLoad();
//     const randomRowToCheck = await getRandomNumber(1, 20);
//     const totalPages = await commonItemsPage.getTotalPages();

//     //if totalPages more than 2 then limit checks to 2
//     let maxPagesToCheck = 0;

//     if (totalPages > 2) {
//       maxPagesToCheck =
//         modificationsReadyToAssignPage.modificationsReadyToAssignPageData.Modifications_Ready_To_Assign_Page
//           .maxPagesToVisit;
//     } else {
//       maxPagesToCheck = totalPages;
//     }

//     for (let currentPage = 1; currentPage <= maxPagesToCheck; currentPage++) {
//       if (currentPage == 1) {
//         //will have not previous page since first page
//         await modificationsReadyToAssignPage.modification_checkbox.nth(randomRowToCheck).check();
//         await expect(modificationsReadyToAssignPage.modification_checkbox.nth(randomRowToCheck)).toBeChecked();
//       } //will have both previous and next page if currentpage is 2 or more
//       else {
//         await modificationsReadyToAssignPage.next_button.click();
//         await modificationsReadyToAssignPage.waitForLoad();

//         await modificationsReadyToAssignPage.modification_checkbox.nth(randomRowToCheck).check();
//         await expect(modificationsReadyToAssignPage.modification_checkbox.nth(randomRowToCheck)).toBeChecked();

//         //navigate to next page and come back
//         await modificationsReadyToAssignPage.next_button.click();
//         await modificationsReadyToAssignPage.previous_button.click();
//         await expect(modificationsReadyToAssignPage.modification_checkbox.nth(randomRowToCheck)).toBeChecked();

//         //navigate to previous page and come to current page
//         await modificationsReadyToAssignPage.previous_button.click();
//         await modificationsReadyToAssignPage.next_button.click();
//         await expect(modificationsReadyToAssignPage.modification_checkbox.nth(randomRowToCheck)).toBeChecked();
//       }
//     }
//   }
// );

When(
  'I select check all checkbox on the current page and validate all checkboxes are checked',
  async ({ modificationsReadyToAssignPage }) => {
    await modificationsReadyToAssignPage.waitForLoad();
    const checkboxes = modificationsReadyToAssignPage.modification_checkbox;
    const checkAll = modificationsReadyToAssignPage.checkall_modification_checkbox;
    await checkAll.click();
    const rowCount = await modificationsReadyToAssignPage.tableRows.count();
    for (let i = 1; i < rowCount; i++) {
      expect(await checkboxes.nth(i).isChecked());
    }
  }
);

When(
  'JSdisabled I select check all checkbox on the current page and validate all checkboxes are unchecked',
  async ({ modificationsReadyToAssignPage }) => {
    await modificationsReadyToAssignPage.waitForLoad();
    const checkboxes = modificationsReadyToAssignPage.modification_checkbox;
    const checkAll = modificationsReadyToAssignPage.checkall_modification_checkbox;
    await checkAll.click();
    const rowCount = await modificationsReadyToAssignPage.tableRows.count();
    //start from row 3 i.e. index 2 as the first two rows are for header and hidden toggle filter
    //1)<input hidden="" type="checkbox" id="toggle-filter" class="search-filter-toggle"/> aka getByTestId('toggle-filter')
    //2)<input name="" type="checkbox" id="select-all-modifications" class="govuk-checkboxes__input select-all-modifications"/> aka getByTestId('select-all-modifications')
    for (let i = 2; i < rowCount; i++) {
      await expect(checkboxes.nth(i)).not.toBeChecked();
    }
  }
);

When(
  'I navigate by {string} within the Modifications Ready to assign page',
  async ({ modificationsReadyToAssignPage }, paginationLink: string) => {
    if (paginationLink === 'clicking on next link') {
      await modificationsReadyToAssignPage.next_button.isEnabled();
      await modificationsReadyToAssignPage.next_button.click();
    } else if (paginationLink === 'clicking on previous link') {
      await modificationsReadyToAssignPage.previous_button.isEnabled();
      await modificationsReadyToAssignPage.previous_button.click();
    }
  }
);

When('I confirm all checkboxes are {string}', async ({ modificationsReadyToAssignPage }, checkboxStatus: string) => {
  const checkboxes = modificationsReadyToAssignPage.modification_checkbox;
  const rowCount = await modificationsReadyToAssignPage.tableRows.count();
  //start from row 3 i.e. index 2 as the first two rows are for header and hidden toggle filter
  //1)<input hidden="" type="checkbox" id="toggle-filter" class="search-filter-toggle"/> aka getByTestId('toggle-filter')
  //2)<input name="" type="checkbox" id="select-all-modifications" class="govuk-checkboxes__input select-all-modifications"/> aka getByTestId('select-all-modifications')
  for (let i = 2; i < rowCount; i++) {
    if (checkboxStatus === 'unchecked') {
      await expect(checkboxes.nth(i)).not.toBeChecked();
    } else if (checkboxStatus === 'checked') {
      await expect(checkboxes.nth(i)).toBeChecked();
    }
  }
});

When(
  'I navigate to previous page to confirm all checkboxes remain checked',
  async ({ modificationsReadyToAssignPage }) => {
    await modificationsReadyToAssignPage.previous_button.click();
    const checkboxes = modificationsReadyToAssignPage.modification_checkbox;
    const rowCount = await modificationsReadyToAssignPage.tableRows.count();
    for (let i = 1; i < rowCount; i++) {
      expect(checkboxes.nth(i)).toBeChecked();
    }
  }
);

Then('I sort the column {string}', async ({ modificationsReadyToAssignPage }, sortColumn: string) => {
  const modificationId = modificationsReadyToAssignPage.modification_id_label;
  const shortProjectTitle = modificationsReadyToAssignPage.short_project_title_label;
  const modificationType = modificationsReadyToAssignPage.modification_type_label;
  const dateSubmitted = modificationsReadyToAssignPage.date_submitted_label;
  const daysSinceSubmission = modificationsReadyToAssignPage.days_since_submission_label;

  if (sortColumn === 'Modification ID') {
    await modificationId.click();
  }
  if (sortColumn === 'Short project title') {
    await shortProjectTitle.click();
  }
  if (sortColumn === 'Modification type') {
    await modificationType.click();
  }
  if (sortColumn === 'Date submitted') {
    await dateSubmitted.click();
  }
  if (sortColumn === 'Days since submission') {
    await daysSinceSubmission.click();
  }
});

When(
  'the pagination is in Modification and a button the current page number should be visually highlighted to indicate the active page the user is on',
  async ({ commonItemsPage }) => {
    await commonItemsPage.next_button.click();
    const currentUrl = commonItemsPage.page.url();
    const currentPageNumber = await commonItemsPage.getPageNumberForModifications(currentUrl);
    const currentPageLabel = `Page ${currentPageNumber}`;
    const currentPageLink = commonItemsPage.pagination.getByRole('button', { name: currentPageLabel });
    await expect(currentPageLink).toHaveAttribute('aria-current');
    const currentPageRef = await currentPageLink.getAttribute('formaction');
    expect(currentUrl).toContain(currentPageRef);
    await commonItemsPage.previous_button.click();
  }
);
