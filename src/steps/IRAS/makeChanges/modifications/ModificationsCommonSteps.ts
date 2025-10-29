import { createBdd } from 'playwright-bdd';
import { expect, test } from '../../../../hooks/CustomFixtures';
import { confirmStringNotNull, getFormattedDate } from '../../../../utils/UtilFunctions';
//import ModificationsCommonPage from '../../../../pages/IRAS/makeChanges/modifications/ModificationsCommonPage';

const { When, Then } = createBdd(test);

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
    const irasIDActual = await modificationsCommonPage.iras_id_value.textContent();
    const shortProjectTitleActual = confirmStringNotNull(
      await modificationsCommonPage.short_project_title_value.textContent()
    );
    const modificationIDActual = confirmStringNotNull(
      await modificationsCommonPage.modification_id_value.textContent()
    );
    if (await modificationsCommonPage.status_value.isVisible()) {
      const statusActual = confirmStringNotNull(await modificationsCommonPage.status_value.textContent());
      expect
        .soft(statusActual)
        .toBe(modificationsCommonPage.modificationsCommonPageTestData.Label_Texts.draft_status_value);
    }
    expect.soft(irasIDActual).toBe(irasIDExpected);
    expect.soft(shortProjectTitleActual).toBe(shortProjectTitleExpected);
    expect.soft(modificationIDActual).toBe(modificationIDExpected);
    await modificationsCommonPage.setModificationID(modificationIDExpected);
  }
);

