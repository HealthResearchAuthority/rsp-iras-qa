import { createBdd } from 'playwright-bdd';
import { expect, test } from '../../hooks/CustomFixtures';

const { Then } = createBdd(test);

Then(
  'I fill the project details section in the project filter page with {string}',
  async ({ projectFilterPage, commonItemsPage }, datasetName: string) => {
    const dataset = projectFilterPage.projectFilterPageTestData.Project_Details[datasetName];
    for (const key in dataset) {
      if (Object.prototype.hasOwnProperty.call(dataset, key)) {
        await commonItemsPage.fillUIComponent(dataset, key, projectFilterPage);
      }
    }
  }
);

Then(
  'I fill the project scope section in the project filter page with {string}',
  async ({ projectFilterPage, commonItemsPage }, datasetName: string) => {
    const dataset = projectFilterPage.projectFilterPageTestData.Project_Scope[datasetName];
    for (const key in dataset) {
      if (Object.prototype.hasOwnProperty.call(dataset, key)) {
        await commonItemsPage.fillUIComponent(dataset, key, projectFilterPage);
      }
    }
  }
);

Then(
  'I fill the research location section in the project filter page with {string}',
  async ({ projectFilterPage, commonItemsPage }, datasetName: string) => {
    const dataset = projectFilterPage.projectFilterPageTestData.Research_Location[datasetName];
    for (const key in dataset) {
      if (Object.prototype.hasOwnProperty.call(dataset, key)) {
        await commonItemsPage.fillUIComponent(dataset, key, projectFilterPage);
      }
    }
  }
);

Then(
  'I see the expected validation errors appearing for {string} on the project filter page',
  async ({ commonItemsPage, projectFilterPage }, datasetName: string) => {
    const expectedAlertBoxErrors = projectFilterPage.projectFilterPageTestData.Validation.Alert_Box_Errors[datasetName];
    const expectedFieldErrors = projectFilterPage.projectFilterPageTestData.Validation.Field_Errors[datasetName];
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
        const actualFieldError = await commonItemsPage.getFieldErrors(key, projectFilterPage);
        await expect(actualFieldError).toHaveText(expectedFieldErrors[key]);
      }
    }
  }
);
