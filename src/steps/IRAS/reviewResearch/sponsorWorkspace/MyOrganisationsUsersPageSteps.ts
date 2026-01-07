import { createBdd } from 'playwright-bdd';
import { expect, test } from '../../../../hooks/CustomFixtures';
const { Then } = createBdd(test);

Then(
  'I can see tabs are displayed based on the logged in user role {string}',
  async ({ mySponsorOrgUsersPage }, userLoggedIn: string) => {
    if (userLoggedIn === 'Sponsor_Org_Admin_User' || userLoggedIn === 'System_Admin') {
      const tabNames = await mySponsorOrgUsersPage.getVisibleTabNames();
      expect
        .soft(tabNames)
        .toEqual(
          mySponsorOrgUsersPage.mySponsorOrgUsersPageTestData.My_Organisations_Users_Page.org_admin_sys_admin_tabs.slice()
        );
    } else if (userLoggedIn === 'Sponsor_User') {
      const tabNames = await mySponsorOrgUsersPage.getVisibleTabNames();
      expect
        .soft(tabNames)
        .toEqual(
          mySponsorOrgUsersPage.mySponsorOrgUsersPageTestData.My_Organisations_Users_Page.sponsor_user_tabs.slice()
        );
    }
  }
);

Then('the {string} tab is underlined', async ({ mySponsorOrgUsersPage }, activeTab: string) => {
  const usersLink = mySponsorOrgUsersPage.page.getByRole('link', { name: activeTab });
  await expect.soft(usersLink).toBeVisible();
  //   await expect.soft(usersLink).toHaveCSS('text-decoration-line', 'underline');
  //   const computed = await usersLink.evaluate((el) => getComputedStyle(el).textDecoration);
  //   expect.soft(computed.toLowerCase()).toContain('underline');
  const usersItem = mySponsorOrgUsersPage.page
    .locator('li.govuk-service-navigation__item--active')
    .filter({ has: mySponsorOrgUsersPage.page.getByRole('link', { name: activeTab }) });
  await expect.soft(usersItem).toHaveCount(1);
});

Then(
  'the add a user section is {string} based on the logged in user role',
  async ({ mySponsorOrgUsersPage }, visibility: string) => {
    const addUserButton = mySponsorOrgUsersPage.page.getByRole('button', { name: 'Add a user' });
    if (visibility === 'not visible') {
      expect.soft(addUserButton).toBeHidden();
    } else if (visibility === 'visible') {
      expect.soft(addUserButton).toBeVisible();
    }
  }
);

Then(
  'the action column section shows the hyperlink as {string} based on the logged in user role',
  async ({ mySponsorOrgUsersPage }, visibleLink: string) => {
    const actionLinks = mySponsorOrgUsersPage.page.locator('tbody tr td:last-child a.govuk-link');
    const texts = (await actionLinks.allTextContents()).map((t) => t.trim());
    texts.forEach((t) => expect.soft(t).toBe(visibleLink));
    const hrefs = await actionLinks.evaluateAll((anchors) =>
      anchors.map((a) => (a as HTMLAnchorElement).getAttribute('href') || '')
    );
    // ensure none are null/empty if that’s expected
    hrefs.forEach((href) => expect.soft(href).not.toBeNull());
  }
);

Then(
  'I add twenty five users to the sponsor organisation to verify pagination, search and sort in user list page',
  async ({ mySponsorOrgUsersPage, commonItemsPage }) => {
    const automationUserEmailsSet = await mySponsorOrgUsersPage.getAutomationUserEmails();
    console.log('Automation User Emails from JSON Test Data:', automationUserEmailsSet);
    const emails = Array.from(automationUserEmailsSet).slice(0, 25);
    for (let i = 0; i < emails.length; i++) {
      await commonItemsPage.govUkLink.getByText('Add a new user profile record', { exact: true }).click();
      await commonItemsPage.page.waitForTimeout(2000);
      const email = emails[i];
      console.log(`Adding user with email: ${email}`);
      await commonItemsPage.search_text.fill(email);
      await commonItemsPage.govUkButton.getByText('Search', { exact: true }).click();
      await commonItemsPage.page.waitForTimeout(1000);
      await commonItemsPage.govUkLink.getByText('Add user', { exact: true }).click();
      await commonItemsPage.page.waitForTimeout(1000);
      await commonItemsPage.govUkButton.getByText('Add user', { exact: true }).click();
      await commonItemsPage.page.waitForTimeout(1000);
    }
  }
);
