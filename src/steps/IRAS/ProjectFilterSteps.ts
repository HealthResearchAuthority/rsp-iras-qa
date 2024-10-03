import { createBdd } from 'playwright-bdd';
import { test } from '../../hooks/CustomFixtures';

const { Then } = createBdd(test);

Then('I can see the project filter page', async ({ projectFilterPage }) => {
  await projectFilterPage.assertOnProjectFilterPage();
});

Then(
  'I fill the project details section in the project filter page using the {string} dataset',
  async ({ projectFilterPage, commonItemsPage }, dataset: string) => {
    if (
      Object.prototype.hasOwnProperty.call(projectFilterPage.projectFilterPageTestData[dataset], 'short_project_title')
    ) {
      const shortProjectTitle = projectFilterPage.projectFilterPageTestData[dataset].short_project_title;
      await projectFilterPage.shortProjectTitleTextBox.fill(shortProjectTitle);
    }
    if (
      Object.prototype.hasOwnProperty.call(projectFilterPage.projectFilterPageTestData[dataset], 'full_project_title')
    ) {
      const fullProjectTitle = projectFilterPage.projectFilterPageTestData[dataset].full_project_title;
      await projectFilterPage.fullProjectTitleTextBox.fill(fullProjectTitle);
    }
    if (
      Object.prototype.hasOwnProperty.call(
        projectFilterPage.projectFilterPageTestData[dataset],
        'is_project_managed_commercial_research'
      )
    ) {
      const isProjectManagedCommercialResearch =
        projectFilterPage.projectFilterPageTestData[dataset].is_project_managed_commercial_research;
      await commonItemsPage.selectRadio(
        isProjectManagedCommercialResearch,
        projectFilterPage.isProjectManagedCommercialResearchRadio
      );
    }
    if (Object.prototype.hasOwnProperty.call(projectFilterPage.projectFilterPageTestData[dataset], 'is_nihr_funding')) {
      const isNIHRFunding = projectFilterPage.projectFilterPageTestData[dataset].is_nihr_funding;
      await commonItemsPage.selectRadio(isNIHRFunding, projectFilterPage.seekingNIHRFundingRadio);
    }
    if (
      Object.prototype.hasOwnProperty.call(projectFilterPage.projectFilterPageTestData[dataset], 'access_cpms_Services')
    ) {
      const accessCPMSServices = projectFilterPage.projectFilterPageTestData[dataset].access_cpms_Services;
      await commonItemsPage.selectRadio(accessCPMSServices, projectFilterPage.accessCPMSServiceRadio);
    }
    if (
      Object.prototype.hasOwnProperty.call(
        projectFilterPage.projectFilterPageTestData[dataset],
        'email_initial_contact_cpms'
      )
    ) {
      const emailInitialContactCPMS = projectFilterPage.projectFilterPageTestData[dataset].email_initial_contact_cpms;
      await projectFilterPage.emailInitialContactCPMSTextBox.fill(emailInitialContactCPMS);
    }
  }
);

