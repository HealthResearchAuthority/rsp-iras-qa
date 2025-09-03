import { createBdd } from 'playwright-bdd';
import { expect, test } from '../../../hooks/CustomFixtures';
import { generateIrasId, generateRandomValidIrasId } from '../.././../utils/GenerateTestData';

const { Then } = createBdd(test);

Then('I can see the project details iras page', async ({ projectDetailsIRASPage }) => {
  await projectDetailsIRASPage.assertOnProjectDetailsIRASPage();
});

Then(
  'I can see the {string} ui labels on the project details iras page',
  async ({ commonItemsPage, projectDetailsIRASPage }, datasetName: string) => {
    const dataset = projectDetailsIRASPage.projectDetailsIRASPageTestData[datasetName];
    for (const key in dataset) {
      if (Object.hasOwn(dataset, key)) {
        const labelVal = await commonItemsPage.getUiLabel(key, projectDetailsIRASPage);
        expect(labelVal).toBe(dataset[key]);
      }
    }
  }
);

Then(
  'I fill the project details iras page with {string}',
  async ({ commonItemsPage, projectDetailsIRASPage }, datasetName: string) => {
    const dataset = projectDetailsIRASPage.projectDetailsIRASPageTestData[datasetName];
    for (const key in dataset) {
      if (Object.hasOwn(dataset, key)) {
        if (['Valid_IRAS_ID_Max', 'Valid_IRAS_ID_Min', 'Invalid_IRAS_ID_Min_Length'].includes(datasetName)) {
          dataset[key] = generateIrasId(datasetName);
        }
        await commonItemsPage.fillUIComponent(dataset, key, projectDetailsIRASPage);
      }
    }
  }
);

Then('I fill the unique iras id in project details iras page', async ({ projectDetailsIRASPage }) => {
  const uniqueIrasId = generateRandomValidIrasId();
  await projectDetailsIRASPage.setUniqueIrasId(uniqueIrasId);
  await projectDetailsIRASPage.iras_id_text.fill(await projectDetailsIRASPage.getUniqueIrasId());
});

Then('I fill the existing iras id in project details iras page', async ({ projectDetailsIRASPage }) => {
  const irasIdRunTime = await projectDetailsIRASPage.getUniqueIrasId();
  await projectDetailsIRASPage.iras_id_text.fill(irasIdRunTime);
});

Then(
  'I can see previously saved values for {string} displayed on the project details iras page',
  async ({ commonItemsPage, projectDetailsIRASPage }, datasetName: string) => {
    const dataset = projectDetailsIRASPage.projectDetailsIRASPageTestData[datasetName];
    for (const key in dataset) {
      if (Object.hasOwn(dataset, key)) {
        await commonItemsPage.validateUIComponentValues(dataset, key, projectDetailsIRASPage);
      }
    }
  }
);
