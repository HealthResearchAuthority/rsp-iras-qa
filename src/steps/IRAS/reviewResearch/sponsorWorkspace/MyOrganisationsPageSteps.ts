import { createBdd } from 'playwright-bdd';
import { expect, test } from '../../../../hooks/CustomFixtures';
import { Locator } from '@playwright/test';

const { Given, When, Then } = createBdd(test);

Given('I can see the my organisations page', async ({ myOrganisationsPage }) => {
  await myOrganisationsPage.assertOnMyOrganisationsPage();
});

When(
  'I can see the {string} ui labels on the my organisations page',
  async ({ myOrganisationsPage }, datasetName: string) => {
    const dataset = myOrganisationsPage.myOrganisationsPageTestData.My_Organisations_Table[datasetName];
    for (const key in dataset) {
      if (Object.hasOwn(dataset, key)) {
        const locator: Locator = myOrganisationsPage[key];
        await expect.soft(locator).toBeVisible();
      }
    }
  }
);

Then('I can now see a table of results for my organisations', async ({ myOrganisationsPage, commonItemsPage }) => {
  await expect.soft(myOrganisationsPage.organisations_table).toBeVisible();
  expect.soft(await commonItemsPage.tableBodyRows.count()).toBeGreaterThan(0);
});

Then(
  'I can see the associated organisations displaying in the table for {string}',
  async ({ myOrganisationsPage, manageSponsorOrganisationPage, loginPage }, user: string) => {
    let userEmailValue: string = '';
    if (user === 'Sponsor_User') {
      userEmailValue = loginPage.loginPageTestData.Sponsor_User.username;
    } else if (user === 'Sponsor_Org_Admin_User') {
      userEmailValue = loginPage.loginPageTestData.Sponsor_Org_Admin_User.username;
    }
    const sponsorIds = new Set(await manageSponsorOrganisationPage.sqlGetSponsorRtsIdsByEmailAndActive(userEmailValue));
    const orgInfoList = [];
    for (const rtsId of sponsorIds) {
      const orgName = (await manageSponsorOrganisationPage.sqlGetOrganisationNameFromRTSById(rtsId)).toString();
      const orgCountry = (await manageSponsorOrganisationPage.sqlGetOrganisationCountryFromRTSById(rtsId)).toString();

      orgInfoList.push({
        orgName,
        orgCountry,
      });
    }
    const rows = myOrganisationsPage.organisations_table.locator('tbody tr');
    const rowCount = await rows.count();
    const uiList: { orgName: string; orgCountry: string }[] = [];
    for (let i = 0; i < rowCount; i++) {
      const row = rows.nth(i);
      const orgName = (await row.locator('td').nth(0).innerText()).trim();
      const orgCountry = (await row.locator('td').nth(1).innerText()).trim();
      uiList.push({ orgName, orgCountry });
      // const linkName = (await row.locator('td').nth(2).innerText()).trim();
      // if (user === 'Sponsor_User') {
      //   expect.soft(linkName).toBe('View');
      // } else {
      //   expect.soft(linkName).toBe('Manage');
      // }
    }
    expect.soft(uiList).toEqual(expect.arrayContaining(orgInfoList));
    expect.soft(uiList.length, 'Row count mismatch').toBe(orgInfoList.length);
  }
);

When(
  'I enter partial {string} into the search field',
  async (
    { myOrganisationsPage, commonItemsPage, checkSetupSponsorOrganisationPage, myOrgSponsorOrgProfilePage },
    fieldKey: string
  ) => {
    const partialString = myOrganisationsPage.generatePartialString(
      fieldKey,
      checkSetupSponsorOrganisationPage,
      myOrgSponsorOrgProfilePage
    );
    await commonItemsPage.search_text.fill(await partialString);
  }
);
