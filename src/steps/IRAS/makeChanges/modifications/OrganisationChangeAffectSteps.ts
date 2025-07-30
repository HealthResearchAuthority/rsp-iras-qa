import { createBdd } from 'playwright-bdd';
import { expect, test } from '../../../../hooks/CustomFixtures';

const { Then } = createBdd(test);

Then(
  'I validate the ui labels for which organisation this change affect page in modifications',
  async ({ organisationChangeAffectPage, modificationsCommonPage }) => {
    const whichOrganisationAffectHintLabelExpected =
      organisationChangeAffectPage.organisationChangeAffectPageTestData.Label_Texts
        .which_organisation_change_affect_hint_label;
    expect(await organisationChangeAffectPage.which_organisation_affect_hint_label.textContent()).toBe(
      whichOrganisationAffectHintLabelExpected
    );
    await expect(
      organisationChangeAffectPage.page.getByText(
        modificationsCommonPage.modificationsCommonPagePageTestData.Label_Texts.remove_this_change_label
      )
    ).toBeVisible();
  }
);

Then(
  'I fill the which organisation this change affect modifications page with {string}',
  async ({ commonItemsPage, organisationChangeAffectPage }, datasetName: string) => {
    const dataset = organisationChangeAffectPage.organisationChangeAffectPageTestData[datasetName];
    for (const key in dataset) {
      if (Object.prototype.hasOwnProperty.call(dataset, key)) {
        await commonItemsPage.fillUIComponent(dataset, key, organisationChangeAffectPage);
      }
    }
  }
);
