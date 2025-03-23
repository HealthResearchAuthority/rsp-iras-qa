import { createBdd } from 'playwright-bdd';
import { expect, test } from '../../../hooks/CustomFixtures';

const { Then } = createBdd(test);

Then('I can see the research locations page', async ({ reseachLocationsPage }) => {
  await reseachLocationsPage.assertOnResearchLocationsPage();
});

Then(
  'I fill the research locations page with {string}',
  async ({ commonItemsPage, reseachLocationsPage }, datasetName: string) => {
    const dataset = reseachLocationsPage.researchLocationsPageTestData[datasetName];
    for (const key in dataset) {
      if (Object.prototype.hasOwnProperty.call(dataset, key)) {
        await commonItemsPage.fillUIComponent(dataset, key, reseachLocationsPage);
      }
    }
  }
);

Then(
  'I can see the {string} ui labels on the research locations page',
  async ({ reseachLocationsPage }, datasetName: string) => {
    const dataset = reseachLocationsPage.researchLocationsPageTestData[datasetName];
    expect((await reseachLocationsPage.nations_participating_label.textContent())?.trim()).toBe(
      dataset.nations_participating_label
    );
    // expect((await reseachLocationsPage.nations_participating_hint_label.textContent())?.trim()).toBe(dataset.nations_participating_hint_label);
    expect((await reseachLocationsPage.is_nhs_hsc_organisation_label.textContent())?.trim()).toBe(
      dataset.is_nhs_hsc_organisation_label
    );
    expect((await reseachLocationsPage.lead_nation_label.textContent())?.trim()).toBe(dataset.lead_nation_label);
  }
);

Then(
  'I can see previously saved values for {string} displayed on the research locations page',
  async ({ commonItemsPage, reseachLocationsPage }, datasetName: string) => {
    const dataset = reseachLocationsPage.researchLocationsPageTestData[datasetName];
    for (const key in dataset) {
      if (Object.prototype.hasOwnProperty.call(dataset, key)) {
        await commonItemsPage.validateUIComponentValues(dataset, key, reseachLocationsPage);
      }
    }
  }
);

Then('I validate lead nation radio option for {string}', async ({ reseachLocationsPage }, datasetName: string) => {
  const dataset = reseachLocationsPage.researchLocationsPageTestData[datasetName];
  if (dataset.is_nhs_hsc_organisation_radio.toLowerCase() === 'no') {
    await expect(reseachLocationsPage.lead_nation_radio.first()).not.toBeVisible();
  }
  if (dataset.is_nhs_hsc_organisation_radio.toLowerCase() === 'yes') {
    await expect(reseachLocationsPage.lead_nation_radio.first()).toBeVisible();
  }
});
