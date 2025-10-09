import { createBdd } from 'playwright-bdd';
import { expect, test } from '../../../hooks/CustomFixtures';
import { confirmStringNotNull, removeUnwantedWhitespace } from '../../../utils/UtilFunctions';

const { Then } = createBdd(test);

Then('I can see the project overview page', async ({ projectOverviewPage }) => {
  await projectOverviewPage.assertOnProjectOverviewPage();
});

Then('I navigate to the project overview page of a specific project', async ({ projectOverviewPage }) => {
  await projectOverviewPage.gotoSpecificProjectPage();
  await projectOverviewPage.assertOnProjectOverviewPage();
});

Then(
  'I can see the project details on project overview page for {string}',
  async ({ projectDetailsIRASPage, projectDetailsTitlePage, projectOverviewPage }, datasetName: string) => {
    const dataset = projectDetailsTitlePage.projectDetailsTitlePageTestData[datasetName];
    const expectedProjectTitle = dataset.short_project_title_text;
    const expectedIrasId = await projectDetailsIRASPage.getUniqueIrasId();
    const projectTitle = confirmStringNotNull(await projectOverviewPage.project_overview_heading.textContent());
    const projectDetails = projectTitle.split('\n');
    const irasId = projectDetails[0].split(' ');
    const actualIrasId = irasId[2];
    const shortProjectTitle = projectDetails[3].trim();
    const actualshortProjectTitle = shortProjectTitle.replace('Short project title: ', '');
    expect.soft(actualshortProjectTitle).toBe(expectedProjectTitle);
    expect.soft(actualIrasId).toBe(expectedIrasId);
  }
);

Then(
  'I can see the short project title on project overview page for {string}',
  async ({ projectDetailsTitlePage, projectOverviewPage }, datasetName: string) => {
    const dataset = projectDetailsTitlePage.projectDetailsTitlePageTestData[datasetName];
    const expectedProjectTitle = dataset.short_project_title_text;
    const actualProjectTitle = confirmStringNotNull(await projectOverviewPage.project_short_title_label.textContent());
    const actualProjectTitleUpdated = actualProjectTitle
      .replace(projectOverviewPage.projectOverviewPageTestData.Project_Overview_Page.short_project_title_label, '')
      .trim();
    expect.soft(actualProjectTitleUpdated).toBe(expectedProjectTitle);
  }
);

Then(
  'I can see the modification progress saved successful message on project overview page',
  async ({ projectOverviewPage, commonItemsPage }) => {
    await expect.soft(projectOverviewPage.modification_saved_success_message_header_text).toBeVisible();
    await expect.soft(projectOverviewPage.modification_saved_success_message_text).toBeVisible();
    expect
      .soft(
        await projectOverviewPage.information_alert_banner.evaluate((e: any) =>
          getComputedStyle(e).getPropertyValue('border-color')
        )
      )
      .toBe(commonItemsPage.commonTestData.rgb_green_color);
    expect
      .soft(
        await projectOverviewPage.information_alert_banner.evaluate((e: any) =>
          getComputedStyle(e).getPropertyValue('background-color')
        )
      )
      .toBe(commonItemsPage.commonTestData.rgb_green_color);
  }
);

Then(
  'I can see the {string} ui labels on the project overview page',
  async ({ commonItemsPage, projectOverviewPage }, datasetName: string) => {
    const dataset = projectOverviewPage.projectOverviewPageTestData[datasetName];
    for (const key in dataset) {
      if (Object.hasOwn(dataset, key)) {
        const labelVal = await commonItemsPage.getUiLabel(key, projectOverviewPage);
        expect.soft(labelVal).toBe(dataset[key]);
      }
    }
  }
);

Then(
  'I validate the ui labels using {string} on the project documents page',
  async ({ projectOverviewPage, commonItemsPage }, datasetName) => {
    const dataset = projectOverviewPage.projectOverviewPageTestData[datasetName];
    for (const key in dataset) {
      if (Object.hasOwn(dataset, key)) {
        await commonItemsPage.validateUIComponentValues(dataset, key, projectOverviewPage);
      }
    }
  }
);

Then(
  'I can see the status of modifications displayed is {string}',
  async ({ commonItemsPage, projectOverviewPage }, datasetName: string) => {
    //Limiting the checks to 2 pages
    const dataset = projectOverviewPage.projectOverviewPageTestData[datasetName];
    const expectedStatus = dataset.status;
    const maxPagesToCheck = projectOverviewPage.projectOverviewPageTestData.Project_Overview_Page.maxPagesToVisit;
    for (let pageIndex = 1; pageIndex <= maxPagesToCheck; pageIndex++) {
      const rowCount = await commonItemsPage.tableRows.count();
      for (let rowIndex = 1; rowIndex < rowCount; rowIndex++) {
        const row = commonItemsPage.tableRows.nth(rowIndex);
        const actualStatus = await projectOverviewPage.getStatus(row);
        expect.soft(actualStatus).toEqual(expectedStatus);
      }
      if (await commonItemsPage.next_button.isVisible()) {
        await commonItemsPage.next_button.click();
      } else {
        break;
      }
    }
  }
);

