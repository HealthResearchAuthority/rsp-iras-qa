import { createBdd } from 'playwright-bdd';
import { test } from '../../../../../hooks/CustomFixtures';

const { Then } = createBdd(test);

Then(
  'I can see the change planned end date affected organisation questions page',
  async ({ affectedOrganisationQuestionsPage }) => {
    await affectedOrganisationQuestionsPage.assertOnAffectedOrganisationQuestionsPage();
  }
);

Then(
  'I fill the affected organisation questions page with {string}',
  async ({ commonItemsPage, affectedOrganisationQuestionsPage }, datasetName: string) => {
    const dataset = affectedOrganisationQuestionsPage.affectedOrganisationQuestionsPageTestData[datasetName];
    for (const key of Object.keys(dataset)) {
      const locator = affectedOrganisationQuestionsPage[key];
      await commonItemsPage.uncheckAllCheckboxes(locator);
      await commonItemsPage.fillUIComponent(dataset, key, affectedOrganisationQuestionsPage);
    }
  }
);

Then(
  'I validate the ui labels using {string} on affected organisation questions page',
  async ({ affectedOrganisationQuestionsPage, commonItemsPage }, datasetName) => {
    const dataset = affectedOrganisationQuestionsPage.affectedOrganisationQuestionsPageTestData[datasetName];
    for (const key in dataset) {
      if (Object.hasOwn(dataset, key)) {
        await commonItemsPage.validateUIComponentValues(dataset, key, affectedOrganisationQuestionsPage);
      }
    }
  }
);

Then(
  'I can see previously saved values for {string} displayed on the affected organisation questions page',
  async ({ commonItemsPage, affectedOrganisationQuestionsPage }, datasetName: string) => {
    const dataset = affectedOrganisationQuestionsPage.affectedOrganisationQuestionsPageTestData[datasetName];
    for (const key in dataset) {
      if (Object.hasOwn(dataset, key)) {
        await commonItemsPage.validateUIComponentValues(dataset, key, affectedOrganisationQuestionsPage);
      }
    }
  }
);
