import { createBdd } from 'playwright-bdd';
import { expect, test } from '../../../../hooks/CustomFixtures';
import { confirmStringNotNull } from '../../../../utils/UtilFunctions';

const { When } = createBdd(test);

When(
  'I can see all the selected modifications on that page including details such as the short project title and the modification id',
  async ({ modificationsReadyToAssignPage, commonItemsPage }) => {
    const modificationRecordActual: string[] = [];
    const modificationRecordExpected = await modificationsReadyToAssignPage.getSelectedModifications();
    for (const row of await commonItemsPage.tableBodyRows.all()) {
      const modification_id = confirmStringNotNull(await row.getByRole('cell').nth(0).textContent());
      const shortProjectTitle = confirmStringNotNull(await row.getByRole('link').textContent());
      modificationRecordActual.push(modification_id + ':' + shortProjectTitle);
    }
    expect(modificationRecordExpected).toEqual(modificationRecordActual);
  }
);

When(
  'I select a study wide reviewer in the select a reviewer page using {string}',
  async ({ selectStudyWideReviewerPage, commonItemsPage }, datasetName: string) => {
    const dataset = selectStudyWideReviewerPage.selectStudywideReviewerPageData.Study_Wide_Reviewer[datasetName];
    for (const key in dataset) {
      if (Object.hasOwn(dataset, key)) {
        await commonItemsPage.fillUIComponent(dataset, key, selectStudyWideReviewerPage);
      }
    }
  }
);
