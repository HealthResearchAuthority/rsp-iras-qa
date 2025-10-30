import { createBdd } from 'playwright-bdd';
import { test, expect } from '../../../../../hooks/CustomFixtures';
import { confirmStringNotNull } from '../../../../../utils/UtilFunctions';

const { Then, When } = createBdd(test);

Then(
  'I can see the view and edit user profile page of the sponsor organisation',
  async ({ viewEditUserProfilePage, commonItemsPage }) => {
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
      const actualValues = confirmStringNotNull(await viewEditUserProfilePage.role_value.textContent());
      expect
        .soft(actualValues)
        .toContain(
          viewEditUserProfilePage.viewEditUserProfilePageTestData.View_And_Edit_User_Profile_Page.sponsor_role_value
        );
    }
  }
);

When(
  'I can see the {string} user has the correct roles assigned on their profile page',
  async ({ userProfilePage, createUserProfilePage }, datasetName: string) => {
    if (datasetName.endsWith('_No_Roles')) {
      await expect(userProfilePage.role_value).not.toBeVisible();
    } else {
      const dataset = createUserProfilePage.createUserProfilePageTestData.Create_User_Profile[datasetName];
      const actualValues = confirmStringNotNull(await userProfilePage.role_value.textContent());
      const expectedValues = dataset.role_checkbox.toString().replaceAll(',', ', ');
      expect(actualValues).toBe(expectedValues);
    }
  }
);
