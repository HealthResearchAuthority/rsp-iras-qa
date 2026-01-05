import { createBdd } from 'playwright-bdd';
import { expect, test } from '../../../hooks/CustomFixtures';
import { Locator } from '@playwright/test';
//import MyOrganisationsPage from '../../../pages/IRAS/makeChanges/MyOrganisationsPage';

const { Then } = createBdd(test);

Then('I can see the my organisations page', async ({ myOrganisationsPage }) => {
  await myOrganisationsPage.assertOnMyOrganisationsPage();
});

Then(
  'I can see the {string} ui labels on the my organisations page',
  async ({ myOrganisationsPage }, datasetName: string) => {
    const dataset = myOrganisationsPage.myOrganisationsPageTestData.My_Organisations_Table[datasetName];
    for (const key in dataset) {
      if (Object.hasOwn(dataset, key)) {
        const locator: Locator = myOrganisationsPage[key];
        await expect(locator).toBeVisible();
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
  async ({ myOrganisationsPage, checkSetupSponsorOrganisationPage }, user: string) => {
    const sponsorOrgName = await checkSetupSponsorOrganisationPage.getOrgName();
    const countryName = await checkSetupSponsorOrganisationPage.getCountry();
    const orgNameValue = await myOrganisationsPage.organisations_table.locator('tbody tr td:nth-child(1)').innerText();
    await expect.soft(orgNameValue).toBe(sponsorOrgName);
    const countryValue = await myOrganisationsPage.organisations_table.locator('tbody tr td:nth-child(2)').innerText();
    await expect.soft(countryValue).toBe(countryName);

    const linkName = await myOrganisationsPage.organisations_table.locator('tbody tr td:nth-child(3)').innerText();
    if (user === 'Sponsor_User') {
      await expect.soft(linkName).toBe('View');
    } else {
      await expect.soft(linkName).toBe('Manage');
    }
  }
);