Then(
  'I fill the project scope section in the project filter page using the {string} dataset',
  async ({ projectFilterPage, commonItemsPage }, dataset: string) => {
    if (
      Object.prototype.hasOwnProperty.call(
        projectFilterPage.projectFilterPageTestData[dataset],
        'is_educational_project'
      )
    ) {
      const isEducationalProject = projectFilterPage.projectFilterPageTestData[dataset].is_educational_project;
      await commonItemsPage.selectRadio(isEducationalProject, projectFilterPage.isEducationalProjectRadio);
    }
    if (
      Object.prototype.hasOwnProperty.call(projectFilterPage.projectFilterPageTestData[dataset], 'activities_involved')
    ) {
      const activitiesInvolved = projectFilterPage.projectFilterPageTestData[dataset].activities_involved;
      await commonItemsPage.selectCheckboxes(activitiesInvolved, projectFilterPage.activitiesInvolvedCheckBox);
    }
    if (
      Object.prototype.hasOwnProperty.call(
        projectFilterPage.projectFilterPageTestData[dataset],
        'is_research_bioresource'
      )
    ) {
      const isResearchBioresource = projectFilterPage.projectFilterPageTestData[dataset].is_research_bioresource;
      await commonItemsPage.selectRadio(isResearchBioresource, projectFilterPage.isResearchBioresourceRadio);
    }
    if (
      Object.prototype.hasOwnProperty.call(
        projectFilterPage.projectFilterPageTestData[dataset],
        'bioresource_established_nhs_hsc'
      )
    ) {
      const bioresourceNHSOrHSC = projectFilterPage.projectFilterPageTestData[dataset].bioresource_established_nhs_hsc;
      await commonItemsPage.selectRadio(bioresourceNHSOrHSC, projectFilterPage.bioresourceNHSOrHSCRadio);
    }
    if (Object.prototype.hasOwnProperty.call(projectFilterPage.projectFilterPageTestData[dataset], 'is_ctimp')) {
      const isCTIMP = projectFilterPage.projectFilterPageTestData[dataset].is_ctimp;
      await commonItemsPage.selectRadio(isCTIMP, projectFilterPage.isCTIMPRadio);
    }
    if (
      Object.prototype.hasOwnProperty.call(
        projectFilterPage.projectFilterPageTestData[dataset],
        'options_applied_for_project'
      )
    ) {
      const optionsForProject = projectFilterPage.projectFilterPageTestData[dataset].options_applied_for_project;
      await commonItemsPage.selectRadio(optionsForProject, projectFilterPage.optionsForProjectRadio);
    }
    if (
      Object.prototype.hasOwnProperty.call(
        projectFilterPage.projectFilterPageTestData[dataset],
        'product_contain_genetically_modified_organism'
      )
    ) {
      const geneticallyModifiedOrganism =
        projectFilterPage.projectFilterPageTestData[dataset].product_contain_genetically_modified_organism;
      await commonItemsPage.selectRadio(
        geneticallyModifiedOrganism,
        projectFilterPage.geneticallyModifiedOrganismRadio
      );
    }
    if (
      Object.prototype.hasOwnProperty.call(
        projectFilterPage.projectFilterPageTestData[dataset],
        'is_clinical_or_medical_devices'
      )
    ) {
      const isClinicalOrMedicalDevices =
        projectFilterPage.projectFilterPageTestData[dataset].is_clinical_or_medical_devices;
      await commonItemsPage.selectRadio(isClinicalOrMedicalDevices, projectFilterPage.isClinicalOrMedicalDevicesRadio);
    }
    if (
      Object.prototype.hasOwnProperty.call(
        projectFilterPage.projectFilterPageTestData[dataset],
        'exposing_ionising_radiation'
      )
    ) {
      const exposingIonisingRadiation =
        projectFilterPage.projectFilterPageTestData[dataset].exposing_ionising_radiation;
      await commonItemsPage.selectRadio(exposingIonisingRadiation, projectFilterPage.exposingIonisingRadiationRadio);
    }
    if (
      Object.prototype.hasOwnProperty.call(
        projectFilterPage.projectFilterPageTestData[dataset],
        'using_human_biological_samples'
      )
    ) {
      const usingHumanSamples = projectFilterPage.projectFilterPageTestData[dataset].using_human_biological_samples;
      await commonItemsPage.selectRadio(usingHumanSamples, projectFilterPage.usingHumanSamplesRadio);
    }
    if (
      Object.prototype.hasOwnProperty.call(
        projectFilterPage.projectFilterPageTestData[dataset],
        'patient_data_accessed_outside'
      )
    ) {
      const patientDataAccessedOutside =
        projectFilterPage.projectFilterPageTestData[dataset].patient_data_accessed_outside;
      await commonItemsPage.selectRadio(patientDataAccessedOutside, projectFilterPage.patientDataAccessedOutsideRadio);
    }
    if (
      Object.prototype.hasOwnProperty.call(
        projectFilterPage.projectFilterPageTestData[dataset],
        'research_with_adults_lacking_capacity_to_consent'
      )
    ) {
      const adultsNotAbleToConsent =
        projectFilterPage.projectFilterPageTestData[dataset].research_with_adults_lacking_capacity_to_consent;
      await commonItemsPage.selectRadio(adultsNotAbleToConsent, projectFilterPage.adultsNotAbleToConsentRadio);
    }
    if (
      Object.prototype.hasOwnProperty.call(projectFilterPage.projectFilterPageTestData[dataset], 'include_children')
    ) {
      const includeChildren = projectFilterPage.projectFilterPageTestData[dataset].include_children;
      await commonItemsPage.selectRadio(includeChildren, projectFilterPage.includeChildrenRadio);
    }
    if (
      Object.prototype.hasOwnProperty.call(
        projectFilterPage.projectFilterPageTestData[dataset],
        'include_prisoners_offenders'
      )
    ) {
      const includePrisonersOffenders =
        projectFilterPage.projectFilterPageTestData[dataset].include_prisoners_offenders;
      await commonItemsPage.selectRadio(includePrisonersOffenders, projectFilterPage.includePrisonersOffendersRadio);
    }
    if (
      Object.prototype.hasOwnProperty.call(
        projectFilterPage.projectFilterPageTestData[dataset],
        'involve_ministry_of_defence'
      )
    ) {
      const involveMinistryOfDefence = projectFilterPage.projectFilterPageTestData[dataset].involve_ministry_of_defence;
      await commonItemsPage.selectRadio(involveMinistryOfDefence, projectFilterPage.involveMinistryOfDefenceRadio);
    }
    if (Object.prototype.hasOwnProperty.call(projectFilterPage.projectFilterPageTestData[dataset], 'involve_hfea')) {
      const involveHFEA = projectFilterPage.projectFilterPageTestData[dataset].involve_hfea;
      await commonItemsPage.selectRadio(involveHFEA, projectFilterPage.involveHFEARadio);
    }
  }
);

