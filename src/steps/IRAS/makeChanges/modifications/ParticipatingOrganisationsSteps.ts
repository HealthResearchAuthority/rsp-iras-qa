import { createBdd } from 'playwright-bdd';
import { expect, test } from '../../../../hooks/CustomFixtures';
import { confirmStringNotNull } from '../../../../utils/UtilFunctions';

const { When, Then } = createBdd(test);

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
  async ({ participatingOrganisationsPage, projectDetailsIRASPage }) => {
    const actualIrasIdValue = confirmStringNotNull(await participatingOrganisationsPage.iras_id_text.textContent());
    const expectedIrasIdValue = await projectDetailsIRASPage.getUniqueIrasId();
    const actualProjectTitle = confirmStringNotNull(
      await participatingOrganisationsPage.short_project_title_text.textContent()
    );
    const expectedProjectTitle = (await projectDetailsIRASPage.getShortProjectTitle()).trimEnd();
    const actualModificationId = confirmStringNotNull(
      await participatingOrganisationsPage.modification_id_text.textContent()
    );
    const irasIdRunTime = await projectDetailsIRASPage.getUniqueIrasId();
    const expectedModificationId = irasIdRunTime + '/' + 1;
    expect(actualIrasIdValue).toBe(expectedIrasIdValue);
    expect(actualProjectTitle).toBe(expectedProjectTitle);
    expect(actualModificationId).toBe(expectedModificationId);
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
      if (Object.hasOwn(dataset, key)) {
        const labelVal = await commonItemsPage.getUiLabel(key, participatingOrganisationsPage);
        expect(labelVal).toBe(dataset[key]);
      }
    }
  }
);

Then(
  'I see the total number of results displayed in the participating organisation page',
  async ({ commonItemsPage }) => {
    const textDisplayNoOfRows = (await commonItemsPage.search_results_count.textContent()).trim();
    const displayedNoOfRows = textDisplayNoOfRows?.split(' ')[0];
    const expectedTotalPages = Math.ceil(Number(displayedNoOfRows) / 10);
    const itemsMap = await commonItemsPage.getPaginationValues();
    const itemsValues: any = itemsMap.get('items');
    const visiblePagesMap = await commonItemsPage.getVisiblePages(itemsValues);
    const visiblePages: number[] = visiblePagesMap.get('visiblePages');
    const actualtotalPages = visiblePages[visiblePages.length - 1];
    expect(expectedTotalPages).toBe(actualtotalPages);
    let expectedRowsLastPage = Number(displayedNoOfRows) % 10;
    if (Number(displayedNoOfRows) % 10 === 0) {
      expectedRowsLastPage = 10;
    }
    //click on the last page
    await commonItemsPage.clickOnPages(actualtotalPages, 'page number');
    const actualRows = (await commonItemsPage.tableRows.count()) - 1;
    expect(expectedRowsLastPage).toBe(actualRows);
  }
);

Then(
  'I confirm checkbox is displayed in participating organisation page',
  async ({ commonItemsPage, participatingOrganisationsPage }) => {
    await commonItemsPage.firstPage.click();
    const maxPagesToValidate = commonItemsPage.commonTestData.maxPagesToValidate;
    for (let pageIndex = 1; pageIndex < maxPagesToValidate; pageIndex++) {
      const rowCount = await commonItemsPage.tableRows.count();
      for (let rowIndex = 1; rowIndex < rowCount; rowIndex++) {
        await participatingOrganisationsPage.modification_checkbox.nth(pageIndex).isVisible();
      }
      await commonItemsPage.next_button.click();
    }
  }
);

When(
  'I can see the results matching the search {string} in the participating organisation page',
  async ({ participatingOrganisationsPage, commonItemsPage }, searchDatasetName: string) => {
    await commonItemsPage.firstPage.click();
    const searchCriteriaDataset =
      participatingOrganisationsPage.participatingOrganisationsPageTestData.Search_Queries[searchDatasetName];
    await participatingOrganisationsPage.validateResults(commonItemsPage, searchCriteriaDataset, true);
  }
);

Then(
  'I validate the guidance content displayed on modifications participating organisations page',
  async ({ commonItemsPage, participatingOrganisationsPage }) => {
    const collapsibleDetailsComponent = commonItemsPage.details_component
      .getByText(
        participatingOrganisationsPage.participatingOrganisationsPageTestData.Participating_Organisations_Page
          .guidance_header_cant_find_organisation
      )
      .locator('..');
    await commonItemsPage.verifyDetailsExpanded('closed', commonItemsPage.details_component);
    await collapsibleDetailsComponent.click();
    await commonItemsPage.verifyDetailsExpanded('open', commonItemsPage.details_component);
    const cantFindOrganisationDetailsBody = (await commonItemsPage.details_component.textContent())
      .replaceAll(/\s+/g, ' ')
      .trim();
    expect(cantFindOrganisationDetailsBody).toContain(
      participatingOrganisationsPage.participatingOrganisationsPageTestData.Participating_Organisations_Page
        .guidance_body_cant_find_organisation
    );
    await collapsibleDetailsComponent.click();
    await commonItemsPage.verifyDetailsExpanded('closed', commonItemsPage.details_component);
    await collapsibleDetailsComponent.click();
  }
);
