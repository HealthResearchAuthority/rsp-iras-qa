import { createBdd } from 'playwright-bdd';
import { test, expect } from '../../../../hooks/CustomFixtures';

const { Then } = createBdd(test);

Then('I can see the modifications details page', async ({ modificationsDetailsPage }) => {
  await modificationsDetailsPage.assertOnModificationsDetailsPage();
});

Then('I can see the confirm remove modifications page', async ({ modificationsDetailsPage }) => {
  await modificationsDetailsPage.assertOnRemoveModificationsPage();
});

Then('I can see the modification unfinished error page', async ({ modificationsDetailsPage }) => {
  await modificationsDetailsPage.assertOnModificationUnfinishedErrorPage();
});

Then(
  'I can see the modification successfully removed message on modification details page',
  async ({ modificationsDetailsPage }) => {
    await expect.soft(modificationsDetailsPage.removeModificationSuccessMessageText).toBeVisible();
  }
);

Then(
  'I validate the ui labels on modification details page using {string}',
  async ({ modificationsDetailsPage, commonItemsPage }, datasetName) => {
    const dataset = modificationsDetailsPage.modificationsDetailsPageTestData[datasetName];
    for (const key in dataset) {
      if (Object.hasOwn(dataset, key)) {
        await commonItemsPage.validateUIComponentValues(dataset, key, modificationsDetailsPage);
      }
    }
  }
);

Then('I validate all fields on modification page {string}', async ({ modificationsCommonPage }, datasetName) => {
  modificationsCommonPage.validateAllFieldsOnModificationDetailsPage(datasetName);
});
