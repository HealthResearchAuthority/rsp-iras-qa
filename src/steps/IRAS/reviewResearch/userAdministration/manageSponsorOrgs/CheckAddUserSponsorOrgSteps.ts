import { createBdd } from 'playwright-bdd';
import { expect, test } from '../../../../../hooks/CustomFixtures';
import { confirmStringNotNull } from '../../../../../utils/UtilFunctions';

const { Given, When } = createBdd(test);

Given(
  'I can see the check and add user to sponsor organisation page',
  async ({ checkAddUserSponsorOrganisationPage }) => {
    await checkAddUserSponsorOrganisationPage.assertOnCheckAddUserSponsorOrganisationPage();
  }
);

When(
  'the check and add user to sponsor organisation page displays the expected user details for the selected sponsor organisation {string}',
  async ({ checkAddUserSponsorOrganisationPage }, sponsorOrg: string) => {
    await checkAddUserSponsorOrganisationPage.assertOnCheckAddUserSponsorOrganisationPage();
    await expect
      .soft(
        checkAddUserSponsorOrganisationPage.mainPageContent.getByRole('heading', {
          name:
            checkAddUserSponsorOrganisationPage.checkAddUserSponsorOrgPageTestData
              .Check_Add_User_Sponsor_Organisation_Page.page_guidance_prefix_text + sponsorOrg,
        })
      )
      .toBeVisible();
    await checkAddUserSponsorOrganisationPage.setUserEmail(
      confirmStringNotNull(await checkAddUserSponsorOrganisationPage.user_email_value.textContent())
    );
    // validate user details from db using email address
  }
);
