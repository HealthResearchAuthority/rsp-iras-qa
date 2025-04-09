import { test as base } from 'playwright-bdd';
import AxeBuilder from '@axe-core/playwright';
import { getAuthState, getTicketReferenceTags } from '../utils/UtilFunctions';
import CommonItemsPage from '../pages/Common/CommonItemsPage';
import LoginPage from '../pages/Common/LoginPage';
import HomePage from '../pages/IRAS/HomePage';
import ProjectFilterPage from '../pages/IRAS/questionSet/ProjectFilterPage';
import ProjectDetailsPage from '../pages/IRAS/questionSet/ProjectDetailsPage';
import StudentPage from '../pages/IRAS/questionSet/StudentPage';
import DevicesPage from '../pages/IRAS/questionSet/DevicesPage';
import TissuePage from '../pages/IRAS/questionSet/TissuePage';
import AdultsLackingCapacityPage from '../pages/IRAS/questionSet/AdultsLackingCapacityPage';
import ChildrenPage from '../pages/IRAS/questionSet/ChildrenPage';
import BookingPage from '../pages/IRAS/questionSet/BookingPage';
import CreateApplicationPage from '../pages/IRAS/CreateApplicationPage';
import ProceedApplicationPage from '../pages/IRAS/ProceedApplicationPage';
import QuestionSetPage from '../pages/Common/QuestionSetPage';
import EmailNotificationPage from '../pages/Common/emailNotificationPage';
import MyResearchProjectsPage from '../pages/IRAS/createAmendment/MyResearchProjectsPage';
import CreateProjectRecordPage from '../pages/IRAS/createAmendment/CreateProjectRecordPage';
import ProjectDetailsIRASPage from '../pages/IRAS/createAmendment/ProjectDetailsIRASPage';
import ProjectDetailsTitlePage from '../pages/IRAS/createAmendment/ProjectDetailsTitlePage';
import ReseachLocationsPage from '../pages/IRAS/createAmendment/ResearchLocationsPage';
import KeyProjectRolesPage from '../pages/IRAS/createAmendment/KeyProjectRolesPage';
import ReviewYourApplicationPage from '../pages/IRAS/createAmendment/ReviewYourApplicationPage';
import ManageReviewBodiesPage from '../pages/IRAS/reviewResearch/userAdministration/manageReviewBodies/ManageReviewBodiesPage';
import CreateReviewBodyPage from '../pages/IRAS/reviewResearch/userAdministration/manageReviewBodies/CreateReviewBodyPage';
import CheckCreateReviewBodyPage from '../pages/IRAS/reviewResearch/userAdministration/manageReviewBodies/CheckCreateReviewBodyPage';
import CreateReviewBodyConfirmationPage from '../pages/IRAS/reviewResearch/userAdministration/manageReviewBodies/CreateReviewBodyConfirmationPage';
import ManageUsersPage from '../pages/IRAS/reviewResearch/userAdministration/manageUsers/ManageUsersPage';
import CreateUserProfilePage from '../pages/IRAS/reviewResearch/userAdministration/manageUsers/CreateUserProfilePage';
import CreateUserProfileConfirmationPage from '../pages/IRAS/reviewResearch/userAdministration/manageUsers/CreateUserProfileConfirmationPage';
import CheckCreateUserProfilePage from '../pages/IRAS/reviewResearch/userAdministration/manageUsers/CheckCreateUserProfilePage';
import UserProfilePage from '../pages/IRAS/reviewResearch/userAdministration/manageUsers/UserProfilePage';
import EditUserProfilePage from '../pages/IRAS/reviewResearch/userAdministration/manageUsers/EditUserProfilePage';
import ConfirmationPage from '../pages/IRAS/ConfirmationPage';
import SystemAdministrationPage from '../pages/IRAS/reviewResearch/userAdministration/SystemAdministrationPage';
import ReviewBodyProfilePage from '../pages/IRAS/reviewResearch/userAdministration/manageReviewBodies/ReviewBodyProfilePage';
import EditReviewBodyPage from '../pages/IRAS/reviewResearch/userAdministration/manageReviewBodies/EditReviewBodyPage';
import AuditHistoryReviewBodyPage from '../pages/IRAS/reviewResearch/userAdministration/manageReviewBodies/AuditHistoryReviewBodyPage';

