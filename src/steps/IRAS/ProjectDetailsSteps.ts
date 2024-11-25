import { createBdd } from 'playwright-bdd';
import { test, expect } from '../../hooks/CustomFixtures';

const { Then } = createBdd(test);

Then(
  'I fill the project information section on the project details page with {string}',
  async ({ projectDetailsPage, commonItemsPage }, datasetName: string) => {
    const dataset = projectDetailsPage.projectDetailsPageTestData.Project_Information[datasetName];
    for (const key in dataset) {
      if (Object.prototype.hasOwnProperty.call(dataset, key)) {
        await commonItemsPage.fillUIComponent(dataset, key, projectDetailsPage);
      }
    }
  }
);

Then(
  'I fill the public involvement section on the project details page with {string}',
  async ({ projectDetailsPage, commonItemsPage }, datasetName: string) => {
    const dataset = projectDetailsPage.projectDetailsPageTestData.Public_Involvement[datasetName];
    for (const key in dataset) {
      if (Object.prototype.hasOwnProperty.call(dataset, key)) {
        await commonItemsPage.fillUIComponent(dataset, key, projectDetailsPage);
      }
    }
  }
);

Then(
  'I fill the research design and methodology section on the project details page with {string}',
  async ({ projectDetailsPage, commonItemsPage }, datasetName: string) => {
    const dataset = projectDetailsPage.projectDetailsPageTestData.Research_Design[datasetName];
    for (const key in dataset) {
      if (Object.prototype.hasOwnProperty.call(dataset, key)) {
        await commonItemsPage.fillUIComponent(dataset, key, projectDetailsPage);
      }
    }
  }
);

Then(
  'I fill the research activities section on the project details page with {string}',
  async ({ projectDetailsPage, commonItemsPage }, datasetName: string) => {
    const dataset = projectDetailsPage.projectDetailsPageTestData.Research_Activities[datasetName];
    for (const key in dataset) {
      if (Object.prototype.hasOwnProperty.call(dataset, key)) {
        await commonItemsPage.fillUIComponent(dataset, key, projectDetailsPage);
      }
    }
  }
);

Then(
  'I fill the participants section on the project details page with {string}',
  async ({ projectDetailsPage, commonItemsPage }, datasetName: string) => {
    const dataset = projectDetailsPage.projectDetailsPageTestData.Participants[datasetName];
    for (const key in dataset) {
      if (Object.prototype.hasOwnProperty.call(dataset, key)) {
        await commonItemsPage.fillUIComponent(dataset, key, projectDetailsPage);
      }
    }
  }
);

Then(
  'I fill the consent section on the project details page with {string}',
  async ({ projectDetailsPage, commonItemsPage }, datasetName: string) => {
    const dataset = projectDetailsPage.projectDetailsPageTestData.Consent[datasetName];
    for (const key in dataset) {
      if (Object.prototype.hasOwnProperty.call(dataset, key)) {
        await commonItemsPage.fillUIComponent(dataset, key, projectDetailsPage);
      }
    }
  }
);

Then(
  'I fill the risks and conflicts of interest section on the project details page with {string}',
  async ({ projectDetailsPage, commonItemsPage }, datasetName: string) => {
    const dataset = projectDetailsPage.projectDetailsPageTestData.Risks_Conflicts[datasetName];
    for (const key in dataset) {
      if (Object.prototype.hasOwnProperty.call(dataset, key)) {
        await commonItemsPage.fillUIComponent(dataset, key, projectDetailsPage);
      }
    }
  }
);

Then(
  'I fill the summary ethical issues section on the project details page with {string}',
  async ({ projectDetailsPage, commonItemsPage }, datasetName: string) => {
    const dataset = projectDetailsPage.projectDetailsPageTestData.Summary_Ethical_Issues[datasetName];
    for (const key in dataset) {
      if (Object.prototype.hasOwnProperty.call(dataset, key)) {
        await commonItemsPage.fillUIComponent(dataset, key, projectDetailsPage);
      }
    }
  }
);

Then(
  'I fill the research analysis section on the project details page with {string}',
  async ({ projectDetailsPage, commonItemsPage }, datasetName: string) => {
    const dataset = projectDetailsPage.projectDetailsPageTestData.Research_Analysis[datasetName];
    for (const key in dataset) {
      if (Object.prototype.hasOwnProperty.call(dataset, key)) {
        await commonItemsPage.fillUIComponent(dataset, key, projectDetailsPage);
      }
    }
  }
);

Then(
  'I fill the governance and management section on the project details page with {string}',
  async ({ projectDetailsPage, commonItemsPage }, datasetName: string) => {
    const dataset = projectDetailsPage.projectDetailsPageTestData.Governance_Management[datasetName];
    for (const key in dataset) {
      if (Object.prototype.hasOwnProperty.call(dataset, key)) {
        await commonItemsPage.fillUIComponent(dataset, key, projectDetailsPage);
      }
    }
  }
);

Then(
  'I fill the transparency section on the project details page with {string}',
  async ({ projectDetailsPage, commonItemsPage }, datasetName: string) => {
    const dataset = projectDetailsPage.projectDetailsPageTestData.Transparency[datasetName];
    for (const key in dataset) {
      if (Object.prototype.hasOwnProperty.call(dataset, key)) {
        await commonItemsPage.fillUIComponent(dataset, key, projectDetailsPage);
      }
    }
  }
);

Then(
  'I fill the confidentiality and information governance section on the project details page with {string}',
  async ({ projectDetailsPage, commonItemsPage }, datasetName: string) => {
    const dataset = projectDetailsPage.projectDetailsPageTestData.Confidentiality_Info_Management[datasetName];
    for (const key in dataset) {
      if (Object.prototype.hasOwnProperty.call(dataset, key)) {
        await commonItemsPage.fillUIComponent(dataset, key, projectDetailsPage);
      }
    }
  }
);

Then(
  'I see the expected validation errors appearing for {string} on the project details page',
  async ({ commonItemsPage, projectDetailsPage }, datasetName: string) => {
    const expectedAlertBoxErrors =
      projectDetailsPage.projectDetailsPageTestData.Validation.Alert_Box_Errors[datasetName];
    const expectedFieldErrors = projectDetailsPage.projectDetailsPageTestData.Validation.Field_Errors[datasetName];
    const expectedNumberFieldErrors = Object.keys(expectedFieldErrors).length;
    await expect(commonItemsPage.alert_box).toBeVisible();
    await expect(commonItemsPage.alert_box_heading).toHaveText(
      commonItemsPage.questionSetData.Validation.alert_box_heading
    );

    const actualAlertBoxErrors = commonItemsPage.alert_box_list_items;
    const actualFieldErrorsArray = await commonItemsPage.govUkFieldValidationError.all();
    await expect(actualAlertBoxErrors).toHaveText(expectedAlertBoxErrors, { useInnerText: true });
    expect(actualFieldErrorsArray).toHaveLength(expectedNumberFieldErrors);
    for (const key in expectedFieldErrors) {
      if (Object.prototype.hasOwnProperty.call(expectedFieldErrors, key)) {
        const actualFieldError = await commonItemsPage.getFieldErrors(key, projectDetailsPage);
        await expect(actualFieldError).toHaveText(expectedFieldErrors[key]);
      }
    }
  }
);
