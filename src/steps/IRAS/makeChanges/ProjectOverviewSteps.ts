import { createBdd } from 'playwright-bdd';
import { expect, test } from '../../../hooks/CustomFixtures';
import { confirmStringNotNull, removeUnwantedWhitespace } from '../../../utils/UtilFunctions';

const { Then } = createBdd(test);

Then('I can see the project overview page', async ({ projectOverviewPage }) => {
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
    expect(actualshortProjectTitle).toBe(expectedProjectTitle);
    expect(actualIrasId).toBe(expectedIrasId);
  }
);

Then(
  'I can see the short project title on project overview page for {string}',
  async ({ projectDetailsTitlePage, projectOverviewPage }, datasetName: string) => {
    const dataset = projectDetailsTitlePage.projectDetailsTitlePageTestData[datasetName];
    const expectedProjectTitle = dataset.short_project_title_text;
    const actualProjectTitle = confirmStringNotNull(await projectOverviewPage.project_short_title_label.textContent());
    const actualProjectTitleUpdated = actualProjectTitle.slice(21);
    expect(actualProjectTitleUpdated).toBe(expectedProjectTitle);
  }
);

Then(
  'I can see the modification progress saved successful message on project overview page',
  async ({ projectOverviewPage, commonItemsPage }) => {
    await expect(projectOverviewPage.modification_saved_success_message_header_text).toBeVisible();
    await expect(projectOverviewPage.modification_saved_success_message_text).toBeVisible();
    expect(
      await projectOverviewPage.information_alert_banner.evaluate((e: any) =>
        getComputedStyle(e).getPropertyValue('border-color')
      )
    ).toBe(commonItemsPage.commonTestData.rgb_green_color);
    expect(
      await projectOverviewPage.information_alert_banner.evaluate((e: any) =>
        getComputedStyle(e).getPropertyValue('background-color')
      )
    ).toBe(commonItemsPage.commonTestData.rgb_green_color);
  }
);

Then(
  'I can see the {string} ui labels on the project overview page',
  async ({ commonItemsPage, projectOverviewPage }, datasetName: string) => {
    const dataset = projectOverviewPage.projectOverviewPageTestData[datasetName];
    for (const key in dataset) {
      if (Object.hasOwn(dataset, key)) {
        const labelVal = await commonItemsPage.getUiLabel(key, projectOverviewPage);
        expect(labelVal).toBe(dataset[key]);
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
    expect(actualProjectTitle).toBe(expectedProjectTitle);
    expect(actualIrasId).toBe(expectedIrasId);
  }
);

Then(
  'I can see the {string} in the key project roles tab of project overview page',
  async ({ projectOverviewPage, keyProjectRolesPage }, datasetName: string) => {
    await expect(projectOverviewPage.key_project_roles_heading).toBeVisible();
    const dataset = keyProjectRolesPage.keyProjectRolesPageTestData[datasetName];
    const expectedChiefInvestigator = dataset.chief_investigator_email_text;
    const expectedPrimarySponsorOrganisation = dataset.primary_sponsor_organisation_text;
    const expectedSponsorContact = dataset.sponsor_contact_email_text;
    const actualChiefInvestigator = confirmStringNotNull(await projectOverviewPage.chief_investigator.textContent());
    const actualPrimarySponsorOrganisation = confirmStringNotNull(
      await projectOverviewPage.primary_sponsor_organisation.textContent()
    );
    const actualSponsorContact = confirmStringNotNull(await projectOverviewPage.sponsor_contact.textContent());
    expect(actualChiefInvestigator).toBe(expectedChiefInvestigator);
    expect(actualPrimarySponsorOrganisation).toBe(expectedPrimarySponsorOrganisation);
    expect(actualSponsorContact).toBe(expectedSponsorContact);
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
    expect(actualTrimmedParticipatingNations).toContain(expectedParticipatingNations);
    expect(actualNhsHscOrganisations).toBe(expectedNhsHscOrganisations);
    expect(actualLeadNation).toBe(expectedLeadNation);
  }
);
