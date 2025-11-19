import { createBdd } from 'playwright-bdd';
import { expect, test } from '../../../../hooks/CustomFixtures';

const { Then } = createBdd(test);

Then(
  'I can see the project identification enter reference modification page',
  async ({ projectIdentificationEnterReferenceNumbersPage }) => {
    await projectIdentificationEnterReferenceNumbersPage.assertOnProjectIdentificationEnterReferenceNumbersPage();
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

Then(
  'I can validate the ui labels on project identification enter reference numbers page using {string} dataset',
  async ({ commonItemsPage, projectIdentificationEnterReferenceNumbersPage }, datasetName: string) => {
    const dataset =
      projectIdentificationEnterReferenceNumbersPage.projectIdentificationEnterReferenceNumbersPageTestData[
        datasetName
      ];
    for (const key in dataset) {
      if (Object.hasOwn(dataset, key)) {
        const labelValue = await commonItemsPage.getUiLabel(key, projectIdentificationEnterReferenceNumbersPage);
        expect.soft(labelValue).toBe(dataset[key]);
      }
    }
  }
);
