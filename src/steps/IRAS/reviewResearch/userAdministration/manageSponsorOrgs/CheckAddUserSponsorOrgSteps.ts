import { createBdd } from 'playwright-bdd';
import { expect, test } from '../../../../../hooks/CustomFixtures';
import { confirmStringNotNull } from '../../../../../utils/UtilFunctions';

const { When } = createBdd(test);

When(
  'the check and add user to sponsor organisation page displays the expected user details for the selected sponsor organisation {string} and {string}',
  async (
    { checkAddUserSponsorOrganisationPage, addUserRoleSponsorOrgPage },
    sponsorOrg: string,
    permissionSelected: string
  ) => {
    await checkAddUserSponsorOrganisationPage.assertOnCheckAddUserSponsorOrganisationPage();
    await expect
      .soft(
        checkAddUserSponsorOrganisationPage.mainPageContent
          .getByRole('paragraph')
          .getByText(
            checkAddUserSponsorOrganisationPage.checkAddUserSponsorOrgPageTestData
              .Check_Add_User_Sponsor_Organisation_Page.page_guidance_prefix_text +
              sponsorOrg +
              '.',
            { exact: true }
          )
      )
      .toBeVisible();
    await checkAddUserSponsorOrganisationPage.setUserEmail(
      confirmStringNotNull(await checkAddUserSponsorOrganisationPage.user_email_value.textContent())
    );
    // validate user details from db using email address
    if (permissionSelected === 'No_Permission_To_Select') {
      expect
        .soft(confirmStringNotNull(await checkAddUserSponsorOrganisationPage.user_role_value.textContent()))
        .toBe(
          addUserRoleSponsorOrgPage.addUserRoleSponsorOrgPageTestData.Add_User_Role_Page.Sponsor_Org_User_Role_Org_Admin
            .role_radio
        );
      expect
        .soft(confirmStringNotNull(await checkAddUserSponsorOrganisationPage.user_authoriser_value.textContent()))
        .toBe('Yes');
    } else if (permissionSelected === 'Sponsor_Authoriser_Yes') {
      expect
        .soft(confirmStringNotNull(await checkAddUserSponsorOrganisationPage.user_role_value.textContent()))
        .toBe(
          addUserRoleSponsorOrgPage.addUserRoleSponsorOrgPageTestData.Add_User_Role_Page.Sponsor_Org_User_Role_Sponsor
            .role_radio
        );
      expect
        .soft(confirmStringNotNull(await checkAddUserSponsorOrganisationPage.user_authoriser_value.textContent()))
        .toBe('Yes');
    } else if (permissionSelected === 'Sponsor_Authoriser_No') {
      expect
        .soft(confirmStringNotNull(await checkAddUserSponsorOrganisationPage.user_role_value.textContent()))
        .toBe(
          addUserRoleSponsorOrgPage.addUserRoleSponsorOrgPageTestData.Add_User_Role_Page.Sponsor_Org_User_Role_Sponsor
            .role_radio
        );
      expect
        .soft(confirmStringNotNull(await checkAddUserSponsorOrganisationPage.user_authoriser_value.textContent()))
        .toBe('No');
    }
  }
);