Then(
  'I validate the data displayed {string} in the project details tab of project overview page',
  async ({ projectDetailsIRASPage, projectDetailsTitlePage, projectOverviewPage }, datasetName: string) => {
    await expect(projectOverviewPage.project_details_heading).toBeVisible();
    const dataset = projectDetailsTitlePage.projectDetailsTitlePageTestData[datasetName];
    const expectedProjectTitle = dataset.short_project_title_text;
    const expectedIrasId = await projectDetailsIRASPage.getUniqueIrasId();
    const actualProjectTitle = confirmStringNotNull(
      await projectOverviewPage.project_details_short_project_title.textContent()
    );
    const actualIrasId = confirmStringNotNull(await projectOverviewPage.project_details_irasid.textContent());
    expect.soft(actualProjectTitle).toBe(expectedProjectTitle);
    expect.soft(actualIrasId).toBe(expectedIrasId);
  }
);

Then(
  'I can see the {string} in the key project roles tab of project overview page',
  async ({ projectOverviewPage, chiefInvestigatorPage }, datasetName: string) => {
    await expect(projectOverviewPage.key_project_roles_heading).toBeVisible();
    const dataset = chiefInvestigatorPage.chiefInvestigatorPageTestData[datasetName];
    const expectedChiefInvestigator = dataset.chief_investigator_email_text;
    const expectedPrimarySponsorOrganisation = dataset.primary_sponsor_organisation_text;
    const expectedSponsorContact = dataset.sponsor_contact_email_text;
    const actualChiefInvestigator = confirmStringNotNull(await projectOverviewPage.chief_investigator.textContent());
    const actualPrimarySponsorOrganisation = confirmStringNotNull(
      await projectOverviewPage.primary_sponsor_organisation.textContent()
    );
    const actualSponsorContact = confirmStringNotNull(await projectOverviewPage.sponsor_contact.textContent());
    expect.soft(actualChiefInvestigator).toBe(expectedChiefInvestigator);
    expect.soft(actualPrimarySponsorOrganisation).toBe(expectedPrimarySponsorOrganisation);
    expect.soft(actualSponsorContact).toBe(expectedSponsorContact);
  }
);

Then(
  'I can see the {string} in the research locations tab of project overview page',
  async ({ projectOverviewPage }, datasetName: string) => {
    await expect(projectOverviewPage.research_locations_heading).toBeVisible();
    const dataset = projectOverviewPage.projectOverviewPageTestData[datasetName];
    const expectedParticipatingNations = dataset.participating_nations;
    const expectedNhsHscOrganisations = dataset.nhs_hsc_organisations;
    const expectedLeadNation = dataset.lead_nation;
    const actualParticipatingNations = confirmStringNotNull(
      await projectOverviewPage.participating_nations.textContent()
    );
    const actualTrimmedParticipatingNations = await removeUnwantedWhitespace(
      confirmStringNotNull(actualParticipatingNations)
    );
    const actualNhsHscOrganisations = confirmStringNotNull(
      await projectOverviewPage.nhs_hsc_organisations.textContent()
    );
    const actualLeadNation = confirmStringNotNull(await projectOverviewPage.lead_nation.textContent());
    expect.soft(actualTrimmedParticipatingNations).toContain(expectedParticipatingNations);
    expect.soft(actualNhsHscOrganisations).toBe(expectedNhsHscOrganisations);
    expect.soft(actualLeadNation).toBe(expectedLeadNation);
  }
);

Then(
  'I can see the modifications is sorted by {string} order of the {string}',
  async ({ commonItemsPage }, sortOrder: string, sortColumn: string) => {
    let sortedColumnList: string[];
    let columnIndex: number;
    switch (sortColumn.toLowerCase()) {
      case 'modification id':
        columnIndex = 0;
        break;
      case 'modification type':
        columnIndex = 1;
        break;
      default:
        throw new Error(`${sortColumn} is not a valid option`);
    }
    const actualColumnList = await commonItemsPage.getActualListValues(commonItemsPage.tableBodyRows, columnIndex);
    if (sortColumn.toLowerCase() == 'modification id') {
      sortedColumnList = await commonItemsPage.sortModificationIdListValues(actualColumnList, sortOrder);
    } else if (sortOrder.toLowerCase() == 'ascending') {
      sortedColumnList = [...actualColumnList].sort((a, b) => a.localeCompare(b, 'en', { sensitivity: 'base' }));
    } else {
      sortedColumnList = [...actualColumnList].sort((a, b) => b.localeCompare(a, 'en', { sensitivity: 'base' }));
    }
    expect.soft(actualColumnList).toEqual(sortedColumnList);
  }
);

Then(
  'I can now see a table of search results for project documents page',
  async ({ projectOverviewPage, commonItemsPage }) => {
    await expect.soft(projectOverviewPage.results_count_project_documents).toBeVisible();
    expect.soft(await commonItemsPage.tableBodyRows.count()).toBeGreaterThan(0);
  }
);

Then('I click the {string} button on the project documents page', async ({ projectOverviewPage }, button: string) => {
  switch (button.trim().toLowerCase()) {
    case 'document_type':
      await projectOverviewPage.document_type_project_documents.click();
      break;
    case 'document_name':
      await projectOverviewPage.document_name_project_documents.click();
      break;
    case 'document_version':
      await projectOverviewPage.version_project_documents.click();
      break;
    case 'document_date':
      await projectOverviewPage.document_date_project_documents.click();
      break;
    case 'modification_id':
      await projectOverviewPage.modification_id_project_documents.click();
      break;
    default:
      throw new Error(`${button} is not a valid option`);
  }
});