Then(
  'I fill the research location section in the project filter page using the {string} dataset',
  async ({ projectFilterPage, commonItemsPage }, dataset: string) => {
    if (Object.prototype.hasOwnProperty.call(projectFilterPage.projectFilterPageTestData[dataset], 'is_outside_uk')) {
      const isOutsideUK = projectFilterPage.projectFilterPageTestData[dataset].is_outside_uk;
      await commonItemsPage.selectRadio(isOutsideUK, projectFilterPage.isOutsideUKRadio);
    }
    if (
      Object.prototype.hasOwnProperty.call(
        projectFilterPage.projectFilterPageTestData[dataset],
        'places_in_uk_for_project'
      )
    ) {
      const placeInUKForProject = projectFilterPage.projectFilterPageTestData[dataset].places_in_uk_for_project;
      await commonItemsPage.selectCheckboxes(placeInUKForProject, projectFilterPage.placeInUKForProjectCheckBox);
    }
    if (
      Object.prototype.hasOwnProperty.call(
        projectFilterPage.projectFilterPageTestData[dataset],
        'where_human_sample_held'
      )
    ) {
      const whereHumanSamplesHeld = projectFilterPage.projectFilterPageTestData[dataset].where_human_sample_held;
      await commonItemsPage.selectCheckboxes(whereHumanSamplesHeld, projectFilterPage.whereHumanSamplesHeldCheckBox);
    }
    if (
      Object.prototype.hasOwnProperty.call(
        projectFilterPage.projectFilterPageTestData[dataset],
        'where_human_sample_obtained'
      )
    ) {
      const whereHumanSampleObtained = projectFilterPage.projectFilterPageTestData[dataset].where_human_sample_obtained;
      await commonItemsPage.selectCheckboxes(
        whereHumanSampleObtained,
        projectFilterPage.whereHumanSampleObtainedCheckBox
      );
    }
    if (
      Object.prototype.hasOwnProperty.call(
        projectFilterPage.projectFilterPageTestData[dataset],
        'where_project_take_place'
      )
    ) {
      const whereProjectTakePlace = projectFilterPage.projectFilterPageTestData[dataset].where_project_take_place;
      await commonItemsPage.selectCheckboxes(whereProjectTakePlace, projectFilterPage.whereProjectTakePlaceCheckBox);
    }
    if (
      Object.prototype.hasOwnProperty.call(
        projectFilterPage.projectFilterPageTestData[dataset],
        'details_other_organisation'
      )
    ) {
      const detailsOfOtherOrganisation =
        projectFilterPage.projectFilterPageTestData[dataset].details_other_organisation;
      await projectFilterPage.detailsOfOtherOrganisationTextBox.fill(detailsOfOtherOrganisation);
    }
    if (Object.prototype.hasOwnProperty.call(projectFilterPage.projectFilterPageTestData[dataset], 'use_pic')) {
      const usePICs = projectFilterPage.projectFilterPageTestData[dataset].use_pic;
      await commonItemsPage.selectRadio(usePICs, projectFilterPage.usePICsRadio);
    }
    // await new Promise(() => {});
  }
);
