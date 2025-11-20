import { createBdd } from 'playwright-bdd';
import { expect, test } from '../../../../hooks/CustomFixtures';
const { Given } = createBdd(test);

Given(
  'I can see the {string} ui labels on the team manager dashboard page',
  async ({ commonItemsPage, teamManagerDashboardPage }, datasetName: string) => {
    const dataset = teamManagerDashboardPage.teamManagerDashBoardPageTestData[datasetName];
    for (const key in dataset) {
      if (Object.hasOwn(dataset, key)) {
        const labelVal = await commonItemsPage.getUiLabel(key, teamManagerDashboardPage);
        expect(labelVal).toBe(dataset[key]);
      }
    }
  }
);
