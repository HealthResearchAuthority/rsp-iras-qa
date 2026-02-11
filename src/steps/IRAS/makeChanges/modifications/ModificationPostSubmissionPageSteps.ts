import { createBdd } from 'playwright-bdd';
import { test, expect } from '../../../../hooks/CustomFixtures';
import { Locator } from '@playwright/test';
import { confirmStringNotNull } from '../../../../utils/UtilFunctions';

const { Then } = createBdd(test);

Then('I can see the modification post submission page', async ({ modificationPostSubmissionPage }) => {
  await modificationPostSubmissionPage.assertOnModificationPostSubmissionPage();
});

Then(
  'I can see the {string} ui labels on the modification post submission page',
  async ({ modificationPostSubmissionPage }, datasetName: string) => {
    const dataset =
      modificationPostSubmissionPage.modificationPostSubmissionPageTestData.Modification_Post_Submission_Page
        .documents_tab[datasetName];
    for (const key in dataset) {
      if (Object.hasOwn(dataset, key)) {
        const locator: Locator = modificationPostSubmissionPage[key];
        await expect.soft(locator).toBeVisible();
      }
    }
  }
);

Then(
  'I see the the modification post submission page with {string} status and {string} reason',
  async (
    { modificationsDetailsPage, modificationsCommonPage, modificationOutcomeCheckSendPage },
    statusDataset: string,
    reason: string
  ) => {
    const dataset = modificationsCommonPage.modificationsCommonPageTestData[statusDataset];
    const expectedStatus = dataset.status;
    const actualStatus = confirmStringNotNull(await modificationsCommonPage.status_value.textContent());
    expect.soft(actualStatus).toBe(expectedStatus);
    if (statusDataset.toLowerCase() == 'modification_status_not_approved') {
      const expectedReason =
        modificationsDetailsPage.modificationsDetailsPageTestData.Modification_Outcome_Reasons[reason];
      await expect.soft(modificationOutcomeCheckSendPage.reason_value).toHaveText(expectedReason);
    } else {
      await expect.soft(modificationOutcomeCheckSendPage.reason_row).toBeHidden();
    }
  }
);
