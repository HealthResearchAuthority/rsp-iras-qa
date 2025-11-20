import { createBdd } from 'playwright-bdd';
import { test, expect } from '../../../../hooks/CustomFixtures';
import { confirmStringNotNull } from '../../../../utils/UtilFunctions';
import { Locator } from '@playwright/test';
//import * as fs from 'node:fs';

const { Then } = createBdd(test);
//This needs to be updated once the code drop provided
Then('I can see the modification post submission page', async ({ modificationPostSubmissionPage }) => {
  await modificationPostSubmissionPage.assertOnModificationPostSubmissionPage();
});
//this needs to be updated once the code drop is provided
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
//the below needs to be updated once the code drop is available
Then(
  'I can validate the {string} are displayed in the supporting documents table on the modification post submission page',
  async ({ modificationPostSubmissionPage, commonItemsPage, modificationsCommonPage }, datasetName: string) => {
    const dataset = commonItemsPage.documentUploadTestData[datasetName];
    const actualStatus = confirmStringNotNull(await modificationsCommonPage.status_value.textContent());
    const rows = modificationPostSubmissionPage.locator('table tbody tr');
    const rowCount = await rows.count();

    const actualDocsInTable: string[] = [];

    for (let i = 0; i < rowCount; i++) {
      const docName = await rows.nth(i).locator(`td:nth-child(2)`).innerText();
      const status = await rows.nth(i).locator(`td:nth-child(4)`).innerText();

      if (dataset.includes(docName)) {
        actualDocsInTable.push(docName);
        expect(status).toBe(actualStatus);
      }
    }

    for (const doc of dataset) {
      expect.soft(actualDocsInTable).toContain(doc);
    }
  }
);
