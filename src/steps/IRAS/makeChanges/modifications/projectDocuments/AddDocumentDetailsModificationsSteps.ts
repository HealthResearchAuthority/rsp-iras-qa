import { createBdd } from 'playwright-bdd';
import { test } from '../../../../../hooks/CustomFixtures';
import { expect } from '@playwright/test';
import fs from 'fs';

const { Then } = createBdd(test);

Then(
  'I can see the add document details for {string} page',
  async ({ selectAreaOfChangePage, addDocumentDetailsModificationsPage }, specificChangeDatsetName: string) => {
    const dataset =
      selectAreaOfChangePage.selectAreaOfChangePageTestData.Select_Specific_Change[specificChangeDatsetName];
    const specificChangeTitleLabel = dataset.specific_change_dropdown;
    await addDocumentDetailsModificationsPage.assertOnAddDocumentsDetailsModificationsPage(specificChangeTitleLabel);
  }
);

Then(
  'I validate the status of each document is {string} in add document details page',
  async ({ addDocumentDetailsModificationsPage }, datasetName: string) => {
    const dataset = addDocumentDetailsModificationsPage.addDocumentDetailsModificationsPageTestData[datasetName];
    const expectedStatus = dataset.status;
    const displayedDocumentsListMap =
      await addDocumentDetailsModificationsPage.getDisplayedDocumentsListAndStatusFromUI(true);
    const displayedDocumentsStatuses: string[] = displayedDocumentsListMap.get('displayedStatuses');
    for (const actualStatus of displayedDocumentsStatuses) {
      expect.soft(actualStatus).toBe(expectedStatus);
    }
  }
);

Then(
  'I click on the document link with status {string} and enter {string} for the uploaded {string} in the add document details for specific document page',
  async (
    { addDocumentDetailsForSpecificDocumentModificationsPage, commonItemsPage, addDocumentDetailsModificationsPage },
    docStatusDataset: string,
    datasetName: string,
    uploadDatasetName: string
  ) => {
    const statusDataset =
      addDocumentDetailsModificationsPage.addDocumentDetailsModificationsPageTestData[docStatusDataset];
    const status = statusDataset.status;
    const dataset =
      addDocumentDetailsForSpecificDocumentModificationsPage
        .addDocumentDetailsForSpecificDocumentModificationsPageTestData[datasetName];
    const displayedDocumentsListMap =
      await addDocumentDetailsModificationsPage.getDisplayedDocumentsListAndStatusFromUI(true);
    const displayedDocumentsList: string[] = displayedDocumentsListMap.get('displayedDocuments');
    const displayedStatusesList: string[] = displayedDocumentsListMap.get('displayedStatuses');
    // Click on each document link
    for (let i = 0; i < displayedDocumentsList.length; i++) {
      if (displayedStatusesList[i] === status) {
        const documentName = displayedDocumentsList[i];
        await addDocumentDetailsModificationsPage.documentlink.getByText(documentName, { exact: true }).first().click();

        //Assertion to verify Add document details for specific document page
        await addDocumentDetailsForSpecificDocumentModificationsPage.assertOnAddDocumentsDetailsForSpecificModificationsPage(
          documentName
        );
        const documentPath = commonItemsPage.documentUploadTestData[uploadDatasetName];
        const fileArray = Array.isArray(documentPath) ? documentPath : [documentPath];
        const trimmedDocumentName = documentName.replace('Add details for ', '').trim();
        const filePath = fileArray.find((path: string) => path.includes(trimmedDocumentName));
        const fileSize = parseFloat((fs.statSync(filePath).size / 1024).toFixed(2)).toString();
        const expectedDocumentRow = addDocumentDetailsForSpecificDocumentModificationsPage.table
          .locator(addDocumentDetailsForSpecificDocumentModificationsPage.rows, { hasText: `${documentName}` })
          .filter({ hasText: `${fileSize} KB` })
          .filter({
            hasText:
              addDocumentDetailsForSpecificDocumentModificationsPage
                .addDocumentDetailsForSpecificDocumentModificationsPageTestData
                .Add_Document_Details_For_Specific_Document_Modifications_Page.delete_label,
          });
        const documentFoundCount = await expectedDocumentRow.count();
        expect(documentFoundCount).toBeGreaterThanOrEqual(0);
      }
      //Enter document details
      for (const key in dataset) {
        if (Object.prototype.hasOwnProperty.call(dataset, key)) {
          await commonItemsPage.fillUIComponent(dataset, key, addDocumentDetailsForSpecificDocumentModificationsPage);
        }
      }
      await addDocumentDetailsForSpecificDocumentModificationsPage.save_and_continue.click();
    }
  }
);
