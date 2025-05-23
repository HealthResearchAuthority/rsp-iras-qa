import { createBdd } from 'playwright-bdd';
import { test, expect } from '../../../../../hooks/CustomFixtures';
import { confirmStringNotNull, removeUnwantedWhitespace } from '../../../../../utils/UtilFunctions';
const { When, Then } = createBdd(test);

Then(
  'I can see the review body for {string} is present in the list with {string} status',
  async ({ manageReviewBodiesPage, createReviewBodyPage }, datasetName: string, reviewBodyStatus: string) => {
    const dataset = createReviewBodyPage.createReviewBodyPageData.Create_Review_Body[datasetName];
    const expectedCountryValue: string = dataset.country_checkbox.toString();
    const reviewBodyName = await createReviewBodyPage.getUniqueOrgName();
    const createdReviewBodyRow = await manageReviewBodiesPage.findReviewBody(reviewBodyName, reviewBodyStatus);
    const createdReviewBodyCountry = createdReviewBodyRow.locator('td', {
      hasText: expectedCountryValue.replaceAll(',', ', '),
      hasNotText: 'QA',
    });
    expect(createdReviewBodyRow).toHaveCount(1);
    await expect(createdReviewBodyCountry).toBeVisible();
  }
);

Then(
  'I can see the updated review body is present in the list with {string}',
  async ({ manageReviewBodiesPage, editReviewBodyPage }, datasetName: string) => {
    const dataset = editReviewBodyPage.editReviewBodyPageData.Edit_Review_Body[datasetName];
    const expectedCountryValue: string = dataset.country_checkbox.toString();
    const updatedReviewBodyRow = await manageReviewBodiesPage.getRowByOrgName(
      await editReviewBodyPage.getUniqueOrgName(),
      true
    );
    const updatedReviewBodyCountry = updatedReviewBodyRow.locator('td', {
      hasText: expectedCountryValue.replaceAll(',', ', '),
      hasNotText: 'QA',
    });
    expect(updatedReviewBodyRow).toHaveCount(1);
    await expect(updatedReviewBodyCountry).toBeVisible();
  }
);

Then(
  'I can see the status of the review body is {string}',
  async ({ manageReviewBodiesPage, createReviewBodyPage }, status: string) => {
    const dataset = manageReviewBodiesPage.manageReviewBodiesPageData.Manage_Review_Body_Page;
    const createdReviewBodyRow = await manageReviewBodiesPage.getRowByOrgName(
      await createReviewBodyPage.getUniqueOrgName(),
      true
    );
    if (status.toLowerCase() == 'disabled') {
      expect(createdReviewBodyRow.locator(manageReviewBodiesPage.statusCell)).toHaveText(dataset.disabled_status);
    } else {
      expect(createdReviewBodyRow.locator(manageReviewBodiesPage.statusCell)).toHaveText(dataset.enabled_status);
    }
  }
);

Then(
  'I click the view edit link for the {string} review body',
  async ({ manageReviewBodiesPage, reviewBodyProfilePage }, status: string) => {
    const reviewBodyRow = await manageReviewBodiesPage.getRowByOrgName(await reviewBodyProfilePage.getOrgName(), true);
    const organisationStatusText = await removeUnwantedWhitespace(
      confirmStringNotNull(await reviewBodyRow.locator(manageReviewBodiesPage.status_from_list).textContent())
    );
    if (status === organisationStatusText.toLowerCase()) {
      await reviewBodyRow.locator(manageReviewBodiesPage.actionsLink).click();
    }
  }
);

Then(
  'I search {string} review body and click on view edit link for {string} with {string} status',
  async ({ createReviewBodyPage, manageReviewBodiesPage }, recordType: string, datasetName: string, status: string) => {
    let reviewBodyName: string;
    if (recordType.toLowerCase() == 'existing') {
      const dataset = createReviewBodyPage.createReviewBodyPageData.Create_Review_Body[datasetName];
      reviewBodyName = dataset.organisation_name_text;
    } else {
      reviewBodyName = await createReviewBodyPage.getUniqueOrgName();
    }
    const reviewBodyRow = await manageReviewBodiesPage.findReviewBody(reviewBodyName, status);
    await reviewBodyRow.locator(manageReviewBodiesPage.actionsLink).click();
  }
);

