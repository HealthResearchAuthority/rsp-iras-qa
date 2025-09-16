import { createBdd } from 'playwright-bdd';
import { expect, test } from '../../../../hooks/CustomFixtures';
import { getRandomNumber } from '../../../../utils/UtilFunctions';
const { Given, When, Then } = createBdd(test);

Then('I can see the modifications ready to assign page', async ({ modificationsReadyToAssignPage }) => {
  await modificationsReadyToAssignPage.assertOnModificationsReadyToAssignPage();
});

Given(
  'I can see the {string} ui labels on the modifications ready to assign page',
  async ({ commonItemsPage, modificationsReadyToAssignPage }, datasetName: string) => {
    const dataset = modificationsReadyToAssignPage.modificationsReadyToAssignPageTestData[datasetName];
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
      modificationsReadyToAssignPage.modificationsReadyToAssignPageTestData.Modifications_Ready_To_Assign_Page
        .maxPagesToVisit;
    for (let pageIndex = 1; pageIndex <= maxPagesToCheck; pageIndex++) {
      const checkboxes = await modificationsReadyToAssignPage.modification_checkbox.all();
      expect(checkboxes.length).toBeGreaterThan(0);
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
      modificationsReadyToAssignPage.modificationsReadyToAssignPageTestData.Modifications_Ready_To_Assign_Page
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
    expect(checkboxes.length).toBeGreaterThan(0);
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
    expect(checkboxes.length).toBeGreaterThan(0);
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
  expect(checkboxes.length).toBeGreaterThan(0);
  for (const checkbox of checkboxes) {
    if (checkboxStatus.toLowerCase() === 'unchecked') {
      await expect(checkbox).not.toBeChecked();
    } else {
      await expect(checkbox).toBeChecked();
    }
  }
});
