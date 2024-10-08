import { createBdd } from 'playwright-bdd';
import { test } from '../../hooks/CustomFixtures';

const { Then } = createBdd(test);

Then('I can see the project filter page', async ({ projectFilterPage }) => {
  await projectFilterPage.assertOnProjectFilterPage();
});

Then(
  'I fill the project details section in the project filter page with {string}',
  async ({ projectFilterPage, commonItemsPage }, dataset: string) => {
    if (
      Object.prototype.hasOwnProperty.call(
        projectFilterPage.projectFilterPageTestData.Project_Details[dataset],
        'short_project_title'
      )
    ) {
      const shortProjectTitle =
        projectFilterPage.projectFilterPageTestData.Project_Details[dataset].short_project_title;
      await projectFilterPage.shortProjectTitleTextBox.fill(shortProjectTitle);
    }
    if (
      Object.prototype.hasOwnProperty.call(
        projectFilterPage.projectFilterPageTestData.Project_Details[dataset],
        'full_project_title'
      )
    ) {
      const fullProjectTitle = projectFilterPage.projectFilterPageTestData.Project_Details[dataset].full_project_title;
      await projectFilterPage.fullProjectTitleTextBox.fill(fullProjectTitle);
    }
    if (
      Object.prototype.hasOwnProperty.call(
        projectFilterPage.projectFilterPageTestData.Project_Details[dataset],
        'is_project_managed_commercial_research'
      )
    ) {
      const isProjectManagedCommercialResearch =
        projectFilterPage.projectFilterPageTestData.Project_Details[dataset].is_project_managed_commercial_research;
      await commonItemsPage.selectRadioOld(
        isProjectManagedCommercialResearch,
        projectFilterPage.isProjectManagedCommercialResearchRadio
      );
    }
    if (
      Object.prototype.hasOwnProperty.call(
        projectFilterPage.projectFilterPageTestData.Project_Details[dataset],
        'is_nihr_funding'
      )
    ) {
      const isNIHRFunding = projectFilterPage.projectFilterPageTestData.Project_Details[dataset].is_nihr_funding;
      await commonItemsPage.selectRadioOld(isNIHRFunding, projectFilterPage.seekingNIHRFundingRadio);
    }
    if (
      Object.prototype.hasOwnProperty.call(
        projectFilterPage.projectFilterPageTestData.Project_Details[dataset],
        'access_cpms_Services'
      )
    ) {
      const accessCPMSServices =
        projectFilterPage.projectFilterPageTestData.Project_Details[dataset].access_cpms_Services;
      await commonItemsPage.selectRadioOld(accessCPMSServices, projectFilterPage.accessCPMSServiceRadio);
    }
    if (
      Object.prototype.hasOwnProperty.call(
        projectFilterPage.projectFilterPageTestData.Project_Details[dataset],
        'email_initial_contact_cpms'
      )
    ) {
      const emailInitialContactCPMS =
        projectFilterPage.projectFilterPageTestData.Project_Details[dataset].email_initial_contact_cpms;
      await projectFilterPage.emailInitialContactCPMSTextBox.fill(emailInitialContactCPMS);
    }
  }
);

