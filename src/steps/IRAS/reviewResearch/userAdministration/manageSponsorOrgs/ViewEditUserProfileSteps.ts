import { createBdd } from 'playwright-bdd';
import { test, expect } from '../../../../../hooks/CustomFixtures';
import { confirmStringNotNull } from '../../../../../utils/UtilFunctions';

const { When, Then } = createBdd(test);

Then(
  'I can see the view and edit user profile page of the sponsor organisation',
  async ({ viewEditUserProfilePage, commonItemsPage, myOrganisationsUserProfilePage }) => {
    await viewEditUserProfilePage.assertOnViewEditUserProfilePage();
    const userIdStartIndex = viewEditUserProfilePage.page.url().indexOf('=') + 1;
    const userIdEndIndex = viewEditUserProfilePage.page.url().indexOf('&');
    await viewEditUserProfilePage.setUserId(
      viewEditUserProfilePage.page.url().substring(userIdStartIndex, userIdEndIndex)
    );
    await viewEditUserProfilePage.setTitle(
      confirmStringNotNull(await viewEditUserProfilePage.title_value.textContent())
    );
    await commonItemsPage.setFirstName(
      confirmStringNotNull(await viewEditUserProfilePage.first_name_value.textContent())
    );
    await commonItemsPage.setLastName(
      confirmStringNotNull(await viewEditUserProfilePage.last_name_value.textContent())
    );
    await commonItemsPage.setEmail(
      confirmStringNotNull(await viewEditUserProfilePage.email_address_value.textContent())
    );
    await viewEditUserProfilePage.setTelephone(
      confirmStringNotNull(await viewEditUserProfilePage.telephone_value.textContent())
    );
    await viewEditUserProfilePage.setOrganisation(
      confirmStringNotNull(await viewEditUserProfilePage.organisation_value.textContent())
    );
    await viewEditUserProfilePage.setJobTitle(
      confirmStringNotNull(await viewEditUserProfilePage.job_title_value.textContent())
    );
    if (await viewEditUserProfilePage.role_value.isVisible()) {
      await viewEditUserProfilePage.setRole(
        confirmStringNotNull(await viewEditUserProfilePage.role_value.textContent()).split(', ')
      );
      await expect.soft(viewEditUserProfilePage.role_value).toBeVisible();
      await expect.soft(viewEditUserProfilePage.role_value).toHaveText(await myOrganisationsUserProfilePage.getRole());
      await expect.soft(viewEditUserProfilePage.authoriser_value).toBeVisible();
      await expect
        .soft(viewEditUserProfilePage.authoriser_value)
        .toHaveText(await myOrganisationsUserProfilePage.getAuthoriser());
    }
  }
);

When(
  'the view and edit user profile page displays the expected user details for the selected {string}',
  async ({ viewEditUserProfilePage, addUserRoleSponsorOrgPage }, permissionSelected: string) => {
    await viewEditUserProfilePage.assertOnViewEditUserProfilePage();
    if (permissionSelected === 'No_Permission_To_Select') {
      expect
        .soft(confirmStringNotNull(await viewEditUserProfilePage.role_value.textContent()))
        .toBe(
          addUserRoleSponsorOrgPage.addUserRoleSponsorOrgPageTestData.Add_User_Role_Page.Sponsor_Org_User_Role_Org_Admin
            .role_radio
        );
      expect.soft(confirmStringNotNull(await viewEditUserProfilePage.authoriser_value.textContent())).toBe('Yes');
    } else if (permissionSelected === 'Sponsor_Authoriser_Yes') {
      expect
        .soft(confirmStringNotNull(await viewEditUserProfilePage.role_value.textContent()))
        .toBe(
          addUserRoleSponsorOrgPage.addUserRoleSponsorOrgPageTestData.Add_User_Role_Page.Sponsor_Org_User_Role_Sponsor
            .role_radio
        );
      expect.soft(confirmStringNotNull(await viewEditUserProfilePage.authoriser_value.textContent())).toBe('Yes');
    } else if (permissionSelected === 'Sponsor_Authoriser_No') {
      expect
        .soft(confirmStringNotNull(await viewEditUserProfilePage.role_value.textContent()))
        .toBe(
          addUserRoleSponsorOrgPage.addUserRoleSponsorOrgPageTestData.Add_User_Role_Page.Sponsor_Org_User_Role_Sponsor
            .role_radio
        );
      expect.soft(confirmStringNotNull(await viewEditUserProfilePage.authoriser_value.textContent())).toBe('No');
    }
  }
);
