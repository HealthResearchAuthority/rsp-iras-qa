import { createBdd } from 'playwright-bdd';
import { test } from '../../hooks/CustomFixtures';

const { Then } = createBdd(test);

Then(
  'I fill the Project Information section on the Project Details page with {string}',
  async ({ projectDetailsPage, commonItemsPage }, datasetName: string) => {
    const dataset = projectDetailsPage.projectDetailsPageTestData.Project_Information[datasetName];
    for (const key in dataset) {
      await commonItemsPage.fillElementByAndId(
        projectDetailsPage.projectInformationTextInputField,
        dataset[key].id,
        dataset[key].value
      );
    }
  }
);

Then(
  'I fill the Public Involvement section on the Project Details page with {string}',
  async ({ projectDetailsPage, commonItemsPage }, datasetName: string) => {
    const dataset = projectDetailsPage.projectDetailsPageTestData.Public_Involvement[datasetName];
    for (const key in dataset) {
      if (Object.prototype.hasOwnProperty.call(dataset, key)) {
        if (dataset[key].type === 'text') {
          await commonItemsPage.fillElementByAndId(
            projectDetailsPage.publicInvolvementTextInputField,
            dataset[key].id,
            dataset[key].value
          );
        } else {
          await commonItemsPage.selectCheckboxes(
            projectDetailsPage.publicInvolvementFormGroupLabel,
            dataset[key].label,
            dataset[key].values
          );
        }
      }
    }
  }
);

Then(
  'I fill the Research Design and Methodology section on the Project Details page with {string}',
  async ({ projectDetailsPage, commonItemsPage }, datasetName: string) => {
    const dataset = projectDetailsPage.projectDetailsPageTestData.Research_Design[datasetName];
    for (const key in dataset) {
      if (Object.prototype.hasOwnProperty.call(dataset, key)) {
        if (dataset[key].type === 'text') {
          await commonItemsPage.fillElementByAndId(
            projectDetailsPage.researchDesignSectionTextInputField,
            dataset[key].id,
            dataset[key].value
          );
        } else if (dataset[key].type === 'checkbox') {
          await commonItemsPage.selectCheckboxes(
            projectDetailsPage.researchDesignSectionFormGroupLabel,
            dataset[key].label,
            dataset[key].values
          );
        } else {
          await commonItemsPage.selectRadio(
            projectDetailsPage.researchDesignSectionFormGroupLabel,
            dataset[key].label,
            dataset[key].id
          );
        }
      }
    }
  }
);

Then(
  'I fill the Research Activities section on the Project Details page with {string}',
  async ({ projectDetailsPage, commonItemsPage }, datasetName: string) => {
    const dataset = projectDetailsPage.projectDetailsPageTestData.Research_Activities[datasetName];
    for (const key in dataset) {
      if (Object.prototype.hasOwnProperty.call(dataset, key)) {
        if (dataset[key].type === 'text') {
          await commonItemsPage.fillElementByAndId(
            projectDetailsPage.researchActivitiesSectionTextInputField,
            dataset[key].id,
            dataset[key].value
          );
        } else if (dataset[key].type === 'date') {
          await commonItemsPage.fillElementById(
            projectDetailsPage.researchActivitiesSectionDateInputField,
            dataset[key].id,
            dataset[key].value
          );
        } else if (dataset[key].type === 'checkbox') {
          await commonItemsPage.selectCheckboxes(
            projectDetailsPage.researchActivitiesSectionFormGroupLabel,
            dataset[key].label,
            dataset[key].values
          );
        } else {
          await commonItemsPage.selectRadio(
            projectDetailsPage.researchActivitiesSectionFormGroupLabel,
            dataset[key].label,
            dataset[key].id
          );
        }
      }
    }
  }
);

Then(
  'I fill the Participants section on the Project Details page with {string}',
  async ({ projectDetailsPage, commonItemsPage }, datasetName: string) => {
    const dataset = projectDetailsPage.projectDetailsPageTestData.Participants[datasetName];
    for (const key in dataset) {
      if (Object.prototype.hasOwnProperty.call(dataset, key)) {
        if (dataset[key].type === 'text') {
          await commonItemsPage.fillElementByAndId(
            projectDetailsPage.participantsSectionTextInputField,
            dataset[key].id,
            dataset[key].value
          );
        } else if (dataset[key].type === 'date') {
          await commonItemsPage.fillElementById(
            projectDetailsPage.participantsSectionDateInputField,
            dataset[key].id,
            dataset[key].value
          );
        } else if (dataset[key].type === 'checkbox') {
          await commonItemsPage.selectCheckboxes(
            projectDetailsPage.participantsSectionFormGroupLabel,
            dataset[key].label,
            dataset[key].values
          );
        } else {
          await commonItemsPage.selectRadio(
            projectDetailsPage.participantsSectionFormGroupLabel,
            dataset[key].label,
            dataset[key].id
          );
        }
      }
    }
  }
);