Then(
  'I fill the project scope section in the project filter page with {string}',
  async ({ projectFilterPage, commonItemsPage }, dataset: string) => {
    if (
      Object.prototype.hasOwnProperty.call(
        projectFilterPage.projectFilterPageTestData.Project_Scope[dataset],
        'is_educational_project'
      )
    ) {
      const isEducationalProject =
        projectFilterPage.projectFilterPageTestData.Project_Scope[dataset].is_educational_project;
      await commonItemsPage.selectRadioOld(isEducationalProject, projectFilterPage.isEducationalProjectRadio);
    }
    if (
      Object.prototype.hasOwnProperty.call(
        projectFilterPage.projectFilterPageTestData.Project_Scope[dataset],
        'activities_involved'
      )
    ) {
      const activitiesInvolved = projectFilterPage.projectFilterPageTestData.Project_Scope[dataset].activities_involved;
      await commonItemsPage.selectCheckboxesOld(activitiesInvolved, projectFilterPage.activitiesInvolvedCheckBox);
    }
    if (
      Object.prototype.hasOwnProperty.call(
        projectFilterPage.projectFilterPageTestData.Project_Scope[dataset],
        'is_research_bioresource'
      )
    ) {
      const isResearchBioresource =
        projectFilterPage.projectFilterPageTestData.Project_Scope[dataset].is_research_bioresource;
      await commonItemsPage.selectRadioOld(isResearchBioresource, projectFilterPage.isResearchBioresourceRadio);
    }
    if (
      Object.prototype.hasOwnProperty.call(
        projectFilterPage.projectFilterPageTestData.Project_Scope[dataset],
        'bioresource_established_nhs_hsc'
      )
    ) {
      const bioresourceNHSOrHSC =
        projectFilterPage.projectFilterPageTestData.Project_Scope[dataset].bioresource_established_nhs_hsc;
      await commonItemsPage.selectRadioOld(bioresourceNHSOrHSC, projectFilterPage.bioresourceNHSOrHSCRadio);
    }
    if (
      Object.prototype.hasOwnProperty.call(
        projectFilterPage.projectFilterPageTestData.Project_Scope[dataset],
        'is_ctimp'
      )
    ) {
      const isCTIMP = projectFilterPage.projectFilterPageTestData.Project_Scope[dataset].is_ctimp;
      await commonItemsPage.selectRadioOld(isCTIMP, projectFilterPage.isCTIMPRadio);
    }
    if (
      Object.prototype.hasOwnProperty.call(
        projectFilterPage.projectFilterPageTestData.Project_Scope[dataset],
        'options_applied_for_project'
      )
    ) {
      const optionsForProject =
        projectFilterPage.projectFilterPageTestData.Project_Scope[dataset].options_applied_for_project;
      await commonItemsPage.selectRadioOld(optionsForProject, projectFilterPage.optionsForProjectRadio);
    }
    if (
      Object.prototype.hasOwnProperty.call(
        projectFilterPage.projectFilterPageTestData.Project_Scope[dataset],
        'product_contain_genetically_modified_organism'
      )
    ) {
      const geneticallyModifiedOrganism =
        projectFilterPage.projectFilterPageTestData.Project_Scope[dataset]
          .product_contain_genetically_modified_organism;
      await commonItemsPage.selectRadioOld(
        geneticallyModifiedOrganism,
        projectFilterPage.geneticallyModifiedOrganismRadio
      );
    }
    if (
      Object.prototype.hasOwnProperty.call(
        projectFilterPage.projectFilterPageTestData.Project_Scope[dataset],
        'is_clinical_or_medical_devices'
      )
    ) {
      const isClinicalOrMedicalDevices =
        projectFilterPage.projectFilterPageTestData.Project_Scope[dataset].is_clinical_or_medical_devices;
      await commonItemsPage.selectRadioOld(
        isClinicalOrMedicalDevices,
        projectFilterPage.isClinicalOrMedicalDevicesRadio
      );
    }
    if (
      Object.prototype.hasOwnProperty.call(
        projectFilterPage.projectFilterPageTestData.Project_Scope[dataset],
        'exposing_ionising_radiation'
      )
    ) {
      const exposingIonisingRadiation =
        projectFilterPage.projectFilterPageTestData.Project_Scope[dataset].exposing_ionising_radiation;
      await commonItemsPage.selectRadioOld(exposingIonisingRadiation, projectFilterPage.exposingIonisingRadiationRadio);
    }
    if (
      Object.prototype.hasOwnProperty.call(
        projectFilterPage.projectFilterPageTestData.Project_Scope[dataset],
        'using_human_biological_samples'
      )
    ) {
      const usingHumanSamples =
        projectFilterPage.projectFilterPageTestData.Project_Scope[dataset].using_human_biological_samples;
      await commonItemsPage.selectRadioOld(usingHumanSamples, projectFilterPage.usingHumanSamplesRadio);
    }
    if (
      Object.prototype.hasOwnProperty.call(
        projectFilterPage.projectFilterPageTestData.Project_Scope[dataset],
        'patient_data_accessed_outside'
      )
    ) {
      const patientDataAccessedOutside =
        projectFilterPage.projectFilterPageTestData.Project_Scope[dataset].patient_data_accessed_outside;
      await commonItemsPage.selectRadioOld(
        patientDataAccessedOutside,
        projectFilterPage.patientDataAccessedOutsideRadio
      );
    }
    if (
      Object.prototype.hasOwnProperty.call(
        projectFilterPage.projectFilterPageTestData.Project_Scope[dataset],
        'research_with_adults_lacking_capacity_to_consent'
      )
    ) {
      const adultsNotAbleToConsent =
        projectFilterPage.projectFilterPageTestData.Project_Scope[dataset]
          .research_with_adults_lacking_capacity_to_consent;
      await commonItemsPage.selectRadioOld(adultsNotAbleToConsent, projectFilterPage.adultsNotAbleToConsentRadio);
    }
    if (
      Object.prototype.hasOwnProperty.call(
        projectFilterPage.projectFilterPageTestData.Project_Scope[dataset],
        'include_children'
      )
    ) {
      const includeChildren = projectFilterPage.projectFilterPageTestData.Project_Scope[dataset].include_children;
      await commonItemsPage.selectRadioOld(includeChildren, projectFilterPage.includeChildrenRadio);
    }
    if (
      Object.prototype.hasOwnProperty.call(
        projectFilterPage.projectFilterPageTestData.Project_Scope[dataset],
        'include_prisoners_offenders'
      )
    ) {
      const includePrisonersOffenders =
        projectFilterPage.projectFilterPageTestData.Project_Scope[dataset].include_prisoners_offenders;
      await commonItemsPage.selectRadioOld(includePrisonersOffenders, projectFilterPage.includePrisonersOffendersRadio);
    }
    if (
      Object.prototype.hasOwnProperty.call(
        projectFilterPage.projectFilterPageTestData.Project_Scope[dataset],
        'involve_ministry_of_defence'
      )
    ) {
      const involveMinistryOfDefence =
        projectFilterPage.projectFilterPageTestData.Project_Scope[dataset].involve_ministry_of_defence;
      await commonItemsPage.selectRadioOld(involveMinistryOfDefence, projectFilterPage.involveMinistryOfDefenceRadio);
    }
    if (
      Object.prototype.hasOwnProperty.call(
        projectFilterPage.projectFilterPageTestData.Project_Scope[dataset],
        'involve_hfea'
      )
    ) {
      const involveHFEA = projectFilterPage.projectFilterPageTestData.Project_Scope[dataset].involve_hfea;
      await commonItemsPage.selectRadioOld(involveHFEA, projectFilterPage.involveHFEARadio);
    }
  }
);

