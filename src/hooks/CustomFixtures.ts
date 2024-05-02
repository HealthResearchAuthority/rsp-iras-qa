import { test as base } from 'playwright-bdd';
import { getAuthState } from '../utils/UtilFunctions';

import CommonItemsPage from '../pages/CommonItemsPage';
import LoginPage from '../pages/LoginPage';
import TasksPage from '../pages/TasksPage';
import ProjectDetailsPage from '../pages/ProjectDetailsPage';

type CustomFixtures = {
  commonItemsPage: CommonItemsPage;
  loginPage: LoginPage;
  tasksPage: TasksPage;
  projectDetailsPage: ProjectDetailsPage;
}

export const test = base.extend<CustomFixtures>({
  commonItemsPage: async ({ page }, use) => {
    await use(new CommonItemsPage(page));
  },

  loginPage: async ({ page }, use) => {
    await use(new LoginPage(page));
  },

  tasksPage: async ({ page }, use) => {
    await use(new TasksPage(page));
  },

  projectDetailsPage: async ({ page }, use) => {
    await use(new ProjectDetailsPage(page));
  },

  //Set the Storage State based on User Tag from Feature File
  storageState: async ({ $tags, storageState }, use) => {
    if ($tags.includes('@pocUser')) {
      storageState = getAuthState('POC');
    }
    await use(storageState);
  }
});

export { expect } from '@playwright/test';