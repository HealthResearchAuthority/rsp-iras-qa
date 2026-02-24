import { createBdd } from 'playwright-bdd';
import { test } from '../../../../../hooks/CustomFixtures';
import { expect, Locator } from '@playwright/test';
import fs from 'node:fs';
import { confirmStringNotNull, generateUniqueValue } from '../../../../../utils/UtilFunctions';
import path from 'node:path';
const { Then, When } = createBdd(test);

When(
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
        await addDocumentDetailsModificationsPage.documentlink
          .getByText(documentName, { exact: true })
          .first()
          .waitFor({ state: 'visible', timeout: 20000 });
        await addDocumentDetailsModificationsPage.documentlink.getByText(documentName, { exact: true }).first().click();
        //Assertion to verify Add document details for specific document page
        await addDocumentDetailsForSpecificDocumentModificationsPage.assertOnAddDocumentsDetailsForSpecificModificationsPage(
          documentName
        );
        const documentPath = commonItemsPage.documentUploadTestData[uploadDatasetName];
        const fileArray = Array.isArray(documentPath) ? documentPath : [documentPath];
        const trimmedDocumentName = documentName.replace('Add details for ', '').trim();
        const filePath = fileArray.find((path: string) => path.includes(trimmedDocumentName));
        const stats = fs.statSync(filePath);
        let fileSize;
        if (stats.size < 1024 * 1024) {
          fileSize = Number.parseFloat((stats.size / 1024).toFixed(2)).toString() + ' KB';
        } else {
          fileSize = Number.parseFloat((stats.size / (1024 * 1024)).toFixed(2)).toString() + ' MB';
        }
        const expectedDocumentRow = addDocumentDetailsForSpecificDocumentModificationsPage.table
          .locator(addDocumentDetailsForSpecificDocumentModificationsPage.rows, { hasText: `${trimmedDocumentName}` })
          .filter({ hasText: fileSize })
          .filter({
            hasText:
              addDocumentDetailsForSpecificDocumentModificationsPage
                .addDocumentDetailsForSpecificDocumentModificationsPageTestData
                .Add_Document_Details_For_Specific_Document_Modifications_Page.delete_label,
          });
        const documentFoundCount = await expectedDocumentRow.count();
        expect.soft(documentFoundCount).toBeGreaterThan(0);
      } else {
        continue;
      }
      //Enter document details
      for (const key in dataset) {
        if (Object.hasOwn(dataset, key)) {
          if (key === 'document_name_text') {
            const prefix =
              addDocumentDetailsForSpecificDocumentModificationsPage
                .addDocumentDetailsForSpecificDocumentModificationsPageTestData.Document_Name_Prefix.prefix;
            const uniqueDocName = await generateUniqueValue(dataset[key], prefix);
            const locator: Locator = addDocumentDetailsForSpecificDocumentModificationsPage[key];
            await locator.fill(uniqueDocName);
            await addDocumentDetailsModificationsPage.setUniqueDocNames(uniqueDocName);
          } else {
            await commonItemsPage.fillUIComponent(dataset, key, addDocumentDetailsForSpecificDocumentModificationsPage);
          }
        }
      }
      await addDocumentDetailsForSpecificDocumentModificationsPage.save_and_continue.click();
    }
  }
);
Then(
  'I click on the document link with status {string} and delete the uploaded document in the add document details for specific document page',
  async ({ commonItemsPage, confirmationPage, addDocumentDetailsModificationsPage }, docStatusDataset: string) => {
    const statusDataset =
      addDocumentDetailsModificationsPage.addDocumentDetailsModificationsPageTestData[docStatusDataset];
    const status = statusDataset.status;
    const displayedDocumentsListMap =
      await addDocumentDetailsModificationsPage.getDisplayedDocumentsListAndStatusFromUI(true);
    const displayedDocumentsList: string[] = displayedDocumentsListMap.get('displayedDocuments');
    const displayedStatusesList: string[] = displayedDocumentsListMap.get('displayedStatuses');
    for (
      let displayedDocumentsListIndex = 0;
      displayedDocumentsListIndex < displayedDocumentsList.length;
      displayedDocumentsListIndex++
    ) {
      if (displayedStatusesList[displayedDocumentsListIndex] === status) {
        const documentName = displayedDocumentsList[displayedDocumentsListIndex];
        await addDocumentDetailsModificationsPage.documentlink.getByText(documentName, { exact: true }).first().click();
      }
      await addDocumentDetailsModificationsPage.documentlink.getByText('Delete', { exact: true }).first().click();
      await expect(
        confirmationPage.confirmation_header_common_label.getByText(
          confirmationPage.confirmationPageTestData.Delete_Document_Confirmation_Labels
            .delete_single_document_page_heading
        )
      ).toBeVisible();
      await commonItemsPage.clickButton('Confirmation_Page', 'Delete_Document');
    }
  }
);

