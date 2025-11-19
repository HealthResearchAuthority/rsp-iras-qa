import { createBdd } from 'playwright-bdd';
import { test } from '../../../../../hooks/CustomFixtures';
import { expect } from '@playwright/test';

const { Then } = createBdd(test);

// Then(
//   'I can see the add documents for {string} page',
//   async ({ addDocumentsModificationsPage, selectAreaOfChangePage }, specificChangeDatsetName: string) => {
//     const dataset =
//       selectAreaOfChangePage.selectAreaOfChangePageTestData.Select_Specific_Change[specificChangeDatsetName];
//     const specificChangeTitleLabel = dataset.specific_change_dropdown;
//     await addDocumentsModificationsPage.assertOnAddDocumentsModificationsPage(specificChangeTitleLabel);
//   }
// );

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
