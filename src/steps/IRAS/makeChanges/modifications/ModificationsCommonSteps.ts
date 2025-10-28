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
    await modificationsCommonPage.validateIndividualAndOverallRanking();
  }
);

Then(
  'I keep note of the individual and overall ranking of changes created using {string} and {string} dataset',
  async ({ modificationsCommonPage, reseachLocationsPage }, datasetName, datasetNameResearchLocation) => {
    const changesDataset = modificationsCommonPage.modificationsCommonPageTestData[datasetName];
    const researchLocationDataset = reseachLocationsPage.researchLocationsPageTestData[datasetNameResearchLocation];
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
    await modificationsCommonPage.validateIndividualAndOverallRanking();
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
    expect.soft(commonItemsPage.errorMessageSummaryLabel).toBeVisible();
    expect.soft(modificationsCommonPage.changes_free_text_summary_error).toBeVisible();
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

Then('I validate all fields on modification page {string}', async ({ modificationsCommonPage }, datasetName) => {
  modificationsCommonPage.validateAllFieldsOnModificationDetailsPage(datasetName);
});

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
    const modificationTypeExpected = individualRanking[firstCardKey][0].modificationType;
    const categoryExpected = individualRanking[firstCardKey][0].category;
    const reviewTypeExpected = individualRanking[firstCardKey][0].reviewType;
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
      chiefInvestigatorPage.chiefInvestigatorPageTestData[datasetNameChiefInvestigator].chief_investigator_email_text;
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
