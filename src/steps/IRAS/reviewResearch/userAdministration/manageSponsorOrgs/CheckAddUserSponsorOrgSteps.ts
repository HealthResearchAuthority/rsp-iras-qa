import { createBdd } from 'playwright-bdd';
import { test } from '../../../../../hooks/CustomFixtures';
import { confirmStringNotNull } from '../../../../../utils/UtilFunctions';

const { Given, When } = createBdd(test);

Given(
  'I can see the check and add user to sponsor organisation page',
  async ({ checkAddUserSponsorOrganisationPage }) => {
    await checkAddUserSponsorOrganisationPage.assertOnCheckAddUserSponsorOrganisationPage();
  }
);

When(
  'the check and add user to sponsor organisation page displays the expected user details',
  async ({ checkAddUserSponsorOrganisationPage }) => {
    // await expect.soft(checkAddUserSponsorOrganisationPage.page_guidance_text).toHaveText(`
    // ${checkAddUserSponsorOrganisationPage.checkAddUserSponsorOrgPageTestData.Check_Add_User_Sponsor_Organisation_Page.page_guidance_text}${await sponsorOrganisationProfilePage.getOrgName()}.`);
    // await expect.soft(checkAddUserSponsorOrganisationPage.user_details_table).toBeVisible();
    // await expect
    //   .soft(checkAddUserSponsorOrganisationPage.user_details_table_labels)
    //   .toHaveText(
    //     checkAddUserSponsorOrganisationPage.checkAddUserSponsorOrgPageTestData.Check_Add_User_Sponsor_Organisation_Page
    //       .user_details_table_labels
    //   );
    // await expect
    //   .soft(checkAddUserSponsorOrganisationPage.user_first_name_value)
    //   .toHaveText(await searchAddUserSponsorOrganisationPage.getUserFirstName());
    // await expect
    //   .soft(checkAddUserSponsorOrganisationPage.user_last_name_value)
    //   .toHaveText(await searchAddUserSponsorOrganisationPage.getUserLastName());
    // await expect
    //   .soft(checkAddUserSponsorOrganisationPage.user_email_value)
    //   .toHaveText(await searchAddUserSponsorOrganisationPage.getUserEmail());
    await checkAddUserSponsorOrganisationPage.setUserEmail(
      confirmStringNotNull(await checkAddUserSponsorOrganisationPage.user_email_value.textContent())
    );
  }
);
