import { createBdd } from 'playwright-bdd';
import { test } from '../../hooks/CustomFixtures';
import { chromium } from '@playwright/test';
import CommonItemsPage from '../../pages/Common/CommonItemsPage';
import HomePage from '../../pages/IRAS/HomePage';
import LoginPage from '../../pages/Common/LoginPage';
import { getAuthState, getReportFolderName, getTicketReferenceTags } from '../../utils/UtilFunctions';
import fs from 'fs';
import path from 'path';
const { AfterStep, BeforeScenario } = createBdd(test);

AfterStep(async ({ page, $step, $testInfo, commonItemsPage }) => {
  if (
    `${process.env.STEP_SCREENSHOT?.toLowerCase()}` === 'yes' ||
    `${$step.title}` === 'I capture the page screenshot'
  ) {
    const fileName = new Date().toISOString().replace(/[-:.TZ]/g, '') + '.png';
    const screenshotDir = './test-reports/' + getReportFolderName() + '/cucumber/html/screenshots';
    const screenshotPath = path.join(screenshotDir, fileName);
    try {
      await page.screenshot({ path: screenshotPath, fullPage: true });
    } catch (error) {
      if (error.message.includes('Cannot take screenshot larger')) {
        await commonItemsPage.captureLargeSizeScreenshot(page, screenshotPath);
      } else {
        console.error(error);
      }
    }
    const relativePath = path.join('../screenshots/', fileName).replace(/\\/g, '/');
    const htmlPreview = `
      <a href="${relativePath}" target="_blank">
        <img src="${relativePath}" alt="screenshot" style="max-height:1000px;border:1px solid #ccc;" />
      </a>
    `;
    await $testInfo.attach(`[step] ${$step.title}`, { body: htmlPreview, contentType: 'text/html' });
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
  async function ({ commonItemsPage, homePage, $tags }) {
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
      const users = ['System_Admin', 'Frontstage_User', 'Backstage_User'];

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
      };

      for (const tag in tagToUserMap) {
        if ($tags.includes(tag)) {
          const state = JSON.parse(fs.readFileSync(getAuthState(tagToUserMap[tag])).toString());
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
    }
  }
);
