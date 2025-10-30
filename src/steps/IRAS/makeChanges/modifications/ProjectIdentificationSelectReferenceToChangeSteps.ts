import { createBdd } from 'playwright-bdd';
import { expect, test } from '../../../../hooks/CustomFixtures';
import { confirmStringNotNull } from '../../../../utils/UtilFunctions';

const { Then } = createBdd(test);

Then(
  'I can see the project identification select reference modification page',
  async ({ projectIdentificationSelectReferenceToChangePage }) => {
    await projectIdentificationSelectReferenceToChangePage.assertOnProjectIdentificationSelectReferenceToChangePage();
  }
);

Then(
  'I can see the page heading is changed for {string} on participating organisation page',
  async ({ selectAreaOfChangePage, participatingOrganisationsPage }, datasetName) => {
    const dataset = selectAreaOfChangePage.selectAreaOfChangePageTestData.Select_Specific_Change[datasetName];
    const expectedPageHeading = dataset['specific_change_dropdown'];
    const actualPageHeading = confirmStringNotNull(await participatingOrganisationsPage.pageHeading.textContent());
    expect(actualPageHeading).toBe(expectedPageHeading);
  }
);

Then(
  'I fill the project identification select reference modification page using {string} dataset',
  async (
    {
      commonItemsPage,
      projectIdentificationSelectReferenceToChangePage,
      projectIdentificationEnterReferenceNumbersPage,
    },
    datasetName: string
  ) => {
    const dataset =
      projectIdentificationEnterReferenceNumbersPage.projectIdentificationEnterReferenceNumbersPageTestData[
        datasetName
      ];
    for (const key in dataset) {
      if (Object.hasOwn(dataset, key)) {
        if (key === 'which_reference_do_you_need_to_change_checkboxes') {
          await commonItemsPage.fillUIComponent(dataset, key, projectIdentificationSelectReferenceToChangePage);
        }
      }
    }
  }
);
