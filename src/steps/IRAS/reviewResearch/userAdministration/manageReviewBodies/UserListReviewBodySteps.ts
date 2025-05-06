import { createBdd } from 'playwright-bdd';
import { expect, test } from '../../../../../hooks/CustomFixtures';
import { confirmStringNotNull } from '../../../../../utils/UtilFunctions';
const { When, Then } = createBdd(test);

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
    switch (sortField.toLowerCase()) {
      case 'first name':
        firstNameValues = await userListReviewBodyPage.getUserFirstName();
        break;
      default:
        throw new Error(`${sortField} is not a valid option`);
    }
    const sortedList = [...firstNameValues].sort((a, b) => a.localeCompare(b, 'en', { sensitivity: 'base' }));
    expect(firstNameValues).toEqual(sortedList);
  }
);

When(
  'I enter an input into the search field to search for the existing {string} user of the current review body for {string}',
  async ({ userListReviewBodyPage, commonItemsPage }, position: string, fieldKey: string) => {
    if ((await userListReviewBodyPage.userListTableRows.count()) >= 2) {
      let searchKey: string = '';
      if (fieldKey === 'Email_Address') {
        const emailAddressValues: any = await userListReviewBodyPage.getUserEmail();
        const rowCount = emailAddressValues.length;
        if (position == 'first') {
          searchKey = emailAddressValues[0];
        } else if (position == 'last') {
          searchKey = emailAddressValues[rowCount - 1];
        }
      } else if (fieldKey === 'First_Name') {
        const firstNameValues: any = await userListReviewBodyPage.getUserFirstName();
        const rowCount = firstNameValues.length;
        if (position == 'first') {
          searchKey = firstNameValues[0];
        } else if (position == 'last') {
          searchKey = firstNameValues[rowCount - 1];
        }
      } else if (fieldKey === 'Last_Name') {
        const lastNameValues: any = await userListReviewBodyPage.getUserLastName();
        const rowCount = lastNameValues.length;
        if (position == 'first') {
          searchKey = lastNameValues[0];
        } else if (position == 'last') {
          searchKey = lastNameValues[rowCount - 1];
        }
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
    await userListReviewBodyPage.setFirstName(
      confirmStringNotNull(await userListReviewBodyPage.first_name_value_first_row.textContent())
    );
    await userListReviewBodyPage.setLastName(
      confirmStringNotNull(await userListReviewBodyPage.last_name_value_first_row.textContent())
    );
    await userListReviewBodyPage.setEmail(
      confirmStringNotNull(await userListReviewBodyPage.email_address_value_first_row.textContent())
    );
    await userListReviewBodyPage.setStatus(
      confirmStringNotNull(await userListReviewBodyPage.status_value_first_row.textContent())
    );
    const userValues = await userListReviewBodyPage.getUserListBeforeSearch();
    const searchKey = await userListReviewBodyPage.getSearchKey();
    const filteredSearchResults: string[] = userValues.filter((result) =>
      result.toLowerCase().includes(searchKey.toLowerCase())
    );
    const userList = await commonItemsPage.getAllUsersFromTheTable();
    const userListAfterSearch: any = userList.get('searchResultValues');
    expect(filteredSearchResults).toEqual(userListAfterSearch);
    const searchResult = await commonItemsPage.validateSearchResults(userListAfterSearch, searchKey);
    expect(searchResult).toBeTruthy();
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

When(
  'I click the first {string} link on the {string}',
  async ({ commonItemsPage }, linkKey: string, pageKey: string) => {
    const linkValue = commonItemsPage.linkTextData[pageKey][linkKey];
    await commonItemsPage.govUkButton
      .getByText(linkValue, { exact: true })
      .or(commonItemsPage.govUkLink.getByText(linkValue, { exact: true }))
      .first()
      .click();
  }
);

When(
  'I enter an input into the search field to search for a user not added in the current review body',
  async ({ userListReviewBodyPage }) => {
    await userListReviewBodyPage.search_text.fill('QA Automation');
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
    await expect(userProfilePage.role_value).toHaveText(await checkRemoveUserReviewBodyPage.getRole());
  }
);
