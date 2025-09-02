import { createBdd } from 'playwright-bdd';
import { test } from '../../hooks/CustomFixtures';
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
  async function ({ commonItemsPage, homePage, loginPage, $tags }) {
    const isAuthStateValid = async () => {
      const response = await commonItemsPage.page.request.get('', { maxRedirects: 0 });
      const text = await response.text();
      return text.includes(homePage.homePageTestData.Home_Page.heading);
    };

    const reauthenticateUsers = async () => {
      const users = ['System_Admin', 'Applicant_User', 'Studywide_Reviewer', 'Team_Manager', 'WorkFlow_Coordinator'];

      for (const user of users) {
        await commonItemsPage.page.context().clearCookies();
        await homePage.goto();
        await homePage.loginBtn.click();
        await loginPage.assertOnLoginPage();
        await loginPage.loginWithUserCreds(user);
        await homePage.assertOnHomePage();
        await commonItemsPage.storeAuthState(user);
      }
    };

    const getReauthenticatedCookies = () => {
      const tagToUserMap: Record<string, string> = {
        '@SysAdminUser': 'system_admin',
        '@ApplicantUser': 'applicant_user',
        '@StudyWideReviewer': 'studywide_reviewer',
        '@TeamManager': 'team_manager',
        '@WorkFlowCoordinator': 'workflow_coordinator',
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
