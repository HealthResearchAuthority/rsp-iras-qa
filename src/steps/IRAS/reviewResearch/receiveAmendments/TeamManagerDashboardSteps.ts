import { createBdd } from 'playwright-bdd';
import { expect, test } from '../../../../hooks/CustomFixtures';
const { Then } = createBdd(test);

Then('I can see the team manager dashboard page', async ({ teamManagerDashboardPage }) => {
  await teamManagerDashboardPage.assertOnTeamManagerDashboardPage();
});

Then(
  'the country linked to the {string} appears as the lead nation in the page description',
  async ({ teamManagerDashboardPage }, user: string) => {
    const expectedLeadNation =
      teamManagerDashboardPage.teamManagerDashboardPageTestData.Team_Manager_Nations[user] + '.';
    const actualPageDescription = await teamManagerDashboardPage.page_description
      .textContent()
      .then((description: string) => description.trim());
    expect.soft(actualPageDescription.endsWith(expectedLeadNation)).toBeTruthy();
  }
);

Then(
  'I capture the modification id of {string} where the lead nation is the country linked to the {string} and with status {string}',
  async (
    { teamManagerDashboardPage, modificationsReceivedCommonPage },
    modificationCount: string,
    user: string,
    status: string
  ) => {
    let countValue: string;
    let leadNation = teamManagerDashboardPage.teamManagerDashboardPageTestData.Team_Manager_Nations[user];
    if (leadNation === 'Northern Ireland') {
      leadNation = 'Northern_Ireland';
    }
    if (modificationCount === 'Single' || modificationCount === 'Partial') {
      countValue = '=';
    } else {
      countValue = '>';
    }
    const modificationId = await teamManagerDashboardPage.sqlGetModificationByLeadNationAndStatusCount(
      leadNation,
      status,
      countValue
    );
    await modificationsReceivedCommonPage.setModificationId(modificationId.toString());
    await teamManagerDashboardPage.saveModificationIdTM(modificationId.toString(), modificationCount);
    await teamManagerDashboardPage.page.waitForTimeout(2000);
    const irasId = modificationId.toString().split('/')[0];
    await teamManagerDashboardPage.setIrasId(irasId);
  }
);

Then(
  'I capture the modification id of {string} where the lead nation is the country linked to the {string} with status {string} and SWR {string}',
  async (
    { teamManagerDashboardPage, selectStudyWideReviewerPage },
    modificationCount: string,
    user: string,
    status: string,
    datasetName: string
  ) => {
    let countValue: string;
    let leadNation = teamManagerDashboardPage.teamManagerDashboardPageTestData.Team_Manager_Nations[user];
    if (leadNation === 'Northern Ireland') {
      leadNation = 'Northern_Ireland';
    }
    if (modificationCount === 'Single' || modificationCount === 'Partial') {
      countValue = '=';
    } else {
      countValue = '>';
    }

    const dataset = selectStudyWideReviewerPage.selectStudywideReviewerPageData.Study_Wide_Reviewer[datasetName];
    const swrName = dataset['study_wide_reviewer_dropdown'];
    const irasId = await teamManagerDashboardPage.sqlGetIrasIdByLeadNationAndStatusCountSWR(
      leadNation,
      status,
      countValue,
      swrName
    );
    await teamManagerDashboardPage.saveIrasId(irasId.toString(), modificationCount);
  }
);

Then(
  'I can see the {string} ui labels on the team manager dashboard page',
  async ({ commonItemsPage, teamManagerDashboardPage }, datasetName: string) => {
    const dataset = teamManagerDashboardPage.teamManagerDashboardPageTestData[datasetName];
    for (const key in dataset) {
      if (Object.hasOwn(dataset, key)) {
        const labelVal = await commonItemsPage.getUiLabel(key, teamManagerDashboardPage);
        expect.soft(labelVal).toBe(dataset[key]);
      }
    }
  }
);
