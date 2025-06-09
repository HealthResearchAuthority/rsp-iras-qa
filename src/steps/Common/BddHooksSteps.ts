import { createBdd } from 'playwright-bdd';
import { expect, test } from '../../hooks/CustomFixtures';
import { chromium } from 'playwright';
import CommonItemsPage from '../../pages/Common/CommonItemsPage';
import HomePage from '../../pages/IRAS/HomePage';
import LoginPage from '../../pages/Common/LoginPage';
import { getAuthState, getTicketReferenceTags } from '../../utils/UtilFunctions';
import { readFileSync } from 'fs';
const { AfterStep, BeforeScenario } = createBdd(test);

AfterStep(async ({ page, $step, $testInfo }) => {
  if (
    `${process.env.STEP_SCREENSHOT?.toLowerCase()}` === 'yes' ||
    `${$step.title}` === 'I capture the page screenshot'
  ) {
    const screenshot = await page.screenshot({ path: 'screenshot.png', fullPage: true });
    await $testInfo.attach(`[step] ${$step.title}`, { body: screenshot, contentType: 'image/png' });
  }
});

BeforeScenario(
  { name: 'Attach relevant ticket links to each scenario in test report' },
  async function ({ $tags, $testInfo }) {
    const tickets = getTicketReferenceTags($tags);
    if (tickets.length > 0) {
      $testInfo.attach('Ticket Reference:', { body: tickets.toString().replace(/,/g, '') });
    }
  }
);

BeforeScenario(
  { name: 'Check that current auth state has not expired', tags: '@Regression or @SystemTest and not @NoAuth' },
  async function ({ commonItemsPage, homePage, loginPage, $tags }) {
    const isAuthStateValid = async () => {
      const response = await commonItemsPage.page.request.get('', { maxRedirects: 0 });
      const text = await response.text();
      return text.includes(homePage.homePageTestData.Home_Page.heading);
    };

    const reauthenticateUsers = async () => {
      const jsBrowser = await chromium.launch();
      const jsContext = await jsBrowser.newContext({ javaScriptEnabled: true });
      const jsPage = await jsContext.newPage();
      const jsCommonItemsPage = new CommonItemsPage(jsPage);
      const jsHomePage = new HomePage(jsPage);
      const jsLoginPage = new LoginPage(jsPage);
      const users = ['System_Admin', 'Frontstage_User', 'Backstage_User', 'Admin_User', 'Non_Admin_User'];

      for (const user of users) {
        await jsContext.clearCookies();
        await jsHomePage.goto();
        await jsHomePage.loginBtn.click();
        await jsLoginPage.assertOnLoginPage();
        await jsLoginPage.loginWithUserCreds(user);
        await jsHomePage.assertOnHomePage();
        await jsCommonItemsPage.storeAuthState(user);
      }

      await jsContext.close();
      await jsBrowser.close();
    };

    const getReauthenticatedCookies = () => {
      const tagToUserMap: Record<string, string> = {
        '@SysAdminUser': 'system_admin',
        '@FrontStageUser': 'frontstage_user',
        '@BackStageUser': 'backstage_user',
        '@adminUser': 'admin_user',
        '@nonAdminUser': 'non_admin_user',
      };

      for (const tag in tagToUserMap) {
        if ($tags.includes(tag)) {
          const state = JSON.parse(readFileSync(getAuthState(tagToUserMap[tag])).toString());
          return state.cookies;
        }
      }

      throw new Error(
        `A Reauthenticated User State has not been set for the current test.\nPlease review and ensure that the correct user tag has been applied to this test`
      );
    };

    if (!(await isAuthStateValid())) {
      console.info('Current auth states have expired!\nReauthenticating test users before continuing test execution');
      await commonItemsPage.page.context().clearCookies();
      await reauthenticateUsers();
      const newCookies = getReauthenticatedCookies();
      await commonItemsPage.page.context().clearCookies();
      await commonItemsPage.page.context().addCookies(newCookies);
    } else if (await homePage.loginBtn.isVisible()) {
      console.info('Sign In button is displayed');
      console.info(homePage.page.url());
      let user: string = '';
      if ($tags.includes('@SysAdminUser')) {
        user = 'System_Admin';
      } else if ($tags.includes('Frontstage_User')) {
        user = 'Frontstage_User';
      } else if ($tags.includes('Backstage_User')) {
        user = 'Backstage_User';
      }
      await homePage.loginBtn.click();
      await homePage.page.waitForLoadState('domcontentloaded');
      await homePage.page.waitForTimeout(3000);
      console.info(await homePage.pageHeading.textContent());
      if (await homePage.pageHeading.isVisible()) {
        console.info('My account home page is displayed');
        await expect(homePage.pageHeading).toBeVisible();
        await expect(homePage.myWorkspacesHeading).toBeVisible();
        await expect(homePage.projectGuidanceText).toBeVisible();
      } else {
        await loginPage.assertOnLoginPage();
        console.info('Login page is displayed');
        await loginPage.loginWithUserCreds(user);
        await expect(homePage.pageHeading).toBeVisible();
        await expect(homePage.myWorkspacesHeading).toBeVisible();
        await expect(homePage.projectGuidanceText).toBeVisible();
        await commonItemsPage.storeAuthState(user);
      }
    }
  }
);
