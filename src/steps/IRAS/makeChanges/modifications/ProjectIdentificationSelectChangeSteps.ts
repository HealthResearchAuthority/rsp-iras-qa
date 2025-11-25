import { createBdd } from 'playwright-bdd';
import { test } from '../../../../hooks/CustomFixtures';

const { Then } = createBdd(test);

Then(
  'I can see the project identification select change modification page',
  async ({ projectIdentificationSelectChangePage }) => {
    await projectIdentificationSelectChangePage.assertOnProjectIdentificationSelectChangePage();
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
