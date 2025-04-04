import { createBdd } from 'playwright-bdd';
import { expect, test } from '../../../../hooks/CustomFixtures';

const { Then } = createBdd(test);

Then('I can see the system administration home page', async ({ systemAdministrationHomePage }) => {
  await systemAdministrationHomePage.assertOnSystemAdministrationHomePage();
});

Then(
  'I can see the {string} ui labels on the system administration home page',
  async ({ commonItemsPage, systemAdministrationHomePage }, datasetName: string) => {
    const dataset = systemAdministrationHomePage.systemAdminHomePageTestData[datasetName];
    for (const key in dataset) {
      if (Object.prototype.hasOwnProperty.call(dataset, key)) {
        const labelValue = await commonItemsPage.getUiLabel(dataset, key, systemAdministrationHomePage);
        expect(labelValue).toBe(dataset[key]);
      }
    }
  }
);
