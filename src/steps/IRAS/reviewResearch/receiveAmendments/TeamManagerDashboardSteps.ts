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
    const normalize = (arr: any[]) => arr.map((item) => item.toString().trim()).sort();
    expect.soft(normalize(actualList)).toEqual(normalize(modificationsByLeadNation));
  }
);

Then(
  'I capture the modification id where the lead nation is the country linked to the {string} and with status {string}',
  async ({ teamManagerDashboardPage }, user: string, status: string) => {
    let leadNation = teamManagerDashboardPage.teamManagerDashboardPageTestData.Team_Manager_Nations[user];
    if (leadNation === 'Northern Ireland') {
      leadNation = 'Northern_Ireland';
    }
    const modificationId = await teamManagerDashboardPage.sqlGetModificationByLeadNationAndStatus(leadNation, status);
    await teamManagerDashboardPage.saveModificationId(modificationId.toString());
  }
);
