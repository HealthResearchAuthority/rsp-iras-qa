import { createBdd } from 'playwright-bdd';
import { test, expect } from '../../../../../hooks/CustomFixtures';
import { confirmArrayNotNull, getRandomNumber } from '../../../../../utils/UtilFunctions';
const { When, Then } = createBdd(test);

Then(
  'I can see the review body for {string} is present in the list with {string} status',
  async ({ manageReviewBodiesPage, createReviewBodyPage }, datasetName: string, status: string) => {
    const reviewBodyStatus = await manageReviewBodiesPage.getReviewBodyStatus(status);
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
    await manageReviewBodiesPage.setReviewBodyRow(createdReviewBodyRow);
  }
);

Then(
  'I can see the updated review body is present in the list with {string}',
  async ({ manageReviewBodiesPage, editReviewBodyPage }, datasetName: string) => {
    const dataset = editReviewBodyPage.editReviewBodyPageData.Edit_Review_Body[datasetName];
    const expectedCountryValue: string = dataset.country_checkbox.toString();
    const reviewBodyName = await editReviewBodyPage.getUniqueOrgName();
    const updatedReviewBodyRow = await manageReviewBodiesPage.findReviewBody(reviewBodyName);
    const updatedReviewBodyCountry = updatedReviewBodyRow.locator('td', {
      hasText: expectedCountryValue.replaceAll(',', ', '),
      hasNotText: 'QA',
    });
    expect(updatedReviewBodyRow).toHaveCount(1);
    await expect(updatedReviewBodyCountry).toBeVisible();
    await manageReviewBodiesPage.setReviewBodyRow(updatedReviewBodyRow);
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
  'I click the view edit link for the {string}',
  async ({ manageReviewBodiesPage, createReviewBodyPage, reviewBodyProfilePage }, inputType: string) => {
    const reviewBodyName = await manageReviewBodiesPage.getReviewBodyName(
      inputType,
      reviewBodyProfilePage,
      createReviewBodyPage
    );
    await manageReviewBodiesPage.goto(
      manageReviewBodiesPage.manageReviewBodiesPageData.Manage_Review_Body_Page.enlarged_page_size,
      reviewBodyName
    );
    const createdReviewBodyRow = await manageReviewBodiesPage.findReviewBody(reviewBodyName);
    await createdReviewBodyRow.locator(manageReviewBodiesPage.actionsLink).click();
  }
);

When(
  'I can see the {string} should be present in the list with {string} status in the manage review bodies page',
  async (
    { manageReviewBodiesPage, createReviewBodyPage, reviewBodyProfilePage },
    inputType: string,
    status: string
  ) => {
    const reviewBodyStatus = await manageReviewBodiesPage.getReviewBodyStatus(status);
    const reviewBodyName = await manageReviewBodiesPage.getReviewBodyName(
      inputType,
      reviewBodyProfilePage,
      createReviewBodyPage
    );
    await manageReviewBodiesPage.goto(
      manageReviewBodiesPage.manageReviewBodiesPageData.Manage_Review_Body_Page.enlarged_page_size,
      reviewBodyName
    );
    const foundRecords = await manageReviewBodiesPage.findReviewBody(reviewBodyName, reviewBodyStatus);
    expect(foundRecords).toBeDefined();
    expect(foundRecords).toHaveCount(1);
    await manageReviewBodiesPage.setReviewBodyRow(foundRecords);
  }
);

When(
  'I select a {string} review Body to View and Edit which is {string}',
  async ({ manageReviewBodiesPage }, reviewBodyName: string, status: string) => {
    const reviewBodyStatus = await manageReviewBodiesPage.getReviewBodyStatus(status);
    const foundRecords = await manageReviewBodiesPage.findReviewBody(reviewBodyName, reviewBodyStatus);
    expect(foundRecords).toBeDefined();
    expect(foundRecords).toHaveCount(1);
    await foundRecords.locator(manageReviewBodiesPage.actionsLink).click();
  }
);

When('I select a review body from the list to View and Edit', async ({ manageReviewBodiesPage }) => {
  const noOfLinks = await manageReviewBodiesPage.actionsLink.count().then((result) => result - 1);
  const index = await getRandomNumber(0, noOfLinks);
  await manageReviewBodiesPage.actionsLink.nth(index).click();
});

Then('the system displays review bodies matching the search criteria', async ({ commonItemsPage }) => {
  const searchKey = await commonItemsPage.getSearchKey();
  const searchTerms = await commonItemsPage.splitSearchTerm(searchKey);
  const orgList = await commonItemsPage.getAllOrgNamesFromTheTable();
  const orgListAfterSearch: string[] = confirmArrayNotNull(orgList.get('searchResultValues'));
  const searchResult = await commonItemsPage.validateSearchResultsMultipleWordsSearchKey(
    orgListAfterSearch,
    searchTerms
  );
  expect(searchResult).toBeTruthy();
  expect(orgListAfterSearch).toEqual(searchResult);
});

Then('I click the view edit link', async ({ manageReviewBodiesPage }) => {
  const createdReviewBodyRow = await manageReviewBodiesPage.getReviewBodyRow();
  await createdReviewBodyRow.locator(manageReviewBodiesPage.actionsLink).click();
});

Then(
  'I can see the manage review bodies list sorted by {string} order of the {string} on the {string} page',
  async (
    { manageReviewBodiesPage, commonItemsPage },
    sortDirection: string,
    sortField: string,
    currentPage: string
  ) => {
    let sortedList: string[];
    let columnIndex: number;
    switch (sortField.toLowerCase()) {
      case 'organisation name':
        columnIndex = 0;
        break;
      case 'country':
        columnIndex = 1;
        break;
      case 'status':
        columnIndex = 2;
        break;
      default:
        throw new Error(`${sortField} is not a valid option`);
    }
    let actualList: string[] = [];
    if (sortField.toLowerCase() == 'country') {
      const originalList = await commonItemsPage.getActualListValues(commonItemsPage.tableBodyRows, columnIndex);
      for (const country of originalList) {
        if (country.includes(',')) {
          actualList.push(country.slice(0, country.indexOf(',')));
        } else {
          actualList.push(country);
        }
      }
    } else {
      actualList = await commonItemsPage.getActualListValues(commonItemsPage.tableBodyRows, columnIndex);
    }
    if (sortDirection.toLowerCase() == 'ascending') {
      sortedList = [...actualList].toSorted((a, b) => a.localeCompare(b, 'en', { sensitivity: 'base' }));
      if (sortField.toLowerCase() == 'status' && currentPage.toLowerCase() == 'first') {
        expect(actualList).toContain(
          manageReviewBodiesPage.manageReviewBodiesPageData.Manage_Review_Body_Page.enabled_status
        );
      }
    } else {
      sortedList = [...actualList].toSorted((a, b) => b.localeCompare(a, 'en', { sensitivity: 'base' }));
      if (sortField.toLowerCase() == 'status' && currentPage.toLowerCase() == 'first') {
        expect(actualList).toContain(
          manageReviewBodiesPage.manageReviewBodiesPageData.Manage_Review_Body_Page.disabled_status
        );
      }
    }
    expect(actualList).toEqual(sortedList);
  }
);

When(
  'I select advanced filters in the manage review bodies page using {string}',
  async ({ manageReviewBodiesPage, commonItemsPage }, filterDatasetName: string) => {
    const dataset = manageReviewBodiesPage.manageReviewBodiesPageData.Advanced_Filters[filterDatasetName];
    for (const key in dataset) {
      if (Object.hasOwn(dataset, key)) {
        await manageReviewBodiesPage[key + '_chevron'].click();
        await commonItemsPage.fillUIComponent(dataset, key, manageReviewBodiesPage);
      }
    }
  }
);

When(
  'I can see the results matching the search {string} and filter criteria {string} for manage review bodies page',
  async ({ manageReviewBodiesPage, commonItemsPage }, searchDatasetName: string, filterDatasetName: string) => {
    const searchCriteriaDataset =
      manageReviewBodiesPage.manageReviewBodiesPageData.Search_For_Review_Bodies.Search_Queries[searchDatasetName];
    const filterDataset = manageReviewBodiesPage.manageReviewBodiesPageData.Advanced_Filters[filterDatasetName];
    await manageReviewBodiesPage.validateResults(commonItemsPage, searchCriteriaDataset, filterDataset, true);
  }
);

When(
  'I can see the results matching the filter criteria {string} for manage review bodies page',
  async ({ manageReviewBodiesPage, commonItemsPage }, filterDatasetName: string) => {
    const filterDataset = manageReviewBodiesPage.manageReviewBodiesPageData.Advanced_Filters[filterDatasetName];
    await manageReviewBodiesPage.validateResults(commonItemsPage, {}, filterDataset, false);
  }
);

Then(
  'I verify the hint text based on the {string} for manage review bodies page',
  async ({ manageReviewBodiesPage }, filterDatasetName: string) => {
    const dataset = manageReviewBodiesPage.manageReviewBodiesPageData.Advanced_Filters[filterDatasetName];
    for (const key in dataset) {
      if (Object.hasOwn(dataset, key)) {
        if (key === 'country_checkbox') {
          const numberOfCheckboxesSelected = dataset[key].length;
          const hintLabel =
            numberOfCheckboxesSelected +
            ' ' +
            manageReviewBodiesPage.manageReviewBodiesPageData.Manage_Review_Body_Page.selected_checkboxes_hint_label;
          expect(await manageReviewBodiesPage.country_selected_hint_label.textContent()).toBe(hintLabel);
        }
      }
    }
  }
);

Then(
  'I expand the chevrons for {string} in manage review bodies page',
  async ({ manageReviewBodiesPage, commonItemsPage }, filterDatasetName: string) => {
    const dataset = manageReviewBodiesPage.manageReviewBodiesPageData.Advanced_Filters[filterDatasetName];
    await commonItemsPage.advanced_filter_chevron.click();
    for (const key in dataset) {
      if (Object.hasOwn(dataset, key)) {
        await manageReviewBodiesPage[key + '_chevron'].click();
      }
    }
  }
);

Then(
  'I can see the {string} ui labels in manage review bodies page',
  async ({ manageReviewBodiesPage }, datasetName: string) => {
    const dataset = manageReviewBodiesPage.manageReviewBodiesPageData[datasetName];
    for (const key in dataset) {
      if (Object.hasOwn(dataset, key)) {
        await expect(manageReviewBodiesPage[key].getByText(dataset[key])).toBeVisible();
      }
    }
  }
);

Then(
  'I can see the selected filters {string} are removed from active filters for manage review bodies page',
  async ({ manageReviewBodiesPage, commonItemsPage }, filterDatasetName: string) => {
    const dataset = manageReviewBodiesPage.manageReviewBodiesPageData.Advanced_Filters[filterDatasetName];
    for (const key in dataset) {
      if (Object.hasOwn(dataset, key)) {
        if (key === 'country_checkbox') {
          for (const filterLabel of dataset[key]) {
            const activeLabel =
              manageReviewBodiesPage.manageReviewBodiesPageData.Manage_Review_Body_Page.country_label +
              ' - ' +
              filterLabel;
            await expect(commonItemsPage.active_filter_list.getByText(activeLabel)).not.toBeVisible();
          }
        } else if (key === 'status_radio') {
          const activeLabel =
            manageReviewBodiesPage.manageReviewBodiesPageData.Manage_Review_Body_Page.status_label +
            ' - ' +
            dataset[key];
          await expect(commonItemsPage.active_filter_list.getByText(activeLabel)).not.toBeVisible();
        }
      }
    }
  }
);
