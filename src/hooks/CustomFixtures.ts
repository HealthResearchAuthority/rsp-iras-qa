import { test as base } from '@playwright/test'

import CommonItemsPage from '../pages/CommonItemsPage'
import LoginPage from '../pages/LoginPage'
import StudiesPage from '../pages/StudiesPage'

type CustomFixtures = {
  commonItemsPage: CommonItemsPage
  loginPage: LoginPage
  studiesPage: StudiesPage
}

export const test = base.extend<CustomFixtures>({
  commonItemsPage: async ({ page }, use) => {
    await use(new CommonItemsPage(page))
  },

  loginPage: async ({ page }, use) => {
    await use(new LoginPage(page))
  },

  studiesPage: async ({ page }, use) => {
    await use(new StudiesPage(page))
  }
})

export { expect } from '@playwright/test'