import { createBdd } from 'playwright-bdd';
import { test, expect } from '../../../../hooks/CustomFixtures';

const { Then } = createBdd(test);

Then('I can see the add sponsor reference page', async ({ sponsorReferencePage }) => {
  await sponsorReferencePage.assertOnSponsorReferencePage();
});

Then(
  'I can see the {string} ui labels on the sponsor reference modifications page',
  async ({ commonItemsPage, sponsorReferencePage }, datasetName: string) => {
    const dataset = sponsorReferencePage.sponsorReferencePageTestData[datasetName];
    for (const key in dataset) {
      if (Object.hasOwn(dataset, key)) {
        const labelVal = await commonItemsPage.getUiLabel(key, sponsorReferencePage);
        expect.soft(labelVal).toBe(dataset[key]);
      }
    }
  }
);

Then(
  'I fill the sponsor reference modifications page with {string}',
  async ({ commonItemsPage, sponsorReferencePage }, datasetName: string) => {
    const dataset = sponsorReferencePage.sponsorReferencePageTestData[datasetName];
    for (const key in dataset) {
      if (Object.hasOwn(dataset, key)) {
        await commonItemsPage.fillUIComponent(dataset, key, sponsorReferencePage);
      }
    }
  }
);
