import { createBdd } from 'playwright-bdd';
import { test, expect } from '../../../../../hooks/CustomFixtures';
import { confirmStringNotNull, convertDate } from '../../../../../utils/UtilFunctions';

const { Then } = createBdd(test);

Then('I can see the modification review changes page', async ({ modificationReviewChangesPage }) => {
  await modificationReviewChangesPage.assertOnModificationReviewChangesPage();
});

Then(
  'I validate the ui labels using {string} on modification review changes page',
  async ({ modificationReviewChangesPage, commonItemsPage }, datasetName) => {
    const dataset = modificationReviewChangesPage.modificationReviewChangesPageTestData[datasetName];
    for (const key in dataset) {
      if (Object.hasOwn(dataset, key)) {
        await commonItemsPage.validateUIComponentValues(dataset, key, modificationReviewChangesPage);
      }
    }
  }
);

Then(
  'I validate all field values on review modifications page using {string} , {string} and {string}',
  async (
    {
      modificationReviewChangesPage,
      plannedEndDateChangePage,
      affectedOrganisationSelectionPage,
      affectedOrganisationQuestionsPage,
    },
    datasetNamePlannedEndDate: string,
    datasetNameAffectedOrgSelection: string,
    datasetNameAffectedOrgQuestions: string
  ) => {
    const datasetPlannedEndDate = plannedEndDateChangePage.plannedEndDateChangePageTestData[datasetNamePlannedEndDate];
    const datasetAffectedOrgSelection =
      affectedOrganisationSelectionPage.affectedOrganisationSelectionPageTestData[datasetNameAffectedOrgSelection];
    const datasetAffectedOrgQuestions =
      affectedOrganisationQuestionsPage.affectedOrganisationQuestionsPageTestData[datasetNameAffectedOrgQuestions];
    const actualNewPlannedEndDate = confirmStringNotNull(
      await modificationReviewChangesPage.new_planned_project_end_date_text.textContent()
    );
    const expectedNewPlannedEndDate = await convertDate(
      datasetPlannedEndDate.planned_project_end_day_text,
      datasetPlannedEndDate.planned_project_end_month_dropdown,
      datasetPlannedEndDate.planned_project_end_year_text
    );
    expect(actualNewPlannedEndDate).toBe(expectedNewPlannedEndDate);
    const actualAffectedOrgType = confirmStringNotNull(
      await modificationReviewChangesPage.affected_organisation_types_text.textContent()
    );
    expect(actualAffectedOrgType).toBe(
      datasetAffectedOrgSelection.which_organisation_change_affect_checkbox.toString().replaceAll(',', '')
    );
    if (datasetNameAffectedOrgSelection !== 'Non_NHS_HSC_Only') {
      await validateNhsFields();
    } else {
      await validateNonNhsFields();
    }
    async function validateNhsFields() {
      const actualNhsAffectedLocations = confirmStringNotNull(
        await modificationReviewChangesPage.affected_nhs_hsc_locations_text.textContent()
      );
      const expectedNhsAffectedLocations =
        datasetAffectedOrgQuestions.where_organisation_change_affect_nhs_question_checkbox
          .toString()
          .replaceAll(',', '');
      expect.soft(actualNhsAffectedLocations).toBe(expectedNhsAffectedLocations);
      const actualPortionOfAffected = confirmStringNotNull(
        await modificationReviewChangesPage.portion_of_nhs_hsc_organisations_affected_text.textContent()
      );
      expect
        .soft(actualPortionOfAffected)
        .toBe(datasetAffectedOrgQuestions.will_some_or_all_organisations_be_affected_question_radio);
      const actualAdditionalResourcesImplications = confirmStringNotNull(
        await modificationReviewChangesPage.additional_resource_implications_text.textContent()
      );
      expect
        .soft(actualAdditionalResourcesImplications)
        .toBe(datasetAffectedOrgQuestions.will_nhs_hsc_organisations_require_additional_resources_question_radio);
    }
    async function validateNonNhsFields() {
      const actualNonNhsAffectedLocations = confirmStringNotNull(
        await modificationReviewChangesPage.affected_non_nhs_hsc_locations_text.textContent()
      );
      expect
        .soft(actualNonNhsAffectedLocations)
        .toBe(
          datasetAffectedOrgQuestions.where_organisation_change_affect_non_nhs_question_checkbox
            .toString()
            .replaceAll(',', '')
        );
    }
  }
);

Then(
  'I click the change link {string} on modification review changes page',
  async ({ modificationReviewChangesPage }, changeLink: string) => {
    await modificationReviewChangesPage.clickChangeLinks(changeLink);
  }
);
