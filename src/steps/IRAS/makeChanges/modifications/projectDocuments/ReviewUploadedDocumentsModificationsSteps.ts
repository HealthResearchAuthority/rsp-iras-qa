import { createBdd } from 'playwright-bdd';
import { test, expect } from '../../../../../hooks/CustomFixtures';
import fs from 'fs';
import path from 'path';

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
    const rowCount = await reviewUploadedDocumentsModificationsPage.rows.count();
    for (const filePath of fileArray) {
      const fileSize = parseFloat((fs.statSync(filePath).size / (1024 * 1024)).toFixed(2)).toString();
      const fileName = path.basename(filePath);
      let found = false;
      for (let documentsRowIndex = 0; documentsRowIndex < rowCount; documentsRowIndex++) {
        const row = reviewUploadedDocumentsModificationsPage.rows.nth(documentsRowIndex);
        const cells = row.locator(reviewUploadedDocumentsModificationsPage.cells);
        const cellCount = await cells.count();
        const rowData = [];
        for (let documentsColumnDetailIndex = 0; documentsColumnDetailIndex < cellCount; documentsColumnDetailIndex++) {
          const text = (await cells.nth(documentsColumnDetailIndex).innerText()).trim();
          rowData.push(text);
        }
        if (
          rowData.includes(fileName) &&
          rowData.includes(`${fileSize} MB`) &&
          rowData.includes(
            reviewUploadedDocumentsModificationsPage.reviewUploadedDocumentsModificationsPageTestData
              .Review_Uploaded_Documents_Modifications_Page.delete_label
          )
        ) {
          found = true;
        }
      }
      expect(found).toBe(true);
    }
  }
);
