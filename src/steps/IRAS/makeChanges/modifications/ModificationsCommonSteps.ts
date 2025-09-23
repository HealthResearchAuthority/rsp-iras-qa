import { createBdd } from 'playwright-bdd';
import { expect, test } from '../../../../hooks/CustomFixtures';
import { confirmStringNotNull } from '../../../../utils/UtilFunctions';

const { Then } = createBdd(test);

Then('I can see the {string} page for modifications', async ({ modificationsCommonPage }, datasetName) => {
  const dataset = modificationsCommonPage.modificationsCommonPageTestData.Specific_Change_Pages[datasetName];
  await modificationsCommonPage.assertOnModificationsPage(dataset);
});

Then(
  'I validate the project information labels using {string} dataset displayed on modifications page',
  async (
    { modificationsCommonPage, projectDetailsIRASPage, projectDetailsTitlePage },
    projectTitleDatasetName: string
  ) => {
    const irasIDExpected = await projectDetailsIRASPage.getUniqueIrasId();
    const shortProjectTitleExpected =
      projectDetailsTitlePage.projectDetailsTitlePageTestData[projectTitleDatasetName].short_project_title_text;
    const modificationIDExpected = irasIDExpected + '/' + 1;
    const irasIDActual = confirmStringNotNull(await modificationsCommonPage.iras_id_label.textContent());
    const shortProjectTitleActual = confirmStringNotNull(
      await modificationsCommonPage.short_project_title_label.textContent()
    );
    const modificationIDActual = confirmStringNotNull(
      await modificationsCommonPage.modification_id_label.textContent()
    );
    expect(irasIDActual).toBe(irasIDExpected);
    expect(shortProjectTitleActual).toBe(shortProjectTitleExpected);
    expect(modificationIDActual).toBe(modificationIDExpected);
  }
);

Then(
  'I create {string} for the created modification',
  async ({ commonItemsPage, modificationsCommonPage, selectAreaOfChangePage }, datasetName) => {
    const changesDataset = modificationsCommonPage.modificationsCommonPageTestData[datasetName];
    for (const changeName of Object.keys(changesDataset)) {
      const changeDataset = modificationsCommonPage.modificationsCommonPageTestData[datasetName][changeName];
      await selectAreaOfChangePage.selectAreaOfChangeInModificationsPage(changeDataset);
      await modificationsCommonPage.createChangeModification(changeName, changeDataset);
      await commonItemsPage.clickButton('Modifications_Details_Page', 'Add_Another_Change');
    }
  }
);

Then(
  'I keep note of the individual and overall ranking of changes created using {string}',
  async ({ modificationsCommonPage }, datasetName) => {
    const changesDataset = modificationsCommonPage.modificationsCommonPageTestData[datasetName];
    for (const changeName of Object.keys(changesDataset)) {
      const changeDataset = modificationsCommonPage.modificationsCommonPageTestData[datasetName][changeName];
      if ('which_organisation_change_affect_checkbox' in changeDataset) {
        modificationsCommonPage.calculateAndStoreRankingForChangesForApplicability(changeName, changeDataset);
      } else {
        modificationsCommonPage.calculateAndStoreRankingForChangesForNonApplicability(changeName);
      }
      modificationsCommonPage.calculateAndStoreOverallRanking();
    }
  }
);

Then(
  'I modify the current changes with {string} for the created modification',
  async ({ commonItemsPage, modificationsCommonPage, selectAreaOfChangePage }, datasetName) => {
    const changesDataset = modificationsCommonPage.modificationsCommonPageTestData[datasetName];
    for (const changeName of Object.keys(changesDataset)) {
      // Click Change link agaist every changeName
      //validate the review changes page for the changeName
      const changeDataset = modificationsCommonPage.modificationsCommonPageTestData[datasetName][changeName];
      await selectAreaOfChangePage.selectAreaOfChangeInModificationsPage(changeDataset);
      await modificationsCommonPage.createChangeModification(changeName, changeDataset);
      await commonItemsPage.clickButton('Modifications_Details_Page', 'Add_Another_Change');
    }
  }
);

//  And I can see the review changes planned end date page
//     And I capture the page screenshot
//     Then I validate all field values on review modifications page using '<Planned_End_Date>' , '<Organisation_Change_Affect>' and '<Affected_Org_Questions>'
//     When I click the change link '<Change_Field>' on review changes planned end date page
//     Then I can see the 'Planned_End_Date' page for modifications
//     And I capture the page screenshot
