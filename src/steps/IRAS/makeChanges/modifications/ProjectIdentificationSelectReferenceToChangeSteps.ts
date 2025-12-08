import { createBdd } from 'playwright-bdd';
import { test } from '../../../../hooks/CustomFixtures';

const { Then } = createBdd(test);

Then(
  'I can see the project identification select reference modification page',
  async ({ projectIdentificationSelectReferenceToChangePage }) => {
    await projectIdentificationSelectReferenceToChangePage.assertOnProjectIdentificationSelectReferenceToChangePage();
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

Then(
  'I fill the project identification titles page using {string} dataset',
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
        if (key === 'which_titles_do_you_need_to_change_checkboxes') {
          await commonItemsPage.fillUIComponent(dataset, key, projectIdentificationSelectReferenceToChangePage);
        }
      }
    }
  }
);
