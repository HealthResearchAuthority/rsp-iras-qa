import { createBdd } from 'playwright-bdd';
import { test } from '../../../../../hooks/CustomFixtures';
const { When } = createBdd(test);
import config from '../../../../../../playwright.config';

When(
  'I select a sponsor organisation in the set up a new sponsor organisation page using {string}',
  async ({ setupNewSponsorOrganisationPage, commonItemsPage, $tags }, sponsorDatasetName: string) => {
    let dataset =
      setupNewSponsorOrganisationPage.setupNewSponsorOrganisationPageTestData.Setup_New_Sponsor_Organisation[
        'Sponsor_Organisation_One'
      ];
    if (sponsorDatasetName === 'existing sponsor organisation') {
      const sponsorOrgName = await commonItemsPage.getSearchKey();
      dataset['sponsor_organisation_text'] = sponsorOrgName;
    } else {
      dataset =
        setupNewSponsorOrganisationPage.setupNewSponsorOrganisationPageTestData.Setup_New_Sponsor_Organisation[
          sponsorDatasetName
        ];
    }
    const isJsEnabled =
      ($tags.includes('@jsEnabled') || config.projects?.[1].use?.javaScriptEnabled) && !$tags.includes('@jsDisabled');
    for (const key in dataset) {
      if (Object.hasOwn(dataset, key)) {
        if (key === 'sponsor_organisation_text') {
          if (isJsEnabled) {
            await commonItemsPage.selectSponsorOrgJsEnabled(dataset, key, commonItemsPage);
          } else {
            await setupNewSponsorOrganisationPage.selectSponsorOrgJsDisabled(dataset, key, commonItemsPage);
          }
          delete dataset['sponsor_organisation_jsenabled_text'];
        } else {
          await commonItemsPage.fillUIComponent(dataset, key, setupNewSponsorOrganisationPage);
        }
      }
    }
  }
);
