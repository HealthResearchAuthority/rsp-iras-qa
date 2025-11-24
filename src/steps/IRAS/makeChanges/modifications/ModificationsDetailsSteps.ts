import { createBdd } from 'playwright-bdd';
import { test, expect } from '../../../../hooks/CustomFixtures';

const { Given, When, Then } = createBdd(test);

Then('I can see the modifications details page', async ({ modificationsDetailsPage }) => {
  await modificationsDetailsPage.assertOnModificationsDetailsPage();
});

Then(
  'I can see the modifications details page in the readonly view for {string}',
  async ({ modificationsDetailsPage }, user: string) => {
    await modificationsDetailsPage.assertOnModificationsDetailsPage();
    await expect.soft(modificationsDetailsPage.deleteModificationLink).toBeHidden();
    await expect.soft(modificationsDetailsPage.remove_link).toBeHidden();
    await expect.soft(modificationsDetailsPage.change_link).toBeHidden();
    if (user.toLowerCase().startsWith('study')) {
      await expect.soft(modificationsDetailsPage.next_steps_heading).toBeVisible();
      await expect.soft(modificationsDetailsPage.next_steps_guidance).toBeVisible();
      await expect.soft(modificationsDetailsPage.next_steps_button).toBeVisible();
    } else {
      await expect.soft(modificationsDetailsPage.next_steps_heading).toBeHidden();
      await expect.soft(modificationsDetailsPage.next_steps_guidance).toBeHidden();
      await expect.soft(modificationsDetailsPage.next_steps_button).toBeHidden();
    }
  }
);

Then('I can see the confirm remove modifications page', async ({ modificationsDetailsPage }) => {
  await modificationsDetailsPage.assertOnRemoveModificationsPage();
});

Then('I can see the modification unfinished error page', async ({ modificationsDetailsPage }) => {
  await modificationsDetailsPage.assertOnModificationUnfinishedErrorPage();
});

Then(
  'I can see the modification successfully removed message on modification details page',
  async ({ modificationsDetailsPage }) => {
    await expect.soft(modificationsDetailsPage.removeModificationSuccessMessageText).toBeVisible();
  }
);

Then(
  'I validate the ui labels on modification details page using {string}',
  async ({ modificationsDetailsPage, commonItemsPage }, datasetName) => {
    const dataset = modificationsDetailsPage.modificationsDetailsPageTestData[datasetName];
    for (const key in dataset) {
      if (Object.hasOwn(dataset, key)) {
        await commonItemsPage.validateUIComponentValues(dataset, key, modificationsDetailsPage);
      }
    }
  }
);

Then('I validate all fields on modification page {string}', async ({ modificationsCommonPage }, datasetName) => {
  const changesDataset = modificationsCommonPage.modificationsCommonPageTestData[datasetName];
  const changeNames = Object.keys(changesDataset).reverse();
  // Headings assertions
  expect.soft(modificationsCommonPage.overall_modification_ranking_sub_heading).toBeVisible();
  expect.soft(modificationsCommonPage.ranking_sub_heading).toBeVisible();
  expect.soft(modificationsCommonPage.changes_sub_heading).toBeVisible();
  // Get actual values
  const actualValuesArray = await modificationsCommonPage.getActualFieldValuesOnModificationPage(
    modificationsCommonPage.allChangeCards,
    changesDataset,
    changeNames
  );
  // Loop through each change and assert
  for (let index = 0; index < actualValuesArray.length; index++) {
    const changeName = changeNames[index];
    const expectedData = changesDataset[changeName];
    for (const key of Object.keys(expectedData)) {
      const expectedValues = await modificationsCommonPage.getExpectedValues(expectedData, key, index);
      expect.soft(actualValuesArray[index].individualChangeStatus).toBe(expectedValues.expectedChangeStatus);
      expect.soft(actualValuesArray[index].areaOfChangeSubHeading).toBe(expectedValues.expectedAreaOfChangeSubHeading);
      if (expectedValues.expectedSpecificChangeValue) {
        expect.soft(actualValuesArray[index].specificChangeValue).toBe(expectedValues.expectedSpecificChangeValue);
      }
    }
  }
});

Then('I click the {string} tab on the modification details page', async ({ modificationsDetailsPage }, tabtype) => {
  await modificationsDetailsPage[tabtype.toLowerCase()].click();
});

Given('I can see the review outcome section', async ({ modificationsDetailsPage }) => {
  await expect(modificationsDetailsPage.review_comment_heading).toBeVisible();
  await expect(modificationsDetailsPage.review_comment_guidance).toBeVisible();
  await expect(modificationsDetailsPage.review_comment_box).toBeVisible();
  await expect(modificationsDetailsPage.review_outcome_heading).toBeVisible();
  await expect(modificationsDetailsPage.approved_outcome_option).toBeVisible();
  await expect(modificationsDetailsPage.not_approved_outcome_option).toBeVisible();
});

When(
  'I provide the {string} outcome for the modification with {string} reason',
  async ({ modificationsDetailsPage, modificationsReceivedCommonPage }, outcome: string, reason: string) => {
    const reasonGiven = modificationsDetailsPage.modificationsDetailsPageTestData.Modification_Outcome_Reasons[reason];
    if (outcome.toLowerCase() == 'not_approved') {
      await modificationsDetailsPage.not_approved_outcome_option.check();
      await modificationsDetailsPage.save_continue_button.click();
      await expect(modificationsDetailsPage.not_approved_comment_heading).toBeVisible();
      await expect(modificationsDetailsPage.not_approved_comment_guidance).toBeVisible();
      await modificationsDetailsPage.not_approved_comment_box.fill(reasonGiven);
      await modificationsReceivedCommonPage.setDecisionOutcome(
        modificationsDetailsPage.modificationsDetailsPageTestData.Modification_Review_Outcome_Section
          .not_approved_outcome_option
      );
    } else {
      await modificationsDetailsPage.approved_outcome_option.check();
      await modificationsDetailsPage.review_comment_box.fill(reasonGiven);
      await modificationsReceivedCommonPage.setDecisionOutcome(
        modificationsDetailsPage.modificationsDetailsPageTestData.Modification_Review_Outcome_Section
          .approved_outcome_option
      );
    }
  }
);