Then(
  'I can see the document type drop down list shows only the document types for {string}',
  async ({ addDocumentDetailsForSpecificDocumentModificationsPage }, documentTypedatasetName: string) => {
    const dataset =
      addDocumentDetailsForSpecificDocumentModificationsPage
        .addDocumentDetailsForSpecificDocumentModificationsPageTestData[documentTypedatasetName];
    const documentTypeDropdownValuesExpected = dataset['document_type_dropdown_values'];
    const documentTypeDropdownValuesActual = (
      await addDocumentDetailsForSpecificDocumentModificationsPage.document_type_dropdown
        .locator('option')
        .allTextContents()
    )
      .map((option) => option.trim())
      .filter((option) => option !== 'Please select...');

    const sortedDocumentTypeDropdownValuesActual = [...documentTypeDropdownValuesActual].sort((a, b) =>
      a.localeCompare(b, 'en', { sensitivity: 'base' })
    );
    const SortedDocumentTypeDropdownValuesExpected = [...documentTypeDropdownValuesExpected].sort((a, b) =>
      a.localeCompare(b, 'en', { sensitivity: 'base' })
    );
    expect.soft(sortedDocumentTypeDropdownValuesActual).toEqual(SortedDocumentTypeDropdownValuesExpected);
  }
);

Then(
  'I click on the document link with status {string} and I can see the add document details for specific document page',
  async (
    { addDocumentDetailsForSpecificDocumentModificationsPage, addDocumentDetailsModificationsPage },
    docStatusDataset: string
  ) => {
    const statusDataset =
      addDocumentDetailsModificationsPage.addDocumentDetailsModificationsPageTestData[docStatusDataset];
    const status = statusDataset.status;
    const displayedDocumentsListMap =
      await addDocumentDetailsModificationsPage.getDisplayedDocumentsListAndStatusFromUI(true);
    const displayedDocumentsList: string[] = displayedDocumentsListMap.get('displayedDocuments');
    const displayedStatusesList: string[] = displayedDocumentsListMap.get('displayedStatuses');
    for (let i = 0; i < 1; i++) {
      if (displayedStatusesList[i] === status) {
        const documentName = displayedDocumentsList[i];
        await addDocumentDetailsModificationsPage.documentlink.getByText(documentName, { exact: true }).first().click();
        await addDocumentDetailsForSpecificDocumentModificationsPage.assertOnAddDocumentsDetailsForSpecificModificationsPage(
          documentName
        );
      }
    }
  }
);

