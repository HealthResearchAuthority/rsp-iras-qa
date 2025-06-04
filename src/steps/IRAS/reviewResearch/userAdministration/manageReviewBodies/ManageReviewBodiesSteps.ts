import { createBdd } from 'playwright-bdd';
import { test, expect } from '../../../../../hooks/CustomFixtures';
import { confirmStringNotNull, removeUnwantedWhitespace } from '../../../../../utils/UtilFunctions';
const { When, Then } = createBdd(test);

Then(
  'I can see the review body for {string} is present in the list with {string} status',
  async ({ manageReviewBodiesPage, createReviewBodyPage }, datasetName: string, status: string) => {
    let reviewBodyStatus: string;
    const datasetStatus = manageReviewBodiesPage.manageReviewBodiesPageData.Manage_Review_Body_Page;
    if (status.toLowerCase() == 'disabled') {
      reviewBodyStatus = datasetStatus.disabled_status;
    } else {
      reviewBodyStatus = datasetStatus.enabled_status;
    }
    const dataset = createReviewBodyPage.createReviewBodyPageData.Create_Review_Body[datasetName];
    const expectedCountryValue: string = dataset.country_checkbox.toString();
    const reviewBodyName = await createReviewBodyPage.getUniqueOrgName();
    await manageReviewBodiesPage.goto(
      manageReviewBodiesPage.manageReviewBodiesPageData.Manage_Review_Body_Page.enlarged_page_size,
      reviewBodyName
    );
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
  'I can see the review body for {string} is present in the list',
  async ({ manageReviewBodiesPage, createReviewBodyPage }, datasetName: string) => {
    const dataset = createReviewBodyPage.createReviewBodyPageData.Create_Review_Body[datasetName];
    const expectedCountryValue: string = dataset.country_checkbox.toString();
    const reviewBodyName = await createReviewBodyPage.getUniqueOrgName();
    await manageReviewBodiesPage.goto(
      manageReviewBodiesPage.manageReviewBodiesPageData.Manage_Review_Body_Page.enlarged_page_size,
      reviewBodyName
    );
    const createdReviewBodyRow = await manageReviewBodiesPage.findReviewBody(reviewBodyName);
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
    const reviewBodyName = await editReviewBodyPage.getUniqueOrgName();
    await manageReviewBodiesPage.goto(
      manageReviewBodiesPage.manageReviewBodiesPageData.Manage_Review_Body_Page.enlarged_page_size,
      reviewBodyName
    );
    const updatedReviewBodyRow = await manageReviewBodiesPage.findReviewBody(reviewBodyName);
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
    let reviewBodyStatus: string;
    if (recordType.toLowerCase() == 'existing') {
      const dataset = createReviewBodyPage.createReviewBodyPageData.Create_Review_Body[datasetName];
      reviewBodyName = dataset.organisation_name_text;
    } else {
      reviewBodyName = await createReviewBodyPage.getUniqueOrgName();
    }
    const datasetStatus = manageReviewBodiesPage.manageReviewBodiesPageData.Manage_Review_Body_Page;
    if (status.toLowerCase() == 'disabled') {
      reviewBodyStatus = datasetStatus.disabled_status;
    } else {
      reviewBodyStatus = datasetStatus.enabled_status;
    }
    await manageReviewBodiesPage.goto(
      manageReviewBodiesPage.manageReviewBodiesPageData.Manage_Review_Body_Page.enlarged_page_size,
      reviewBodyName
    );
    const reviewBodyRow = await manageReviewBodiesPage.findReviewBody(reviewBodyName, reviewBodyStatus);
    await reviewBodyRow.locator(manageReviewBodiesPage.actionsLink).click();
  }
);

Then(
  'I click the view edit link for the newly created review body',
  async ({ manageReviewBodiesPage, createReviewBodyPage }) => {
    const reviewBodyName = await createReviewBodyPage.getUniqueOrgName();
    await manageReviewBodiesPage.goto(
      manageReviewBodiesPage.manageReviewBodiesPageData.Manage_Review_Body_Page.enlarged_page_size,
      reviewBodyName
    );
    const createdReviewBodyRow = await manageReviewBodiesPage.findReviewBody(reviewBodyName);
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
      await userListReviewBodyPage.setSearchKey(searchKey);
      await commonItemsPage.search_text.fill(searchKey);
    } else {
      throw new Error(`There are no items in list to search`);
    }
  }
);

When(
  'I can see the newly created review body should be present in the list with {string} status in the manage review bodies page',
  async ({ manageReviewBodiesPage, createReviewBodyPage }, status: string) => {
    let reviewBodyStatus: string;
    const dataset = manageReviewBodiesPage.manageReviewBodiesPageData.Manage_Review_Body_Page;
    if (status.toLowerCase() == 'disabled') {
      reviewBodyStatus = dataset.disabled_status;
    } else {
      reviewBodyStatus = dataset.enabled_status;
    }
    const reviewBodyName = await createReviewBodyPage.getUniqueOrgName();
    await manageReviewBodiesPage.goto(
      manageReviewBodiesPage.manageReviewBodiesPageData.Manage_Review_Body_Page.enlarged_page_size,
      reviewBodyName
    );
    const foundRecords = await manageReviewBodiesPage.findReviewBody(reviewBodyName, reviewBodyStatus);
    expect(foundRecords).toBeDefined();
    expect(foundRecords).toHaveCount(1);
  }
);

When(
  'I select a {string} Review Body to View and Edit which is {string}',
  async ({ manageReviewBodiesPage }, reviewBodyName: string, status: string) => {
    let reviewBodyStatus: string;
    const dataset = manageReviewBodiesPage.manageReviewBodiesPageData.Manage_Review_Body_Page;
    if (status.toLowerCase() == 'disabled') {
      reviewBodyStatus = dataset.disabled_status;
    } else {
      reviewBodyStatus = dataset.enabled_status;
    }
    const foundRecords = await manageReviewBodiesPage.findReviewBodyByStatus(reviewBodyName, reviewBodyStatus);
    expect(foundRecords).toBeDefined();
    expect(foundRecords).toHaveCount(1);
    await foundRecords.locator(manageReviewBodiesPage.actionsLink).click();
  }
);

Then(
  'the system displays review bodies matching the search criteria',
  async ({ userListReviewBodyPage, commonItemsPage }) => {
    const searchKey = await userListReviewBodyPage.getSearchKey();
    const searchTerms = await commonItemsPage.splitSearchTerm(searchKey);
    const orgList = await commonItemsPage.getAllOrgNamesFromTheTable();
    const orgListAfterSearch: any = orgList.get('searchResultValues');
    const searchResult = await commonItemsPage.validateSearchResultsMultipleWordsSearchKey(
      orgListAfterSearch,
      searchTerms
    );
    expect(searchResult).toBeTruthy();
    expect(orgListAfterSearch).toEqual(searchResult);
  }
);
