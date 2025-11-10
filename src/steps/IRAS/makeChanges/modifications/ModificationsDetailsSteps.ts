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
  const changesDataset = modificationsCommonPage.modificationsCommonPageTestData[datasetName];
  const changeNames = Object.keys(changesDataset).reverse();
  // Headings assertions
  expect.soft(modificationsCommonPage.overall_modification_ranking_sub_heading).toBeVisible();
  expect.soft(modificationsCommonPage.ranking_sub_heading).toBeVisible();
  expect.soft(modificationsCommonPage.changes_sub_heading).toBeVisible();
  // Get actual values
  const actualValuesArray = await modificationsCommonPage.getActualFieldValuesOnModificationPage(
    modificationsCommonPage.allChangeCards,
    changesDataset,
    changeNames
  );
  // Loop through each change and assert
  for (let index = 0; index < actualValuesArray.length; index++) {
    const changeName = changeNames[index];
    const expectedData = changesDataset[changeName];
    for (const key of Object.keys(expectedData)) {
      const expectedValues = await modificationsCommonPage.getExpectedValues(expectedData, key, index);
      expect.soft(actualValuesArray[index].individualChangeStatus).toBe(expectedValues.expectedChangeStatus);
      expect.soft(actualValuesArray[index].areaOfChangeSubHeading).toBe(expectedValues.expectedAreaOfChangeSubHeading);
      if (expectedValues.expectedSpecificChangeValue) {
        expect.soft(actualValuesArray[index].specificChangeValue).toBe(expectedValues.expectedSpecificChangeValue);
      }
    }
  }
});
