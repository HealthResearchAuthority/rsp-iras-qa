import { createBdd } from 'playwright-bdd';
import { expect, test } from '../../../../hooks/CustomFixtures';
import { confirmStringNotNull, getFormattedDate, removeUnwantedWhitespace } from '../../../../utils/UtilFunctions';

const { Then } = createBdd(test);

Then('I can see the {string} page for modifications', async ({ modificationsCommonPage }, datasetName) => {
  const dataset = modificationsCommonPage.modificationsCommonPageTestData.Specific_Change_Pages[datasetName];
  await modificationsCommonPage.assertOnModificationsPage(dataset);
});

Then('I can see the review all changes page', async ({ reviewAllChangesPage }) => {
  await reviewAllChangesPage.assertOnReviewAllChangesPage();
});

Then(
  'I can see the modification page matching with the specific change using {string} dataset',
  async ({ modificationsCommonPage }, datasetName) => {
    const dataset = modificationsCommonPage.modificationsCommonPageTestData[datasetName];
    const changeName = Object.keys(dataset);
    const expectedPageHeading = dataset[changeName].specific_change_dropdown;
    await expect(modificationsCommonPage.pageHeading.getByText(expectedPageHeading)).toBeVisible();
  }
);

Then(
  'I validate the project information labels using dataset displayed on modifications page',
  async ({ modificationsCommonPage, projectDetailsIRASPage, modificationsReceivedCommonPage }) => {
    const irasIDExpected = await projectDetailsIRASPage.getUniqueIrasId();
    const shortProjectTitleExpected = (await projectDetailsIRASPage.getShortProjectTitle()).trimEnd();
    const modificationIDExpected = irasIDExpected + '/' + modificationsReceivedCommonPage.modificationCounter;
    const irasIDActual = await modificationsCommonPage.iras_id_value.textContent();
    const shortProjectTitleActual = confirmStringNotNull(
      await modificationsCommonPage.short_project_title_value.textContent()
    );
    const modificationIDActual = confirmStringNotNull(
      await modificationsCommonPage.modification_id_value.textContent()
    );
    expect.soft(irasIDActual).toBe(irasIDExpected);
    expect
      .soft(shortProjectTitleActual.replaceAll(/[’‘]/g, "'").replaceAll(/[“”]/g, '"'))
      .toBe(shortProjectTitleExpected.replaceAll(/[’‘]/g, "'").replaceAll(/[“”]/g, '"'));
    expect.soft(modificationIDActual).toBe(modificationIDExpected);
    await modificationsCommonPage.setModificationID(modificationIDExpected);
    await modificationsReceivedCommonPage.setIrasId(shortProjectTitleExpected);
    await modificationsReceivedCommonPage.setModificationId(modificationIDExpected);
    await modificationsReceivedCommonPage.setShortProjectTitle(shortProjectTitleExpected);
  }
);

Then(
  'I create {string} for the created modification',
  async (
    {
      commonItemsPage,
      modificationsCommonPage,
      selectAreaOfChangePage,
      projectIdentificationSelectChangePage,
      projectIdentificationSelectReferenceToChangePage,
      projectIdentificationEnterReferenceNumbersPage,
      $tags,
    },
    datasetName
  ) => {
    const changesDataset = modificationsCommonPage.modificationsCommonPageTestData[datasetName];
    const changeNames = Object.keys(changesDataset);
    for (let changeIndex = 0; changeIndex < changeNames.length; changeIndex++) {
      const changeName = changeNames[changeIndex];
      const changeDataset = changesDataset[changeName];
      await selectAreaOfChangePage.selectAreaOfChangeInModificationsPage(changeDataset, $tags);
      await modificationsCommonPage.createChangeModification(
        {
          projectIdentificationSelectChangePage,
          projectIdentificationSelectReferenceToChangePage,
          projectIdentificationEnterReferenceNumbersPage,
        },
        changeName,
        changeDataset
      );
      // Only click "Add Another Change" if it's not the last iteration
      if (changeIndex < changeNames.length - 1) {
        await commonItemsPage.clickButton('Modification_Details_Page', 'Add_Another_Change');
      }
    }
  }
);

