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
    // const irasIDActual = confirmStringNotNull(await modificationsCommonPage.iras_id_label.textContent());
    const irasIDActual = await modificationsCommonPage.iras_id_value.textContent();
    const shortProjectTitleActual = confirmStringNotNull(
      await modificationsCommonPage.short_project_title_value.textContent()
    );
    const modificationIDActual = confirmStringNotNull(
      await modificationsCommonPage.modification_id_value.textContent()
    );
    const statusActual = confirmStringNotNull(await modificationsCommonPage.status_value.textContent());
    expect.soft(irasIDActual).toBe(irasIDExpected);
    expect.soft(shortProjectTitleActual).toBe(shortProjectTitleExpected);
    expect.soft(modificationIDActual).toBe(modificationIDExpected);
    expect
      .soft(statusActual)
      .toBe(modificationsCommonPage.modificationsCommonPageTestData.Label_Texts.draft_status_value);
    await modificationsCommonPage.setModificationID(modificationIDExpected);
  }
);

// Then(
//   'I create {string} for the created modification',
//   async ({ commonItemsPage, modificationsCommonPage, selectAreaOfChangePage }, datasetName) => {
//     const changesDataset = modificationsCommonPage.modificationsCommonPageTestData[datasetName];
//     for (const changeName of Object.keys(changesDataset)) {
//       const changeDataset = modificationsCommonPage.modificationsCommonPageTestData[datasetName][changeName];
//       await selectAreaOfChangePage.selectAreaOfChangeInModificationsPage(changeDataset);
//       await modificationsCommonPage.createChangeModification(changeName, changeDataset);
//       await commonItemsPage.clickButton('Modifications_Details_Page', 'Add_Another_Change');
//     }
//   }
// );

Then(
  'I create {string} for the created modification',
  async ({ commonItemsPage, modificationsCommonPage, selectAreaOfChangePage }, datasetName) => {
    const changesDataset = modificationsCommonPage.modificationsCommonPageTestData[datasetName];
    const changeNames = Object.keys(changesDataset);
    for (let i = 0; i < changeNames.length; i++) {
      const changeName = changeNames[i];
      const changeDataset = changesDataset[changeName];
      await selectAreaOfChangePage.selectAreaOfChangeInModificationsPage(changeDataset);
      await modificationsCommonPage.createChangeModification(changeName, changeDataset);
      // Only click "Add Another Change" if it's not the last iteration
      if (i < changeNames.length - 1) {
        await commonItemsPage.clickButton('Modifications_Details_Page', 'Add_Another_Change');
      }
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
        await modificationsCommonPage.calculateAndStoreRankingForChangesForApplicability(changeName, changeDataset);
      } else {
        await modificationsCommonPage.calculateAndStoreRankingForChangesForNonApplicability(changeName);
      }
      await modificationsCommonPage.calculateAndStoreOverallRanking();
    }
  }
);

Then(
  'I modify the current changes with {string} for the created modification',
  async ({ commonItemsPage, modificationsCommonPage, selectAreaOfChangePage }, datasetName) => {
    const changesDataset = modificationsCommonPage.modificationsCommonPageTestData[datasetName];
    const changeNames = Object.keys(changesDataset);
    for (let i = 0; i < changeNames.length; i++) {
      const changeName = changeNames[i];
      const changeDataset = changesDataset[changeName];
      // Click Change link agaist every changeName
      //validate the review changes page for the changeName
      // const changeDataset = modificationsCommonPage.modificationsCommonPageTestData[datasetName][changeName];
      await selectAreaOfChangePage.selectAreaOfChangeInModificationsPage(changeDataset);
      await modificationsCommonPage.createChangeModification(changeName, changeDataset);
      // Only click "Add Another Change" if it's not the last iteration
      if (i < changeNames.length - 1) {
        await commonItemsPage.clickButton('Modifications_Details_Page', 'Add_Another_Change');
      }
    }
    // for (const changeName of Object.keys(changesDataset)) {
    //   // Click Change link agaist every changeName
    //   //validate the review changes page for the changeName
    //   const changeDataset = modificationsCommonPage.modificationsCommonPageTestData[datasetName][changeName];
    //   await selectAreaOfChangePage.selectAreaOfChangeInModificationsPage(changeDataset);
    //   await modificationsCommonPage.createChangeModification(changeName, changeDataset);
    //   await commonItemsPage.clickButton('Modifications_Details_Page', 'Add_Another_Change');
    // }
  }
);

