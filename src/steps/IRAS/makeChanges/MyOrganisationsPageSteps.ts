import { createBdd } from 'playwright-bdd';
import { expect, test } from '../../../hooks/CustomFixtures';
import { Locator } from '@playwright/test';
import { randomInt } from 'node:crypto';

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
  async ({ myOrganisationsPage, checkSetupSponsorOrganisationPage }, user: string) => {
    const sponsorOrgName = await checkSetupSponsorOrganisationPage.getOrgName();
    const countryName = await checkSetupSponsorOrganisationPage.getCountry();
    const orgNameValue = await myOrganisationsPage.orgName_Locator.innerText();
    expect.soft(orgNameValue).toBe(sponsorOrgName);
    const countryValue = await myOrganisationsPage.country_Locator.innerText();
    expect.soft(countryValue).toBe(countryName);
    const linkName = await myOrganisationsPage.action_Locator.innerText();
    if (user === 'Sponsor_User') {
      expect.soft(linkName).toBe('View');
    } else {
      expect.soft(linkName).toBe('Manage');
    }
  }
);

Then(
  'I enter partial {string} into the search field',
  async ({ commonItemsPage, checkSetupSponsorOrganisationPage, myOrgSponsorOrgProfilePage }, fieldKey: string) => {
    if (fieldKey == 'organisation name') {
      const sponsorOrgName = await checkSetupSponsorOrganisationPage.getOrgName();
      const minLen = 3;
      const start = randomInt(0, sponsorOrgName.length - minLen);
      const maxLen = sponsorOrgName.length - start;
      const len = randomInt(minLen, maxLen + 1);
      const partialText = sponsorOrgName.slice(start, start + len);
      await commonItemsPage.search_text.fill(partialText);
    }
    if (fieldKey == 'iras id') {
      const irasId = await myOrgSponsorOrgProfilePage.irasid_Locator.first().innerText();
      const startIndex = randomInt(0, irasId.length);
      const endIndex = randomInt(startIndex + 1, irasId.length + 1);
      const partialIrasId = irasId.substring(startIndex, endIndex);
      await commonItemsPage.search_text.fill(partialIrasId);
    }
  }
);