Then(
  'I keep note of the individual and overall ranking of changes created using {string} and {string} dataset',
  async ({ modificationsCommonPage, researchLocationsPage }, datasetName, datasetNameResearchLocation) => {
    const changesDataset = modificationsCommonPage.modificationsCommonPageTestData[datasetName];
    const researchLocationDataset = researchLocationsPage.researchLocationsPageTestData[datasetNameResearchLocation];
    for (const changeName of Object.keys(changesDataset)) {
      const changeDataset = modificationsCommonPage.modificationsCommonPageTestData[datasetName][changeName];
      if ('which_organisation_change_affect_checkbox' in changeDataset) {
        await modificationsCommonPage.calculateAndStoreRankingForChangesForApplicability(changeName, changeDataset);
      } else {
        await modificationsCommonPage.calculateAndStoreRankingForChangesForNonApplicability(
          changeName,
          changeDataset,
          researchLocationDataset
        );
      }
      await modificationsCommonPage.calculateAndStoreOverallRanking();
    }
  }
);

Then(
  'I validate the individual and overall ranking of changes on the relevant modification page',
  async ({ modificationsCommonPage }) => {
    const { actualValuesArray, ranking, changeNames } = await modificationsCommonPage.getIndividualRankingData();
    const overallExpected = await modificationsCommonPage.getOverallRankingForChanges();
    // Overall Ranking Assertions
    const overAllActual = actualValuesArray[0];
    expect.soft(overAllActual.modificationType).toBe(overallExpected.modificationType);
    expect.soft(overAllActual.category).toBe(overallExpected.category);
    expect.soft(overAllActual.reviewType).toBe(overallExpected.reviewType);
    // Individual Ranking Assertions
    const reversedChangeNames = changeNames.toReversed();
    for (let arrayIndex = 0, fieldIndex = 1; arrayIndex < actualValuesArray.length - 1; arrayIndex++, fieldIndex++) {
      const changeName = reversedChangeNames[arrayIndex];
      const changeRankings = ranking[changeName];

      if (changeRankings && changeRankings.length > 0) {
        const { expectedModificationType, expectedCategory, expectedReviewType } = changeRankings[0];
        try {
          expect(actualValuesArray[fieldIndex].modificationType).toBe(expectedModificationType);
          expect(actualValuesArray[fieldIndex].category).toBe(expectedCategory);
          expect(actualValuesArray[fieldIndex].reviewType).toBe(expectedReviewType);
        } catch (error) {
          console.log('Error is ranking Change name: ' + changeName, error);
          expect.soft(actualValuesArray[fieldIndex].modificationType).toBe(expectedModificationType);
          expect.soft(actualValuesArray[fieldIndex].category).toBe(expectedCategory);
          expect.soft(actualValuesArray[fieldIndex].reviewType).toBe(expectedReviewType);
        }
      } else {
        throw new Error(`No ranking data found for changeName: ${changeName}`);
      }
    }
  }
);

Then(
  'I validate the individual ranking of change on the relevant modification page using {string} dataset',
  async ({ modificationsCommonPage }, datasetName) => {
    const dataset = modificationsCommonPage.modificationsCommonPageTestData[datasetName];
    const changeName = Object.keys(dataset);
    await modificationsCommonPage.validateRankingForIndividualChange(dataset[changeName]);
  }
);

