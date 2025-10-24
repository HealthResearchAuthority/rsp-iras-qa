import { createBdd } from 'playwright-bdd';
import { test, expect } from '../../../../../hooks/CustomFixtures';
import { confirmStringNotNull } from '../../../../../utils/UtilFunctions';

const { Then, When } = createBdd(test);

Then(
  'I can see the view and edit user profile page of the sponsor organisation',
  async ({ viewEditUserProfilePage }) => {
    await viewEditUserProfilePage.assertOnViewEditUserProfilePage();
    const userIdStartIndex = viewEditUserProfilePage.page.url().indexOf('=') + 1;
    const userIdEndIndex = viewEditUserProfilePage.page.url().indexOf('&');
    await viewEditUserProfilePage.setUserId(
      viewEditUserProfilePage.page.url().substring(userIdStartIndex, userIdEndIndex)
    );
    await viewEditUserProfilePage.setTitle(
      confirmStringNotNull(await viewEditUserProfilePage.title_value.textContent())
    );
    await viewEditUserProfilePage.setFirstName(
      confirmStringNotNull(await viewEditUserProfilePage.first_name_value.textContent())
    );
    await viewEditUserProfilePage.setLastName(
      confirmStringNotNull(await viewEditUserProfilePage.last_name_value.textContent())
    );
    await viewEditUserProfilePage.setEmail(
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
      expect.soft(actualValues).toContain('Sponsor');
      // const expectedValues = dataset.role_checkbox.toString().replaceAll(',', ', ');
      // expect(actualValues).toBe(expectedValues);
    }
  }
);

// Then(
//   'I can see the user profile {string} is updated with the edited data {string}',
//   async ({ userProfilePage, editUserProfilePage }, editFieldName: string, datesetName: string) => {
//     const dataset = editUserProfilePage.editUserProfilePageTestData[datesetName];
//     const actualValue = await userProfilePage.getUserProfileValue(editFieldName);
//     const expectedValue = dataset[editFieldName];
//     expect(actualValue).toBe(expectedValue.toString());
//   }
// );

// When(
//   'I can see that the user profiles last updated field has the current time',
//   async ({ userProfilePage, auditHistoryUserPage }) => {
//     const abbreviatedValue = await auditHistoryUserPage.getUpdatedTime();
//     const shortMonth = new Date().toLocaleString('en-GB', { month: 'short', timeZone: 'UTC' }).slice(0, 3);
//     const longMonth = new Date().toLocaleString('en-GB', { month: 'long', timeZone: 'UTC' });
//     const expectedValue = abbreviatedValue.replace(shortMonth, longMonth);
//     await expect(userProfilePage.last_updated_value).toHaveText(confirmStringNotNull(expectedValue));
//   }
// );

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

// Then(
//   'I can see the {string} ui labels on the user profile page',
//   async ({ commonItemsPage, userProfilePage }, datasetName: string) => {
//     const dataset = userProfilePage.userProfilePageTestData[datasetName];
//     for (const key in dataset) {
//       if (Object.hasOwn(dataset, key)) {
//         const labelVal = await commonItemsPage.getUiLabel(key, userProfilePage);
//         expect(labelVal).toBe(dataset[key]);
//       }
//     }
//   }
// );
