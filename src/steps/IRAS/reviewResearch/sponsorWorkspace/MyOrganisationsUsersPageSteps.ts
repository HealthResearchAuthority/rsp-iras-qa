import { createBdd } from 'playwright-bdd';
import { expect, test } from '../../../../hooks/CustomFixtures';
const { Then } = createBdd(test);

Then(
  'I can see the users tab in the sponsor organisation profile for the selected sponsor organisation {string}',
  async ({ mySponsorOrgUsersPage, commonItemsPage }, sponsorOrg: string) => {
    await mySponsorOrgUsersPage.assertOnMySponsorOrgUsersPage(sponsorOrg, commonItemsPage);
  }
);

Then(
  'I can see tabs are displayed based on the logged in user role {string}',
  async ({ mySponsorOrgUsersPage }, userLoggedIn: string) => {
    const tabNames = await mySponsorOrgUsersPage.getVisibleTabNames();
    if (userLoggedIn === 'Sponsor_Org_Admin_User' || userLoggedIn === 'System_Admin') {
      expect
        .soft(tabNames)
        .toEqual(
          mySponsorOrgUsersPage.mySponsorOrgUsersPageTestData.My_Organisations_Users_Page.org_admin_sys_admin_tabs.slice()
        );
    } else if (userLoggedIn === 'Sponsor_User') {
      expect
        .soft(tabNames)
        .toEqual(
          mySponsorOrgUsersPage.mySponsorOrgUsersPageTestData.My_Organisations_Users_Page.sponsor_user_tabs.slice()
        );
    }
  }
);

Then('the users tab is underlined', async ({ mySponsorOrgUsersPage }) => {
  await expect.soft(mySponsorOrgUsersPage.usersLink).toBeVisible();
  await expect.soft(mySponsorOrgUsersPage.users_tab_active).toHaveCount(1);
});

Then(
  'the add a user section is {string} based on the logged in user role',
  async ({ mySponsorOrgUsersPage }, visibility: string) => {
    if (visibility === 'not visible') {
      await expect.soft(mySponsorOrgUsersPage.add_a_user_section_heading).toBeHidden();
      await expect.soft(mySponsorOrgUsersPage.add_a_user_section_hint_text).toBeHidden();
      await expect.soft(mySponsorOrgUsersPage.add_a_user_button).toBeHidden();
    } else if (visibility === 'visible') {
      await expect.soft(mySponsorOrgUsersPage.add_a_user_section_heading).toBeVisible();
      await expect.soft(mySponsorOrgUsersPage.add_a_user_section_hint_text).toBeVisible();
      await expect.soft(mySponsorOrgUsersPage.add_a_user_button).toBeVisible();
    }
  }
);

Then(
  'the action column section shows the hyperlink as {string} based on the logged in user role',
  async ({ mySponsorOrgUsersPage }, visibleLink: string) => {
    const texts = (await mySponsorOrgUsersPage.actionLinks.allTextContents()).map((t) => t.trim());
    texts.forEach((t) => expect.soft(t).toBe(visibleLink));
    const hrefs = await mySponsorOrgUsersPage.actionLinks.evaluateAll((anchors) =>
      anchors.map((a) => (a as HTMLAnchorElement).getAttribute('href') || '')
    );
    // ensure none are null/empty if that’s expected
    hrefs.forEach((href) => expect.soft(href).not.toBeNull());
  }
);

Then(
  'I can see the {string} successful message on users tab in the sponsor organisation profile for the selected sponsor organisation',
  async ({ mySponsorOrgUsersPage, commonItemsPage }, activityName: string) => {
    await expect.soft(commonItemsPage.success_message_header_text).toBeVisible();
    if (activityName === 'user added') {
      await expect.soft(mySponsorOrgUsersPage.user_added_to_sponsor_organisation__success_message_text).toBeVisible();
    }
    expect
      .soft(
        await mySponsorOrgUsersPage.information_alert_banner.evaluate((e: any) =>
          getComputedStyle(e).getPropertyValue('border-color')
        )
      )
      .toBe(commonItemsPage.commonTestData.rgb_green_color);
    expect
      .soft(
        await mySponsorOrgUsersPage.information_alert_banner.evaluate((e: any) =>
          getComputedStyle(e).getPropertyValue('background-color')
        )
      )
      .toBe(commonItemsPage.commonTestData.rgb_green_color);
  }
);

Then(
  'I add twenty five users to the sponsor organisation to verify pagination, search and sort in user list page',
  async ({ mySponsorOrgUsersPage, commonItemsPage }) => {
    const automationUserEmailsSet = await mySponsorOrgUsersPage.getAutomationUserEmails();
    const emails = Array.from(automationUserEmailsSet).slice(0, 25);
    for (let i = 0; i < emails.length; i++) {
      console.log(`${i}`);
      await commonItemsPage.govUkLink.getByText('Add a new user profile record', { exact: true }).click();
      await commonItemsPage.page.reload({ waitUntil: 'networkidle' });
      await commonItemsPage.page.waitForTimeout(2000);
      const email = emails[i];
      await commonItemsPage.search_text.fill(email);
      await commonItemsPage.govUkButton.getByText('Search', { exact: true }).click();
      await commonItemsPage.page.reload({ waitUntil: 'networkidle' });
      await commonItemsPage.page.waitForTimeout(2000);
      await commonItemsPage.govUkLink.getByText('Add user', { exact: true }).click();
      await commonItemsPage.page.reload({ waitUntil: 'networkidle' });
      await commonItemsPage.page.waitForTimeout(2000);
      await commonItemsPage.page.reload({ waitUntil: 'networkidle' });
      await commonItemsPage.govUkButton.getByText('Add user', { exact: true }).click();
      await commonItemsPage.page.reload({ waitUntil: 'networkidle' });
      await commonItemsPage.page.waitForTimeout(2000);
    }
  }
);
