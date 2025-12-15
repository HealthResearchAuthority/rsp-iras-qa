import { createBdd } from 'playwright-bdd';
import { expect, test } from '../../../../../hooks/CustomFixtures';
import { confirmArrayNotNull } from '../../../../../utils/UtilFunctions';
const { When, Then } = createBdd(test);

When(
  'I navigate to the user list page of the {string} review body',
  async ({ userListReviewBodyPage, commonItemsPage }, revBodyName: string) => {
    const reviewBodyId = userListReviewBodyPage.userListReviewBodyPageTestData.Review_Body_Ids[revBodyName];
    userListReviewBodyPage.goto(reviewBodyId);
    userListReviewBodyPage.assertOnUserListReviewBodyPage(commonItemsPage);
  }
);

Then(
  'the system displays search results matching the search criteria',
  async ({ userListReviewBodyPage, commonItemsPage }) => {
    // const userValues = await commonItemsPage.getUserListBeforeSearch();
    const searchKey = await commonItemsPage.getSearchKey();
    const searchTerms = await commonItemsPage.splitSearchTerm(searchKey);
    // const filteredSearchResults = await commonItemsPage.filterResults(userValues, searchTerms);
    const userList = await commonItemsPage.getAllUsersFromTheTable();
    const userListAfterSearch: any = userList.get('searchResultValues');
    // expect.soft(filteredSearchResults).toEqual(userListAfterSearch);
    const searchResult = await commonItemsPage.validateSearchResultsMultipleWordsSearchKey(
      userListAfterSearch,
      searchTerms
    );
    expect.soft(searchResult).toBeTruthy();
    await userListReviewBodyPage.updateUserInfo(commonItemsPage);
  }
);

When(
  'I enter an input into the search field to search for the removed user of the review body',
  async ({ commonItemsPage, checkRemoveUserReviewBodyPage }) => {
    const searchKey = await checkRemoveUserReviewBodyPage.getEmail();
    await commonItemsPage.setSearchKey(searchKey);
    await commonItemsPage.search_text.fill(searchKey);
  }
);

Then(
  'the system displays no results found message in the user list page of the review body',
  async ({ userListReviewBodyPage, reviewBodyProfilePage, commonItemsPage, searchAddUserReviewBodyPage }) => {
    await userListReviewBodyPage.assertOnUserListReviewBodyPage(commonItemsPage);
    const organisationName = await reviewBodyProfilePage.getOrgName();
    await expect
      .soft(userListReviewBodyPage.page_heading)
      .toHaveText(
        userListReviewBodyPage.userListReviewBodyPageTestData.Review_Body_User_List_Page.page_heading + organisationName
      );
    await expect
      .soft(userListReviewBodyPage.no_results_heading)
      .toHaveText(userListReviewBodyPage.userListReviewBodyPageTestData.Review_Body_User_List_Page.no_results_heading);
    await expect
      .soft(userListReviewBodyPage.no_results_guidance_text)
      .toHaveText(
        userListReviewBodyPage.userListReviewBodyPageTestData.Review_Body_User_List_Page.no_results_guidance_text
      );
    expect(await commonItemsPage.userListTableRows.count()).toBe(0);
    await expect
      .soft(searchAddUserReviewBodyPage.back_to_users_link)
      .toHaveText(
        userListReviewBodyPage.userListReviewBodyPageTestData.Review_Body_User_List_Page.back_to_users_link +
          organisationName
      );
  }
);

Then(
  'I can see the user profile page of the removed user from the review body',
  async ({ userProfilePage, checkRemoveUserReviewBodyPage }) => {
    await userProfilePage.assertOnUserProfilePage();
    const userIdStartIndex = userProfilePage.page.url().indexOf('=') + 1;
    const userIdEndIndex = userProfilePage.page.url().indexOf('&');
    await userProfilePage.setUserId(userProfilePage.page.url().substring(userIdStartIndex, userIdEndIndex));
    await expect(userProfilePage.title_value).toHaveText(await checkRemoveUserReviewBodyPage.getTitle());
    await expect(userProfilePage.first_name_value).toHaveText(await checkRemoveUserReviewBodyPage.getFirstName());
    await expect(userProfilePage.last_name_value).toHaveText(await checkRemoveUserReviewBodyPage.getLastName());
    await expect(userProfilePage.email_address_value).toHaveText(await checkRemoveUserReviewBodyPage.getEmail());
    await expect(userProfilePage.telephone_value).toHaveText(await checkRemoveUserReviewBodyPage.getTelephone());
    await expect(userProfilePage.organisation_value).toHaveText(await checkRemoveUserReviewBodyPage.getOrganisation());
    await expect(userProfilePage.job_title_value).toHaveText(await checkRemoveUserReviewBodyPage.getJobTitle());
    if (await userProfilePage.role_value.isVisible()) {
      const expectedRaw = await checkRemoveUserReviewBodyPage.getRole();
      await expect.soft(userProfilePage.role_value).toContainText(
        expectedRaw.split(',').map((r) => r.trim()),
        { useInnerText: true }
      );
    }
  }
);

When(
  'I capture the name of the newly added user in the user list page of the review body',
  async ({ createUserProfilePage, commonItemsPage }) => {
    if ((await commonItemsPage.tableBodyRows.count()) >= 1) {
      if (await commonItemsPage.firstPage.isVisible()) {
        await commonItemsPage.firstPage.click();
      }
      const userListBeforeSearch = await commonItemsPage.getAllUsersFromTheTable();
      const userValues: string[] = confirmArrayNotNull(userListBeforeSearch.get('searchResultValues'));
      await commonItemsPage.setUserListBeforeSearch(userValues);
      await commonItemsPage.setSearchKey(await createUserProfilePage.getUniqueEmail());
    } else {
      throw new Error(`There are no items in list to search`);
    }
  }
);
