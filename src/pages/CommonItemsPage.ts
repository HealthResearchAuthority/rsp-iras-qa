import { expect, Locator, Page } from '@playwright/test'
// import { confirmStringNotNull, numDaysBetween } from '../utils/UtilFunctions'
// import { seDatabaseReq } from '../utils/DbRequests'

//Declare Page Objects
export default class CommonItemsPage {
  readonly page: Page
  readonly pageTitle: Locator
  readonly txtUsageGuidance: Locator
  readonly txtContactInfo: Locator
  readonly homeIcon: Locator
  readonly manageContactsIcon: Locator
  readonly assessStudiesDropdown: Locator
  readonly studiesFoundHeading: Locator
  readonly txtGenericErrorGuidance: Locator
  readonly requestSupportSection: Locator
  readonly requestSupportHeader: Locator
  readonly requestSupportText: Locator
  readonly requestSupportButton: Locator
  readonly usernameBanner: Locator
  readonly cogIcon: Locator
  readonly logoutOption: Locator

  //Initialize Page Objects
  constructor(page: Page) {
    this.page = page

    //Locators
    this.pageTitle = page.locator('h2[class="govuk-heading-l"]')
    this.txtUsageGuidance = page.locator('p[class="govuk-body"]').nth(0)
    this.txtContactInfo = page.locator('p[class="govuk-body"]').nth(1)
  }

  //Page Methods
  async goto() {
    await this.page.goto('Index')
  }

  async assertOnHomePageNoAccount() {
    await expect(this.pageTitle).toBeVisible()
    await expect(this.txtUsageGuidance).toBeVisible()
    await expect(this.txtContactInfo).toBeVisible()
    await expect(this.pageTitle).toHaveText('Your details are not associated with any account on this application')
    await expect(this.txtUsageGuidance).toHaveText(
      'The Sponsor Engagement Tool is for use by project sponsors or their delegates in CRO/CTU organisations only.'
    )
    await expect(this.txtContactInfo).toHaveText('Please contact supportmystudy@nihr.ac.uk for further assistance.')
    await expect(this.page).toHaveURL('')
  }
}
