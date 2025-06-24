import { createBdd } from 'playwright-bdd';
import { test, expect } from '../../../../../hooks/CustomFixtures';
import { confirmArrayNotNull } from '../../../../../utils/UtilFunctions';
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

Then(
  'the system displays review bodies matching the search criteria',
  async ({ userListReviewBodyPage, commonItemsPage }) => {
    const searchKey = await userListReviewBodyPage.getSearchKey();
    const searchTerms = await commonItemsPage.splitSearchTerm(searchKey);
    const orgList = await commonItemsPage.getAllOrgNamesFromTheTable();
    const orgListAfterSearch: string[] = confirmArrayNotNull(orgList.get('searchResultValues'));
    const searchResult = await commonItemsPage.validateSearchResultsMultipleWordsSearchKey(
      orgListAfterSearch,
      searchTerms
    );
    expect(searchResult).toBeTruthy();
    expect(orgListAfterSearch).toEqual(searchResult);
  }
);

Then('I click the view edit link', async ({ manageReviewBodiesPage }) => {
  const createdReviewBodyRow = await manageReviewBodiesPage.getReviewBodyRow();
  await createdReviewBodyRow.locator(manageReviewBodiesPage.actionsLink).click();
});
