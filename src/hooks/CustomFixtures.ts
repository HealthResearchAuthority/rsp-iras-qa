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
import { readdirSync } from 'fs';
import * as userProfileGeneratedataConfig from '../resources/test_data/user_administration/testdata_generator/user_profile_generate_data_config.json';

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

  //Attach relevant ticket links to each scenario in test report
  $before: async ({ $tags, $testInfo }, use) => {
    const tickets = getTicketReferenceTags($tags);
    if (tickets.length > 0) {
      $testInfo.attach('Ticket Reference:', { body: tickets.toString().replace(/,/g, '') });
    }
    if ($tags.includes('@testdata')) {
      const files = readdirSync('src/resources/test_data/user_administration/testdata_generator/results/');
      const jsonPath = userProfileGeneratedataConfig.JSON_Properties['json_path'];
      const jsonPath_faker = userProfileGeneratedataConfig.JSON_Properties['json_path_faker'];
      if (files.length > 0) {
        $testInfo.attach('User Attributes test data generated using Faker library:', {
          path: jsonPath_faker,
          contentType: 'text/plain',
        });

        $testInfo.attach('User Attributes test data generated using regular expression:', {
          path: jsonPath,
          contentType: 'text/plain',
        });
      }
    }
    await use();
  },
});

export { expect } from '@playwright/test';
