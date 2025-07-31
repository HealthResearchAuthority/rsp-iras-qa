import { createBdd } from 'playwright-bdd';
import { expect, test } from '../../../../hooks/CustomFixtures';
import { confirmStringNotNull } from '../../../../utils/UtilFunctions';
//import config from '../../../../../playwright.config';

const { Then } = createBdd(test);

Then('I can see the participating organisation page', async ({ participatingOrganisationsPage }) => {
  await participatingOrganisationsPage.assertOnParticipatingOrganisationsPage();
});

Then(
  'I can see the page heading is changed for {string} on participating organisation page',
  async ({ selectAreaOfChangePage, participatingOrganisationsPage }, datasetName) => {
    const dataset = selectAreaOfChangePage.selectAreaOfChangePageTestData.Select_Specific_Change[datasetName];
    const expectedPageHeading = dataset['specific_change_dropdown'];
    const actualPageHeading = confirmStringNotNull(await participatingOrganisationsPage.pageHeading.textContent());
    expect(actualPageHeading).toBe(expectedPageHeading);
  }
);

Then(
  'I validate the ui lables and field values with {string} on participating organisation page',
  async (
    { participatingOrganisationsPage, projectDetailsIRASPage, projectDetailsTitlePage },
    projectTitleDatasetName: string
  ) => {
    const projectTitleDataset = projectDetailsTitlePage.projectDetailsTitlePageTestData[projectTitleDatasetName];
    const actualIrasIdValue = confirmStringNotNull(await participatingOrganisationsPage.iras_id_text.textContent());
    const expectedIrasIdValue = await projectDetailsIRASPage.getUniqueIrasId();
    const actualProjectTitle = confirmStringNotNull(
      await participatingOrganisationsPage.short_project_title_text.textContent()
    );
    const expectedProjectTitle = projectTitleDataset.short_project_title_text;
    const actualModificationId = confirmStringNotNull(
      await participatingOrganisationsPage.modification_id_text.textContent()
    );
    const irasIdRunTime = await projectDetailsIRASPage.getUniqueIrasId();
    const expectedModificationId = irasIdRunTime + '/' + 1;
    expect(actualIrasIdValue).toBe(expectedIrasIdValue);
    expect(actualProjectTitle).toBe(expectedProjectTitle);
    expect(actualModificationId).toBe(expectedModificationId);
    // All the below assertion can be removed when the functionality is implemented - now it's UI only function
    expect(participatingOrganisationsPage.remove_this_change_link).toBeVisible();
    expect(participatingOrganisationsPage.advanced_filter_link).toBeVisible();
    expect(participatingOrganisationsPage.participating_organisations_text).toBeVisible();
    expect(participatingOrganisationsPage.participating_organisations_search_button).toBeVisible();
  }
);

Then(
  'I validate the modification id on participating organisation page when user creates multiple new modifications',
  async ({ participatingOrganisationsPage, selectAreaOfChangePage }) => {
    const expectedModificationId = await selectAreaOfChangePage.getModificationId();
    const actualModificationId = confirmStringNotNull(
      await participatingOrganisationsPage.modification_id_text.textContent()
    );
    expect(actualModificationId).toBe(expectedModificationId);
  }
);

Then(
  'I can see the {string} ui labels on the participating organisation page',
  async ({ commonItemsPage, participatingOrganisationsPage }, datasetName: string) => {
    const dataset = participatingOrganisationsPage.participatingOrganisationsPageTestData[datasetName];
    for (const key in dataset) {
      if (Object.prototype.hasOwnProperty.call(dataset, key)) {
        const labelVal = await commonItemsPage.getUiLabel(key, participatingOrganisationsPage);
        expect(labelVal).toBe(dataset[key]);
      }
    }
  }
);

Then('I see the total number of results in the page', async ({ commonItemsPage, participatingOrganisationsPage }) => {
  //find total number of rows minus the header row ??.. check this

  const truncated = await participatingOrganisationsPage.displayed_row_count.textContent();
  const displayedRowCount = truncated?.split(' ')[0].trim();

  const totalPages = await commonItemsPage.getTotalPages();
  let totalRowCount = 0;
  for (let i = 1; i <= totalPages; i++) {
    totalRowCount = totalRowCount + (await commonItemsPage.tableRows.count());
    if (i < totalPages) {
      await commonItemsPage.next_button.isVisible();
      await commonItemsPage.next_button.click();
    }
  }
  expect(totalRowCount).toBe(displayedRowCount);
});

// Then(
//   'I confirm checkbox exists in every row across all pages',
//   async ({ commonItemsPage, participatingOrganisationsPage }) => {
//     while (true) {
//       const rows = await commonItemsPage.tableRows;
//       const rowCount = await rows.count();
//       for (let i = 2; i < rowCount; i++) {
//         //check the locator checkbox
//         await participatingOrganisationsPage.modification_checkbox.nth(i).isVisible();
//       }
//       const isDisabled = await commonItemsPage.next_button.isDisabled();
//       if (isDisabled !== null) {
//         break;
//       }
//       await commonItemsPage.next_button.click();
//     }
//   }
// );

Then(
  'I confirm checkbox exists in every row across all pages',
  async ({ commonItemsPage, participatingOrganisationsPage }) => {
    let hasNextPage = true;
    while (hasNextPage) {
      const rows = await commonItemsPage.tableRows;
      const rowCount = await rows.count();
      for (let i = 2; i < rowCount; i++) {
        //check the locator checkbox
        //await participatingOrganisationsPage.modification_checkbox.nth(i).isVisible();
        //const checkbox = rows.nth(i).locator(participatingOrganisationsPage.modification_checkbox);
        await participatingOrganisationsPage.modification_checkbox.nth(i).isVisible();
        //await expect(participatingOrganisationsPage.modification_checkbox).toBeVisible();
      }
      hasNextPage = await commonItemsPage.next_button.isEnabled();

      if (hasNextPage) {
        await commonItemsPage.next_button.click();
        await participatingOrganisationsPage.page.waitForLoadState('networkidle');
      }
    }
  }
);

Then(
  'I fill the search criteria {string}',
  async ({ commonItemsPage, participatingOrganisationsPage }, datasetName: string) => {
    const dataset = participatingOrganisationsPage.participatingOrganisationsPageTestData[datasetName];
    for (const key in dataset) {
      if (Object.prototype.hasOwnProperty.call(dataset, key)) {
        await commonItemsPage.fillUIComponent(dataset, key, participatingOrganisationsPage);
      }
    }
  }
);
