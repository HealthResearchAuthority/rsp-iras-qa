import { createBdd } from 'playwright-bdd';
import { expect, test } from '../../hooks/CustomFixtures';
import dateTimeRelatedData from '../../resources/test_data/common/date_time_related_data.json';

const { Given, Then } = createBdd(test);

Given('I can see project guidance text on the home_page', async ({ homePage }) => {
  const expectedText = homePage.homePageTestData.Home_Page.guidance_text;
  await expect(homePage.projectGuidanceText.getByText(expectedText, { exact: true })).toBeVisible();
});

Then('I can see the my account home page', async ({ homePage }) => {
  await homePage.assertOnHomePage();
});

Then(
  'I can see the {string} ui labels on the my account home page',
  async ({ commonItemsPage, homePage }, datasetName: string) => {
    const dataset = homePage.homePageTestData[datasetName];
    for (const key in dataset) {
      if (Object.hasOwn(dataset, key)) {
        const labelValue = await commonItemsPage.getUiLabel(key, homePage);
        expect(labelValue).toBe(dataset[key]);
      }
    }
  }
);

Then('I can see the workspaces in my account home page for {string}', async ({ homePage }, user: string) => {
  const expectedLinksMap = {
    System_Admin: homePage.homePageTestData.Home_Page.workspaces_links_system_admin,
    Applicant_User: homePage.homePageTestData.Home_Page.workspaces_links_applicant_user,
    Studywide_Reviewer: homePage.homePageTestData.Home_Page.workspaces_links_studywide_reviewer,
    Team_Manager: homePage.homePageTestData.Home_Page.workspaces_links_team_manager,
    Workflow_Coordinator: homePage.homePageTestData.Home_Page.workspaces_links_workflow_coordinator,
    Sponsor_User: homePage.homePageTestData.Home_Page.workspaces_links_sponsor_user,
  };
  const expectedLinks = expectedLinksMap[user];
  if (!expectedLinks) {
    throw new Error(`Unexpected user type: ${user}`);
  }
  const actualLinks = await homePage.getMyWorkspaceLinksNames();
  expect(actualLinks).toEqual(expectedLinks);
});

Then('I validate the last logged in is displayed as full date in home page', async ({ manageUsersPage, homePage }) => {
  expect(homePage.lastLoggedIn).toContainText(`${manageUsersPage.getLastLoggedInDateFull()} ${dateTimeRelatedData.at}`);
  if (manageUsersPage.getLastLoggedInHours() >= 12) {
    expect(homePage.lastLoggedIn).toContainText(`${dateTimeRelatedData.afternoon} ${dateTimeRelatedData.uk_time}`);
  } else {
    expect(homePage.lastLoggedIn).toContainText(`${dateTimeRelatedData.morning} ${dateTimeRelatedData.uk_time}`);
  }
});
