import { createBdd } from 'playwright-bdd';
import { expect, test } from '../../../../hooks/CustomFixtures';

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

    if (pageType.toLowerCase().includes('edit')) {
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
      expect.soft(myOrganisationsUserProfilePage.role_value).toHaveText(await myOrganisationsUserProfilePage.getRole());
      expect
        .soft(myOrganisationsUserProfilePage.authoriser_value)
        .toHaveText(await myOrganisationsUserProfilePage.getAuthoriser());
      expect
        .soft(myOrganisationsUserProfilePage.status_value)
        .toHaveText(await myOrganisationsUserProfilePage.getStatus());
    }

    expect.soft(myOrganisationsUserProfilePage.title_value).toHaveText(await userProfilePage.getTitle());
    expect.soft(myOrganisationsUserProfilePage.first_name_value).toHaveText(await userProfilePage.getFirstName());
    expect.soft(myOrganisationsUserProfilePage.last_name_value).toHaveText(await userProfilePage.getLastName());
    expect.soft(myOrganisationsUserProfilePage.email_value).toHaveText(await userProfilePage.getEmail());
    expect.soft(myOrganisationsUserProfilePage.telephone_value).toHaveText(await userProfilePage.getTelephone());
    expect.soft(myOrganisationsUserProfilePage.organisation_value).toHaveText(await userProfilePage.getOrganisation());
    expect.soft(myOrganisationsUserProfilePage.job_title_value).toHaveText(await userProfilePage.getJobTitle());
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

Then(
  'I can see a {string} section on my organisation user profile page',
  async ({ myOrganisationsUserProfilePage }, status: string) => {
    if (status.toLowerCase() == 'disable_user') {
      await expect.soft(myOrganisationsUserProfilePage.disabled_section_header).toBeVisible();
      await expect.soft(myOrganisationsUserProfilePage.disabled_section_guidance_text).toBeVisible();
    } else {
      await expect.soft(myOrganisationsUserProfilePage.enabled_section_header).toBeVisible();
      await expect.soft(myOrganisationsUserProfilePage.enabled_section_guidance_text).toBeVisible();
    }
  }
);