Then(
  'I fill the research location section in the project filter page with {string}',
  async ({ projectFilterPage, commonItemsPage }, dataset: string) => {
    if (
      Object.prototype.hasOwnProperty.call(
        projectFilterPage.projectFilterPageTestData.Research_Location[dataset],
        'is_outside_uk'
      )
    ) {
      const isOutsideUK = projectFilterPage.projectFilterPageTestData.Research_Location[dataset].is_outside_uk;
      await commonItemsPage.selectRadioOld(isOutsideUK, projectFilterPage.isOutsideUKRadio);
    }
    if (
      Object.prototype.hasOwnProperty.call(
        projectFilterPage.projectFilterPageTestData.Research_Location[dataset],
        'places_in_uk_for_project'
      )
    ) {
      const placeInUKForProject =
        projectFilterPage.projectFilterPageTestData.Research_Location[dataset].places_in_uk_for_project;
      await commonItemsPage.selectCheckboxesOld(placeInUKForProject, projectFilterPage.placeInUKForProjectCheckBox);
    }
    if (
      Object.prototype.hasOwnProperty.call(
        projectFilterPage.projectFilterPageTestData.Research_Location[dataset],
        'where_human_sample_held'
      )
    ) {
      const whereHumanSamplesHeld =
        projectFilterPage.projectFilterPageTestData.Research_Location[dataset].where_human_sample_held;
      await commonItemsPage.selectCheckboxesOld(whereHumanSamplesHeld, projectFilterPage.whereHumanSamplesHeldCheckBox);
    }
    if (
      Object.prototype.hasOwnProperty.call(
        projectFilterPage.projectFilterPageTestData.Research_Location[dataset],
        'where_human_sample_obtained'
      )
    ) {
      const whereHumanSampleObtained =
        projectFilterPage.projectFilterPageTestData.Research_Location[dataset].where_human_sample_obtained;
      await commonItemsPage.selectCheckboxesOld(
        whereHumanSampleObtained,
        projectFilterPage.whereHumanSampleObtainedCheckBox
      );
    }
    if (
      Object.prototype.hasOwnProperty.call(
        projectFilterPage.projectFilterPageTestData.Research_Location[dataset],
        'where_project_take_place'
      )
    ) {
      const whereProjectTakePlace =
        projectFilterPage.projectFilterPageTestData.Research_Location[dataset].where_project_take_place;
      await commonItemsPage.selectCheckboxesOld(whereProjectTakePlace, projectFilterPage.whereProjectTakePlaceCheckBox);
    }
    if (
      Object.prototype.hasOwnProperty.call(
        projectFilterPage.projectFilterPageTestData.Research_Location[dataset],
        'details_other_organisation'
      )
    ) {
      const detailsOfOtherOrganisation =
        projectFilterPage.projectFilterPageTestData.Research_Location[dataset].details_other_organisation;
      await projectFilterPage.detailsOfOtherOrganisationTextBox.fill(detailsOfOtherOrganisation);
    }
    if (
      Object.prototype.hasOwnProperty.call(
        projectFilterPage.projectFilterPageTestData.Research_Location[dataset],
        'use_pic'
      )
    ) {
      const usePICs = projectFilterPage.projectFilterPageTestData.Research_Location[dataset].use_pic;
      await commonItemsPage.selectRadioOld(usePICs, projectFilterPage.usePICsRadio);
    }
  }
);
