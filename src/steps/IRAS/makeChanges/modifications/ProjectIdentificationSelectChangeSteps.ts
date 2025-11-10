import { createBdd } from 'playwright-bdd';
import { expect, test } from '../../../../hooks/CustomFixtures';
import { confirmStringNotNull } from '../../../../utils/UtilFunctions';

const { Then } = createBdd(test);

Then(
  'I can see the project identification select change modification page',
  async ({ projectIdentificationSelectChangePage }) => {
    await projectIdentificationSelectChangePage.assertOnProjectIdentificationSelectChangePage();
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
  'I fill the project identification select change modification page using {string} dataset',
  async (
    { projectIdentificationEnterReferenceNumbersPage, commonItemsPage, projectIdentificationSelectChangePage },
    datasetName: string
  ) => {
    const dataset =
      projectIdentificationEnterReferenceNumbersPage.projectIdentificationEnterReferenceNumbersPageTestData[
        datasetName
      ];
    for (const key in dataset) {
      if (Object.hasOwn(dataset, key)) {
        if (key === 'project_reference_numbers_radio' || key === 'title_radio')
          await commonItemsPage.fillUIComponent(dataset, key, projectIdentificationSelectChangePage);
      }
    }
  }
);
