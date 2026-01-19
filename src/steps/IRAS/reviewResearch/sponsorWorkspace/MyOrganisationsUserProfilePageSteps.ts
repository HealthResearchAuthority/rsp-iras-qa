import { createBdd } from 'playwright-bdd';
import { expect, test } from '../../../../hooks/CustomFixtures';
import MyOrganisationsEditUserProfilePage from '../../../../pages/IRAS/reviewResearch/sponsorWorkspace/MyOrganisationsEditUserProfilePage';
import MyOrganisationsUserProfilePage from '../../../../pages/IRAS/reviewResearch/sponsorWorkspace/MyOrganisationsUserProfilePage';

const { Given, When, Then } = createBdd(test);

Given(
  'I see the details for {string} are correctly displayed on {string}',
  async (
    { myOrganisationsUserProfilePage, myOrganisationsEditUserProfilePage, loginPage, userProfilePage },
    user: string,
    pageType: string
  ) => {
    const username = loginPage.loginPageTestData[user].username;
    await userProfilePage.sqlGetUserProfileByEmail(username);
    let page: MyOrganisationsUserProfilePage | MyOrganisationsEditUserProfilePage;

    if (pageType.toLowerCase().includes('edit')) {
      page = myOrganisationsEditUserProfilePage;
      await expect
        .soft(
          myOrganisationsEditUserProfilePage.role_radio
            .locator('..')
            .getByLabel(await myOrganisationsUserProfilePage.getRole())
        )
        .toBeChecked();
      await expect
        .soft(
          myOrganisationsEditUserProfilePage.authoriser_radio
            .locator('..')
            .getByLabel(await myOrganisationsUserProfilePage.getAuthoriser())
        )
        .toBeChecked();
    } else {
      page = myOrganisationsUserProfilePage;
      expect.soft(myOrganisationsUserProfilePage.role_value).toHaveText(await myOrganisationsUserProfilePage.getRole());
      expect
        .soft(myOrganisationsUserProfilePage.authoriser_value)
        .toHaveText(await myOrganisationsUserProfilePage.getAuthoriser());
      expect
        .soft(myOrganisationsUserProfilePage.status_value)
        .toHaveText(await myOrganisationsUserProfilePage.getStatus());
    }

    expect.soft(page.title_value).toHaveText(await userProfilePage.getTitle());
    expect.soft(page.first_name_value).toHaveText(await userProfilePage.getFirstName());
    expect.soft(page.last_name_value).toHaveText(await userProfilePage.getLastName());
    expect.soft(page.email_value).toHaveText(await userProfilePage.getEmail());
    expect.soft(page.telephone_value).toHaveText(await userProfilePage.getTelephone());
    expect.soft(page.organisation_value).toHaveText(await userProfilePage.getOrganisation());
    expect.soft(page.job_title_value).toHaveText(await userProfilePage.getJobTitle());
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

When(
  'I click the change link against {string} on my organisations user profile page',
  async ({ myOrganisationsUserProfilePage, commonItemsPage }, fieldKey: string) => {
    const changeLink = await commonItemsPage.getChangeLink(fieldKey, myOrganisationsUserProfilePage);
    // await myOrganisationsUserProfilePage.page.pause();
    // await changeLink.highlight();
    // await myOrganisationsUserProfilePage.page.pause();
    await expect(changeLink).toBeVisible();
    await changeLink.click();
  }
);

Then(
  'I can see the successful user update message on my organisations user profile page',
  async ({ commonItemsPage, myOrganisationsUserProfilePage }) => {
    await expect.soft(commonItemsPage.alert_box.locator(commonItemsPage.success_message_header_text)).toBeVisible();
    await expect
      .soft(commonItemsPage.alert_box.locator(myOrganisationsUserProfilePage.user_updated_success_message_text))
      .toBeVisible();
  }
);
