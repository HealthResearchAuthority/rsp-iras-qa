import { createBdd } from 'playwright-bdd';
import { test } from '../../hooks/CustomFixtures';
import { getAuthState, getTicketReferenceTags } from '../../utils/UtilFunctions';
import * as fs from 'node:fs';

const { AfterScenario, AfterStep, BeforeScenario } = createBdd(test);

AfterStep(async ({ page, $step, $testInfo, commonItemsPage }) => {
  if (
    `${process.env.STEP_SCREENSHOT?.toLowerCase()}` === 'yes' ||
    `${$step.title}` === 'I capture the page screenshot'
  ) {
    await commonItemsPage.captureScreenshot(page, $testInfo, $step);
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
    name: 'Ensure sponsor organisation does not exist in system',
    tags: '@SetupNewSponsorOrg',
  },
  async function ({ manageSponsorOrganisationPage, setupNewSponsorOrganisationPage }) {
    const unusedSponsorOrgId = await manageSponsorOrganisationPage.findUnmatchedOrganisations();
    const unusedSponsorOrgName = (
      await manageSponsorOrganisationPage.sqlGetOrganisationNameFromRTSById(unusedSponsorOrgId)
    ).toString();
    await setupNewSponsorOrganisationPage.saveUnusedSponsorOrgTosetupNewSponsorOrganisation(unusedSponsorOrgName);
  }
);

AfterScenario(
  {
    name: 'Remove sponsor organisation from the system',
    tags: '@SetupNewSponsorOrg',
  },
  async function ({ manageSponsorOrganisationPage, setupNewSponsorOrganisationPage }) {
    const usedSponsorOrg =
      setupNewSponsorOrganisationPage.setupNewSponsorOrganisationPageTestData.Setup_New_Sponsor_Organisation
        .Sponsor_Organisation_Unused.sponsor_organisation_text;
    const sponsor_id = (
      await manageSponsorOrganisationPage.sqlGetOrganisationIdFromRTSByName(usedSponsorOrg)
    ).toString();
    await manageSponsorOrganisationPage.sqlDeleteSponsorOrgById(sponsor_id);
  }
);

BeforeScenario(
  {
    name: 'Remove known reusable sponsor organisation from the system',
    tags: '@SetupNewSponsorOrgGoLive',
  },
  async function ({ manageSponsorOrganisationPage, setupNewSponsorOrganisationPage }) {
    const reusableOrgsDataset =
      setupNewSponsorOrganisationPage.setupNewSponsorOrganisationPageTestData.Setup_New_Sponsor_Organisation;
    for (const org in reusableOrgsDataset) {
      if (Object.hasOwn(reusableOrgsDataset, org)) {
        const sponsorOrgName = reusableOrgsDataset[org].sponsor_organisation_text;
        const sponsorId = (
          await manageSponsorOrganisationPage.sqlGetOrganisationIdFromRTSByName(sponsorOrgName)
        ).toString();
        if (sponsorId) {
          await manageSponsorOrganisationPage.sqlDeleteSponsorOrgById(sponsorId);
        }
      }
    }
  }
);

AfterScenario(
  {
    name: 'Remove sponsor organisation from the system',
    tags: '@SetupNewSponsorOrgGoLive',
  },
  async function ({ manageSponsorOrganisationPage, checkSetupSponsorOrganisationPage }) {
    const usedSponsorOrg = await checkSetupSponsorOrganisationPage.getOrgName();
    const sponsor_id = (
      await manageSponsorOrganisationPage.sqlGetOrganisationIdFromRTSByName(usedSponsorOrg)
    ).toString();
    await manageSponsorOrganisationPage.sqlDeleteSponsorOrgById(sponsor_id);
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

AfterScenario(
  {
    name: 'Remove test automation generated users from a specific review body',
    tags: '@RevBodyUserListCleanup',
  },
  async function ({ userListReviewBodyPage, reviewBodyProfilePage }) {
    const revBodyId = await reviewBodyProfilePage.getReviewBodyId();
    await userListReviewBodyPage.sqlDeleteReviewBodyAutomatedUserListById(revBodyId);
  }
);

AfterScenario(
  {
    name: 'Remove a newly created test automation review body',
    tags: '@CreatedRevBodyCleanup',
  },
  async function ({ createReviewBodyPage }) {
    const revBodyName = await createReviewBodyPage.getUniqueOrgName();
    await createReviewBodyPage.sqlDeleteAutomatedReviewBodyByUniqueName(revBodyName);
  }
);

BeforeScenario(
  {
    name: 'Ensure a test automation review body with DISABLED status exists',
    tags: '@RevBodyStatusSetup',
  },
  async function ({ manageReviewBodiesPage }) {
    await manageReviewBodiesPage.sqlUpdateAutomatedReviewBodyStatus('disabled');
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
        'Team_Manager_NI',
        'Team_Manager_S',
        'Team_Manager_W',
        'Workflow_Coordinator',
        'Workflow_Coordinator_NI',
        'Workflow_Coordinator_S',
        'Workflow_Coordinator_W',
        'Sponsor_User',
        'Sponsor_Org_Admin_User',
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
        '@TeamManagerNI': 'team_manager_ni',
        '@TeamManagerSco': 'team_manager_s',
        '@TeamManagerW': 'team_manager_w',
        '@WorkFlowCoordinator': 'workflow_coordinator',
        '@WorkFlowCoordinatorNI': 'workflow_coordinator_ni',
        '@WorkFlowCoordinatorSco': 'workflow_coordinator_s',
        '@WorkFlowCoordinatorWal': 'workflow_coordinator_w',
        '@SponsorUser': 'sponsor_user',
        '@SponsorOrgAdminUser': 'sponsor_org_admin_user',
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

AfterScenario(
  { name: 'Attach screenshot for failed scenarios' },
  async function ({ page, $testInfo, commonItemsPage }) {
    if ($testInfo.status === 'failed') {
      await commonItemsPage.captureScreenshot(page, $testInfo);
    }
  }
);

AfterScenario({ name: 'Cleanup cucumber report to remove large items' }, async function ({ $testInfo }) {
  if ($testInfo.attachments?.length) {
    $testInfo.attachments = $testInfo.attachments.filter((att) => !(att.body && att.body.length > 200_000));
  }
  if ($testInfo.error?.message && $testInfo.error.message.length > 50_000) {
    $testInfo.error.message = '[removed large error message]';
  }
});
