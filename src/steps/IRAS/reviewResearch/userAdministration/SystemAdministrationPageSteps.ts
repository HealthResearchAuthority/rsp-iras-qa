import { createBdd } from 'playwright-bdd';
import { expect, test } from '../../../../hooks/CustomFixtures';

const { Then } = createBdd(test);

Then('I can see the system administration home page', async ({ systemAdministrationPage }) => {
  await systemAdministrationPage.assertOnSystemAdministrationPage();
});

Then(
  'I can see the {string} ui labels on the system administration home page',
  async ({ commonItemsPage, systemAdministrationPage }, datasetName: string) => {
    const dataset = systemAdministrationPage.systemAdminPageTestData[datasetName];
    for (const key in dataset) {
      if (Object.prototype.hasOwnProperty.call(dataset, key)) {
        const labelValue = await commonItemsPage.getUiLabel(key, systemAdministrationPage);
        expect(labelValue).toBe(dataset[key]);
      }
    }
  }
);

Then(
  'the top menu bar will not have links to {string} or {string}',
  async ({ commonItemsPage }, usersLink: string, adminLink: string) => {
    const allTopMenuBarLinksExpectedValues = commonItemsPage.commonTestData.top_menu_bar_links;
    const allTopMenuBarLinksActualValues = await commonItemsPage.getTopMenuBarLinksNames();
    expect(allTopMenuBarLinksActualValues).toEqual(allTopMenuBarLinksExpectedValues);
    expect(allTopMenuBarLinksActualValues).not.toContain(usersLink);
    expect(allTopMenuBarLinksActualValues).not.toContain(adminLink);
  }
);
