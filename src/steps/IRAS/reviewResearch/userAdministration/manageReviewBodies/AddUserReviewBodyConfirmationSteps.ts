import { createBdd } from 'playwright-bdd';
import { expect, test } from '../../../../../hooks/CustomFixtures';

const { Given } = createBdd(test);

Given('I can see the add user to review body confirmation page', async ({ addUserReviewBodyConfirmationPage }) => {
  await addUserReviewBodyConfirmationPage.assertOnAddUserReviewBodyConfirmationPage();
});

Given(
  'the add user to review body confirmation page displays the expected guidance text',
  async ({ addUserReviewBodyConfirmationPage, searchAddUserReviewBodyPage, reviewBodyProfilePage }) => {
    const firstName = await searchAddUserReviewBodyPage.getUserFirstName();
    const lastName = await searchAddUserReviewBodyPage.getUserLastName();
    const reviewBodyName = await reviewBodyProfilePage.getOrgName();
    const guidanceText =
      addUserReviewBodyConfirmationPage.addUserReviewBodyConfirmationPageTestData.Add_User_Review_Body_Confirmation_Page
        .page_guidance_text;
    await expect(addUserReviewBodyConfirmationPage.page_guidance_text).toHaveText(
      `${firstName} ${lastName}${guidanceText}${reviewBodyName}.`
    );
  }
);
