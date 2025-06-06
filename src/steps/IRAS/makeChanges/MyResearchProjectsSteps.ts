import { createBdd } from 'playwright-bdd';
import { test } from '../../../hooks/CustomFixtures';

const { Then } = createBdd(test);

Then('I have navigated to the my research projects page', async ({ myResearchProjectsPage }) => {
  await myResearchProjectsPage.goto();
  await myResearchProjectsPage.assertOnMyResearchProjectsPage();
});

Then('I can see the my research projects page', async ({ myResearchProjectsPage }) => {
  await myResearchProjectsPage.assertOnMyResearchProjectsPage();
});
