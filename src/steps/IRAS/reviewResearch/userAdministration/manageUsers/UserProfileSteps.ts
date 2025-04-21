import { createBdd } from 'playwright-bdd';
import { test, expect } from '../../../../../hooks/CustomFixtures';
import { confirmStringNotNull } from '../../../../../utils/UtilFunctions';

const { Then, When } = createBdd(test);

Then('I can see the user profile page', async ({ userProfilePage }) => {
  await userProfilePage.assertOnUserProfilePage();
  const userIdStartIndex = userProfilePage.page.url().indexOf('=') + 1;
  const userIdEndIndex = userProfilePage.page.url().indexOf('&');
  await userProfilePage.setUserId(userProfilePage.page.url().substring(userIdStartIndex, userIdEndIndex));
  // await reviewBodyProfilePage.setOrgName(
  //   confirmStringNotNull(await reviewBodyProfilePage.organisation_name_value.textContent())
  // );
  // await reviewBodyProfilePage.setCountries(
  //   confirmStringNotNull(await reviewBodyProfilePage.country_value.textContent()).split(', ')
  // );
  await userProfilePage.setEmail(confirmStringNotNull(await userProfilePage.email_address_value.textContent()));
  // await reviewBodyProfilePage.setDescription(
  //   confirmStringNotNull(await reviewBodyProfilePage.description_value.textContent())
  // );
  // await reviewBodyProfilePage.setLastUpdatedDate(
  //   confirmStringNotNull(await reviewBodyProfilePage.last_updated_value.textContent())
  // );
});

Then(
  'I can see the user profile {string} is updated with the edited data {string}',
  async ({ userProfilePage, editUserProfilePage }, editFieldName: string, datesetName: string) => {
    const dataset = editUserProfilePage.editUserProfilePageTestData[datesetName];
    const actualValue = await userProfilePage.getUserProfileValue(editFieldName);
    const expectedValue = dataset[editFieldName];
    expect(actualValue).toBe(expectedValue);
  }
);

When(
  'I click the {string} change link for {string} on the user profile page',
  async ({ userProfilePage }, editUserFieldName: string, userRole: string) => {
    await userProfilePage.clickOnChangeUserProfileDetails(editUserFieldName, userRole);
  }
);
