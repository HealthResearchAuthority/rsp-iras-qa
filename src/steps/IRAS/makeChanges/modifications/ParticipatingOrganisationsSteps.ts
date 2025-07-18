import { createBdd } from 'playwright-bdd';
import { expect, test } from '../../../../hooks/CustomFixtures';
import { confirmStringNotNull, removeUnwantedWhitespace } from '../../../../utils/UtilFunctions';

const { Then } = createBdd(test);

Then('I can see the participating organisation page', async ({ participatingOrganisationsPage }) => {
  await participatingOrganisationsPage.assertOnParticipatingOrganisationsPage();
});

Then(
  'I can see the page heading is changed for {string} on participating organisation page',
  async ({ selectAreaOfChangePage, participatingOrganisationsPage }, datasetName) => {
    const dataset = selectAreaOfChangePage.selectAreaOfChangePageTestData[datasetName];
    const expectedPageHeading = dataset.specific_change_dropdown;
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
    //The below code will be uncommented when defect RSP-4268 is fixed
    //expect(participatingOrganisationsPage.advanced_filter_link).toBeVisible();
    expect(participatingOrganisationsPage.participating_organisations_text).toBeVisible();
    expect(participatingOrganisationsPage.participating_organisations_search_button).toBeVisible();
  }
);

Then(
  'I can validate the error message {string} when user has not changed the participating organisations',
  async ({ participatingOrganisationsPage }, datasetName: string) => {
    //This code will be updated to use common error validation function when we have both field and summary error
    const errorDataset = participatingOrganisationsPage.participatingOrganisationsPageTestData[datasetName];
    const expectedSummaryHeader = participatingOrganisationsPage.commonTestData.error_message_summary_header;
    const actualSummaryHeader = confirmStringNotNull(
      await participatingOrganisationsPage.error_message_summary_header.textContent()
    );
    expect(actualSummaryHeader).toBe(expectedSummaryHeader);
    const expectedSummaryErrorParticipationOrganisation = errorDataset.participating_organisations_text;
    const actualSummaryErrorParticipationOrganisation = removeUnwantedWhitespace(
      confirmStringNotNull(
        await participatingOrganisationsPage.summary_error_participating_Organisations_text.textContent()
      )
    );
    expect(actualSummaryErrorParticipationOrganisation).toBe(expectedSummaryErrorParticipationOrganisation);
  }
);

//This step should be updated when field error implemented
Then(
  'I validate mandatory field summary error message is displayed on participating organisations page',
  async ({ participatingOrganisationsPage }) => {
    expect(participatingOrganisationsPage.error_message_summary_header).toBeVisible();
    expect(participatingOrganisationsPage.summary_error_participating_Organisations_text).toBeVisible();
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
