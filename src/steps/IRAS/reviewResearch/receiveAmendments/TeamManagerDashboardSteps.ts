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
  'I see only modifications where the lead nation is the country linked to the {string}',
  async ({ teamManagerDashboardPage, commonItemsPage }, user: string) => {
    let leadNation = teamManagerDashboardPage.teamManagerDashboardPageTestData.Team_Manager_Nations[user];
    if (leadNation === 'Northern Ireland') {
      leadNation = 'Northern_Ireland';
    }
    const modificationsByLeadNation = await teamManagerDashboardPage.sqlGetModificationByLeadNation(leadNation);
    const actualList = await commonItemsPage.getActualModificationListValues(commonItemsPage.tableBodyRows, 1);

    const normalize = (arr: any[]) =>
      arr
        .map((item) => item.toString().trim())
        .sort((a, b) => {
          const numA = parseFloat(a);
          const numB = parseFloat(b);
          if (!isNaN(numA) && !isNaN(numB)) {
            return numA - numB; // Numeric comparison
          }

          return 0; // Keeps original order for non-numeric values
        });
    expect.soft(normalize(actualList)).toEqual(normalize(modificationsByLeadNation));
  }
);

Then(
  'I capture the modification id of {string} where the lead nation is the country linked to the {string} and with status {string}',
  async ({ teamManagerDashboardPage }, modificationCount: string, user: string, status: string) => {
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
    await teamManagerDashboardPage.saveModificationId(modificationId.toString(), modificationCount);
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
