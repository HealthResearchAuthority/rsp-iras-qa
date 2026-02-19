import { createBdd } from 'playwright-bdd';
import { test } from '../../../hooks/CustomFixtures';

const { Then } = createBdd(test);

Then('I can see the revise and authorise page', async ({ reviseAndAuthorisePage }) => {
  await reviseAndAuthorisePage.assertOnReviseAndAuthorisePage();
});

Then(
  'I fill the revise and authorise page with {string}',
  async ({ commonItemsPage, reviseAndAuthorisePage }, datasetName: string) => {
    const dataset = reviseAndAuthorisePage.reviseAndAuthorisePageTestData[datasetName];
    for (const key in dataset) {
      if (Object.hasOwn(dataset, key)) {
        await commonItemsPage.fillUIComponent(dataset, key, reviseAndAuthorisePage);
      }
    }
  }
);
