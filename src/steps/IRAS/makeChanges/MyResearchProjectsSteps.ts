import { createBdd } from 'playwright-bdd';
import { expect, test } from '../../../hooks/CustomFixtures';

const { Then } = createBdd(test);

Then(
  'I can see the {string} on the my research project page',
  async ({ myResearchProjectsPage }, datasetName: string) => {
    const dataset = myResearchProjectsPage.myResearchProjectsPageTestData[datasetName];
    expect(await myResearchProjectsPage.noProjectsAvailableLabel.textContent()).toBe(dataset.noProjectsAvailable);
  }
);
