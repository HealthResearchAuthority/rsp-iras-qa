import { createBdd } from 'playwright-bdd';
import { test } from '../../../hooks/CustomFixtures';

const { Then } = createBdd(test);

Then('I can see the key project roles page', async ({ keyProjectRolesPage }) => {
  await keyProjectRolesPage.assertOnKeyProjectRolesPage();
});

Then(
  'I fill the key project roles page with {string}',
  async ({ commonItemsPage, keyProjectRolesPage }, datasetName: string) => {
    const dataset = keyProjectRolesPage.keyProjectRolesPageTestData[datasetName];
    for (const key in dataset) {
      if (Object.prototype.hasOwnProperty.call(dataset, key)) {
        await commonItemsPage.fillUIComponent(dataset, key, keyProjectRolesPage);
      }
    }
  }
);