//  And I can see the review changes planned end date page
//     And I capture the page screenshot
//     Then I validate all field values on review modifications page using '<Planned_End_Date>' , '<Organisation_Change_Affect>' and '<Affected_Org_Questions>'
//     When I click the change link '<Change_Field>' on review changes planned end date page
//     Then I can see the 'Planned_End_Date' page for modifications
//     And I capture the page screenshot

Then(
  'I validate the change details are displayed as per the {string} dataset',
  async ({ modificationsCommonPage }, datasetName) => {
    const changesDataset = modificationsCommonPage.modificationsCommonPageTestData[datasetName];
    const changeNames = Object.keys(changesDataset);

    for (let i = 0; i < changeNames.length; i++) {
      const changeName = changeNames[i];
      const expectedData = changesDataset[changeName]; // From JSON
      const actualData = await modificationsCommonPage.getMappedSummaryCardDataForRankingCategoryChanges(
        'Change ' + (i + 1) + ' - ' + expectedData.area_of_change_dropdown,
        'Changes'
      );

      console.log(`\n Comparing Change ${i + 1}: ${changeName}`);
      console.log('Expected:', expectedData);
      console.log('Actual:', actualData.cardData);

      // Compare keys and values
      for (const key of Object.keys(expectedData)) {
        const expectedValue = expectedData[key];
        const actualValue = actualData.cardData[key];

        if (Array.isArray(expectedValue)) {
          // Compare arrays (order-insensitive)
          const sortedExpected = [...expectedValue].sort();
          const sortedActual = [...(actualValue || [])].sort();
          expect.soft(sortedActual).toEqual(sortedExpected);
        } else {
          expect.soft(actualValue).toBe(expectedValue);
        }
      }
    }
  }
);

Then(
  'I validate sponsor details are displayed with {string}',
  async ({ modificationsCommonPage, sponsorReferencePage }, datasetName) => {
    const sponsorDataset = sponsorReferencePage.sponsorReferencePageTestData[datasetName];
    const expectedData = sponsorDataset;
    const actualData = await modificationsCommonPage.getMappedSummaryCardDataForRankingCategoryChanges(
      'Sponsor details',
      'Sponsor details'
    );
    console.log('Expected:', expectedData);
    console.log('Actual:', actualData.cardData);

    //  Compare keys and values
    for (const key of Object.keys(expectedData)) {
      const expectedValue = expectedData[key];
      const actualValue = actualData.cardData[key];

      if (Array.isArray(expectedValue)) {
        // Compare arrays (order-insensitive)
        const sortedExpected = [...expectedValue].sort();
        const sortedActual = [...(actualValue || [])].sort();
        expect.soft(sortedActual).toEqual(sortedExpected);
      } else {
        expect.soft(actualValue).toBe(expectedValue);
      }
    }
  }
);

Then(
  'I validate the modification record details displayed on post approvals page',
  async ({ modificationsCommonPage }) => {
    const modificationIDExpected = await modificationsCommonPage.getModificationID();
    const modificationRecord = await modificationsCommonPage.getModificationPostApprovalPage();
    const modificationIDActual = modificationRecord.get('modificationIdValue');
    expect.soft(modificationIDActual).toBe(modificationIDExpected);
    const statusActual = modificationRecord.get('statusValue');
    expect.soft(statusActual).toBe('In sponsor review');
    const submittedDateActual = modificationRecord.get('submittedDateValue');
    const submittedDateExpected = await modificationsCommonPage.getFormattedDate();
    console.log(submittedDateExpected); // Example: 02 Oct 2025
    expect.soft(submittedDateActual).toBe(submittedDateExpected);
  }
);

Then('I click on the modification id hyperlink in the post approvals page', async ({ modificationsCommonPage }) => {
  await modificationsCommonPage.modification_id_link.click();
  await modificationsCommonPage.page.waitForLoadState('domcontentloaded');
});
