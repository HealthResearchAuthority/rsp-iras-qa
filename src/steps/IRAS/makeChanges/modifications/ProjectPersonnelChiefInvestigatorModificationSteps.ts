import { createBdd } from 'playwright-bdd';
import { expect, test } from '../../../../hooks/CustomFixtures';

const { Then } = createBdd(test);

Then(
  'I fill the change chief investigator modifications page with {string} for {string} action',
  async ({ commonItemsPage, projectPersonnelChangeChiefInvestigatorPage }, datasetName: string, action: string) => {
    const dataset =
      projectPersonnelChangeChiefInvestigatorPage.projectPersonnelChangeChiefInvestigatorModificationPageTestData[
        datasetName
      ];
    const clickAction = action === 'create' ? 'Save_Continue' : 'Save_Changes';
    const radioKey = 'select_details_to_change_radio';
    if (dataset[radioKey]) {
      await commonItemsPage.fillUIComponent(dataset, radioKey, projectPersonnelChangeChiefInvestigatorPage);
      await commonItemsPage.clickButton('Modifications_Page', clickAction);
    }
    const ExpectedKeys = ['chief_investigator_email_text', 'first_name_text', 'last_name_text'];
    for (const key of ExpectedKeys) {
      if (dataset[key]) {
        await commonItemsPage.fillUIComponent(dataset, key, projectPersonnelChangeChiefInvestigatorPage);
      }
    }
  }
);

Then(
  'I keep note of the individual and overall ranking of change chief investigator change created using {string} and {string} dataset',
  async (
    { projectPersonnelChangeChiefInvestigatorPage, modificationsCommonPage, researchLocationsPage },
    datasetName,
    datasetNameResearchLocation
  ) => {
    const changeDataset =
      projectPersonnelChangeChiefInvestigatorPage.projectPersonnelChangeChiefInvestigatorModificationPageTestData[
        datasetName
      ];
    const researchLocationDataset = researchLocationsPage.researchLocationsPageTestData[datasetNameResearchLocation];
    await modificationsCommonPage.calculateAndStoreRankingForChangesForNonApplicability(
      datasetName,
      changeDataset,
      researchLocationDataset
    );
    await modificationsCommonPage.calculateAndStoreOverallRanking();
  }
);

Then(
  'I click enter link displayed on review your answers page for change chief investigator modification for {string}',
  async ({ projectPersonnelChangeChiefInvestigatorPage }, datasetName) => {
    switch (datasetName) {
      case 'Select_Details_To_Change': {
        await projectPersonnelChangeChiefInvestigatorPage.page
          .getByText(
            projectPersonnelChangeChiefInvestigatorPage.projectPersonnelChangeChiefInvestigatorModificationPageTestData
              .Label_Texts.select_detail_enter_link
          )
          .first()
          .click();
        break;
      }
      case 'Chief_Investigator_Email': {
        await projectPersonnelChangeChiefInvestigatorPage.page
          .getByText(
            projectPersonnelChangeChiefInvestigatorPage.projectPersonnelChangeChiefInvestigatorModificationPageTestData
              .Label_Texts.chief_investigator_enter_link
          )
          .filter({ has: projectPersonnelChangeChiefInvestigatorPage.page.locator(':visible') })
          .first()
          .click();
        break;
      }
      case 'Name_Text': {
        await projectPersonnelChangeChiefInvestigatorPage.page
          .getByRole('link', {
            name: projectPersonnelChangeChiefInvestigatorPage
              .projectPersonnelChangeChiefInvestigatorModificationPageTestData.Label_Texts.name_enter_link,
          })
          .filter({ has: projectPersonnelChangeChiefInvestigatorPage.page.locator(':visible') })
          .click();
        break;
      }
      case 'CI_First_Name_Text': {
        await projectPersonnelChangeChiefInvestigatorPage.page
          .getByRole('link', {
            name: projectPersonnelChangeChiefInvestigatorPage
              .projectPersonnelChangeChiefInvestigatorModificationPageTestData.Label_Texts.ci_first_name_enter_link,
          })
          .filter({ has: projectPersonnelChangeChiefInvestigatorPage.page.locator(':visible') })
          .click();
        break;
      }
      case 'CI_Last_Name_Text': {
        await projectPersonnelChangeChiefInvestigatorPage.page
          .getByRole('link', {
            name: projectPersonnelChangeChiefInvestigatorPage
              .projectPersonnelChangeChiefInvestigatorModificationPageTestData.Label_Texts.ci_last_name_enter_link,
          })
          .filter({ has: projectPersonnelChangeChiefInvestigatorPage.page.locator(':visible') })
          .click();
        break;
      }
    }
  }
);

Then(
  'I validate the review modifications page for change chief investigator modification using {string} dataset',
  async ({ projectPersonnelChangeChiefInvestigatorPage, modificationReviewChangesPage }, datasetName) => {
    const dataset =
      projectPersonnelChangeChiefInvestigatorPage.projectPersonnelChangeChiefInvestigatorModificationPageTestData[
        datasetName
      ];
    for (const key in dataset) {
      if (Object.hasOwn(dataset, key)) {
        switch (key) {
          case 'select_details_to_change_radio': {
            await expect.soft(modificationReviewChangesPage.select_details_to_change_value).toHaveText(dataset[key]);
            break;
          }
          case 'chief_investigator_email_text': {
            await expect
              .soft(
                modificationReviewChangesPage.chief_investigator_email_value.getByText(dataset[key], { exact: true })
              )
              .toBeVisible();
            break;
          }
          case 'name_text': {
            await expect
              .soft(modificationReviewChangesPage.name_text_value.getByText(dataset[key], { exact: true }))
              .toBeVisible();
            break;
          }
        }
      }
    }
  }
);
