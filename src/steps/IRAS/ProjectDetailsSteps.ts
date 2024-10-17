import { createBdd } from 'playwright-bdd';
import { test } from '../../hooks/CustomFixtures';

const { Then } = createBdd(test);

Then(
  'I fill the project information section on the project details page with {string}',
  async ({ projectDetailsPage, commonItemsPage }, datasetName: string) => {
    const dataset = projectDetailsPage.projectDetailsPageTestData.Project_Information[datasetName];
    for (const key in dataset) {
      if (Object.prototype.hasOwnProperty.call(dataset, key)) {
        await commonItemsPage.fillUIComponent(dataset, key, projectDetailsPage);
      }
    }
  }
);

Then(
  'I fill the public involvement section on the project details page with {string}',
  async ({ projectDetailsPage, commonItemsPage }, datasetName: string) => {
    const dataset = projectDetailsPage.projectDetailsPageTestData.Public_Involvement[datasetName];
    for (const key in dataset) {
      if (Object.prototype.hasOwnProperty.call(dataset, key)) {
        await commonItemsPage.fillUIComponent(dataset, key, projectDetailsPage);
      }
    }
  }
);

Then(
  'I fill the research design and methodology section on the project details page with {string}',
  async ({ projectDetailsPage, commonItemsPage }, datasetName: string) => {
    const dataset = projectDetailsPage.projectDetailsPageTestData.Research_Design[datasetName];
    for (const key in dataset) {
      if (Object.prototype.hasOwnProperty.call(dataset, key)) {
        await commonItemsPage.fillUIComponent(dataset, key, projectDetailsPage);
      }
    }
  }
);

Then(
  'I fill the research activities section on the project details page with {string}',
  async ({ projectDetailsPage, commonItemsPage }, datasetName: string) => {
    const dataset = projectDetailsPage.projectDetailsPageTestData.Research_Activities[datasetName];
    for (const key in dataset) {
      if (Object.prototype.hasOwnProperty.call(dataset, key)) {
        await commonItemsPage.fillUIComponent(dataset, key, projectDetailsPage);
      }
    }
  }
);

Then(
  'I fill the participants section on the project details page with {string}',
  async ({ projectDetailsPage, commonItemsPage }, datasetName: string) => {
    const dataset = projectDetailsPage.projectDetailsPageTestData.Participants[datasetName];
    for (const key in dataset) {
      if (Object.prototype.hasOwnProperty.call(dataset, key)) {
        await commonItemsPage.fillUIComponent(dataset, key, projectDetailsPage);
      }
    }
  }
);
