import { createBdd } from 'playwright-bdd';
import { expect, test } from '../../../../../hooks/CustomFixtures';
const { Then } = createBdd(test);

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

// Then(
//   'the system displays search results matching the search criteria',
//   async ({ userListReviewBodyPage, commonItemsPage }) => {
//     await userListReviewBodyPage.setFirstName(
//       confirmStringNotNull(await userListReviewBodyPage.first_name_value_first_row.textContent())
//     );
//     await userListReviewBodyPage.setLastName(
//       confirmStringNotNull(await userListReviewBodyPage.last_name_value_first_row.textContent())
//     );
//     await userListReviewBodyPage.setEmail(
//       confirmStringNotNull(await userListReviewBodyPage.email_address_value_first_row.textContent())
//     );
//     await userListReviewBodyPage.setStatus(
//       confirmStringNotNull(await userListReviewBodyPage.status_value_first_row.textContent())
//     );
//     const userValues = await userListReviewBodyPage.getUserListBeforeSearch();
//     const searchKey = await userListReviewBodyPage.getSearchKey();
//     const filteredSearchResults: string[] = userValues.filter((result) =>
//       result.toLowerCase().includes(searchKey.toLowerCase())
//     );
//     const userList = await commonItemsPage.getAllUsersFromTheTable();
//     const userListAfterSearch: any = userList.get('searchResultValues');
//     expect(filteredSearchResults).toEqual(userListAfterSearch);
//     const searchResult = await commonItemsPage.validateSearchResults(userListAfterSearch, searchKey);
//     expect(searchResult).toBeTruthy();
//   }
// );

// When(
//   'I enter an input into the search field to search for a user not added in the current review body',
//   async ({ userListReviewBodyPage }) => {
//     await userListReviewBodyPage.search_text.fill('QA Automation');
//   }
// );
