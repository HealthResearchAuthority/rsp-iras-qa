import { createBdd } from 'playwright-bdd';
import { expect, test } from '../../../../../hooks/CustomFixtures';
// import { confirmArrayNotNull } from '../../../../../utils/UtilFunctions';
const { Then } = createBdd(test);

Then(
  'I can see the user added successful message on sponsor organisation user list page',
  async ({ userListSponsorOrganisationPage, commonItemsPage }) => {
    await expect
      .soft(userListSponsorOrganisationPage.user_added_to_sponsor_organisation_success_message_header_text)
      .toBeVisible();
    await expect
      .soft(userListSponsorOrganisationPage.user_added_to_sponsor_organisation__success_message_text)
      .toBeVisible();
    expect
      .soft(
        await userListSponsorOrganisationPage.information_alert_banner.evaluate((e: any) =>
          getComputedStyle(e).getPropertyValue('border-color')
        )
      )
      .toBe(commonItemsPage.commonTestData.rgb_green_color);
    expect
      .soft(
        await userListSponsorOrganisationPage.information_alert_banner.evaluate((e: any) =>
          getComputedStyle(e).getPropertyValue('background-color')
        )
      )
      .toBe(commonItemsPage.commonTestData.rgb_green_color);
  }
);

// When(
//   'I navigate to the user list page of the {string} review body',
//   async ({ userListReviewBodyPage }, revBodyName: string) => {
//     const reviewBodyId = userListReviewBodyPage.userListReviewBodyPageTestData.Review_Body_Ids[revBodyName];
//     userListReviewBodyPage.goto(reviewBodyId);
//     userListReviewBodyPage.assertOnUserListReviewBodyPage();
//   }
// );

// When(
//   'I enter an input into the search field to search for the removed user of the review body',
//   async ({ commonItemsPage, checkRemoveUserReviewBodyPage }) => {
//     const searchKey = await checkRemoveUserReviewBodyPage.getEmail();
//     await commonItemsPage.setSearchKey(searchKey);
//     await commonItemsPage.search_text.fill(searchKey);
//   }
// );

// Then(
//   'the system displays no results found message in the user list page of the review body',
//   async ({ userListReviewBodyPage, reviewBodyProfilePage }) => {
//     await userListReviewBodyPage.assertOnUserListReviewBodyPage();
//     const organisationName = await reviewBodyProfilePage.getOrgName();
//     await expect(userListReviewBodyPage.page_heading).toHaveText(
//       userListReviewBodyPage.userListReviewBodyPageTestData.Review_Body_User_List_Page.page_heading + organisationName
//     );
//     await expect(userListReviewBodyPage.no_results_heading).toHaveText(
//       userListReviewBodyPage.userListReviewBodyPageTestData.Review_Body_User_List_Page.no_results_heading
//     );
//     await expect(userListReviewBodyPage.no_results_guidance_text).toHaveText(
//       userListReviewBodyPage.userListReviewBodyPageTestData.Review_Body_User_List_Page.no_results_guidance_text
//     );
//     expect(await userListReviewBodyPage.userListTableRows.count()).toBe(0);
//     await expect(userListReviewBodyPage.back_to_users_link).toHaveText(
//       userListReviewBodyPage.userListReviewBodyPageTestData.Review_Body_User_List_Page.back_to_users_link +
//         organisationName
//     );
//   }
// );

// Then(
//   'I can see the user profile page of the removed user from the review body',
//   async ({ userProfilePage, checkRemoveUserReviewBodyPage }) => {
//     await userProfilePage.assertOnUserProfilePage();
//     const userIdStartIndex = userProfilePage.page.url().indexOf('=') + 1;
//     const userIdEndIndex = userProfilePage.page.url().indexOf('&');
//     await userProfilePage.setUserId(userProfilePage.page.url().substring(userIdStartIndex, userIdEndIndex));
//     await expect(userProfilePage.title_value).toHaveText(await checkRemoveUserReviewBodyPage.getTitle());
//     await expect(userProfilePage.first_name_value).toHaveText(await checkRemoveUserReviewBodyPage.getFirstName());
//     await expect(userProfilePage.last_name_value).toHaveText(await checkRemoveUserReviewBodyPage.getLastName());
//     await expect(userProfilePage.email_address_value).toHaveText(await checkRemoveUserReviewBodyPage.getEmail());
//     await expect(userProfilePage.telephone_value).toHaveText(await checkRemoveUserReviewBodyPage.getTelephone());
//     await expect(userProfilePage.organisation_value).toHaveText(await checkRemoveUserReviewBodyPage.getOrganisation());
//     await expect(userProfilePage.job_title_value).toHaveText(await checkRemoveUserReviewBodyPage.getJobTitle());
//     if (await userProfilePage.role_value.isVisible()) {
//       await expect(userProfilePage.role_value).toHaveText(await checkRemoveUserReviewBodyPage.getRole());
//     }
//   }
// );

