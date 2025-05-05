import { createBdd } from 'playwright-bdd';
import { expect, test } from '../../../../../hooks/CustomFixtures';

const { Given, When, Then } = createBdd(test);

Given('I can see the search for user to add to review body page', async ({ searchAddUserReviewBodyPage }) => {
  await searchAddUserReviewBodyPage.assertOnSearchAddUserReviewBodyPage();
});

When(
  'I fill the search input with {string} as the search query',
  async ({ searchAddUserReviewBodyPage, commonItemsPage }, searchQueryName: string) => {
    const searchQueryDataset =
      searchAddUserReviewBodyPage.searchAddUserReviewBodyPageData.Search_Add_User_Review_Body.Search_Queries[
        searchQueryName
      ];
    await commonItemsPage.fillUIComponent(searchQueryDataset, 'search_input_text', searchAddUserReviewBodyPage);
  }
);

Then(
  'I can see that the add users to review body search page contains {string}',
  async ({ searchAddUserReviewBodyPage }, searchResult: string) => {
    if (searchResult.toLowerCase() == 'no_results') {
      await expect(searchAddUserReviewBodyPage.no_search_results_heading).toBeVisible();
      await expect(searchAddUserReviewBodyPage.no_search_results_guidance_text).toBeVisible();
      await expect(searchAddUserReviewBodyPage.back_to_users_link).toBeVisible();
      await expect(searchAddUserReviewBodyPage.manage_users_link).toBeVisible();
      // await expect(searchAddUserReviewBodyPage.back_to_users_link).toHaveText(
      //   `link text + getReviewBodyName(from Tiji step)`
      // );
    } else {
      await expect(searchAddUserReviewBodyPage.no_search_results_heading).not.toBeVisible();
      await expect(searchAddUserReviewBodyPage.no_search_results_guidance_text).not.toBeVisible();
      await expect(searchAddUserReviewBodyPage.back_to_users_link).not.toBeVisible();
      await expect(searchAddUserReviewBodyPage.manage_users_link).not.toBeVisible();
      await expect(searchAddUserReviewBodyPage.search_result_table).toBeVisible();
      const tableHeaders = await searchAddUserReviewBodyPage.search_result_table_header.all();
      for (let index = 0; index < tableHeaders.length; index++) {
        const expectedText =
          searchAddUserReviewBodyPage.searchAddUserReviewBodyPageData.Search_Add_User_Review_Body_Page
            .search_table_headings[index];
        expect(await tableHeaders[index].textContent()).toBe(expectedText);
      }
    }
  }
);

Then(
  'the add users to review body search has returned results with the {string}',
  async ({ searchAddUserReviewBodyPage }, searchQueryName: string) => {
    const searchQueryValue =
      searchAddUserReviewBodyPage.searchAddUserReviewBodyPageData.Search_Add_User_Review_Body.Search_Queries[
        searchQueryName
      ]['search_input_text'];
    const allResultRow = await searchAddUserReviewBodyPage.search_result_table_row.all();
    switch (searchQueryName) {
      case 'Existing_QA_User_First_Name':
        for (const element of allResultRow) {
          const firstNameTableCell = element.locator(searchAddUserReviewBodyPage.search_result_table_first_name);
          await expect(firstNameTableCell).toContainText(searchQueryValue);
        }
        break;
      case 'Existing_QA_User_Last_Name':
        for (const element of allResultRow) {
          const lastNameTableCell = element.locator(searchAddUserReviewBodyPage.search_result_table_last_name);
          await expect(lastNameTableCell).toContainText(searchQueryValue);
        }
        break;
      case 'Existing_QA_User_Email':
        for (const element of allResultRow) {
          const emailTableCell = element.locator(searchAddUserReviewBodyPage.search_result_table_email);
          await expect(emailTableCell).toContainText(searchQueryValue);
        }
        break;
      default:
        throw new Error(`${searchQueryName} is not a valid option`);
    }
  }
);
