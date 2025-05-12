import { createBdd } from 'playwright-bdd';
import { expect, test } from '../../../../../hooks/CustomFixtures';

const { Given, When } = createBdd(test);

Given('I can see the check and add user to review body page', async ({ checkAddUserReviewBodyPage }) => {
  await checkAddUserReviewBodyPage.assertOnCheckAddUserReviewBodyPage();
});

When(
  'the check and add user to review body page displays the expected user details',
  async ({ checkAddUserReviewBodyPage, reviewBodyProfilePage, searchAddUserReviewBodyPage }) => {
    await expect(checkAddUserReviewBodyPage.page_guidance_text).toHaveText(`
    ${checkAddUserReviewBodyPage.checkAddUserReviewBodyPageData.Check_Add_User_Review_Body_Page.page_guidance_text}${await reviewBodyProfilePage.getOrgName()}.`);
    await expect(checkAddUserReviewBodyPage.user_details_table).toBeVisible();
    await expect(checkAddUserReviewBodyPage.user_details_table_labels).toHaveText(
      checkAddUserReviewBodyPage.checkAddUserReviewBodyPageData.Check_Add_User_Review_Body_Page
        .user_details_table_labels
    );
    await expect(checkAddUserReviewBodyPage.user_first_name_value).toHaveText(
      await searchAddUserReviewBodyPage.getUserFirstName()
    );
    await expect(checkAddUserReviewBodyPage.user_last_name_value).toHaveText(
      await searchAddUserReviewBodyPage.getUserLastName()
    );
    await expect(checkAddUserReviewBodyPage.user_email_value).toHaveText(
      await searchAddUserReviewBodyPage.getUserEmail()
    );
  }
);
