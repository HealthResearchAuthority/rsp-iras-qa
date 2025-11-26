import { createBdd } from 'playwright-bdd';
import { test, expect } from '../../../../hooks/CustomFixtures';
import { Locator } from '@playwright/test';

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
        await expect(locator).toBeVisible();
      }
    }
  }
);

Then(
  'I can validate the {string} ui labels on the modification history page',
  async ({ modificationPostSubmissionPage }, datasetName: string) => {
    const dataset =
      modificationPostSubmissionPage.modificationPostSubmissionPageTestData.Modification_Post_Submission_Page
        .history_tab[datasetName];
    for (const key in dataset) {
      if (Object.hasOwn(dataset, key)) {
        const locator: Locator = modificationPostSubmissionPage[key];
        await expect(locator).toBeVisible();
      }
    }
  }
);
