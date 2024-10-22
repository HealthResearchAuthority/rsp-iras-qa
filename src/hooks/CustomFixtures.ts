import { test as base } from 'playwright-bdd';
import AxeBuilder from '@axe-core/playwright';
import { getAuthState, getTicketReferenceTags } from '../utils/UtilFunctions';
import CommonItemsPage from '../pages/Common/CommonItemsPage';
import LoginPage from '../pages/Common/LoginPage';
import HomePage from '../pages/IRAS/HomePage';
import ProjectFilterPage from '../pages/IRAS/ProjectFilterPage';
import ProjectDetailsPage from '../pages/IRAS/ProjectDetailsPage';
import StudentPage from '../pages/IRAS/StudentPage';
import DevicesPage from '../pages/IRAS/DevicesPage';
import TissuePage from '../pages/IRAS/TissuePage';
import CreateApplicationPage from '../pages/IRAS/CreateApplicationPage';
import ProceedApplicationPage from '../pages/IRAS/ProceedApplicationPage';

type CustomFixtures = {
  commonItemsPage: CommonItemsPage;
  loginPage: LoginPage;
  homePage: HomePage;
  projectFilterPage: ProjectFilterPage;
  projectDetailsPage: ProjectDetailsPage;
  studentPage: StudentPage;
  devicesPage: DevicesPage;
  tissuePage: TissuePage;
  createApplicationPage: CreateApplicationPage;
  proceedApplicationPage: ProceedApplicationPage;
  makeAxeBuilder: () => AxeBuilder;
};

export const test = base.extend<CustomFixtures>({
  commonItemsPage: async ({ page }, use) => {
    await use(new CommonItemsPage(page));
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
    await use();
  },
});
export { expect } from '@playwright/test';
