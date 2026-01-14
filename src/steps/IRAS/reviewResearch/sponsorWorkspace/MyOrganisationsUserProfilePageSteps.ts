import { createBdd } from 'playwright-bdd';
import { expect, test } from '../../../../hooks/CustomFixtures';

const { Given, When } = createBdd(test);

Given(
  'I see the details for {string} are correctly displayed on my organisations user profile page',
  async ({ myOrganisationsUserProfilePage, loginPage, userProfilePage }, user: string) => {
    const username = loginPage.loginPageTestData[user].username;
    await userProfilePage.sqlGetUserProfileByEmail(username);
    expect.soft(myOrganisationsUserProfilePage.title_value).toHaveText(await userProfilePage.getTitle());
    expect.soft(myOrganisationsUserProfilePage.first_name_value).toHaveText(await userProfilePage.getFirstName());
    expect.soft(myOrganisationsUserProfilePage.last_name_value).toHaveText(await userProfilePage.getLastName());
    expect.soft(myOrganisationsUserProfilePage.email_value).toHaveText(await userProfilePage.getEmail());
    expect.soft(myOrganisationsUserProfilePage.telephone_value).toHaveText(await userProfilePage.getTelephone());
    expect.soft(myOrganisationsUserProfilePage.organisation_value).toHaveText(await userProfilePage.getOrganisation());
    expect.soft(myOrganisationsUserProfilePage.job_title_value).toHaveText(await userProfilePage.getJobTitle());
    expect.soft(myOrganisationsUserProfilePage.role_value).toHaveText(await myOrganisationsUserProfilePage.getRole());
    expect
      .soft(myOrganisationsUserProfilePage.authoriser_value)
      .toHaveText(await myOrganisationsUserProfilePage.getAuthoriser());
    expect
      .soft(myOrganisationsUserProfilePage.status_value)
      .toHaveText(await myOrganisationsUserProfilePage.getStatus());
  }
);

When(
  'I {string} see the change links on my organisations user profile page',
  async ({ myOrganisationsUserProfilePage }, visibility: string) => {
    if (visibility.toLowerCase() == 'can') {
      await expect(myOrganisationsUserProfilePage.role_change_link).toBeVisible();
      await expect(myOrganisationsUserProfilePage.authoriser_change_link).toBeVisible();
    } else {
      await expect(myOrganisationsUserProfilePage.role_change_link).toBeHidden();
      await expect(myOrganisationsUserProfilePage.authoriser_change_link).toBeHidden();
    }
  }
);

//USE FOR EDIT
// When(
//   'I click the change link against {string} on my organisations user profile page',
//   async ({ myOrganisationsUserProfilePage, commonItemsPage }, fieldKey: string) => {
//     const changeLink = await commonItemsPage.getChangeLink(fieldKey, myOrganisationsUserProfilePage);
//     await expect(changeLink).toBeVisible();
//     await changeLink.click();
//   }
// );