Then(
  'I select document type {string} for which document version and date are {string} and I can see mandatory fields are displayed based on the selected document type',
  async (
    { addDocumentDetailsForSpecificDocumentModificationsPage },
    documentTypeDatasetName: string,
    documentVersionDate: string
  ) => {
    const documentTypeName =
      addDocumentDetailsForSpecificDocumentModificationsPage
        .addDocumentDetailsForSpecificDocumentModificationsPageTestData.Document_Types[documentTypeDatasetName];
    const locator: Locator = addDocumentDetailsForSpecificDocumentModificationsPage.document_type_dropdown;
    if (confirmStringNotNull(await locator.getAttribute('class')).includes('govuk-select')) {
      await locator.selectOption(documentTypeName);
    }
    await expect
      .soft(addDocumentDetailsForSpecificDocumentModificationsPage.document_previously_approved_hint_text)
      .toBeVisible();
    if (documentVersionDate === 'optional') {
      await expect
        .soft(addDocumentDetailsForSpecificDocumentModificationsPage.sponsor_document_version_text)
        .toBeHidden();
      await expect.soft(addDocumentDetailsForSpecificDocumentModificationsPage.sponsor_document_day_text).toBeHidden();
      await expect
        .soft(addDocumentDetailsForSpecificDocumentModificationsPage.sponsor_document_month_dropdown)
        .toBeHidden();
      await expect.soft(addDocumentDetailsForSpecificDocumentModificationsPage.sponsor_document_year_text).toBeHidden();
    } else if (documentVersionDate === 'mandatory') {
      await expect
        .soft(addDocumentDetailsForSpecificDocumentModificationsPage.sponsor_document_version_text)
        .toBeVisible();
      await expect.soft(addDocumentDetailsForSpecificDocumentModificationsPage.sponsor_document_day_text).toBeVisible();
      await expect
        .soft(addDocumentDetailsForSpecificDocumentModificationsPage.sponsor_document_month_dropdown)
        .toBeVisible();
      await expect
        .soft(addDocumentDetailsForSpecificDocumentModificationsPage.sponsor_document_year_text)
        .toBeVisible();
    }
  }
);

Then(
  'I select {string} for the previous version of the document approved question',
  async ({ addDocumentDetailsForSpecificDocumentModificationsPage }, radioButtonValue: string) => {
    const locatorVal: Locator =
      addDocumentDetailsForSpecificDocumentModificationsPage[
        `document_previously_approved_+${radioButtonValue}+_radio`
      ];
    const typeAttribute = await locatorVal.first().getAttribute('type');
    if (typeAttribute === 'radio') {
      await locatorVal.check();
    }
  }
);

Then(
  'I enter document details for the uploaded documents using {string} in the add document details for specific document page',
  async ({ addDocumentDetailsForSpecificDocumentModificationsPage, commonItemsPage }, datasetName: string) => {
    const dataset =
      addDocumentDetailsForSpecificDocumentModificationsPage
        .addDocumentDetailsForSpecificDocumentModificationsPageTestData[datasetName];

    for (const key of Object.keys(dataset)) {
      if (Object.hasOwn(dataset, key)) {
        await commonItemsPage.fillUIComponent(dataset, key, addDocumentDetailsForSpecificDocumentModificationsPage);
      }
    }
  }
);

Then(
  'I click on the document link with status {string} and download the uploaded document in the add document details for specific document page',
  async ({ addDocumentDetailsModificationsPage, page }, docStatusDataset: string) => {
    const statusDataset =
      addDocumentDetailsModificationsPage.addDocumentDetailsModificationsPageTestData[docStatusDataset];
    const status = statusDataset.status;
    const displayedDocumentsListMap =
      await addDocumentDetailsModificationsPage.getDisplayedDocumentsListAndStatusFromUI(true);
    const displayedDocumentsList: string[] = displayedDocumentsListMap.get('displayedDocuments');
    const displayedStatusesList: string[] = displayedDocumentsListMap.get('displayedStatuses');
    for (let index = 0; index < displayedDocumentsList.length; index++) {
      if (displayedStatusesList[index] === status) {
        const documentName = displayedDocumentsList[index];
        await addDocumentDetailsModificationsPage.documentlink.getByText(documentName, { exact: true }).first().click();
        const fileNameLocator = addDocumentDetailsModificationsPage.documentlink;
        const actualFileNameArray = await fileNameLocator.allTextContents();
        const actualFileName = actualFileNameArray[1].trim();
        const fieldLocator = addDocumentDetailsModificationsPage.documentlink.getByText(actualFileName);
        const downloadPath = path.resolve(process.env.HOME || process.env.USERPROFILE || '', 'Downloads');
        const [download] = await Promise.all([page.waitForEvent('download'), fieldLocator.click()]);
        const suggestedFileName = download.suggestedFilename();
        const savedFilePath = path.join(downloadPath, suggestedFileName);
        await download.saveAs(savedFilePath);
        const expectedFileName = path.basename(savedFilePath);
        expect.soft(actualFileName).toBe(expectedFileName);
      }
    }
  }
);
