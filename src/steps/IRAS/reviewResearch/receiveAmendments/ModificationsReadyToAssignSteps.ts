import { createBdd } from 'playwright-bdd';
import { expect, test } from '../../../../hooks/CustomFixtures';
import { confirmStringNotNull, getRandomNumber } from '../../../../utils/UtilFunctions';
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
    const recordsCount = await commonItemsPage.extractNumFromSearchResultCount(
      await commonItemsPage.search_results_count.textContent()
    );
    if (recordsCount > 20) {
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
    const recordsCount = await commonItemsPage.extractNumFromSearchResultCount(
      await commonItemsPage.search_results_count.textContent()
    );
    if (recordsCount > 20) {
      if (paginationLink.toLowerCase() === 'clicking on next link') {
        await commonItemsPage.next_button.click();
      } else {
        await commonItemsPage.previous_button.click();
      }
    }
  }
);

When('I confirm all checkboxes are {string}', async ({ modificationsReadyToAssignPage }, checkboxStatus: string) => {
  await modificationsReadyToAssignPage.page.waitForLoadState('domcontentloaded');
  const checkboxes = await modificationsReadyToAssignPage.modification_checkbox.all();
  expect.soft(checkboxes.length).toBeGreaterThan(0);
  for (const checkbox of checkboxes) {
    if (checkboxStatus.toLowerCase() === 'unchecked') {
      await expect.soft(checkbox).not.toBeChecked();
    } else {
      await expect.soft(checkbox).toBeChecked();
    }
  }
});

When(
  'I enter {string} into the search field in the modifications ready to assign page',
  async ({ modificationsReadyToAssignPage }, datasetName: string) => {
    const dataset = modificationsReadyToAssignPage.modificationsReadyToAssignPageTestData.Iras_Id[datasetName];
    await modificationsReadyToAssignPage.iras_id_search_text.fill(dataset['iras_id_text']);
  }
);

When(
  'I select modifications by clicking the checkbox in the {string} page',
  async ({ modificationsReadyToAssignPage, teamManagerDashboardPage }, pageValue: string) => {
    let modificationId: string;
    if (pageValue === 'team manager dashboard') {
      modificationId = await teamManagerDashboardPage.getModificationId();
    } else {
      modificationId = await modificationsReadyToAssignPage.getModificationId();
    }
    const modificationRecord: string[] = [];
    await modificationsReadyToAssignPage.page.locator(`[id^="${modificationId}"]`).nth(0).check();
    const shortProjectTitle = await modificationsReadyToAssignPage.page
      .locator(`[id^="${modificationId}"]`)
      .nth(0)
      .locator('../../..')
      .getByRole('strong')
      .nth(0)
      .textContent();
    const modificationIdValue = confirmStringNotNull(
      await modificationsReadyToAssignPage.page
        .locator(`[id^="${modificationId}"]`)
        .nth(0)
        .locator('../../../td/a')
        .nth(0)
        .textContent()
    );
    modificationRecord.push(modificationIdValue + ':' + shortProjectTitle.trim());
    await modificationsReadyToAssignPage.setSelectedModificationsIdTitle(modificationRecord);
    await modificationsReadyToAssignPage.setSelectedModifications(modificationIdValue);
  }
);

When(
  'I can see previously assigned modification is no longer displayed',
  async ({ modificationsReadyToAssignPage }) => {
    const modificationId = await modificationsReadyToAssignPage.getSelectedModifications();
    await expect.soft(modificationsReadyToAssignPage.page.getByTestId(`${modificationId}`)).not.toBeVisible();
  }
);

When(
  'I can see previously selected modifications checkboxes are retained',
  async ({ modificationsReadyToAssignPage }) => {
    const modificationId = await modificationsReadyToAssignPage.getSelectedModifications();
    await expect.soft(modificationsReadyToAssignPage.page.getByTestId(`${modificationId}`)).toBeChecked();
  }
);

