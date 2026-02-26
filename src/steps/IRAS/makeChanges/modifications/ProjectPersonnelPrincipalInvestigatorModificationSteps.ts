import { createBdd } from 'playwright-bdd';
import { expect, test } from '../../../../hooks/CustomFixtures';

const { Then } = createBdd(test);

Then(
  'I fill the change principal investigator modifications page with {string}',
  async ({ commonItemsPage, projectPersonnelChangePrincipalInvestigatorPage }, datasetName: string) => {
    const dataset =
      projectPersonnelChangePrincipalInvestigatorPage
        .projectPersonnelChangePrincipalInvestigatorModificationPageTestData[datasetName];
    const ExpectedKeys = [
      'new_principal_investigator_email_text',
      'new_principal_investigator_first_name_text',
      'new_principal_investigator_last_name_text',
    ];
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
      case 'CI_First_Name_Text': {
        await projectPersonnelChangePrincipalInvestigatorPage.page
          .getByRole('link', {
            name: projectPersonnelChangePrincipalInvestigatorPage
              .projectPersonnelChangePrincipalInvestigatorModificationPageTestData.Label_Texts.pi_first_name_enter_link,
          })
          .filter({ has: projectPersonnelChangePrincipalInvestigatorPage.page.locator(':visible') })
          .click();
        break;
      }
      case 'CI_Last_Name_Text': {
        await projectPersonnelChangePrincipalInvestigatorPage.page
          .getByRole('link', {
            name: projectPersonnelChangePrincipalInvestigatorPage
              .projectPersonnelChangePrincipalInvestigatorModificationPageTestData.Label_Texts.pi_last_name_enter_link,
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
          case 'new_principal_investigator_email_text': {
            await expect
              .soft(
                modificationReviewChangesPage.principal_investigator_email_value.getByText(dataset[key], {
                  exact: true,
                })
              )
              .toBeVisible();
            break;
          }
          case 'new_principal_investigator_first_name_text': {
            await expect
              .soft(modificationReviewChangesPage.ci_first_name_text_value.getByText(dataset[key], { exact: true }))
              .toBeVisible();
            break;
          }
          case 'new_principal_investigator_last_name_text': {
            await expect
              .soft(modificationReviewChangesPage.ci_last_name_text_value.getByText(dataset[key], { exact: true }))
              .toBeVisible();
            break;
          }
        }
      }
    }
  }
);
