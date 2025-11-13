import { expect, Locator, Page } from '@playwright/test';
import * as sponsorWorkspacePageTestData from '../../../../resources/test_data/iras/reviewResearch/userAdministration/sponsor_workspace_page_data.json';

//Declare Page Objects
export default class SponsorWorkspacePage {
  readonly page: Page;
  readonly sponsorWorkspacePageTestData: typeof sponsorWorkspacePageTestData;
  readonly mainPageContent: Locator;
  readonly pageHeading: Locator;

  //Initialize Page Objects
  constructor(page: Page) {
    this.page = page;
    this.sponsorWorkspacePageTestData = sponsorWorkspacePageTestData;

    //Locators
    this.mainPageContent = this.page.getByTestId('main-content');
    this.pageHeading = this.page
      .getByRole('heading')
      .getByText(this.sponsorWorkspacePageTestData.Sponsor_Workspace_Page.pageHeading);
  }

  //Page Methods
  async assertOnSponsorWorkspacePage() {
    await expect.soft(this.pageHeading).toBeVisible();
  }
}
