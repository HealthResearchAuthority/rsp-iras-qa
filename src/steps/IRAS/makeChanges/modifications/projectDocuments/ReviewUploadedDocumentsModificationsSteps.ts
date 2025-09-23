import { createBdd } from 'playwright-bdd';
import { test } from '../../../../../hooks/CustomFixtures';
import { expect } from '@playwright/test';
import * as fs from 'node:fs';
import path from 'node:path';

const { Then } = createBdd(test);

Then(
  'I can see the review uploaded documents for {string} page',
  async ({ reviewUploadedDocumentsModificationsPage, selectAreaOfChangePage }, specificChangeDatsetName: string) => {
    const dataset =
      selectAreaOfChangePage.selectAreaOfChangePageTestData.Select_Specific_Change[specificChangeDatsetName];
    const specificChangeTitleLabel = dataset.specific_change_dropdown;
    await reviewUploadedDocumentsModificationsPage.assertOnReviewUploadedDocumentsModificationsPage(
      specificChangeTitleLabel
    );
  }
);

Then(
  'I validate the uploaded {string} documents are listed along with size and delete option in the review uploaded documents page',
  async ({ reviewUploadedDocumentsModificationsPage, commonItemsPage }, uploadDocumentsDatasetName: string) => {
    const documentPath = commonItemsPage.documentUploadTestData[uploadDocumentsDatasetName];
    const fileArray = Array.isArray(documentPath) ? documentPath : [documentPath];
    for (const filePath of fileArray) {
      const fileSize = Number.parseFloat((fs.statSync(filePath).size / (1024 * 1024)).toFixed(2)).toString();
      const fileName = path.basename(filePath);
      const expectedDocumentRow = reviewUploadedDocumentsModificationsPage.table
        .locator(reviewUploadedDocumentsModificationsPage.rows, { hasText: `${fileName}` })
        .filter({ hasText: `${fileSize} MB` })
        .filter({
          hasText:
            reviewUploadedDocumentsModificationsPage.reviewUploadedDocumentsModificationsPageTestData
              .Review_Uploaded_Documents_Modifications_Page.delete_label,
        });
      const documentFoundCount = await expectedDocumentRow.count();
      expect(documentFoundCount).toBeGreaterThan(0);
    }
  }
);

Then(
  'I delete the documents one by one from the documents added page of {string} modifications in reference to the uploaded {string} documents',
  async (
    { reviewUploadedDocumentsModificationsPage, commonItemsPage, selectAreaOfChangePage },
    specificChangeDatasetName,
    uploadDocumentsDatasetName: string
  ) => {
    const specificChangeDataset =
      selectAreaOfChangePage.selectAreaOfChangePageTestData.Select_Specific_Change[specificChangeDatasetName];
    const specificChangeTitleLabel = specificChangeDataset.specific_change_dropdown;
    const documentPath = commonItemsPage.documentUploadTestData[uploadDocumentsDatasetName];
    const fileArray = Array.isArray(documentPath) ? documentPath : [documentPath];
    for (const filePath of fileArray) {
      let fileCount = fileArray.length;
      const fileSize = Number.parseFloat((fs.statSync(filePath).size / (1024 * 1024)).toFixed(2)).toString();
      const fileName = path.basename(filePath);
      const expectedDocumentRow = reviewUploadedDocumentsModificationsPage.table
        .locator(reviewUploadedDocumentsModificationsPage.rows, { hasText: `${fileName}` })
        .filter({ hasText: `${fileSize} MB` })
        .filter({
          hasText:
            reviewUploadedDocumentsModificationsPage.reviewUploadedDocumentsModificationsPageTestData
              .Review_Uploaded_Documents_Modifications_Page.delete_label,
        });
      await reviewUploadedDocumentsModificationsPage.table
        .locator(reviewUploadedDocumentsModificationsPage.rows, { hasText: `${fileName}` })
        .filter({ hasText: `${fileSize} MB` })
        .getByRole('link', {
          name: reviewUploadedDocumentsModificationsPage.reviewUploadedDocumentsModificationsPageTestData
            .Review_Uploaded_Documents_Modifications_Page.delete_label,
        })
        .click();
      if (fileCount > 1) {
        const documentFoundCount = await expectedDocumentRow.count();
        expect(documentFoundCount).toBe(0);
        await reviewUploadedDocumentsModificationsPage.assertOnReviewUploadedDocumentsModificationsPage(
          specificChangeTitleLabel
        );
      } else {
        break;
      }
      fileCount--;
    }
  }
);
