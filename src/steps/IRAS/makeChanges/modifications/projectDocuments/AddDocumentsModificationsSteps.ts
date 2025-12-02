import { createBdd } from 'playwright-bdd';
import { test } from '../../../../../hooks/CustomFixtures';
import { expect } from '@playwright/test';
import path from 'node:path';

const { Then } = createBdd(test);
//Below step definition is not required anymore. To be deleted in the future.
Then(
  'I can see the add documents for {string} page',
  async ({ addDocumentsModificationsPage, selectAreaOfChangePage }, specificChangeDatsetName: string) => {
    const dataset =
      selectAreaOfChangePage.selectAreaOfChangePageTestData.Select_Specific_Change[specificChangeDatsetName];
    const specificChangeTitleLabel = dataset.specific_change_dropdown;
    await addDocumentsModificationsPage.assertOnAddDocumentsModificationsPage(specificChangeTitleLabel);
  }
);

Then('I can see add supporting documents page', async ({ addDocumentsModificationsPage }) => {
  await addDocumentsModificationsPage.assertOnAddSupportDocumentsPage();
});

Then('I validate the ui labels for add documents modifications page', async ({ addDocumentsModificationsPage }) => {
  await expect
    .soft(
      addDocumentsModificationsPage.page.getByText(
        addDocumentsModificationsPage.addDocumentsModificationsPageTestData.Add_Documents_Modifications_Page
          .upload_document_header
      )
    )
    .toBeVisible();
  await expect
    .soft(
      addDocumentsModificationsPage.page.getByText(
        addDocumentsModificationsPage.addDocumentsModificationsPageTestData.Add_Documents_Modifications_Page
          .choose_files_button_label
      )
    )
    .toBeVisible();
  await expect
    .soft(
      addDocumentsModificationsPage.page.getByText(
        addDocumentsModificationsPage.addDocumentsModificationsPageTestData.Add_Documents_Modifications_Page
          .upload_document_component_hint_label
      )
    )
    .toBeVisible();
  await expect
    .soft(
      addDocumentsModificationsPage.page.getByText(
        addDocumentsModificationsPage.addDocumentsModificationsPageTestData.Add_Documents_Modifications_Page
          .no_files_chosen_label
      )
    )
    .toBeVisible();
});

Then(
  'I validate the status of each document is {string} in the add documents page',
  async ({ addDocumentsModificationsPage }, datasetName: string) => {
    const dataset = addDocumentsModificationsPage.addDocumentsModificationsPageTestData[datasetName];
    const expectedStatus = dataset.status;
    const displayedDocumentsListMap = await addDocumentsModificationsPage.getSupportingDocumentsStatusFromUI();
    const displayedDocumentsStatuses: string[] = displayedDocumentsListMap.get('displayedStatuses');
    for (const actualStatus of displayedDocumentsStatuses) {
      expect.soft(actualStatus).toBe(expectedStatus);
    }
  }
);

Then(
  'I delete the documents one by one from the uploaded {string} documents',
  async ({ addDocumentsModificationsPage, commonItemsPage, confirmationPage }, uploadDocumentsDatasetName: string) => {
    const documentPath = commonItemsPage.documentUploadTestData[uploadDocumentsDatasetName];
    const fileArray = Array.isArray(documentPath) ? documentPath : [documentPath];
    let fileDeleteCount = 0;
    for (const filePath of fileArray) {
      fileDeleteCount = fileDeleteCount + 1;
      const fileName = path.basename(filePath);
      await addDocumentsModificationsPage.table
        .locator(addDocumentsModificationsPage.rows, { hasText: `${fileName}` })
        .getByRole('link', {
          name: addDocumentsModificationsPage.addDocumentsModificationsPageTestData.Add_Documents_Modifications_Page
            .delete_label,
        })
        .click();
      await expect(
        addDocumentsModificationsPage.deletion_label.getByText(
          confirmationPage.confirmationPageTestData.Delete_Document_Confirmation_Labels
            .delete_single_document_page_heading
        )
      ).toBeVisible();
      await commonItemsPage.clickButton('Confirmation_Page', 'Delete_Document');
      if (fileDeleteCount < fileArray.length) {
        //Navigated back twice as the design need to be confirmed
        await commonItemsPage.govUkBackLink.getByText('Back').click();
        await commonItemsPage.govUkBackLink.getByText('Back').click();
      } else {
        break;
      }
    }
  }
);
