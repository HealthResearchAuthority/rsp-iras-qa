import { createBdd } from 'playwright-bdd';
import { test } from '../../../../../hooks/CustomFixtures';
import { expect, Locator } from '@playwright/test';
import fs from 'fs';
import { confirmStringNotNull } from '../../../../../utils/UtilFunctions';

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
        const stats = fs.statSync(filePath);
        let fileSize;
        if (stats.size < 1024 * 1024) {
          fileSize = parseFloat((stats.size / 1024).toFixed(2)).toString() + ' KB';
        } else {
          fileSize = parseFloat((stats.size / (1024 * 1024)).toFixed(2)).toString() + ' MB';
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
    ).filter((option) => option.trim() !== 'Please select...');
    expect.soft(documentTypeDropdownValuesActual).toStrictEqual(documentTypeDropdownValuesExpected);
    // await addDocumentDetailsForSpecificDocumentModificationsPage.back_link.click();
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
    // Click on each document link
    for (let i = 0; i < 1; i++) {
      // for (let i = 0; i < displayedDocumentsList.length; i++) {
      if (displayedStatusesList[i] === status) {
        const documentName = displayedDocumentsList[i];
        await addDocumentDetailsModificationsPage.documentlink.getByText(documentName, { exact: true }).first().click();
        //Assertion to verify Add document details for specific document page
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
    documentTypeName: string,
    documentVersionDate: string
  ) => {
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
      if (documentTypeName === 'Curriculum vitae (CV) /suitability of researcher') {
        await expect
          .soft(addDocumentDetailsForSpecificDocumentModificationsPage.sub_document_type_dropdown)
          .toBeVisible();
        const locator: Locator = addDocumentDetailsForSpecificDocumentModificationsPage.sub_document_type_dropdown;
        if (confirmStringNotNull(await locator.getAttribute('class')).includes('govuk-select')) {
          await locator.selectOption('Academic Supervisor');
        }
      } else {
        await expect
          .soft(addDocumentDetailsForSpecificDocumentModificationsPage.sub_document_type_dropdown)
          .toBeHidden();
      }
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
    // await addDocumentDetailsForSpecificDocumentModificationsPage.page.getByTestId('IQA0603_OPT0004').check();
  }
);

// Then(
//   'I can see the document type drop down list shows only the document types for {string}',
//   async ({ addDocumentDetailsForSpecificDocumentModificationsPage }, documentTypedatasetName: string) => {
//     const dataset =
//       addDocumentDetailsForSpecificDocumentModificationsPage
//         .addDocumentDetailsForSpecificDocumentModificationsPageTestData[documentTypedatasetName];
//     const documentTypeDropdownValuesExpected = dataset['document_type_dropdown_values'];
//     const documentTypeDropdownValuesActual = (
//       await addDocumentDetailsForSpecificDocumentModificationsPage.document_type_dropdown
//         .locator('option')
//         .allTextContents()
//     ).filter((option) => option.trim() !== 'Please select...');
//     expect.soft(documentTypeDropdownValuesActual).toStrictEqual(documentTypeDropdownValuesExpected);
//   }
// );

// // Optional ‘document date’ and ‘document version’

// Evidence of insurance or indemnity
// Participant facing materials -other
// Questionnaire - validated
// Curriculum vitae (CV) /suitability of researcher
// Curriculum vitae (CV) /suitability of researcher
// Curriculum Vitae (CV) /suitability of researcher
// Curriculum Vitae (CV) /suitability of researcher
// Curriculum vitae (CV) /suitability of researcher
// Student research criteria eligibility declaration
// Dear investigator letter
// Funder's letter/outcome of funding panel
// Statistician's letter
// Referee's  or other scientific critique report
// Sponsor - Site Agreement
// Schedule of Events or Schedule of Events cost attribution template (SoECAT)
// Data flow diagram or documents demonstrating conformity with data protection and confidentiality requirements
// Miscellaneous

// // // Mandatory ‘document date’ and ‘document version’

// Protocol / Clinical Investigation Plan
// Participant information sheet (PIS)
// Consent form
// Recruitment - Invitation to potential participants
// Recruitment materials - other
// Interviews or focus group topic guides
// Questionnaire - non-validated
// Participant Diary (sample)

// // All 21 study types for NON-REC

// 1.Protocol / Clinical Investigation Plan
// 2.Evidence of insurance or indemnity
// 3.Participant information sheet (PIS)
// 4.Participant facing materials -other
// 5.Consent form
// 6.Recruitment - Invitation to potential participants
// 7.Recruitment materials - other
// 8.Interviews or focus group topic guides
// 9.Questionnaire - non-validated
// 10.Questionnaire - validated
// 11.Participant Diary (sample)
// 12.Curriculum vitae (CV) /suitability of researcher
// 13.Student research criteria eligibility declaration
// 14.Dear investigator letter
// 15.Funder's letter/outcome of funding panel
// 16.Statistician's letter
// 17.Referee's  or other scientific critique report
// 18.Sponsor - Site Agreement
// 19.Schedule of Events or Schedule of Events cost attribution template (SoECAT)
// 20.Data flow diagram or documents demonstrating conformity with data protection and confidentiality requirements
// 21.Miscellaneous