Then(
  'I modify the current changes with {string} for the created modification',
  async (
    {
      commonItemsPage,
      modificationsCommonPage,
      modificationReviewChangesPage,
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
      await modificationReviewChangesPage.assertOnReviewChangesSpecificChangePage(specificChange);
      // When I click the change link '<Change_Field>' on modification review changes page
      if (specificChange === 'Change to planned end date') {
        if (await modificationReviewChangesPage.new_planned_project_end_date_change_link.isVisible()) {
          await modificationReviewChangesPage.clickChangeLinks('New_Planned_End_Date');
          await plannedEndDateChangePage.fillPlannedProjectEndDateModificationsPage(changeDataset, 'edit');
        }
        if (await modificationReviewChangesPage.affected_organisation_types_change_link.isVisible()) {
          await modificationReviewChangesPage.clickChangeLinks('affected_organisation_types');
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
      await commonItemsPage.clickButton('Modification_Details_Page', 'Save_Continue_Review');
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

Then(
  'I validate the change details are displayed as per the {string} dataset',
  async ({ modificationsCommonPage }, datasetName) => {
    const changesDataset = modificationsCommonPage.modificationsCommonPageTestData[datasetName];
    const changeNames = Object.keys(changesDataset).reverse();
    for (let changeIndex = 0; changeIndex < changeNames.length; changeIndex++) {
      const changeName = changeNames[changeIndex];
      const expectedData = changesDataset[changeName];
      const cardTitle = `Change ${changeIndex + 1} - ${expectedData.area_of_change_dropdown}`;
      const actualData = await modificationsCommonPage.getMappedSummaryCardDataForRankingCategoryChanges(
        cardTitle,
        expectedData
      );
      modificationsCommonPage.validateCardData(expectedData, actualData.cardData);
    }
  }
);

Then(
  'I validate the change details are displayed as per the {string} dataset under the tabs sections',
  async ({ modificationsCommonPage }, datasetName) => {
    const changesDataset = modificationsCommonPage.modificationsCommonPageTestData[datasetName];
    const changeNames = Object.keys(changesDataset).reverse();
    for (let changeIndex = 0; changeIndex < changeNames.length; changeIndex++) {
      const changeName = changeNames[changeIndex];
      const expectedData = changesDataset[changeName];
      const cardTitle = `Change ${changeIndex + 1} - ${expectedData.area_of_change_dropdown}`;
      const headingLocator = modificationsCommonPage.page.getByRole('heading', { name: cardTitle });
      const keysString = Object.keys(expectedData).join(', ');
      const expectedDataValues = modificationsCommonPage.getExpectedValues(expectedData, keysString, changeIndex);
      if (await headingLocator.isVisible()) {
        const actualData = await modificationsCommonPage.getMappedSummaryCardDataForRankingCategoryChanges(
          cardTitle,
          expectedData
        );
        modificationsCommonPage.validateCardData(expectedDataValues, actualData.cardData);
      } else {
        await expect.soft(headingLocator, `Heading "${cardTitle}" should be visible`).toBeVisible();
      }
    }
  }
);

Then(
  'I validate sponsor details are displayed with {string}',
  async ({ modificationsCommonPage, sponsorReferencePage, reviewAllChangesPage }, datasetName) => {
    const expectedData = sponsorReferencePage.sponsorReferencePageTestData[datasetName];
    const actualData = await modificationsCommonPage.getMappedSummaryCardDataForRankingCategoryChanges(
      reviewAllChangesPage.reviewAllChangesPageTestData.Review_All_Changes_Page.sponsor_details_heading,
      expectedData
    );
    modificationsCommonPage.validateCardData(expectedData, actualData.cardData);
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
  'I fill the modification enter free text page using {string} dataset',
  async ({ modificationsCommonPage, commonItemsPage }, datasetName: string) => {
    const dataset = modificationsCommonPage.modificationsCommonPageTestData[datasetName];
    for (const subKey in dataset) {
      const subDataset = dataset[subKey];
      if (subDataset.specific_change_dropdown) {
        await modificationsCommonPage.validatePageHeading(subDataset.specific_change_dropdown);
      }
      if (subDataset.changes_free_text) {
        await commonItemsPage.fillUIComponent(subDataset, 'changes_free_text', modificationsCommonPage);
      }
    }
  }
);

Then(
  'I can validate that an error is shown when the entered free text exceeds the character limit on enter free text page',
  async ({ modificationsCommonPage, commonItemsPage }) => {
    const expectedFreeTextSummaryError =
      modificationsCommonPage.modificationsCommonPageTestData.Summary_Error_Messages.changes_free_text_summary_error;
    const actualFreeTextSummaryError = confirmStringNotNull(
      await modificationsCommonPage.changes_free_text_summary_error.textContent()
    );
    await expect.soft(commonItemsPage.errorMessageSummaryLabel).toBeVisible();
    await expect.soft(modificationsCommonPage.changes_free_text_summary_error).toBeVisible();
    expect.soft(actualFreeTextSummaryError).toBe(expectedFreeTextSummaryError);
  }
);

Then(
  'I validate the free text content and specific change label on review modifications page using {string} dataset',
  async ({ modificationsCommonPage, modificationReviewChangesPage }, changeDatasetName: string) => {
    const dataset = modificationsCommonPage.modificationsCommonPageTestData[changeDatasetName];
    const changeName = Object.keys(dataset);
    const expectedFreeText = dataset[changeName]['changes_free_text'];
    const actualFreeText = confirmStringNotNull(await modificationReviewChangesPage.changes_free_text.textContent());
    const actualSpecificChangeLabel = confirmStringNotNull(
      await modificationsCommonPage.pageHeading.getByText(dataset[changeName]['specific_change_dropdown']).textContent()
    );
    expect.soft(actualSpecificChangeLabel).toBe(dataset[changeName]['specific_change_dropdown']);
    expect.soft(actualFreeText).toBe(expectedFreeText);
  }
);

Then('I validate overall modification ranking', async ({ modificationsCommonPage }) => {
  const modificationTypeExpected = (await modificationsCommonPage.getOverallRankingForChanges()).modificationType;
  const categoryExpected = (await modificationsCommonPage.getOverallRankingForChanges()).category;
  const reviewTypeExpected = (await modificationsCommonPage.getOverallRankingForChanges()).reviewType;
  const modificationTypeActual = await removeUnwantedWhitespace(
    await modificationsCommonPage.modification_type.first().textContent()
  );
  const categoryActual = await removeUnwantedWhitespace(await modificationsCommonPage.category.first().textContent());
  const reviewTypeActual = await removeUnwantedWhitespace(
    await modificationsCommonPage.review_type.first().textContent()
  );
  expect.soft(modificationTypeActual).toBe(modificationTypeExpected);
  expect.soft(categoryActual).toBe(categoryExpected);
  expect.soft(reviewTypeActual).toBe(reviewTypeExpected);
});

Then(
  'I validate individual ranking for single card displayed in modifications page',
  async ({ modificationsCommonPage }) => {
    const individualRanking = await modificationsCommonPage.getrankingForChanges();
    const firstCardKey = Object.keys(individualRanking)[0];
    const modificationTypeExpected = individualRanking[firstCardKey][0].expectedModificationType;
    const categoryExpected = individualRanking[firstCardKey][0].expectedCategory;
    const reviewTypeExpected = individualRanking[firstCardKey][0].expectedReviewType;
    const modificationTypeActual = await removeUnwantedWhitespace(
      await modificationsCommonPage.allChangeCards
        .locator(modificationsCommonPage.modification_type)
        .first()
        .textContent()
    );
    const categoryActual = await removeUnwantedWhitespace(
      await modificationsCommonPage.allChangeCards.locator(modificationsCommonPage.category).first().textContent()
    );
    const reviewTypeActual = await removeUnwantedWhitespace(
      await modificationsCommonPage.allChangeCards.locator(modificationsCommonPage.review_type).first().textContent()
    );
    expect.soft(modificationTypeActual).toBe(modificationTypeExpected);
    expect.soft(categoryActual).toBe(categoryExpected);
    expect.soft(reviewTypeActual).toBe(reviewTypeExpected);
  }
);

Then(
  'I can see the current chief investigator email details displayed on modifications page using {string} dataset',
  async ({ modificationsCommonPage, chiefInvestigatorPage }, datasetNameChiefInvestigator) => {
    const currentChiefInvestigatorNameExpected =
      chiefInvestigatorPage.chiefInvestigatorPageTestData[datasetNameChiefInvestigator]
        .new_chief_investigator_email_text;
    await expect
      .soft(
        modificationsCommonPage.page.getByText(
          modificationsCommonPage.modificationsCommonPageTestData.Label_Texts.current_chief_investigator_email_label
        )
      )
      .toBeVisible();
    await expect.soft(modificationsCommonPage.page.getByText(currentChiefInvestigatorNameExpected)).toBeVisible();
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
  'I validate the status {string} is displayed on the page',
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

Then('I click on the searched modification id', async ({ modificationsCommonPage }) => {
  const modificationID = await modificationsCommonPage.getModificationID();
  await modificationsCommonPage.page.getByText(modificationID, { exact: true }).click();
});

Then(
  'I keep note of the {string} event actioned by the user {string} to store the modification audit history for {string} user',
  async (
    { modificationsCommonPage, loginPage, modificationsDetailsPage },
    modificationEventDatasetName: string,
    userDatasetName: string,
    auditLogTargetUser: string
  ) => {
    let modificationEvent = '';
    if (
      modificationEventDatasetName.toLowerCase() === 'modification_assigned' &&
      userDatasetName.toLowerCase() === 'workflow_coordinator'
    ) {
      modificationEvent = `${modificationsCommonPage.modificationsCommonPageTestData.Audit_History_Events.Modification_Assigned} '${loginPage.loginPageTestData['Studywide_Reviewer_NI'].username.toLowerCase()}'`;
    } else if (
      modificationEventDatasetName.toLowerCase() === 'modification_reassigned' &&
      userDatasetName.toLowerCase() === 'team_manager'
    ) {
      modificationEvent = `${modificationsCommonPage.modificationsCommonPageTestData.Audit_History_Events.Modification_Reassigned} '${loginPage.loginPageTestData['Studywide_Reviewer'].username}'`;
    } else if (modificationEventDatasetName.toLowerCase() === 'modification_comment_reason_not_approved_changed') {
      modificationEvent = `${modificationsCommonPage.modificationsCommonPageTestData.Audit_History_Events.Modification_Comment_Reason_Not_Approved_Changed} from ${modificationsDetailsPage.modificationsDetailsPageTestData.Modification_Outcome_Reasons.Lack_Of_Evidence} to ${modificationsDetailsPage.modificationsDetailsPageTestData.Modification_Outcome_Reasons.Valid_Reason_Not_Approved}`;
    } else if (modificationEventDatasetName.toLowerCase() === 'modification_comment_changed') {
      modificationEvent = `${modificationsCommonPage.modificationsCommonPageTestData.Audit_History_Events.Modification_Comment_Changed} from ${modificationsDetailsPage.modificationsDetailsPageTestData.Modification_Outcome_Reasons.Lack_Of_Evidence} to ${modificationsDetailsPage.modificationsDetailsPageTestData.Modification_Outcome_Reasons.Valid_Reason}`;
    } else {
      modificationEvent =
        modificationsCommonPage.modificationsCommonPageTestData.Audit_History_Events[modificationEventDatasetName];
    }

    let userEmail = '';
    if (userDatasetName.toLowerCase() !== 'blank_user_details') {
      userEmail = loginPage.loginPageTestData[userDatasetName].username.toLowerCase();
    }
    const dateTimeOfEvent = new Date().toLocaleString('en-GB', {
      day: '2-digit',
      month: 'long',
      year: 'numeric',
    });
    if (auditLogTargetUser.toLowerCase() === 'applicant_user' || auditLogTargetUser.toLowerCase() === 'sponsor_user') {
      modificationsCommonPage.addAuditHistoryRecord = {
        dateTimeOfEventExpected: dateTimeOfEvent,
        modificationEventExpected: modificationEvent,
        userEmailExpected: userEmail,
      };
    } else if (auditLogTargetUser.toLowerCase() === 'backstage_user') {
      modificationsCommonPage.addAuditHistoryRecordBackstageUser = {
        dateTimeOfEventExpected: dateTimeOfEvent,
        modificationEventExpected: modificationEvent,
        userEmailExpected: userEmail,
      };
    }
  }
);

Then(
  'I validate the audit history table for modifications of the user {string}',
  async ({ modificationsCommonPage }, userName: string) => {
    await modificationsCommonPage.auditHistoryTables.waitFor({ state: 'visible' });
    const auditHistoryTableHeadersActual = await modificationsCommonPage.auditHistoryTableHeader.allTextContents();
    const auditHistoryTableHeadersExpected =
      modificationsCommonPage.modificationsCommonPageTestData.Label_Texts.Audit_History_Headers;
    expect.soft(auditHistoryTableHeadersActual).toEqual(auditHistoryTableHeadersExpected);
    const rowCount = await modificationsCommonPage.auditHistoryTableBodyRows.count();
    const actualAuditHistoryRows: string[][] = [];
    for (let auditRowIndex = 0; auditRowIndex < rowCount; auditRowIndex++) {
      const row = modificationsCommonPage.auditHistoryTableBodyRows.nth(auditRowIndex);
      const cellTexts = await row.locator(modificationsCommonPage.tableCell).allTextContents();
      actualAuditHistoryRows.push(cellTexts.map((text) => text.trim()));
    }
    let expectedAuditHistoryRows: string[][];
    if (userName.toLowerCase() === 'applicant_user' || userName.toLowerCase() === 'sponsor_user') {
      expectedAuditHistoryRows = modificationsCommonPage.getAuditHistoryRecord
        .slice()
        .reverse()
        .map((record) => [record.dateTimeOfEventExpected, record.modificationEventExpected, record.userEmailExpected]);
    } else if (userName.toLowerCase() === 'backstage_user') {
      expectedAuditHistoryRows = modificationsCommonPage.getAuditHistoryRecordBackstageUser
        .slice()
        .reverse()
        .map((record) => [record.dateTimeOfEventExpected, record.modificationEventExpected, record.userEmailExpected]);
    }
    expect.soft(actualAuditHistoryRows).toEqual(expectedAuditHistoryRows);
  }
);

Then('I validate overall modification ranking on post approval tab', async ({ modificationsCommonPage }) => {
  const modificationTypeExpected = (await modificationsCommonPage.getOverallRankingForChanges()).modificationType;
  const categoryExpected = (await modificationsCommonPage.getOverallRankingForChanges()).category;
  const reviewTypeExpected = (await modificationsCommonPage.getOverallRankingForChanges()).reviewType;
  const modificationRankingDetails = await modificationsCommonPage.getModificationRankingPostApprovalPage();
  const modificationTypeValue = modificationRankingDetails.get('modificationType');
  const modificationTypeActual = Array.isArray(modificationTypeValue)
    ? modificationTypeValue.join(', ')
    : modificationTypeValue;
  const categoryValue = modificationRankingDetails.get('rankingCategory');
  const categoryActual = Array.isArray(categoryValue) ? categoryValue.join(', ') : categoryValue;
  const reviewTypeValue = modificationRankingDetails.get('reviewType');
  const reviewTypeActual = Array.isArray(reviewTypeValue) ? reviewTypeValue.join(', ') : reviewTypeValue;
  expect.soft(modificationTypeActual).toBe(modificationTypeExpected);
  expect.soft(categoryActual).toBe(categoryExpected);
  expect.soft(reviewTypeActual).toBe(reviewTypeExpected);
});

Then(
  'I create multiple modifications using {string} dataset',
  async (
    {
      commonItemsPage,
      modificationsCommonPage,
      selectAreaOfChangePage,
      projectIdentificationSelectChangePage,
      projectIdentificationSelectReferenceToChangePage,
      projectIdentificationEnterReferenceNumbersPage,
      sponsorReferencePage,
      $tags,
    },
    datasetName
  ) => {
    const changesDataset = modificationsCommonPage.modificationsCommonPageTestData[datasetName];
    const changeNames = Object.keys(changesDataset);
    for (let changeIndex = 0; changeIndex < changeNames.length; changeIndex++) {
      const changeName = changeNames[changeIndex];
      const changeDataset = changesDataset[changeName];
      await selectAreaOfChangePage.selectAreaOfChangeInModificationsPage(changeDataset, $tags);
      await modificationsCommonPage.createChangeModification(
        {
          projectIdentificationSelectChangePage,
          projectIdentificationSelectReferenceToChangePage,
          projectIdentificationEnterReferenceNumbersPage,
        },
        changeName,
        changeDataset
      );
      await commonItemsPage.clickButton('Modification_Details_Page', 'Save_Continue_Review');
      const sponsorReferenceDataset = sponsorReferencePage.sponsorReferencePageTestData['Valid_Data_All_Fields'];
      for (const key in sponsorReferenceDataset) {
        if (Object.hasOwn(sponsorReferenceDataset, key)) {
          await commonItemsPage.fillUIComponent(sponsorReferenceDataset, key, sponsorReferencePage);
        }
      }
      await commonItemsPage.clickButton('Sponsor_Reference_Page', 'Save_Continue_Review');
      await commonItemsPage.clickButton('Review_All_Changes_Page', 'Send_Modification_To_Sponsor');
      await commonItemsPage.clickButton('Confirmation_Page', 'Return_To_Project_Overview');
      if (changeIndex < changeNames.length - 1) {
        await commonItemsPage.clickButton('Project_Overview_Page', 'Create_New_Modification');
      }
    }
  }
);

Then('I validate the missing document notification details', async ({ modificationsCommonPage }) => {
  await expect
    .soft(
      modificationsCommonPage.notification_heading_text.getByText(
        modificationsCommonPage.modificationsCommonPageTestData.Missing_Document_Details_Notification
          .notification_heading_text
      )
    )
    .toBeVisible();
  await expect
    .soft(
      modificationsCommonPage.notification_text.getByText(
        modificationsCommonPage.modificationsCommonPageTestData.Missing_Document_Details_Notification.notification_text
      )
    )
    .toBeVisible();
});
