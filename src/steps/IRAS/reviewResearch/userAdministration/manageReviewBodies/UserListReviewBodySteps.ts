import { createBdd } from 'playwright-bdd';
import { expect, test } from '../../../../../hooks/CustomFixtures';
const { When, Then } = createBdd(test);

Then('I can see the user list page of the review body', async ({ userListReviewBodyPage, reviewBodyProfilePage }) => {
  await userListReviewBodyPage.assertOnUserListReviewBodyPage();
  const organisationName = await reviewBodyProfilePage.getOrgName();
  await expect(userListReviewBodyPage.page_heading).toHaveText(
    userListReviewBodyPage.userListReviewBodyPageTestData.Review_Body_User_List_Page.page_heading + organisationName
  );
});

When(
  'I enter an input into the search field to search for the existing user of the current review body for {string}',
  async ({ userListReviewBodyPage, commonItemsPage }, fieldKey: string) => {
    if ((await userListReviewBodyPage.userListTableRows.count()) >= 2) {
      let searchKey: string = '';
      const userList = await commonItemsPage.getUsers();
      if (fieldKey === 'Email_Address') {
        const emailAddressValues: any = userList.get('emailAddressValues');
        searchKey = emailAddressValues[0];
      } else if (fieldKey === 'First_Name') {
        const firstNameValues: any = userList.get('firstNameValues');
        searchKey = firstNameValues[0];
      } else if (fieldKey === 'Last_Name') {
        const lastNameValues: any = userList.get('lastNameValues');
        searchKey = lastNameValues[0];
      }

      if (await userListReviewBodyPage.first_page_link.isVisible()) {
        await userListReviewBodyPage.first_page_link.click(); //work around due to bug
      }
      const userListBeforeSearch = await commonItemsPage.getAllUsersFromTheTable();
      const userValues: any = userListBeforeSearch.get('searchResultValues');
      await userListReviewBodyPage.setUserListBeforeSearch(userValues);
      if (await userListReviewBodyPage.first_page_link.isVisible()) {
        await userListReviewBodyPage.first_page_link.click(); //work around due to bug
      }
      await userListReviewBodyPage.setSearchKey(searchKey);
      userListReviewBodyPage.search_text.fill(searchKey);
    }
  }
);

Then(
  'the system displays search results matching the search criteria',
  async ({ userListReviewBodyPage, commonItemsPage }) => {
    const userValues = await userListReviewBodyPage.getUserListBeforeSearch();
    const searchKey = await userListReviewBodyPage.getSearchKey();
    const filteredSearchResults: string[] = userValues.filter((result) => result.includes(searchKey));
    const userList = await commonItemsPage.getAllUsersFromTheTable();
    const userListAfterSearch: any = userList.get('searchResultValues');
    expect(filteredSearchResults).toEqual(userListAfterSearch);
    for (const val of userListAfterSearch) {
      if (val.includes(searchKey)) {
        return true;
      }
    }
    return false;
  }
);

When(
  'I enter an input into the search field to search for the removed user of the review body',
  async ({ userListReviewBodyPage, checkRemoveUserReviewBodyPage }) => {
    const searchKey = await checkRemoveUserReviewBodyPage.getEmail();
    await userListReviewBodyPage.setSearchKey(searchKey);
    await userListReviewBodyPage.search_text.fill(searchKey);
  }
);

Then('the system displays no results found message', async ({ userListReviewBodyPage, reviewBodyProfilePage }) => {
  await userListReviewBodyPage.assertOnUserListReviewBodyPage();
  const organisationName = await reviewBodyProfilePage.getOrgName();
  await expect(userListReviewBodyPage.page_heading).toHaveText(
    userListReviewBodyPage.userListReviewBodyPageTestData.Review_Body_User_List_Page.page_heading + organisationName
  );
  await expect(userListReviewBodyPage.no_results_heading).toHaveText(
    userListReviewBodyPage.userListReviewBodyPageTestData.Review_Body_User_List_Page.no_results_heading
  );
  await expect(userListReviewBodyPage.no_results_guidance_text).toHaveText(
    userListReviewBodyPage.userListReviewBodyPageTestData.Review_Body_User_List_Page.no_results_guidance_text
  );
  expect(await userListReviewBodyPage.userListTableRows.count()).toBe(0);
  await expect(userListReviewBodyPage.back_to_users_link).toHaveText(
    userListReviewBodyPage.userListReviewBodyPageTestData.Review_Body_User_List_Page.back_to_users_link +
      organisationName
  );
});