// Given(
//   'I see that the newly added user appears in the user list page for the review body',
//   async ({ searchAddUserReviewBodyPage, userListReviewBodyPage }) => {
//     await expect(userListReviewBodyPage.userListTableBodyRows).toHaveCount(1);
//     await expect(userListReviewBodyPage.first_name_value_first_row).toHaveText(
//       await searchAddUserReviewBodyPage.getUserFirstName()
//     );
//     await expect(userListReviewBodyPage.last_name_value_first_row).toHaveText(
//       await searchAddUserReviewBodyPage.getUserLastName()
//     );
//     await expect(userListReviewBodyPage.email_address_value_first_row).toHaveText(
//       await searchAddUserReviewBodyPage.getUserEmail()
//     );
//     await expect(userListReviewBodyPage.status_value_first_row).toHaveText(
//       await searchAddUserReviewBodyPage.getUserStatus()
//     );
//   }
// );

// When(
//   'I capture the name of the newly added user in the user list page of the review body',
//   async ({ createUserProfilePage, userListReviewBodyPage, commonItemsPage }) => {
//     if ((await commonItemsPage.tableBodyRows.count()) >= 1) {
//       if (await commonItemsPage.firstPage.isVisible()) {
//         await commonItemsPage.firstPage.click();
//       }
//       const userListBeforeSearch = await commonItemsPage.getAllUsersFromTheTable();
//       const userValues: string[] = confirmArrayNotNull(userListBeforeSearch.get('searchResultValues'));
//       await userListReviewBodyPage.setUserListBeforeSearch(userValues);
//       await commonItemsPage.setSearchKey(await createUserProfilePage.getUniqueEmail());
//     } else {
//       throw new Error(`There are no items in list to search`);
//     }
//   }
// );

Then(
  'I can see the user in the selected sponsor organisation disabled successful message on sponsor organisation user list page',
  async ({ userListSponsorOrganisationPage, commonItemsPage }) => {
    await expect
      .soft(userListSponsorOrganisationPage.user_in_sponsor_organisation_disabled_success_message_header_text)
      .toBeVisible();
    await expect
      .soft(userListSponsorOrganisationPage.user_in_sponsor_organisation_disabled_success_message_text)
      .toBeVisible();
    expect
      .soft(
        await userListSponsorOrganisationPage.information_alert_banner.evaluate((e: any) =>
          getComputedStyle(e).getPropertyValue('border-color')
        )
      )
      .toBe(commonItemsPage.commonTestData.rgb_green_color);
    expect
      .soft(
        await userListSponsorOrganisationPage.information_alert_banner.evaluate((e: any) =>
          getComputedStyle(e).getPropertyValue('background-color')
        )
      )
      .toBe(commonItemsPage.commonTestData.rgb_green_color);
  }
);

Then(
  'I can see the user in the selected sponsor organisation enabled successful message on sponsor organisation user list page',
  async ({ userListSponsorOrganisationPage, commonItemsPage }) => {
    await expect
      .soft(userListSponsorOrganisationPage.user_in_sponsor_organisation_enabled_success_message_header_text)
      .toBeVisible();
    await expect
      .soft(userListSponsorOrganisationPage.user_in_sponsor_organisation_enabled_success_message_text)
      .toBeVisible();
    expect
      .soft(
        await userListSponsorOrganisationPage.information_alert_banner.evaluate((e: any) =>
          getComputedStyle(e).getPropertyValue('border-color')
        )
      )
      .toBe(commonItemsPage.commonTestData.rgb_green_color);
    expect
      .soft(
        await userListSponsorOrganisationPage.information_alert_banner.evaluate((e: any) =>
          getComputedStyle(e).getPropertyValue('background-color')
        )
      )
      .toBe(commonItemsPage.commonTestData.rgb_green_color);
  }
);
