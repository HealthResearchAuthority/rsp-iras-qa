import { createBdd } from 'playwright-bdd';
import { expect, test } from '../../../../../hooks/CustomFixtures';
import { confirmArrayNotNull } from '../../../../../utils/UtilFunctions';
const { Given, When, Then } = createBdd(test);

When(
  'I navigate to the user list page of the {string} review body',
  async ({ userListReviewBodyPage }, revBodyName: string) => {
    const reviewBodyId = userListReviewBodyPage.userListReviewBodyPageTestData.Review_Body_Ids[revBodyName];
    userListReviewBodyPage.goto(reviewBodyId);
    userListReviewBodyPage.assertOnUserListReviewBodyPage();
  }
);

Then(
  'I can see the user list page of the review body',
  async ({ userListReviewBodyPage, reviewBodyProfilePage, commonItemsPage }) => {
    await userListReviewBodyPage.assertOnUserListReviewBodyPage();
    const organisationName = await reviewBodyProfilePage.getOrgName();
    await expect(userListReviewBodyPage.page_heading).toHaveText(
      userListReviewBodyPage.userListReviewBodyPageTestData.Review_Body_User_List_Page.page_heading + organisationName
    );
    if ((await userListReviewBodyPage.userListTableRows.count()) >= 2) {
      const userList = await commonItemsPage.getUsers();
      const emailAddress: any = userList.get('emailAddressValues');
      await userListReviewBodyPage.setUserEmail(emailAddress);
      const firstName: any = userList.get('firstNameValues');
      await userListReviewBodyPage.setUserFirstName(firstName);
      const lastName: any = userList.get('lastNameValues');
      await userListReviewBodyPage.setUserLastName(lastName);
      await userListReviewBodyPage.setFirstName(firstName[0]);
      await userListReviewBodyPage.setLastName(lastName[0]);
      await userListReviewBodyPage.setEmail(emailAddress[0]);
    }
  }
);

Then(
  'I can see no users in the review body with a message to add users to the review body',
  async ({ userListReviewBodyPage }) => {
    expect(await userListReviewBodyPage.userListTableRows.count()).toBe(0);
  }
);

Then(
  'I can see the user list of the selected review body is sorted by default in the alphabetical order of the {string}',
  async ({ userListReviewBodyPage }, sortField: string) => {
    let firstNameValues: any;
    if (sortField.toLowerCase() === 'first name') {
      firstNameValues = await userListReviewBodyPage.getUserFirstName();
    } else {
      throw new Error(`${sortField} is not a valid option`);
    }
    const sortedList = [...firstNameValues].sort((a, b) => a.localeCompare(b, 'en', { sensitivity: 'base' }));
    expect(firstNameValues).toEqual(sortedList);
  }
);

When(
  'I enter the {string} of the {string} user shown on the current review body users list, into the search field',
  async ({ userListReviewBodyPage, commonItemsPage }, fieldKey: string, position: string) => {
    if ((await userListReviewBodyPage.userListTableRows.count()) >= 2) {
      let searchKey: string = '';
      if (fieldKey === 'First_Name' || fieldKey === 'Last_Name' || fieldKey === 'Email_Address') {
        searchKey = await userListReviewBodyPage.getSearchQueryFNameLNameEmail(position, fieldKey);
      } else if (fieldKey === 'Full_Name') {
        searchKey = await userListReviewBodyPage.getSearchQueryFullName(position);
      }
      const userListBeforeSearch = await commonItemsPage.getAllUsersFromTheTable();
      const userValues: any = userListBeforeSearch.get('searchResultValues');
      await userListReviewBodyPage.setUserListBeforeSearch(userValues);
      await userListReviewBodyPage.setSearchKey(searchKey);
      commonItemsPage.search_text.fill(searchKey);
    } else {
      throw new Error(`There are no items in list to search`);
    }
  }
);

Then(
  'the system displays search results matching the search criteria',
  async ({ userListReviewBodyPage, commonItemsPage }) => {
    const userValues = await userListReviewBodyPage.getUserListBeforeSearch();
    const searchKey = await userListReviewBodyPage.getSearchKey();
    const searchTerms = await commonItemsPage.splitSearchTerm(searchKey);
    const filteredSearchResults = await commonItemsPage.filterResults(userValues, searchTerms);
    const userList = await commonItemsPage.getAllUsersFromTheTable();
    const userListAfterSearch: any = userList.get('searchResultValues');
    expect.soft(filteredSearchResults.slice(0, userListAfterSearch.length)).toEqual(userListAfterSearch);
    const searchResult = await commonItemsPage.validateSearchResultsMultipleWordsSearchKey(
      userListAfterSearch,
      searchTerms
    );
    expect.soft(searchResult).toBeTruthy();
    await userListReviewBodyPage.updateUserInfo();
  }
);

When(
  'I enter an input into the search field to search for the removed user of the review body',
  async ({ userListReviewBodyPage, commonItemsPage, checkRemoveUserReviewBodyPage }) => {
    const searchKey = await checkRemoveUserReviewBodyPage.getEmail();
    await userListReviewBodyPage.setSearchKey(searchKey);
    await commonItemsPage.search_text.fill(searchKey);
  }
);

Then(
  'the system displays no results found message in the user list page of the review body',
  async ({ userListReviewBodyPage, reviewBodyProfilePage }) => {
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
      await expect(userProfilePage.role_value).toHaveText(await checkRemoveUserReviewBodyPage.getRole());
    }
  }
);

Given(
  'I see that the newly added user appears in the user list page for the review body',
  async ({ searchAddUserReviewBodyPage, userListReviewBodyPage }) => {
    await expect(userListReviewBodyPage.userListTableBodyRows).toHaveCount(1);
    await expect(userListReviewBodyPage.first_name_value_first_row).toHaveText(
      await searchAddUserReviewBodyPage.getUserFirstName()
    );
    await expect(userListReviewBodyPage.last_name_value_first_row).toHaveText(
      await searchAddUserReviewBodyPage.getUserLastName()
    );
    await expect(userListReviewBodyPage.email_address_value_first_row).toHaveText(
      await searchAddUserReviewBodyPage.getUserEmail()
    );
    await expect(userListReviewBodyPage.status_value_first_row).toHaveText(
      await searchAddUserReviewBodyPage.getUserStatus()
    );
  }
);

When(
  'I capture the name of the newly added user in the user list page of the review body',
  async ({ createUserProfilePage, userListReviewBodyPage, commonItemsPage }) => {
    if ((await commonItemsPage.tableBodyRows.count()) >= 1) {
      const userListBeforeSearch = await commonItemsPage.getAllUsersFromTheTable();
      const userValues: string[] = confirmArrayNotNull(userListBeforeSearch.get('searchResultValues'));
      await userListReviewBodyPage.setUserListBeforeSearch(userValues);
      await userListReviewBodyPage.setSearchKey(await createUserProfilePage.getUniqueEmail());
    } else {
      throw new Error(`There are no items in list to search`);
    }
  }
);
