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
      const stats = fs.statSync(filePath);
      let fileSize;
      if (stats.size < 1024 * 1024) {
        fileSize = Number.parseFloat((stats.size / 1024).toFixed(2)).toString() + ' KB';
      } else {
        fileSize = Number.parseFloat((stats.size / (1024 * 1024)).toFixed(2)).toString() + ' MB';
      }
      const fileName = path.basename(filePath);
      const expectedDocumentRow = reviewUploadedDocumentsModificationsPage.table
        .locator(reviewUploadedDocumentsModificationsPage.rows, { hasText: `${fileName}` })
        .filter({ hasText: fileSize })
        .filter({
          hasText:
            reviewUploadedDocumentsModificationsPage.reviewUploadedDocumentsModificationsPageTestData
              .Review_Uploaded_Documents_Modifications_Page.delete_label,
        });
      const documentFoundCount = await expectedDocumentRow.count();
      expect.soft(documentFoundCount).toBeGreaterThan(0);
    }
    await reviewUploadedDocumentsModificationsPage.setUploadedFileName(fileArray);
  }
);

Then(
  'I get the list of files upload and separate valid and invalid files',
  async ({ addDocumentsModificationsPage, reviewUploadedDocumentsModificationsPage }) => {
    const allUploadedFiles = await reviewUploadedDocumentsModificationsPage.getUploadedFileName();
    const validFileExtensions =
      await addDocumentsModificationsPage.addDocumentsModificationsPageTestData.Add_Documents_Modifications_Page
        .valid_file_extensions;
    const validFiles: string[] = [];
    const invalidFiles: string[] = [];
    for (const file of allUploadedFiles) {
      const fileExtn = path.extname(file);
      if (validFileExtensions.includes(fileExtn)) {
        validFileExtensions.push(file);
      } else {
        invalidFiles.push(file);
      }
    }
    await reviewUploadedDocumentsModificationsPage.setValidFileName(validFiles);
    await reviewUploadedDocumentsModificationsPage.setInValidFileName(invalidFiles);
  }
);

Then(
  'I validate if any duplicate files in the new document upload {string}',
  async ({ commonItemsPage, reviewUploadedDocumentsModificationsPage }, newUploadDocumentsDatasetName: string) => {
    const newDocumentUpload = commonItemsPage.documentUploadTestData[newUploadDocumentsDatasetName];

    const duplicateFiles: string[] = [];

    const oldDocumentUpload = await reviewUploadedDocumentsModificationsPage.getUploadedFileName();
    const oldfileArray = Array.isArray(oldDocumentUpload) ? oldDocumentUpload : [oldDocumentUpload];

    const newDocumentUploadFileNameOnly: string[] = [];

    for (const newfile of newDocumentUpload) {
      newDocumentUploadFileNameOnly.push(path.basename(newfile));
    }
    //const fileName = path.basename(oldDocumentUpload.toString());

    //const hasMultipleFiles: boolean = Array.isArray(oldDocumentUpload);

    // if (hasMultipleFiles === false) {
    //   if (newDocumentUpload.includes(oldDocumentUpload)) {
    //     duplicateFiles.push(oldDocumentUpload[0]);
    //     const length = duplicateFiles.length;
    //   }
    // } else {
    for (const file of oldfileArray) {
      const fileName = path.basename(file);
      //const newfileName = path.basename(newDocumentUpload);
      if (newDocumentUploadFileNameOnly.includes(fileName)) {
        duplicateFiles.push(fileName);
        //const length = duplicateFiles.length;
      }
    }
    //}
    await reviewUploadedDocumentsModificationsPage.setDuplicateFileName(duplicateFiles);
  }
);
