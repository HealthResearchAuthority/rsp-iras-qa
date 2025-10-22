import { createBdd } from 'playwright-bdd';
import { expect, test } from '../../../hooks/CustomFixtures';
import config from '../../../../playwright.config';

const { Then } = createBdd(test);

Then('I can see the research locations page', async ({ reseachLocationsPage }) => {
  await reseachLocationsPage.assertOnResearchLocationsPage();
});

Then(
  'I fill the research locations page with {string}',
  async ({ commonItemsPage, reseachLocationsPage }, datasetName: string) => {
    const dataset = reseachLocationsPage.researchLocationsPageTestData[datasetName];
    for (const key in dataset) {
      if (Object.hasOwn(dataset, key)) {
        await commonItemsPage.fillUIComponent(dataset, key, reseachLocationsPage);
      }
    }
  }
);

Then(
  'I can see the {string} ui labels on the research locations page',
  async ({ commonItemsPage, reseachLocationsPage }, datasetName: string) => {
    const dataset = reseachLocationsPage.researchLocationsPageTestData[datasetName];
    for (const key in dataset) {
      if (Object.hasOwn(dataset, key)) {
        const labelVal = await commonItemsPage.getUiLabel(key, reseachLocationsPage);
        expect(labelVal).toBe(dataset[key]);
      }
    }
  }
);

Then(
  'I can see previously saved values for {string} displayed on the research locations page',
  async ({ commonItemsPage, reseachLocationsPage }, datasetName: string) => {
    const dataset = reseachLocationsPage.researchLocationsPageTestData[datasetName];
    for (const key in dataset) {
      if (Object.hasOwn(dataset, key)) {
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

Then('I validate lead nation radio option when javascript disabled', async ({ reseachLocationsPage }) => {
  await expect(reseachLocationsPage.lead_nation_radio.first()).toBeVisible();
});

Then(
  'I validate the guidance content displayed based on the data entered using {string} dataset on the research locations page',
  async ({ commonItemsPage, reseachLocationsPage, $tags }, datasetName: string) => {
    const dataset = reseachLocationsPage.researchLocationsPageTestData[datasetName];
    if (
      dataset.is_nhs_hsc_organisation_radio.toLowerCase() === 'yes' ||
      $tags.includes('@jsDisabled') ||
      !config.projects?.[1].use?.javaScriptEnabled
    ) {
      await commonItemsPage.verifyDetailsExpanded('closed', reseachLocationsPage.details_component);
      await reseachLocationsPage.details_component
        .getByText(
          reseachLocationsPage.researchLocationsPageTestData.Research_Locations_Page.guidance_header_lead_nation
        )
        .click();
      await commonItemsPage.verifyDetailsExpanded('open', reseachLocationsPage.details_component);
      await expect(
        reseachLocationsPage.details_component.getByText(
          reseachLocationsPage.researchLocationsPageTestData.Research_Locations_Page.guidance_body_lead_nation
        )
      ).toBeVisible();
      await reseachLocationsPage.details_component
        .getByText(
          reseachLocationsPage.researchLocationsPageTestData.Research_Locations_Page.guidance_header_lead_nation
        )
        .click();
      await commonItemsPage.verifyDetailsExpanded('closed', reseachLocationsPage.details_component);
      await reseachLocationsPage.details_component
        .getByText(
          reseachLocationsPage.researchLocationsPageTestData.Research_Locations_Page.guidance_header_lead_nation
        )
        .click();
    } else {
      await expect(
        reseachLocationsPage.details_component.getByText(
          reseachLocationsPage.researchLocationsPageTestData.Research_Locations_Page.guidance_header_lead_nation
        )
      ).toBeHidden();
    }
  }
);
