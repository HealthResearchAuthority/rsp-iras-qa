import { createBdd } from 'playwright-bdd';
import { expect, test } from '../../../../../hooks/CustomFixtures';

const { Then } = createBdd(test);

Then(
  'I validate the ui labels for which organisation this change affect page in modifications',
  async ({ affectedOrganisationSelectionPage, modificationsCommonPage }) => {
    const whichOrganisationAffectHintLabelExpected =
      affectedOrganisationSelectionPage.affectedOrganisationSelectionPageTestData.Label_Texts
        .which_organisation_change_affect_hint_label;
    expect((await affectedOrganisationSelectionPage.which_organisation_affect_hint_label.textContent()).trim()).toBe(
      whichOrganisationAffectHintLabelExpected
    );
    await expect(
      affectedOrganisationSelectionPage.page.getByText(
        modificationsCommonPage.modificationsCommonPagePageTestData.Label_Texts.remove_this_change_label
      )
    ).toBeVisible();
  }
);

Then(
  'I fill the which organisation this change affect modifications page with {string}',
  async ({ commonItemsPage, affectedOrganisationSelectionPage }, datasetName: string) => {
    const dataset = affectedOrganisationSelectionPage.affectedOrganisationSelectionPageTestData[datasetName];
    for (const key of Object.keys(dataset)) {
      const locator = affectedOrganisationSelectionPage[key];
      await commonItemsPage.uncheckAllCheckboxes(locator);
      await commonItemsPage.fillUIComponent(dataset, key, affectedOrganisationSelectionPage);
    }
  }
);

Then(
  'I can see previously saved values for {string} displayed on the affected organisation selection page',
  async ({ commonItemsPage, affectedOrganisationSelectionPage }, datasetName: string) => {
    const dataset = affectedOrganisationSelectionPage.affectedOrganisationSelectionPageTestData[datasetName];
    for (const key in dataset) {
      if (Object.hasOwn(dataset, key)) {
        await commonItemsPage.validateUIComponentValues(dataset, key, affectedOrganisationSelectionPage);
      }
    }
  }
);
