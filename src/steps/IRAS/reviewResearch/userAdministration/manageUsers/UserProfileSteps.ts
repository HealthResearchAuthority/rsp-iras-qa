import { createBdd } from 'playwright-bdd';
import { test, expect } from '../../../../../hooks/CustomFixtures';
import { confirmStringNotNull } from '../../../../../utils/UtilFunctions';

const { Then, When } = createBdd(test);

Then('I can see the user profile page', async ({ userProfilePage }) => {
  await userProfilePage.assertOnUserProfilePage();
  const userIdStartIndex = userProfilePage.page.url().indexOf('=') + 1;
  const userIdEndIndex = userProfilePage.page.url().indexOf('&');
  await userProfilePage.setUserId(userProfilePage.page.url().substring(userIdStartIndex, userIdEndIndex));
  await userProfilePage.setTitle(confirmStringNotNull(await userProfilePage.title_value.textContent()));
  await userProfilePage.setFirstName(confirmStringNotNull(await userProfilePage.first_name_value.textContent()));
  await userProfilePage.setLastName(confirmStringNotNull(await userProfilePage.last_name_value.textContent()));
  await userProfilePage.setEmail(confirmStringNotNull(await userProfilePage.email_address_value.textContent()));
  await userProfilePage.setTelephone(confirmStringNotNull(await userProfilePage.telephone_value.textContent()));
  await userProfilePage.setOrganisation(confirmStringNotNull(await userProfilePage.organisation_value.textContent()));
  await userProfilePage.setJobTitle(confirmStringNotNull(await userProfilePage.job_title_value.textContent()));
  if (await userProfilePage.role_value.isVisible()) {
    await userProfilePage.setRole(confirmStringNotNull(await userProfilePage.role_value.textContent()).split(', '));
  }
  if (await userProfilePage.country_row.isVisible()) {
    await userProfilePage.setCountries(
      confirmStringNotNull(await userProfilePage.country_value.textContent()).split(', ')
    );
  }
  if (await userProfilePage.review_body_row.isVisible()) {
    await userProfilePage.setReviewBody(
      confirmStringNotNull(await userProfilePage.review_body_value.textContent()).split(', ')
    );
  }
});

Then(
  'I can see the user profile {string} is updated with the edited data {string}',
  async ({ userProfilePage, editUserProfilePage }, editFieldName: string, datesetName: string) => {
    const dataset = editUserProfilePage.editUserProfilePageTestData[datesetName];
    const actualValue = await userProfilePage.getUserProfileValue(editFieldName);
    const expectedValue = dataset[editFieldName];
    if (typeof expectedValue === 'string') {
      expect.soft(actualValue).toContain(expectedValue);
    } else {
      const newExpValue = Object.keys(expectedValue)
        .sort((a, b) => Number(a) - Number(b))
        .map((k) => expectedValue[k])
        .join(', ');
      expect.soft(actualValue).toContain(newExpValue);
    }
  }
);

When(
  'I click the {string} change link for {string} on the user profile page',
  async ({ userProfilePage }, editUserFieldName: string, userRole: string) => {
    await userProfilePage.clickOnChangeUserProfileDetails(editUserFieldName, userRole);
  }
);

When(
  'I click the change link against {string} on the user profile page',
  async ({ userProfilePage, commonItemsPage }, fieldKey: string) => {
    const changeLink = await commonItemsPage.getChangeLink(fieldKey, userProfilePage);
    await changeLink.click();
  }
);

When(
  'I can see that the user profiles last updated field has the current time',
  async ({ userProfilePage, auditHistoryUserPage }) => {
    const abbreviatedValue = await auditHistoryUserPage.getUpdatedTime();
    const shortMonth = new Date().toLocaleString('en-GB', { month: 'short', timeZone: 'UTC' }).slice(0, 3);
    const longMonth = new Date().toLocaleString('en-GB', { month: 'long', timeZone: 'UTC' });
    const expectedValue = abbreviatedValue.replace(shortMonth, longMonth);
    const expectedMinutes = expectedValue.slice(expectedValue.indexOf(':') + 1);
    const actualMinutes = await userProfilePage.last_updated_value
      .textContent()
      .then((text) => text.slice(text.indexOf(':') + 1));
    const actualValue = confirmStringNotNull(await userProfilePage.last_updated_value.textContent());
    expect.soft(actualValue).toBe(confirmStringNotNull(expectedValue));
    expect.soft(Number.parseInt(actualMinutes)).toBeGreaterThanOrEqual(Number.parseInt(expectedMinutes) - 1);
    expect.soft(Number.parseInt(actualMinutes)).toBeLessThanOrEqual(Number.parseInt(expectedMinutes) + 1);
  }
);

