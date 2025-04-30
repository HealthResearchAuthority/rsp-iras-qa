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

// And I search for a user not present in the current review body
// And the system displays no results found message
When('I search for a user of the current review body', async ({ userListReviewBodyPage, commonItemsPage }) => {
  let searchKey: any;
  if ((await userListReviewBodyPage.userListTableRows.count()) >= 2) {
    const userList = await commonItemsPage.getUsers();
    const emailAddressValues: any = userList.get('emailAddressValues');
    searchKey = emailAddressValues[0]; //modify method to search with first name, last name also
  }
  userListReviewBodyPage.search_text.fill(searchKey);
  await userListReviewBodyPage.setSearchKey(searchKey);
});

Then(
  'the system displays search results matching the search criteria',
  async ({ userListReviewBodyPage, commonItemsPage }) => {
    const userList = await commonItemsPage.getUsers();
    const emailAddressValues: any = userList.get('emailAddressValues');
    const searchKey = await userListReviewBodyPage.getSearchKey();
    for (const val of emailAddressValues) {
      if (val === searchKey) {
        return true;
      }
    }
    return false;
  }
);