Then(
  'I create {string} for the created modification',
  async ({ commonItemsPage, modificationsCommonPage, selectAreaOfChangePage }, datasetName) => {
    const changesDataset = modificationsCommonPage.modificationsCommonPageTestData[datasetName];
    const changeNames = Object.keys(changesDataset);
    for (let changeIndex = 0; changeIndex < changeNames.length; changeIndex++) {
      const changeName = changeNames[changeIndex];
      const changeDataset = changesDataset[changeName];
      await selectAreaOfChangePage.selectAreaOfChangeInModificationsPage(changeDataset);
      await modificationsCommonPage.createChangeModification(changeName, changeDataset);
      // Only click "Add Another Change" if it's not the last iteration
      if (changeIndex < changeNames.length - 1) {
        await commonItemsPage.clickButton('Modification_Details_Page', 'Add_Another_Change');
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
  async (
    {
      commonItemsPage,
      modificationsCommonPage,
      reviewChangesPlannedEndDatePage,
      plannedEndDateChangePage,
      affectedOrganisationSelectionPage,
      affectedOrganisationQuestionsPage,
    },
    datasetName
  ) => {
    const changesDataset = modificationsCommonPage.modificationsCommonPageTestData[datasetName];
    const changeNames = Object.keys(changesDataset).reverse(); // Reversed the order of keys
    for (let changeIndex = 0; changeIndex < changeNames.length; changeIndex++) {
      const changeName = changeNames[changeIndex];
      const changeDataset = changesDataset[changeName];
      const specificChange = await commonItemsPage.govUkLink
        .getByText('Change')
        .nth(changeIndex)
        .locator('..')
        .locator('..')
        .locator('..')
        .locator('..')
        .locator('.govuk-summary-list__row')
        .nth(0)
        .locator('.govuk-summary-list__key')
        .innerText();
      // Click Change link agaist every changeName
      await commonItemsPage.govUkLink.getByText('Change').nth(changeIndex).click();
      // Ensure page is loaded
      await commonItemsPage.page.waitForLoadState('domcontentloaded');
      //validate the review changes page for the specific change
      await reviewChangesPlannedEndDatePage.assertOnReviewChangesSpecificChangePage(specificChange);
      // When I click the change link '<Change_Field>' on review changes planned end date page
      if (specificChange === 'Change to planned end date') {
        if (await reviewChangesPlannedEndDatePage.new_planned_project_end_date_change_link.isVisible()) {
          await reviewChangesPlannedEndDatePage.clickChangeLinks('New_Planned_End_Date');
          await plannedEndDateChangePage.fillPlannedProjectEndDateModificationsPage(changeDataset, 'edit');
        }
        if (await reviewChangesPlannedEndDatePage.affected_organisation_types_change_link.isVisible()) {
          await reviewChangesPlannedEndDatePage.clickChangeLinks('affected_organisation_types');
          await commonItemsPage.clearCheckboxes(
            'which_organisation_change_affect_checkbox',
            affectedOrganisationSelectionPage
          );
          await affectedOrganisationSelectionPage.fillAffectedOrganisation(changeDataset, 'edit');
          await commonItemsPage.clearCheckboxes(
            'where_organisation_change_affect_nhs_question_checkbox',
            affectedOrganisationQuestionsPage
          );
          await commonItemsPage.clearCheckboxes(
            'where_organisation_change_affect_non_nhs_question_checkbox',
            affectedOrganisationQuestionsPage
          );
          await affectedOrganisationQuestionsPage.fillAffectedOrganisationQuestions(changeDataset, 'edit');
        }
      }
      await commonItemsPage.clickButton('Review_Changes_Planned_End_Date_Page', 'Save_Continue');
      await commonItemsPage.clickButton('Modifications_Details_Page', 'Save_Continue_Review');
      await commonItemsPage.clickButton('Sponsor_Reference_Page', 'Save_Continue_Review');
    }
  }
);

Then(
  'I modify the current sponsor details with {string} for the created modification',
  async ({ commonItemsPage, sponsorReferencePage, reviewAllChangesPage }, datasetName: string) => {
    const dataset = sponsorReferencePage.sponsorReferencePageTestData[datasetName];
    await reviewAllChangesPage.page
      .getByRole('heading', {
        name: reviewAllChangesPage.reviewAllChangesPageTestData.Review_All_Changes_Page.sponsor_details_heading,
      })
      .nth(1)
      .locator('..')
      .getByText('Change')
      .click();
    for (const key in dataset) {
      if (Object.hasOwn(dataset, key)) {
        await commonItemsPage.fillUIComponent(dataset, key, sponsorReferencePage);
      }
    }
    await commonItemsPage.clickButton('Sponsor_Reference_Page', 'Save_Continue_Review');
  }
);

const validateCardData = (expectedData: any, actualData: any) => {
  const compareArrays = (expected: any[], actual: any[]) => {
    if (expected.length !== actual.length) return false;
    return expected.every((val, index) => val === actual[index]);
  };
  for (const key of Object.keys(expectedData)) {
    const expectedValue = expectedData[key];
    const actualValue = actualData[key];
    if (Array.isArray(expectedValue)) {
      const sortedExpected = [...expectedValue].sort((a, b) => expectedValue.indexOf(a) - expectedValue.indexOf(b));
      const sortedActual = [...(actualValue || [])].sort((a, b) => expectedValue.indexOf(a) - expectedValue.indexOf(b));
      expect.soft(compareArrays(sortedActual, sortedExpected)).toBe(true);
    } else {
      expect.soft(actualValue).toBe(expectedValue);
    }
  }
};

Then(
  'I validate the change details are displayed as per the {string} dataset',
  async ({ modificationsCommonPage, reviewAllChangesPage }, datasetName) => {
    const changesDataset = modificationsCommonPage.modificationsCommonPageTestData[datasetName];
    const changeNames = Object.keys(changesDataset).reverse();
    for (let changeIndex = 0; changeIndex < changeNames.length; changeIndex++) {
      const changeName = changeNames[changeIndex];
      const expectedData = changesDataset[changeName];
      const cardTitle = `Change ${changeIndex + 1} - ${expectedData.area_of_change_dropdown}`;
      const actualData = await modificationsCommonPage.getMappedSummaryCardDataForRankingCategoryChanges(
        cardTitle,
        reviewAllChangesPage.reviewAllChangesPageTestData.Review_All_Changes_Page.changes_heading
      );
      validateCardData(expectedData, actualData.cardData);
    }
  }
);

Then(
  'I validate sponsor details are displayed with {string}',
  async ({ modificationsCommonPage, sponsorReferencePage, reviewAllChangesPage }, datasetName) => {
    const expectedData = sponsorReferencePage.sponsorReferencePageTestData[datasetName];
    const actualData = await modificationsCommonPage.getMappedSummaryCardDataForRankingCategoryChanges(
      reviewAllChangesPage.reviewAllChangesPageTestData.Review_All_Changes_Page.sponsor_details_heading,
      reviewAllChangesPage.reviewAllChangesPageTestData.Review_All_Changes_Page.sponsor_details_heading
    );
    validateCardData(Object.keys(expectedData), actualData.cardData);
  }
);

Then(
  'I can see the modification send to sponsor is displayed on post approval tab of project overview page with status as {string}',
  async ({ modificationsCommonPage }, statusValue: string) => {
    const modificationIDExpected = await modificationsCommonPage.getModificationID();
    const modificationRecord = await modificationsCommonPage.getModificationPostApprovalPage();
    const modificationIDActual = modificationRecord.get('modificationIdValue');
    expect.soft(modificationIDActual[0]).toBe(modificationIDExpected);
    const statusActual = modificationRecord.get('statusValue');
    expect.soft(statusActual[0]).toBe(statusValue);
    const submittedDateActual = modificationRecord.get('submittedDateValue');
    const submittedDateExpected = await getFormattedDate();
    expect.soft(submittedDateActual[0]).toBe(submittedDateExpected);
  }
);

Then(
  'I click on the modification id hyperlink in the post approval tab',
  async ({ modificationsCommonPage, commonItemsPage }) => {
    const modificationIDExpected = await modificationsCommonPage.getModificationID();
    await commonItemsPage.govUkLink.getByText(modificationIDExpected).click();
    await modificationsCommonPage.page.waitForLoadState('domcontentloaded');
  }
);

Then(
  'the {string} link should be {string} on the {string}',
  async ({ commonItemsPage }, linkKey: string, availability: string, pageKey: string) => {
    const linkValue = commonItemsPage.linkTextData[pageKey][linkKey];
    const noOfLinksFound = await commonItemsPage.govUkLink.getByText(linkValue).count();
    if (availability.toLowerCase() == 'available') {
      await expect(commonItemsPage.govUkLink.getByText(linkValue).first()).toBeVisible();
      expect(noOfLinksFound).not.toBe(0);
    } else {
      await expect(commonItemsPage.govUkLink.getByText(linkValue)).not.toBeVisible();
      expect(noOfLinksFound).toBe(0);
    }
  }
);

Then(
  'the {string} button should be {string} on the {string}',
  async ({ commonItemsPage }, buttonKey: string, availability: string, pageKey: string) => {
    const buttonValue = commonItemsPage.buttonTextData[pageKey][buttonKey];
    const noOfButtonsFound = await commonItemsPage.govUkButton
      .getByText(buttonValue)
      .or(commonItemsPage.genericButton.getByText(buttonValue))
      .count();
    if (availability.toLowerCase() == 'available') {
      await expect(
        commonItemsPage.govUkButton.getByText(buttonValue).or(commonItemsPage.genericButton.getByText(buttonValue))
      ).toBeVisible();
      expect(noOfButtonsFound).not.toBe(0);
    } else {
      await expect(
        commonItemsPage.govUkButton.getByText(buttonValue).or(commonItemsPage.genericButton.getByText(buttonValue))
      ).not.toBeVisible();
      expect(noOfButtonsFound).toBe(0);
    }
  }
);

Then(
  'the now sent to sponsor heading and hint text should be {string} on the review all changes page',
  async ({ reviewAllChangesPage }, availability: string) => {
    if (availability.toLowerCase() == 'available') {
      await expect.soft(reviewAllChangesPage.now_send_to_sponsor_heading).toBeVisible();
      await expect.soft(reviewAllChangesPage.now_send_to_sponsor_hint_label).toBeVisible();
    } else {
      await expect.soft(reviewAllChangesPage.now_send_to_sponsor_heading).not.toBeVisible();
      await expect.soft(reviewAllChangesPage.now_send_to_sponsor_hint_label).not.toBeVisible();
    }
  }
);

Then(
  'I can see the modification status as {string} on the post approval page',
  async ({ modificationsCommonPage }, statusDataset: string) => {
    const dataset = modificationsCommonPage.modificationsCommonPageTestData[statusDataset];
    const expectedStatus = dataset.status;
    let expectedSubmittedDate = dataset.submited_date;
    const expectedModificationID = await modificationsCommonPage.getModificationID();
    const modificationRecord = await modificationsCommonPage.getModificationPostApprovalPage();
    const modificationIDActual = modificationRecord.get('modificationIdValue');
    expect.soft(modificationIDActual[0]).toBe(expectedModificationID);
    const statusActual = modificationRecord.get('statusValue');
    expect.soft(statusActual[0]).toBe(expectedStatus);
    const actualDateSubmitted = modificationRecord.get('submittedDateValue');
    if (expectedSubmittedDate !== '') {
      expectedSubmittedDate = await getFormattedDate();
    }
    expect.soft(actualDateSubmitted[0]).toBe(expectedSubmittedDate);
  }
);

Then(
  'I validate submitted date field value for {string} modifications and confirm {string} status',
  async ({ modificationsCommonPage }, statusDataset: string, statusToCheck: string) => {
    const dataset = modificationsCommonPage.modificationsCommonPageTestData[statusDataset];
    const expectedStatus = dataset.status;
    let expectedSubmittedDate: string;
    if (statusDataset == 'Modification_Status_Indraft') {
      expectedSubmittedDate = dataset.submited_date;
    } else {
      expectedSubmittedDate = await getFormattedDate();
    }
    let modificationMap: any;
    const displayedModificationIdValue: string[] = [];
    const displayedSubmittedDateValue: string[] = [];
    const displayedStatusValue: string[] = [];
    const rows = await modificationsCommonPage.modificationRows.all();
    for (const row of rows) {
      const columns = await row.locator(modificationsCommonPage.listCell).allInnerTexts();
      const status = confirmStringNotNull(columns[5] ?? '');
      if (status == statusToCheck) {
        displayedStatusValue.push(status);
        const modificationId = confirmStringNotNull(columns[0]);
        displayedModificationIdValue.push(modificationId);
        const submittedDate = confirmStringNotNull(columns[4] ?? '');
        displayedSubmittedDateValue.push(submittedDate);
        modificationMap = new Map([
          ['displayedStatusValue', displayedStatusValue],
          ['displayedSubmittedDateValue', displayedSubmittedDateValue],
          ['displayedModificationIdValue', displayedModificationIdValue],
        ]);
        const actualStatus = modificationMap.get('displayedStatusValue');
        const actualDateSubmitted = modificationMap.get('displayedSubmittedDateValue');
        expect.soft(actualStatus[0]).toBe(expectedStatus);
        expect.soft(actualDateSubmitted[0]).toBe(expectedSubmittedDate);
      }
    }
  }
);

Then(
  'I validate the status {string} is displayed on modifications page',
  async ({ modificationsCommonPage }, statusDataset: string) => {
    const dataset = modificationsCommonPage.modificationsCommonPageTestData[statusDataset];
    const expectedStatus = dataset.status;
    const actualStatus = confirmStringNotNull(await modificationsCommonPage.status_value.textContent());
    expect.soft(actualStatus).toBe(expectedStatus);
  }
);

Then(
  'I create {string} and click on save for later on the select area of change page',
  async ({ selectAreaOfChangePage, modificationsCommonPage, commonItemsPage }, dataset: string) => {
    const modificationsDataset = modificationsCommonPage.modificationsCommonPageTestData[dataset];
    const modificationDataValues = Object.keys(modificationsDataset);
    for (const index of modificationDataValues) {
      const modificationName = modificationDataValues[index];
      const modificationDataset = modificationsDataset[modificationName];
      const buttonValue = commonItemsPage.buttonTextData.Project_Overview_Page.Create_New_Modification;
      await commonItemsPage.govUkButton.getByText(confirmStringNotNull(buttonValue)).click();
      await selectAreaOfChangePage.selectAreaOfChangeAndSaveLater(modificationDataset);
    }
  }
);

Then(
  'I create {string} modification with {string} and click on {string}',
  async (
    { commonItemsPage, sponsorReferencePage, modificationsCommonPage, selectAreaOfChangePage },
    modificationDatasetName: string,
    sponsorDatasetName: string,
    buttonValue: string
  ) => {
    const modificationsDataset = modificationsCommonPage.modificationsCommonPageTestData[modificationDatasetName];
    const sponsorDataset = modificationsCommonPage.modificationsCommonPageTestData[sponsorDatasetName];
    const modificationDataValues = Object.keys(modificationsDataset);
    for (const index of modificationDataValues) {
      const modificationName = modificationDataValues[index];
      const modificationDataset = modificationsDataset[modificationName];
      await commonItemsPage.clickButton('Project_Overview_Page', 'Create_New_Modification');
      await selectAreaOfChangePage.selectAreaOfChangeInModificationsPage(modificationDataset);
      await modificationsCommonPage.createChangeModification(modificationName, modificationDataset);
      await commonItemsPage.clickButton('Modification_Details_Page', 'Save_Continue_Review');
      for (const key in sponsorDataset) {
        if (Object.hasOwn(sponsorDataset, key)) {
          await commonItemsPage.fillUIComponent(sponsorDataset, key, sponsorReferencePage);
        }
      }
      await commonItemsPage.clickButton('Sponsor_Reference_Page', 'Save_Continue_Review');
      await commonItemsPage.clickButton('Review_All_Changes_Page', 'Send_Modification_To_Sponsor');
      if (buttonValue == 'Submit_To_Regulator') {
        await commonItemsPage.clickButton('Modification_Sent_To_Sponsor_Page', 'Submit_To_Regulator');
        await commonItemsPage.clickLink('Project_Overview_Page', 'Post_Approval');
      }
    }
  }
);

Then(
  'I enter {string} into the search field for post approval page',
  async ({ modificationsCommonPage, commonItemsPage }, searchDatasetName: string) => {
    const dataset = modificationsCommonPage.modificationsCommonPageTestData.Search_Queries[searchDatasetName];
    // Get the modification record and extract the first modification ID to use as the search key
    if (searchDatasetName === 'Full_Modification_ID') {
      const modificationRecord = await modificationsCommonPage.getModificationPostApprovalPage();
      const modificationIds = modificationRecord.get('modificationIdValue');
      const searchKey: string = modificationIds && modificationIds.length > 0 ? modificationIds[0] : '';
      // fill the modification id in the search box
      expect(searchKey).toBeTruthy();
      await commonItemsPage.setSearchKey(searchKey);
      await commonItemsPage.search_text.fill(searchKey); // check search_text locator//done
    } else {
      //await manageUsersPage.user_search_text.fill(dataset['search_input_text']);//create user_search_text locator
      await commonItemsPage.search_text.fill(dataset['search_input_text']);
    }
  }
);

Then(
  'I can now see the table of modifications contains the expected search results for {string}',
  async ({ modificationsCommonPage, commonItemsPage }, searchDatasetName: string) => {
    const searchDataset = modificationsCommonPage.modificationsCommonPageTestData.Search_Queries[searchDatasetName];
    if (searchDatasetName !== 'Partial_Modification_ID') {
      const modificationIDExpected = await modificationsCommonPage.getModificationID();
      const modificationRecord = await modificationsCommonPage.getModificationPostApprovalPage();
      const modificationIDActual = modificationRecord.get('modificationIdValue');
      expect.soft(modificationIDActual[0]).toBe(modificationIDExpected);
    } else {
      await modificationsCommonPage.validateResults(commonItemsPage, searchDataset, true);
    }
  }
);

When(
  'I open each of the advanced filters in post approval page',
  async ({ modificationsCommonPage, commonItemsPage }) => {
    const expectedFilterHeadings =
      modificationsCommonPage.modificationsCommonPageTestData.Post_Approval_Page.filter_headings;
    for (const heading of expectedFilterHeadings) {
      await commonItemsPage.advanced_filter_headings.getByText(heading, { exact: true }).click();
    }
  }
);

// Then(
//   'I select advanced filters in the post approval page using {string}',
//   async ({ myResearchProjectsPage, commonItemsPage }, filterDatasetName: string) => {
//     const dataset = myResearchProjectsPage.myResearchProjectsPageTestData.Advanced_Filters[filterDatasetName];
//     for (const key in dataset) {
//       if (Object.hasOwn(dataset, key)) {
//         if (key.includes('date')) {
//           if (!(await myResearchProjectsPage.date_project_created_from_day_text.isVisible())) {
//             await myResearchProjectsPage.date_project_created_from_day_text_chevron.click();
//           }
//           await commonItemsPage.fillUIComponent(dataset, key, myResearchProjectsPage);
//         } else {
//           await myResearchProjectsPage[key + '_chevron'].click();
//           await commonItemsPage.fillUIComponent(dataset, key, myResearchProjectsPage);
//         }
//       }
//     }
//   }
// );

When(
  'I enter values in the advanced filters in the post approval page using {string}',
  async ({ modificationsCommonPage, commonItemsPage }, filterDatasetName: string) => {
    const dataset = modificationsCommonPage.modificationsCommonPageTestData.Advanced_Filters[filterDatasetName];
    for (const key in dataset) {
      if (Object.hasOwn(dataset, key)) {
        if (key.includes('date')) {
          if (!(await modificationsCommonPage.date_submitted_from_day_text.isVisible())) {
            // create locators
            await modificationsCommonPage.date_submitted_from_day_text_chevron.click(); // create locators
          }
          await commonItemsPage.fillUIComponent(dataset, key, modificationsCommonPage);
        } else {
          await modificationsCommonPage[key + '_chevron'].click();
          await commonItemsPage.fillUIComponent(dataset, key, modificationsCommonPage);
        }
      }
    }
  }
);