Then(
  'I can see the list is sorted by default in the alphabetical order of {string}',
  async ({ manageReviewBodiesPage }) => {
    const orgNames: string[] = await manageReviewBodiesPage.getOrgNamesListFromUI();
    const sortedOrgNames = [...orgNames].sort((a, b) => a.localeCompare(b, 'en', { sensitivity: 'base' }));
    expect(orgNames).toEqual(sortedOrgNames);
  }
);

Then(
  'I click the view edit link for the newly created review body',
  async ({ manageReviewBodiesPage, createReviewBodyPage }) => {
    const createdReviewBodyRow = await manageReviewBodiesPage.getRowByOrgName(
      await createReviewBodyPage.getUniqueOrgName(),
      true
    );
    await createdReviewBodyRow.locator(manageReviewBodiesPage.actionsLink).click();
  }
);

When(
  'I fill the search input for searching review bodies in manage review bodies page with {string} as the search query',
  async ({ manageReviewBodiesPage, commonItemsPage, userListReviewBodyPage }, searchQueryName: string) => {
    const searchQueryDataset =
      manageReviewBodiesPage.manageReviewBodiesPageData.Search_For_Review_Bodies.Search_Queries[searchQueryName];
    const searchKey = searchQueryDataset['search_input_text'];
    if ((await commonItemsPage.tableRows.count()) >= 2) {
      const userListBeforeSearch = await commonItemsPage.getAllUsersFromTheTable();
      const userValues: any = userListBeforeSearch.get('searchResultValues');
      await userListReviewBodyPage.setUserListBeforeSearch(userValues);
      await userListReviewBodyPage.setSearchKey(searchKey);
      await commonItemsPage.search_text.fill(searchKey);
    } else {
      throw new Error(`There are no items in list to search`);
    }
  }
);

When(
  'I can see the newly created review body should be present in the list with {string} status in the manage review bodies page',
  async ({ manageReviewBodiesPage, createReviewBodyPage }, reviewBodyStatus: string) => {
    const reviewBodyName = await createReviewBodyPage.getUniqueOrgName();
    await manageReviewBodiesPage.goto(
      manageReviewBodiesPage.manageReviewBodiesPageData.Manage_Review_Body_Page.enlarged_page_size
    );
    const foundRecords = await manageReviewBodiesPage.findReviewBody(reviewBodyName, reviewBodyStatus);
    expect(foundRecords).toBeDefined();
    expect(foundRecords).toHaveCount(1);
  }
);

When(
  'I select a {string} Review Body to View and Edit which is {string}',
  async ({ manageReviewBodiesPage }, reviewBodyName: string, reviewBodyStatus: string) => {
    const foundRecords = await manageReviewBodiesPage.findReviewBodyByStatus(reviewBodyName, reviewBodyStatus);
    expect(foundRecords).toBeDefined();
    expect(foundRecords).toHaveCount(1);
    await foundRecords.locator(manageReviewBodiesPage.actionsLink).click();
  }
);

// Then(
//   'I select a {string} Review Body to View and Edit which is {string}',
//   async ({ manageReviewBodiesPage }, orgNamePrefix: string, status: string) => {
//     let statusText: string;
//     await manageReviewBodiesPage.goto(
//       manageReviewBodiesPage.manageReviewBodiesPageData.Manage_Review_Body_Page.enlarged_page_size
//     );
//     if (status.toLowerCase() == 'active') {
//       statusText = manageReviewBodiesPage.manageReviewBodiesPageData.Manage_Review_Body_Page.enabled_status;
//     } else {
//       statusText = manageReviewBodiesPage.manageReviewBodiesPageData.Manage_Review_Body_Page.disabled_status;
//     }
//     const autoReviewBodyRows = await manageReviewBodiesPage.getRowByOrgName(orgNamePrefix, false);
//     const activeAutoReviewBodyRows = autoReviewBodyRows.filter({
//       has: manageReviewBodiesPage.statusCell.getByText(statusText),
//     });
//     const selectedReviewBodyRow = await returnSingleRandomLocator(activeAutoReviewBodyRows);
//     await selectedReviewBodyRow.locator(manageReviewBodiesPage.actionsLink).click();
//   }
// );
