import { createBdd } from 'playwright-bdd';
import { test } from '../../../../../hooks/CustomFixtures';
const { When } = createBdd(test);
import config from '../../../../../../playwright.config';

When(
  'I select a sponsor organisation in the set up a new sponsor organisation page using {string}',
  async (
    { setupNewSponsorOrganisationPage, searchModificationsPage, commonItemsPage, $tags },
    filterDatasetName: string
  ) => {
    const dataset =
      setupNewSponsorOrganisationPage.setupNewSponsorOrganisationPageTestData.Setup_New_Sponsor_Organisation[
        filterDatasetName
      ];
    const isJsEnabled =
      ($tags.includes('@jsEnabled') || config.projects?.[1].use?.javaScriptEnabled) && !$tags.includes('@jsDisabled');
    for (const key in dataset) {
      if (Object.hasOwn(dataset, key)) {
        if (key === 'sponsor_organisation_text') {
          if (isJsEnabled) {
            await searchModificationsPage.selectSponsorOrgJsEnabled(
              dataset,
              key,
              commonItemsPage,
              setupNewSponsorOrganisationPage
            );
          } else {
            await setupNewSponsorOrganisationPage.selectSponsorOrgJsDisabled(
              dataset,
              key,
              commonItemsPage,
              setupNewSponsorOrganisationPage
            );
          }
          delete dataset['sponsor_organisation_jsenabled_text'];
        } else {
          await commonItemsPage.fillUIComponent(dataset, key, setupNewSponsorOrganisationPage);
        }
      }
    }
  }
);
