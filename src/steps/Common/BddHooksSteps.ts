import { createBdd } from 'playwright-bdd';
import { test } from '../../hooks/CustomFixtures';
import { getAuthState, getReportFolderName, getTicketReferenceTags } from '../../utils/UtilFunctions';
import * as fs from 'node:fs';
import path from 'node:path';

const { AfterScenario, AfterStep, BeforeScenario } = createBdd(test);

AfterStep(async ({ page, $step, $testInfo, commonItemsPage }) => {
  if (
    `${process.env.STEP_SCREENSHOT?.toLowerCase()}` === 'yes' ||
    `${$step.title}` === 'I capture the page screenshot'
  ) {
    const fileName = new Date().toISOString().replaceAll(/[-:.TZ]/g, '') + '.png';
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
    const relativePath = path.join('../screenshots/', fileName).replaceAll(/\\/g, '/');
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
      $testInfo.attach('Ticket Reference:', { body: tickets.toString().replaceAll(/,/g, '') });
    }
  }
);

BeforeScenario(
  {
    name: 'Ensure One Login User does not exist in system',
    tags: '@OneLoginUser',
  },
  async function ({ auditHistoryUserPage, userProfilePage }) {
    const userEmail =
      auditHistoryUserPage.auditHistoryUserPageTestData.User_Profiles.One_Login_Account_User.email_address;
    await userProfilePage.sqlDeleteUserProfileByEmail(userEmail);
  }
);

AfterScenario(
  {
    name: 'Remove One Login User from the system',
    tags: '@OneLoginUser',
  },
  async function ({ auditHistoryUserPage, userProfilePage }) {
    const userEmail =
      auditHistoryUserPage.auditHistoryUserPageTestData.User_Profiles.One_Login_Account_User.email_address;
    await userProfilePage.sqlDeleteUserProfileByEmail(userEmail);
  }
);

BeforeScenario(
  {
    name: 'Check that current auth state has not expired',
    tags: '@Regression or @SystemTest or @Smoke and not @NoAuth',
  },
  async function ({ commonItemsPage, homePage, loginPage, $tags }) {
    const isAuthStateValid = async () => {
      const response = await commonItemsPage.page.request.get('', { maxRedirects: 0 });
      const text = await response.text();
      return text.includes(homePage.homePageTestData.Home_Page.hra_card_selector);
    };

    const reauthenticateUsers = async () => {
      const users = [
        'System_Admin',
        'Applicant_User',
        'Studywide_Reviewer',
        'Studywide_Reviewer_NI',
        'Studywide_Reviewer_S',
        'Studywide_Reviewer_W',
        'Team_Manager',
        'Workflow_Coordinator',
        'Workflow_Coordinator_NI',
        'Workflow_Coordinator_S',
        'Workflow_Coordinator_W',
      ];

      for (const user of users) {
        await commonItemsPage.page.context().clearCookies();
        await homePage.goto();
        await homePage.startNowBtn.click();
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
        '@StudyWideReviewerNI': 'studywide_reviewer_ni',
        '@StudyWideReviewerSco': 'studywide_reviewer_s',
        '@StudyWideReviewerWal': 'studywide_reviewer_w',
        '@TeamManager': 'team_manager',
        '@WorkFlowCoordinator': 'workflow_coordinator',
        '@WorkFlowCoordinatorNI': 'workflow_coordinator_ni',
        '@WorkFlowCoordinatorSco': 'workflow_coordinator_s',
        '@WorkFlowCoordinatorWal': 'workflow_coordinator_w',
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
