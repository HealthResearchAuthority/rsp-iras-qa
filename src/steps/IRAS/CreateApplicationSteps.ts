import { createBdd } from 'playwright-bdd';
import { test } from '../../hooks/CustomFixtures';

const { Given } = createBdd(test);

Given(
  'I enter the application name and description for {string}',
  async ({ createApplicationPage }, datasetName: string) => {
    const dataset = createApplicationPage.createApplicationPageData[datasetName];
    await createApplicationPage.applicationNameInput.fill(dataset.name);
    await createApplicationPage.applicationDescriptionInput.fill(dataset.description);
  }
);