type CustomFixtures = {
  commonItemsPage: CommonItemsPage;
  loginPage: LoginPage;
  homePage: HomePage;
  projectFilterPage: ProjectFilterPage;
  projectDetailsPage: ProjectDetailsPage;
  studentPage: StudentPage;
  devicesPage: DevicesPage;
  tissuePage: TissuePage;
  adultsLackingCapacityPage: AdultsLackingCapacityPage;
  childrenPage: ChildrenPage;
  bookingPage: BookingPage;
  createApplicationPage: CreateApplicationPage;
  proceedApplicationPage: ProceedApplicationPage;
  questionSetPage: QuestionSetPage;
  emailNotificationPage: EmailNotificationPage;
  myResearchProjectsPage: MyResearchProjectsPage;
  createProjectRecordPage: CreateProjectRecordPage;
  projectDetailsIRASPage: ProjectDetailsIRASPage;
  projectDetailsTitlePage: ProjectDetailsTitlePage;
  reseachLocationsPage: ReseachLocationsPage;
  keyProjectRolesPage: KeyProjectRolesPage;
  reviewYourApplicationPage: ReviewYourApplicationPage;
  systemAdministrationPage: SystemAdministrationPage;
  manageReviewBodiesPage: ManageReviewBodiesPage;
  createReviewBodyPage: CreateReviewBodyPage;
  checkCreateReviewBodyPage: CheckCreateReviewBodyPage;
  createReviewBodyConfirmationPage: CreateReviewBodyConfirmationPage;
  manageUsersPage: ManageUsersPage;
  createUserProfilePage: CreateUserProfilePage;
  createUserProfileConfirmationPage: CreateUserProfileConfirmationPage;
  checkCreateUserProfilePage: CheckCreateUserProfilePage;
  userProfilePage: UserProfilePage;
  editUserProfilePage: EditUserProfilePage;
  confirmationPage: ConfirmationPage;
  reviewBodyProfilePage: ReviewBodyProfilePage;
  editReviewBodyPage: EditReviewBodyPage;
  auditHistoryReviewBodyPage: AuditHistoryReviewBodyPage;
  makeAxeBuilder: () => AxeBuilder;
};

