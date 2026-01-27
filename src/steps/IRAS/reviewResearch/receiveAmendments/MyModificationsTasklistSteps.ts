import { createBdd } from 'playwright-bdd';
import { expect, test } from '../../../../hooks/CustomFixtures';
const { Then } = createBdd(test);

Then(
  'I can see the {string} ui labels on the my modifications tasklist page',
  async ({ commonItemsPage, myModificationsTasklistPage }, datasetName: string) => {
    const dataset = myModificationsTasklistPage.myModificationsTasklistPageTestData[datasetName];
    for (const key in dataset) {
      if (Object.hasOwn(dataset, key)) {
        const labelVal = await commonItemsPage.getUiLabel(key, myModificationsTasklistPage);
        expect(labelVal).toBe(dataset[key]);
      }
    }
  }
);

Then(
  'I can see the modifications assigned from WFC or TM to SWR are now visible in my task list with status {string}',
  async ({ modificationsReadyToAssignPage }, statusValue: string) => {
    const modificationId = await modificationsReadyToAssignPage.getSelectedModifications();
    const modificationRow = modificationsReadyToAssignPage.page.locator('tbody tr', {
      has: modificationsReadyToAssignPage.page.locator('a.govuk-link', { hasText: `${modificationId}` }),
    });
    await expect.soft(modificationRow).toBeVisible();
    const modificationStatus = modificationRow.locator('td', { hasText: `${statusValue}` });
    await expect.soft(modificationStatus).toBeVisible();
  }
);

Then(
  'I capture the modification id of {string} where the lead nation is the country linked to the SWR {string} and with status {string} and with reviewer {string}',
  async (
    { myModificationsTasklistPage, selectStudyWideReviewerPage },
    modificationCount: string,
    user: string,
    status: string,
    reviewerDatasetName: string
  ) => {
    let countValue: string;
    let leadNation =
      await myModificationsTasklistPage.myModificationsTasklistPageTestData.Study_Wide_Reviewer_Nations[user];
    if (leadNation === 'Northern Ireland') {
      leadNation = 'Northern_Ireland';
    }
    if (modificationCount === 'Single' || modificationCount === 'Partial') {
      countValue = '=';
    } else {
      countValue = '>';
    }
    const reviewerDataset =
      selectStudyWideReviewerPage.selectStudywideReviewerPageData.Study_Wide_Reviewer[reviewerDatasetName];
    const studyWideReviewer = reviewerDataset.study_wide_reviewer_dropdown;
    const modificationId = await myModificationsTasklistPage.sqlGetModificationByLeadNationAndStatusCountSWR(
      leadNation,
      status,
      countValue,
      studyWideReviewer
    );
    await myModificationsTasklistPage.saveModificationId(modificationId.toString(), modificationCount);
    const irasId = modificationId.toString().split('/')[0];
    await myModificationsTasklistPage.setIrasId(irasId);
  }
);
