import { createBdd } from 'playwright-bdd';
import { expect, test } from '../../../../../hooks/CustomFixtures';
const { Given, When, Then } = createBdd(test);

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

When(
  'I fill the search input for the user list page of the review body, with the newly added users email as the search query',
  async ({ searchAddUserReviewBodyPage, userListReviewBodyPage }) => {
    const searchQueryValue = await searchAddUserReviewBodyPage.getUserEmail();
    await userListReviewBodyPage.search_text.fill(searchQueryValue);
  }
);

Given(
  'I see that the newly added user appears in the user list page for the review body',
  async ({ searchAddUserReviewBodyPage, userListReviewBodyPage }) => {
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
