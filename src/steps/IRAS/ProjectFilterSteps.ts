import { createBdd } from 'playwright-bdd';
import { test } from '../../hooks/CustomFixtures';

const { Then } = createBdd(test);

Then(
  'I fill the project details section in the project filter page with {string}',
  async ({ projectFilterPage, commonItemsPage }, datasetName: string) => {
    const dataset = projectFilterPage.projectFilterPageTestData.Project_Details[datasetName];
    for (const key in dataset) {
      if (Object.prototype.hasOwnProperty.call(dataset, key)) {
        await commonItemsPage.fillUIComponent(dataset, key, projectFilterPage);
      }
    }
  }
);

Then(
  'I fill the project scope section in the project filter page with {string}',
  async ({ projectFilterPage, commonItemsPage }, datasetName: string) => {
    const dataset = projectFilterPage.projectFilterPageTestData.Project_Scope[datasetName];
    for (const key in dataset) {
      if (Object.prototype.hasOwnProperty.call(dataset, key)) {
        await commonItemsPage.fillUIComponent(dataset, key, projectFilterPage);
      }
    }
  }
);

Then(
  'I fill the research location section in the project filter page with {string}',
  async ({ projectFilterPage, commonItemsPage }, datasetName: string) => {
    const dataset = projectFilterPage.projectFilterPageTestData.Research_Location[datasetName];
    for (const key in dataset) {
      if (Object.prototype.hasOwnProperty.call(dataset, key)) {
        await commonItemsPage.fillUIComponent(dataset, key, projectFilterPage);
      }
    }
  }
);
