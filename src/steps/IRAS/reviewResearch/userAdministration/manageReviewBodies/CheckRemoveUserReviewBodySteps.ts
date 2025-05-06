import { createBdd } from 'playwright-bdd';
import { expect, test } from '../../../../../hooks/CustomFixtures';
import { confirmStringNotNull } from '../../../../../utils/UtilFunctions';
const { Then } = createBdd(test);

Then(
  'I can see the check and remove user profile page',
  async ({ checkRemoveUserReviewBodyPage, reviewBodyProfilePage, userListReviewBodyPage }) => {
    await checkRemoveUserReviewBodyPage.assertOnCheckRemoveUserProfilePage();
    const organisationName = await reviewBodyProfilePage.getOrgName();
    await expect(checkRemoveUserReviewBodyPage.page_heading).toHaveText(
      checkRemoveUserReviewBodyPage.checkRemoveUserReviewBodyPageTestData.Check_Remove_User_Page.page_heading
    );
    await expect(checkRemoveUserReviewBodyPage.guidance_text).toHaveText(
      checkRemoveUserReviewBodyPage.checkRemoveUserReviewBodyPageTestData.Check_Remove_User_Page.guidance_text +
        organisationName +
        '.'
    );
    await expect(checkRemoveUserReviewBodyPage.first_name_value).toHaveText(
      await userListReviewBodyPage.getFirstName()
    );
    await expect(checkRemoveUserReviewBodyPage.last_name_value).toHaveText(await userListReviewBodyPage.getLastName());
    await expect(checkRemoveUserReviewBodyPage.email_address_value).toHaveText(await userListReviewBodyPage.getEmail());
    await checkRemoveUserReviewBodyPage.setTitle(
      confirmStringNotNull(await checkRemoveUserReviewBodyPage.title_value.textContent())
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
    await checkRemoveUserReviewBodyPage.setTelephone(
      confirmStringNotNull(await checkRemoveUserReviewBodyPage.telephone_value.textContent())
    );
    await checkRemoveUserReviewBodyPage.setOrganisation(
      confirmStringNotNull(await checkRemoveUserReviewBodyPage.organisation_value.textContent())
    );
    await checkRemoveUserReviewBodyPage.setJobTitle(
      confirmStringNotNull(await checkRemoveUserReviewBodyPage.job_title_value.textContent())
    );
    await checkRemoveUserReviewBodyPage.setRole(
      confirmStringNotNull(await checkRemoveUserReviewBodyPage.role_value.textContent())
    );
  }
);
