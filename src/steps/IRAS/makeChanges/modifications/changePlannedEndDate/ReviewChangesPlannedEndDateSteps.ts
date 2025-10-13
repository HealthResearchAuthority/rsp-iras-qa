import { createBdd } from 'playwright-bdd';
import { test, expect } from '../../../../../hooks/CustomFixtures';
import { confirmStringNotNull, convertDate } from '../../../../../utils/UtilFunctions';

const { Then } = createBdd(test);

Then('I can see the review changes planned end date page', async ({ reviewChangesPlannedEndDatePage }) => {
  await reviewChangesPlannedEndDatePage.assertOnReviewChangesPlannedEndDatePage();
});

Then(
  'I validate the ui labels using {string} on review changes planned end date page',
  async ({ reviewChangesPlannedEndDatePage, commonItemsPage }, datasetName) => {
    const dataset = reviewChangesPlannedEndDatePage.reviewChangesPlannedEndDatePageTestData[datasetName];
    for (const key in dataset) {
      if (Object.hasOwn(dataset, key)) {
        await commonItemsPage.validateUIComponentValues(dataset, key, reviewChangesPlannedEndDatePage);
      }
    }
  }
);

Then(
  'I validate all field values on review modifications page using {string} , {string} and {string}',
  async (
    {
      reviewChangesPlannedEndDatePage,
      plannedEndDateChangePage,
      affectedOrganisationSelectionPage,
      affectedOrganisationQuestionsPage,
    },
    datasetNamePlannedEndDate: string,
    datasetNameAffectedOrgSelection: string,
    datasetNameAffectedOrgQuestions
  ) => {
    const datasetPlannedEndDate = plannedEndDateChangePage.plannedEndDateChangePageTestData[datasetNamePlannedEndDate];
    const datasetAffectedOrgSelection =
      affectedOrganisationSelectionPage.affectedOrganisationSelectionPageTestData[datasetNameAffectedOrgSelection];
    const datasetAffectedOrgQuestions =
      affectedOrganisationQuestionsPage.affectedOrganisationQuestionsPageTestData[datasetNameAffectedOrgQuestions];
    const actualNewPlannedEndDate = confirmStringNotNull(
      await reviewChangesPlannedEndDatePage.new_planned_project_end_date_text.textContent()
    );
    const expectedNewPlannedEndDate = await convertDate(
      datasetPlannedEndDate.planned_project_end_day_text,
      datasetPlannedEndDate.planned_project_end_month_dropdown,
      datasetPlannedEndDate.planned_project_end_year_text
    );
    const actualAffectedOrgType = confirmStringNotNull(
      await reviewChangesPlannedEndDatePage.affected_organisation_types_text.textContent()
    );
    expect(actualNewPlannedEndDate).toBe(expectedNewPlannedEndDate);
    expect(actualAffectedOrgType).toBe(
      datasetAffectedOrgSelection.which_organisation_change_affect_checkbox.toString().replaceAll(',', '')
    );
    if (datasetNameAffectedOrgSelection !== 'Non_NHS_HSC_Only') {
      validateNhsFields();
    } else {
      validateNonNhsFields();
    }

    async function validateNhsFields() {
      const actualNhsAffectedLocations = confirmStringNotNull(
        await reviewChangesPlannedEndDatePage.affected_nhs_hsc_locations_text.textContent()
      );

      const actualPortionOfAffected = confirmStringNotNull(
        await reviewChangesPlannedEndDatePage.portion_of_nhs_hsc_organisations_affected_text.textContent()
      );

      const actualAdditionalResourcesImplications = confirmStringNotNull(
        await reviewChangesPlannedEndDatePage.additional_resource_implications_text.textContent()
      );
      const expectedNhsAffectedLocations =
        datasetAffectedOrgQuestions.where_organisation_change_affect_nhs_question_checkbox
          .toString()
          .replaceAll(',', '');
      expect(actualNhsAffectedLocations).toBe(expectedNhsAffectedLocations);
      expect(actualPortionOfAffected).toBe(
        datasetAffectedOrgQuestions.will_some_or_all_organisations_be_affected_question_radio
      );
      expect(actualAdditionalResourcesImplications).toBe(
        datasetAffectedOrgQuestions.will_nhs_hsc_organisations_require_additional_resources_question_radio
      );
    }

    async function validateNonNhsFields() {
      const actualNonNhsAffectedLocations = confirmStringNotNull(
        await reviewChangesPlannedEndDatePage.affected_non_nhs_hsc_locations_text.textContent()
      );
      expect(actualNonNhsAffectedLocations).toBe(
        datasetAffectedOrgQuestions.where_organisation_change_affect_non_nhs_question_checkbox
          .toString()
          .replaceAll(',', '')
      );
    }
  }
);

Then(
  'I click the change link {string} on review changes planned end date page',
  async ({ reviewChangesPlannedEndDatePage }, changeLink: string) => {
    await reviewChangesPlannedEndDatePage.clickChangeLinks(changeLink);
  }
);