export const test = base.extend<CustomFixtures>({
  commonItemsPage: async ({ page }, use) => {
    await use(new CommonItemsPage(page));
  },

  questionSetPage: async ({ page }, use) => {
    await use(new QuestionSetPage(page));
  },

  loginPage: async ({ page }, use) => {
    await use(new LoginPage(page));
  },

  homePage: async ({ page }, use) => {
    await use(new HomePage(page));
  },

  projectFilterPage: async ({ page }, use) => {
    await use(new ProjectFilterPage(page));
  },

  projectDetailsPage: async ({ page }, use) => {
    await use(new ProjectDetailsPage(page));
  },

  studentPage: async ({ page }, use) => {
    await use(new StudentPage(page));
  },

  devicesPage: async ({ page }, use) => {
    await use(new DevicesPage(page));
  },

  tissuePage: async ({ page }, use) => {
    await use(new TissuePage(page));
  },

  adultsLackingCapacityPage: async ({ page }, use) => {
    await use(new AdultsLackingCapacityPage(page));
  },

  childrenPage: async ({ page }, use) => {
    await use(new ChildrenPage(page));
  },

  bookingPage: async ({ page }, use) => {
    await use(new BookingPage(page));
  },

  createApplicationPage: async ({ page }, use) => {
    await use(new CreateApplicationPage(page));
  },

  proceedApplicationPage: async ({ page }, use) => {
    await use(new ProceedApplicationPage(page));
  },

  emailNotificationPage: async ({ page }, use) => {
    await use(new EmailNotificationPage(page));
  },

  myResearchProjectsPage: async ({ page }, use) => {
    await use(new MyResearchProjectsPage(page));
  },

  createProjectRecordPage: async ({ page }, use) => {
    await use(new CreateProjectRecordPage(page));
  },

  projectDetailsIRASPage: async ({ page }, use) => {
    await use(new ProjectDetailsIRASPage(page));
  },

  projectDetailsTitlePage: async ({ page }, use) => {
    await use(new ProjectDetailsTitlePage(page));
  },

  reseachLocationsPage: async ({ page }, use) => {
    await use(new ReseachLocationsPage(page));
  },

  keyProjectRolesPage: async ({ page }, use) => {
    await use(new KeyProjectRolesPage(page));
  },

  reviewYourApplicationPage: async ({ page }, use) => {
    await use(new ReviewYourApplicationPage(page));
  },

  systemAdministrationPage: async ({ page }, use) => {
    await use(new SystemAdministrationPage(page));
  },

  createUserProfilePage: async ({ page }, use) => {
    await use(new CreateUserProfilePage(page));
  },

  manageUsersPage: async ({ page }, use) => {
    await use(new ManageUsersPage(page));
  },

  createUserProfileConfirmationPage: async ({ page }, use) => {
    await use(new CreateUserProfileConfirmationPage(page));
  },

  checkCreateUserProfilePage: async ({ page }, use) => {
    await use(new CheckCreateUserProfilePage(page));
  },

  userProfilePage: async ({ page }, use) => {
    await use(new UserProfilePage(page));
  },

  editUserProfilePage: async ({ page }, use) => {
    await use(new EditUserProfilePage(page));
  },

  confirmationPage: async ({ page }, use) => {
    await use(new ConfirmationPage(page));
  },

  manageReviewBodiesPage: async ({ page }, use) => {
    await use(new ManageReviewBodiesPage(page));
  },

  createReviewBodyPage: async ({ page }, use) => {
    await use(new CreateReviewBodyPage(page));
  },

  checkCreateReviewBodyPage: async ({ page }, use) => {
    await use(new CheckCreateReviewBodyPage(page));
  },

  createReviewBodyConfirmationPage: async ({ page }, use) => {
    await use(new CreateReviewBodyConfirmationPage(page));
  },

  reviewBodyProfilePage: async ({ page }, use) => {
    await use(new ReviewBodyProfilePage(page));
  },

  editReviewBodyPage: async ({ page }, use) => {
    await use(new EditReviewBodyPage(page));
  },

  auditHistoryReviewBodyPage: async ({ page }, use) => {
    await use(new AuditHistoryReviewBodyPage(page));
  },

  makeAxeBuilder: async ({ page }, use) => {
    const makeAxeBuilder = () => new AxeBuilder({ page });
    await use(makeAxeBuilder);
  },

  //Set the Storage State based on User Tag from Feature File
  storageState: async ({ $tags, storageState }, use) => {
    if ($tags.includes('@adminUser')) {
      storageState = getAuthState('adminUser');
    }
    await use(storageState);
  },

  channel: async ({ channel }, use) => {
    if (`${process.env.BROWSER?.toLowerCase()}` == 'microsoft edge') {
      channel = 'msedge';
    } else if (`${process.env.BROWSER?.toLowerCase()}` == 'google chrome') {
      channel = 'chrome';
    }
    await use(channel);
  },

  //Attach relevant ticket links to each scenario in test report
  $beforeEach: async ({ $tags, $testInfo }, use) => {
    const tickets = getTicketReferenceTags($tags);
    if (tickets.length > 0) {
      $testInfo.attach('Ticket Reference:', { body: tickets.toString().replace(/,/g, '') });
    }
    await use();
  },

  //Enable JavaScript in the BrowserContext for applicable, tagged scenarios
  javaScriptEnabled: async ({ $tags, javaScriptEnabled }, use) => {
    if ($tags.includes('@jsEnabled')) {
      javaScriptEnabled = true;
    } else if ($tags.includes('@jsDisabled')) {
      javaScriptEnabled = false;
    }
    await use(javaScriptEnabled);
  },
});

export { expect } from '@playwright/test';
