import { createBdd } from 'playwright-bdd';
import { test, expect } from '../../../../hooks/CustomFixtures';

const { Given } = createBdd(test);

Given(
  'I see the check and send review outcome page with {string} outcome and {string} reason',
  async (
    { modificationOutcomeCheckSendPage, modificationsDetailsPage, modificationsReceivedCommonPage },
    outcome: string,
    reason: string
  ) => {
    // await modificationOutcomeCheckSendPage.assertOnModificationOutcomeCheckSendPage();
    await expect
      .soft(modificationOutcomeCheckSendPage.short_project_title_value)
      .toHaveText(await modificationsReceivedCommonPage.getShortProjectTitle());
    await expect
      .soft(modificationOutcomeCheckSendPage.modification_id_value)
      .toHaveText(await modificationsReceivedCommonPage.getModificationId());
    await expect
      .soft(modificationOutcomeCheckSendPage.decision_value)
      .toHaveText(await modificationsReceivedCommonPage.getDecisionOutcome());
    await expect.soft(modificationOutcomeCheckSendPage.decision_change_link).toBeVisible();

    if (outcome.toLowerCase() == 'not_approved') {
      const expectedReason =
        modificationsDetailsPage.modificationsDetailsPageTestData.Modification_Outcome_Reasons[reason];
      await expect.soft(modificationOutcomeCheckSendPage.reason_value).toHaveText(expectedReason);
      await expect.soft(modificationOutcomeCheckSendPage.reason_change_link).toBeVisible();
    } else {
      await expect.soft(modificationOutcomeCheckSendPage.reason_row).toBeHidden();
    }
  }
);
