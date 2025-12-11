import { createBdd } from 'playwright-bdd';
import { expect, test } from '../../../../hooks/CustomFixtures';

const { Then } = createBdd(test);

Then(
  'I fill the change principal investigator modifications page with {string} for {string} action',
  async ({ commonItemsPage, projectPersonnelChangePrincipalInvestigatorPage }, datasetName: string, action: string) => {
    const dataset =
      projectPersonnelChangePrincipalInvestigatorPage
        .projectPersonnelChangePrincipalInvestigatorModificationPageTestData[datasetName];
    const clickAction = action === 'create' ? 'Save_Continue' : 'Save_Changes';
    const radioKey = 'select_details_to_change_radio';
    if (dataset[radioKey]) {
      await commonItemsPage.fillUIComponent(dataset, radioKey, projectPersonnelChangePrincipalInvestigatorPage);
      await commonItemsPage.clickButton('Modifications_Page', clickAction);
    }
    const ExpectedKeys = ['principal_investigator_email_text', 'name_text'];
    for (const key of ExpectedKeys) {
      if (dataset[key]) {
        await commonItemsPage.fillUIComponent(dataset, key, projectPersonnelChangePrincipalInvestigatorPage);
      }
    }
  }
);

Then(
  'I keep note of the individual and overall ranking of change principal investigator change created using {string} dataset',
  async ({ projectPersonnelChangePrincipalInvestigatorPage, modificationsCommonPage }, datasetName) => {
    const changeDataset =
      projectPersonnelChangePrincipalInvestigatorPage
        .projectPersonnelChangePrincipalInvestigatorModificationPageTestData[datasetName];
    await modificationsCommonPage.calculateAndStoreRankingForChangesForApplicability(datasetName, changeDataset);
    await modificationsCommonPage.calculateAndStoreOverallRanking();
  }
);

Then(
  'I click enter link displayed on review your answers page for change principal investigator modification for {string}',
  async ({ projectPersonnelChangePrincipalInvestigatorPage }, datasetName) => {
    switch (datasetName) {
      case 'Select_Details_To_Change': {
        await projectPersonnelChangePrincipalInvestigatorPage.page
          .getByText(
            projectPersonnelChangePrincipalInvestigatorPage
              .projectPersonnelChangePrincipalInvestigatorModificationPageTestData.Label_Texts.select_detail_enter_link
          )
          .first()
          .click();
        break;
      }
      case 'Principal_Investigator_Email': {
        await projectPersonnelChangePrincipalInvestigatorPage.page
          .getByText(
            projectPersonnelChangePrincipalInvestigatorPage
              .projectPersonnelChangePrincipalInvestigatorModificationPageTestData.Label_Texts
              .principal_investigator_enter_link
          )
          .filter({ has: projectPersonnelChangePrincipalInvestigatorPage.page.locator(':visible') })
          .click();
        break;
      }
      case 'Name_Text': {
        await projectPersonnelChangePrincipalInvestigatorPage.page
          .getByRole('link', {
            name: projectPersonnelChangePrincipalInvestigatorPage
              .projectPersonnelChangePrincipalInvestigatorModificationPageTestData.Label_Texts.name_enter_link,
          })
          .filter({ has: projectPersonnelChangePrincipalInvestigatorPage.page.locator(':visible') })
          .click();
        break;
      }
    }
  }
);

Then(
  'I validate the review modifications page for change principal investigator modification using {string} dataset',
  async ({ projectPersonnelChangePrincipalInvestigatorPage, modificationReviewChangesPage }, datasetName) => {
    const dataset =
      projectPersonnelChangePrincipalInvestigatorPage
        .projectPersonnelChangePrincipalInvestigatorModificationPageTestData[datasetName];
    for (const key in dataset) {
      if (Object.hasOwn(dataset, key)) {
        switch (key) {
          case 'select_details_to_change_radio': {
            await expect.soft(modificationReviewChangesPage.select_details_to_change_value).toHaveText(dataset[key]);
            break;
          }
          case 'principal_investigator_email_text': {
            await expect
              .soft(
                modificationReviewChangesPage.principal_investigator_email_value.getByText(dataset[key], {
                  exact: true,
                })
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
