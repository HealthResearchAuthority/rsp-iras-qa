import { createBdd } from 'playwright-bdd';
import { expect, test } from '../../../../hooks/CustomFixtures';
import { confirmStringNotNull } from '../../../../utils/UtilFunctions';

const { When } = createBdd(test);

When(
  'the check and confirm page to add user to sponsor organisation displays the expected user details for the selected sponsor organisation {string} and {string} and for the user {string}',
  async (
    { checkConfirmUserToAddToSponsorOrganisationPage, addUserRoleSponsorOrgPage, loginPage },
    sponsorOrg: string,
    permissionSelected: string,
    datasetName: string
  ) => {
    let userEmailValue: string = '';
    await checkConfirmUserToAddToSponsorOrganisationPage.assertOnCheckConfirmUserSponsorOrganisationPage();
    await expect
      .soft(
        checkConfirmUserToAddToSponsorOrganisationPage.page_guidance_text.getByText(
          checkConfirmUserToAddToSponsorOrganisationPage.checkConfirmAddUserSponsorOrgPageTestData
            .Check_And_Confirm_User_To_Add_To_Sponsor_Organisation_Page.page_guidance_prefix_text +
            sponsorOrg +
            '.',
          { exact: true }
        )
      )
      .toBeVisible();
    if (datasetName === 'Sponsor_Org_Admin_User') {
      userEmailValue = loginPage.loginPageTestData.Sponsor_Org_Admin_User.username;
    } else if (datasetName === 'System_Admin') {
      userEmailValue = loginPage.loginPageTestData.System_Admin.username;
    } else if (datasetName === 'Sponsor_User') {
      userEmailValue = loginPage.loginPageTestData.Sponsor_User.username;
    }
    expect
      .soft(confirmStringNotNull(await checkConfirmUserToAddToSponsorOrganisationPage.user_email_value.textContent()))
      .toBe(userEmailValue.toLowerCase());
    await checkConfirmUserToAddToSponsorOrganisationPage.setUserEmail(
      confirmStringNotNull(await checkConfirmUserToAddToSponsorOrganisationPage.user_email_value.textContent())
    );
    // validate user details from db using email address
    if (permissionSelected === 'No_Permission_To_Select') {
      expect
        .soft(confirmStringNotNull(await checkConfirmUserToAddToSponsorOrganisationPage.user_role_value.textContent()))
        .toBe(
          addUserRoleSponsorOrgPage.addUserRoleSponsorOrgPageTestData.Add_User_Role_Page.Sponsor_Org_User_Role_Org_Admin
            .role_radio
        );
      expect
        .soft(
          confirmStringNotNull(await checkConfirmUserToAddToSponsorOrganisationPage.user_authoriser_value.textContent())
        )
        .toBe('Yes');
    } else if (permissionSelected === 'Sponsor_Authoriser_Yes') {
      expect
        .soft(confirmStringNotNull(await checkConfirmUserToAddToSponsorOrganisationPage.user_role_value.textContent()))
        .toBe(
          addUserRoleSponsorOrgPage.addUserRoleSponsorOrgPageTestData.Add_User_Role_Page.Sponsor_Org_User_Role_Sponsor
            .role_radio
        );
      expect
        .soft(
          confirmStringNotNull(await checkConfirmUserToAddToSponsorOrganisationPage.user_authoriser_value.textContent())
        )
        .toBe('Yes');
    } else if (permissionSelected === 'Sponsor_Authoriser_No') {
      expect
        .soft(confirmStringNotNull(await checkConfirmUserToAddToSponsorOrganisationPage.user_role_value.textContent()))
        .toBe(
          addUserRoleSponsorOrgPage.addUserRoleSponsorOrgPageTestData.Add_User_Role_Page.Sponsor_Org_User_Role_Sponsor
            .role_radio
        );
      expect
        .soft(
          confirmStringNotNull(await checkConfirmUserToAddToSponsorOrganisationPage.user_authoriser_value.textContent())
        )
        .toBe('No');
    }
  }
);
