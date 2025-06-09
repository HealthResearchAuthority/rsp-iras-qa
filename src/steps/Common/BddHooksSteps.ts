import { createBdd } from 'playwright-bdd';
import { test } from '../../hooks/CustomFixtures';
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
    const authStateIsValid = await commonItemsPage.page.request.get('', { maxRedirects: 0 }).then(async (response) => {
      return await response.text().then((includes) => {
        return includes.includes(homePage.homePageTestData.Home_Page.heading);
      });
    });
    if (!authStateIsValid) {
      console.info('Current auth states have expired!\nReauthenticating test users before continuing test execution');
      await commonItemsPage.page.context().clearCookies();
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
        await jsHomePage.assertOnHomePage($tags, loginPage, commonItemsPage);
        await jsCommonItemsPage.storeAuthState(user);
      }
      await jsContext.close();
      await jsBrowser.close();
      let newCookiesCurrentUser: any;
      if ($tags.includes('@SysAdminUser')) {
        const reauthenticatedState = JSON.parse(readFileSync(getAuthState('system_admin')).toString());
        newCookiesCurrentUser = reauthenticatedState.cookies;
      } else if ($tags.includes('@FrontStageUser')) {
        const reauthenticatedState = JSON.parse(readFileSync(getAuthState('frontstage_user')).toString());
        newCookiesCurrentUser = reauthenticatedState.cookies;
      } else if ($tags.includes('@BackStageUser')) {
        const reauthenticatedState = JSON.parse(readFileSync(getAuthState('backstage_user')).toString());
        newCookiesCurrentUser = reauthenticatedState.cookies;
      } else if ($tags.includes('@adminUser')) {
        const reauthenticatedState = JSON.parse(readFileSync(getAuthState('admin_user')).toString());
        newCookiesCurrentUser = reauthenticatedState.cookies;
      } else if ($tags.includes('@nonAdminUser')) {
        const reauthenticatedState = JSON.parse(readFileSync(getAuthState('non_admin_user')).toString());
        newCookiesCurrentUser = reauthenticatedState.cookies;
      } else {
        throw new Error(
          `A Reauthenticated User State has not been set for the current test.\nPlease review and ensure that the correct user tag has been applied to this test`
        );
      }
      await commonItemsPage.page.context().clearCookies();
      await commonItemsPage.page.context().addCookies(newCookiesCurrentUser);
    }
  }
);
