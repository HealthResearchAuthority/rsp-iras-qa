import { createBdd } from 'playwright-bdd';
import { expect, test } from '../../../../hooks/CustomFixtures';
import { confirmStringNotNull } from '../../../../utils/UtilFunctions';

const { Then } = createBdd(test);

Then(
  'I can see the project identification enter reference modification page',
  async ({ projectIdentificationEnterReferenceNumbersPage }) => {
    await projectIdentificationEnterReferenceNumbersPage.assertOnProjectIdentificationEnterReferenceNumbersPage();
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
  'I fill the project identification enter reference modification page using {string} dataset',
  async ({ commonItemsPage, projectIdentificationEnterReferenceNumbersPage }, datasetName: string) => {
    const dataset =
      projectIdentificationEnterReferenceNumbersPage.projectIdentificationEnterReferenceNumbersPageTestData[
        datasetName
      ];
    const referenceNumbersDataset = dataset['Project_Reference'];
    for (const key in referenceNumbersDataset) {
      if (Object.hasOwn(referenceNumbersDataset, key)) {
        await commonItemsPage.fillUIComponent(
          referenceNumbersDataset,
          key,
          projectIdentificationEnterReferenceNumbersPage
        );
      }
    }
  }
);