When(
  'I can see the {string} user has the correct roles assigned on their profile page',
  async ({ userProfilePage, createUserProfilePage }, datasetName: string) => {
    if (datasetName.endsWith('_No_Roles')) {
      await expect.soft(userProfilePage.role_value).not.toBeVisible();
    } else {
      const dataset = createUserProfilePage.createUserProfilePageTestData.Create_User_Profile[datasetName];
      const actualValues = confirmStringNotNull(await userProfilePage.role_value.textContent());
      const expectedValues = dataset.role_checkbox.toString().replaceAll(',', ', ');
      expect.soft(actualValues).toBe(expectedValues);
    }
  }
);

Then(
  'I can see the {string} ui labels on the user profile page',
  async ({ commonItemsPage, userProfilePage }, datasetName: string) => {
    const dataset = userProfilePage.userProfilePageTestData[datasetName];
    for (const key in dataset) {
      if (Object.hasOwn(dataset, key)) {
        const labelVal = await commonItemsPage.getUiLabel(key, userProfilePage);
        expect(labelVal).toBe(dataset[key]);
      }
    }
  }
);

When('I validate change link is not displayed for {string}', async ({ userProfilePage }, fieldKey: string) => {
  const locatorName = fieldKey.toLowerCase() + '_change_link';
  await expect(userProfilePage[locatorName]).not.toBeVisible();
});

When(
  'I can see the {string} user has the selected roles in the filter assigned on their profile page',
  async ({ userProfilePage, manageUsersPage }, datasetName: string) => {
    let dataset: any;
    if (await userProfilePage.role_value.isVisible()) {
      if (datasetName.includes('_Role_No')) {
        return;
      } else {
        dataset = manageUsersPage.manageUsersPageTestData.Advanced_Filters[datasetName];
      }
      const actualValues = confirmStringNotNull(await userProfilePage.role_value.textContent());
      const expectedValues = dataset.role_checkbox.toString().replaceAll(',', ', ');
      const actualRoles = actualValues.split(',').map((val: any) => val.trim());
      const expectedRoles = expectedValues.split(',').map((val: any) => val.trim());
      const commonValue = actualRoles.some((role) => expectedRoles.includes(role));
      expect.soft(commonValue).toBe(true);
    }
  }
);

When(
  'I can see the {string} user has the selected review bodies in the filter assigned on their profile page',
  async ({ userProfilePage, manageUsersPage }, datasetName: string) => {
    let dataset: any;
    if (await userProfilePage.review_body_value.isVisible()) {
      if (datasetName.includes('_Review_Body_No')) {
        return;
      } else {
        dataset = manageUsersPage.manageUsersPageTestData.Advanced_Filters[datasetName];
      }
      const actualValues = confirmStringNotNull(await userProfilePage.review_body_value.textContent());
      const expectedValues = dataset.review_body_checkbox.toString().replaceAll(',', ', ');
      const actualReviewBodies = actualValues.split(',').map((val: any) => val.trim());
      const expectedReviewBodies = expectedValues.split(',').map((val: any) => val.trim());
      const commonValue = actualReviewBodies.some((value) => expectedReviewBodies.includes(value));
      expect.soft(commonValue).toBe(true);
    }
  }
);

When(
  'I can see the {string} user has the selected countries in the filter assigned on their profile page',
  async ({ userProfilePage, manageUsersPage }, datasetName: string) => {
    let dataset: any;
    if (await userProfilePage.country_value.isVisible()) {
      if (datasetName.includes('_Country_No')) {
        return;
      } else {
        dataset = manageUsersPage.manageUsersPageTestData.Advanced_Filters[datasetName];
      }
      const actualValues = confirmStringNotNull(await userProfilePage.country_value.textContent());
      const expectedValues = dataset.country_checkbox.toString().replaceAll(',', ', ');
      expect(expectedValues).toContain(actualValues);
    }
  }
);
