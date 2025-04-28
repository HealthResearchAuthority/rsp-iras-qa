import { createBdd } from 'playwright-bdd';
import { expect, test } from '../../../hooks/CustomFixtures';
import { generateRandomNumber } from '../.././../utils/GenerateTestData';
import path from 'path';
const pathToTestDataJson = './src/resources/test_data/iras/make_changes/project_details_iras_data.json';

const { Then } = createBdd(test);

Then('I can see the project details iras page', async ({ projectDetailsIRASPage }) => {
  await projectDetailsIRASPage.assertOnProjectDetailsIRASPage();
});

Then(
  'I can see the {string} ui labels on the project details iras page',
  async ({ commonItemsPage, projectDetailsIRASPage }, datasetName: string) => {
    const dataset = projectDetailsIRASPage.projectDetailsIRASPageTestData[datasetName];
    for (const key in dataset) {
      if (Object.prototype.hasOwnProperty.call(dataset, key)) {
        const labelVal = await commonItemsPage.getUiLabel(dataset, key, projectDetailsIRASPage);
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
      if (Object.prototype.hasOwnProperty.call(dataset, key)) {
        await commonItemsPage.fillUIComponent(dataset, key, projectDetailsIRASPage);
      }
    }
  }
);

Then('I fill the unique iras id in project details iras page', async ({ projectDetailsIRASPage }) => {
  const uniqueIrasId = generateRandomNumber();
  await projectDetailsIRASPage.setUniqueIrasId(uniqueIrasId);
  const filePath = path.resolve(pathToTestDataJson);
  await projectDetailsIRASPage.updateUniqueIrasIdTestDataJson(filePath, uniqueIrasId);
  await projectDetailsIRASPage.iras_id_text.fill(uniqueIrasId);
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
      if (Object.prototype.hasOwnProperty.call(dataset, key)) {
        await commonItemsPage.validateUIComponentValues(dataset, key, projectDetailsIRASPage);
      }
    }
  }
);
