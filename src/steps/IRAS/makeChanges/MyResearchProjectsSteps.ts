import { createBdd } from 'playwright-bdd';
import { expect, test } from '../../../hooks/CustomFixtures';

const { Then } = createBdd(test);

Then('I have navigated to the my research projects page', async ({ myResearchProjectsPage }) => {
  await myResearchProjectsPage.assertOnMyResearchProjectsPage();
});

Then('I can see the my research projects page', async ({ myResearchProjectsPage }) => {
  await myResearchProjectsPage.assertOnMyResearchProjectsPage();
});

Then(
  'I can see the {string} on the my research project page',
  async ({ myResearchProjectsPage }, datasetName: string) => {
    const dataset = myResearchProjectsPage.myResearchProjectsPageTestData[datasetName];
    expect(await myResearchProjectsPage.noProjectsAvailableLabel.textContent()).toBe(dataset.noProjectsAvailable);
  }
);
