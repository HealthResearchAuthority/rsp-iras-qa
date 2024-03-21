// import { test as setup, expect } from '@playwright/test';
import { test as setup } from '../../src/hooks/CustomFixtures'
const authSponsorContactFile = 'auth-storage-states/sponsorContact.json'
const authContactManagerFile = 'auth-storage-states/contactManager.json'

setup(
  'Authenticate the Sponsor Contact User',
  async ({ commonItemsPage, loginPage, studiesPage, page }) => {
    await commonItemsPage.goto()
    // await signedOutPage.assertOnSignedOutPage()
    // await signedOutPage.btnSignIn.click()
    await loginPage.assertOnLoginPage()
    await loginPage.loginWithUserCreds('NPM')
    // await loginPage.page.pause()
    await studiesPage.assertOnStudiesPage()
    await page.context().storageState({ path: authSponsorContactFile })
  }
)

// setup(
//   'Authenticate the Contact Manager User',
//   async ({ commonItemsPage, loginPage, organisationsPage, page }) => {
//     await commonItemsPage.goto()
//     await signedOutPage.assertOnSignedOutPage()
//     await signedOutPage.btnSignIn.click()
//     await loginPage.assertOnLoginPage()
//     await loginPage.loginWithUserCreds('Contact Manager')
//     await organisationsPage.assertOnOrganisationsPage()
//     await page.context().storageState({ path: authContactManagerFile })
//   }
// )