Then(
  'the country linked to the review body of the {string} appears as the lead nation in the page description',
  async ({ modificationsReadyToAssignPage }, user: string) => {
    const expectedLeadNation =
      modificationsReadyToAssignPage.modificationsReadyToAssignPageTestData.Workflow_Coordinator_Nations[user] + '.';
    const actualPageDescription = await modificationsReadyToAssignPage.page_description
      .textContent()
      .then((description: string) => description.trim());
    expect(actualPageDescription.endsWith(expectedLeadNation)).toBeTruthy();
  }
);

Then(
  'I see only modifications where the lead nation is the country linked to the review body of the {string} and with status {string}',
  async ({ modificationsReadyToAssignPage, commonItemsPage }, user: string, status: string) => {
    let leadNation =
      modificationsReadyToAssignPage.modificationsReadyToAssignPageTestData.Workflow_Coordinator_Nations[user];
    if (leadNation === 'Northern Ireland') {
      leadNation = 'Northern_Ireland';
    }
    const modificationsByLeadNation = await modificationsReadyToAssignPage.sqlGetModificationByLeadNationAndStatusWFC(
      leadNation,
      status
    );
    const actualList = await commonItemsPage.getActualModificationListValues(commonItemsPage.tableBodyRows, 1);

    const normalize = (arr: any[]) =>
      arr
        .map((item) => item.toString().trim())
        .sort((a, b) => {
          const numA = Number.parseFloat(a);
          const numB = Number.parseFloat(b);
          if (!Number.isNaN(numA) && !Number.isNaN(numB)) {
            return numA - numB; // Numeric comparison
          }

          return 0; // Keeps original order for non-numeric values
        });
    // expect.soft(normalize(actualList)).toEqual(normalize(modificationsByLeadNation));
    //  check both ways to ensure they contain the same elements
    expect.soft(normalize(modificationsByLeadNation)).toEqual(expect.arrayContaining(normalize(actualList)));

    expect.soft(normalize(actualList)).toEqual(expect.arrayContaining(normalize(modificationsByLeadNation)));
  }
);

When(
  'I can see previously assigned modification is displayed in {string} with status {string} and reviewer {string}',
  async (
    { modificationsReadyToAssignPage, selectStudyWideReviewerPage, myModificationsTasklistPage },
    pageValue: string,
    statusValue: string,
    datasetName: string
  ) => {
    const dataset = await selectStudyWideReviewerPage.selectStudywideReviewerPageData.Study_Wide_Reviewer[datasetName];
    const reviewerValue = dataset['study_wide_reviewer_dropdown'];
    const modificationId = await modificationsReadyToAssignPage.getSelectedModifications();
    if (pageValue === 'Team_Manager_Dashboard_Page') {
      await expect.soft(modificationsReadyToAssignPage.page.getByTestId(`${modificationId}`)).toBeVisible();
      const modificationRow = modificationsReadyToAssignPage.page.locator('tbody tr', {
        has: modificationsReadyToAssignPage.page.locator('a.govuk-link', { hasText: `${modificationId}` }),
      });
      const reviewerName = modificationRow.locator('td', { hasText: `${reviewerValue}` });
      await expect.soft(reviewerName).toBeVisible();
      const modificationStatus = modificationRow.locator('td', { hasText: `${statusValue}` });
      await expect.soft(modificationStatus).toBeVisible();
    }
    const irasId = modificationId.toString().split('/')[0];
    await myModificationsTasklistPage.saveModificationId(irasId, 'Single');
  }
);

Then(
  'I capture the modification id of {string} where the lead nation is the country linked to the WFC {string} and with status {string}',
  async ({ modificationsReadyToAssignPage }, modificationCount: string, user: string, status: string) => {
    let countValue: string;
    let leadNation =
      await modificationsReadyToAssignPage.modificationsReadyToAssignPageTestData.Workflow_Coordinator_Nations[user];
    if (leadNation === 'Northern Ireland') {
      leadNation = 'Northern_Ireland';
    }
    if (modificationCount === 'Single' || modificationCount === 'Partial') {
      countValue = '=';
    } else {
      countValue = '>';
    }
    const modificationId = await modificationsReadyToAssignPage.sqlGetModificationByLeadNationAndStatusCountWFC(
      leadNation,
      status,
      countValue
    );
    await modificationsReadyToAssignPage.saveModificationId(modificationId.toString(), modificationCount);
  }
);
