import { expect, Locator, Page } from '@playwright/test';
import * as sponsorWorkspacePageTestData from '../../../resources/test_data/iras/make_changes/sponsor_workspace_page_data.json';
import * as linkTextTestData from '../../../resources/test_data/common/link_text_data.json';

//Declare Page Objects
export default class SponsorWorkspacePage {
  readonly page: Page;
  readonly sponsorWorkspacePageTestData: typeof sponsorWorkspacePageTestData;
  readonly mainPageContent: Locator;
  readonly pageHeading: Locator;
  readonly myOrganisationsLink: Locator;

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
  async goto() {
    await this.page.goto('sponsorworkspace');
  }

  async assertOnSponsorWorkspacePage() {
    await expect.soft(this.pageHeading).toBeVisible();
  }

  async getMyOrganisationsLink(linkNameText: string): Promise<Locator> {
    const linkName = linkTextTestData.Sponsor_Workspace_Page[linkNameText];
    const link = this.page.getByRole('link', { name: linkName });
    await link.waitFor({ state: 'attached', timeout: 3000 }).catch(() => {});
    return link;
  }
}
