import { createBdd } from 'playwright-bdd';
import { expect, test } from '../../../../../hooks/CustomFixtures';
import { confirmStringNotNull } from '../../../../../utils/UtilFunctions';
const { Then } = createBdd(test);

Then(
  'I can see the check and remove user profile page',
  async ({ checkRemoveUserReviewBodyPage, reviewBodyProfilePage }) => {
    await checkRemoveUserReviewBodyPage.assertOnCheckRemoveUserProfilePage();
    const organisationName = await reviewBodyProfilePage.getOrgName();
    await expect(checkRemoveUserReviewBodyPage.page_heading).toHaveText(
      checkRemoveUserReviewBodyPage.checkRemoveUserReviewBodyPageTestData.Check_Remove_User_Page.page_heading +
        organisationName
    );
    await checkRemoveUserReviewBodyPage.setFirstName(
      confirmStringNotNull(await checkRemoveUserReviewBodyPage.first_name_value.textContent())
    );
    await checkRemoveUserReviewBodyPage.setLastName(
      confirmStringNotNull(await checkRemoveUserReviewBodyPage.last_name_value.textContent())
    );
    await checkRemoveUserReviewBodyPage.setEmail(
      confirmStringNotNull(await checkRemoveUserReviewBodyPage.email_address_value.textContent())
    );
  }
);
