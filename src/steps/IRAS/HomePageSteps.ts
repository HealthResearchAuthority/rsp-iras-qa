import { createBdd } from 'playwright-bdd';
import { expect, test } from '../../hooks/CustomFixtures';

const { Given, Then } = createBdd(test);

Given('I can see project guidance text on the home_page', async ({ homePage }) => {
  const expectedText = homePage.homePageTestData.Home_Page.guidance_text;
  await expect(homePage.projectGuidanceText.getByText(expectedText, { exact: true })).toBeVisible();
});

Then('I can see the my account home page', async ({ homePage, $tags, loginPage, commonItemsPage }) => {
  await homePage.assertOnHomePage($tags, loginPage, commonItemsPage);
});

Then(
  'I can see the {string} ui labels on the my account home page',
  async ({ commonItemsPage, homePage }, datasetName: string) => {
    const dataset = homePage.homePageTestData[datasetName];
    for (const key in dataset) {
      if (Object.prototype.hasOwnProperty.call(dataset, key)) {
        const labelValue = await commonItemsPage.getUiLabel(key, homePage);
        expect(labelValue).toBe(dataset[key]);
      }
    }
  }
);

Then('I can see the workspaces in my account home page for {string}', async ({ homePage }, user: string) => {
  if (user === 'System_Admin') {
    const allTopMenuBarLinksExpectedValues = homePage.homePageTestData.Home_Page.workspaces_links_system_admin;
    const allTopMenuBarLinksActualValues = await homePage.getMyWorkspaceLinksNames();
    expect(allTopMenuBarLinksActualValues).toEqual(allTopMenuBarLinksExpectedValues);
  } else if (user === 'Frontstage_User') {
    const allTopMenuBarLinksExpectedValues = homePage.homePageTestData.Home_Page.workspaces_links_frontstage_user;
    const allTopMenuBarLinksActualValues = await homePage.getMyWorkspaceLinksNames();
    expect(allTopMenuBarLinksActualValues).toEqual(allTopMenuBarLinksExpectedValues);
  } else if (user === 'Backstage_User') {
    const allTopMenuBarLinksExpectedValues = homePage.homePageTestData.Home_Page.workspaces_links_backstage_user;
    const allTopMenuBarLinksActualValues = await homePage.getMyWorkspaceLinksNames();
    expect(allTopMenuBarLinksActualValues).toEqual(allTopMenuBarLinksExpectedValues);
  } else if (user === 'Non_Admin_User') {
    const allTopMenuBarLinksExpectedValues = homePage.homePageTestData.Home_Page.workspaces_links_backstage_user;
    const allTopMenuBarLinksActualValues = await homePage.getMyWorkspaceLinksNames();
    expect(allTopMenuBarLinksActualValues).toEqual(allTopMenuBarLinksExpectedValues);
  }
});
