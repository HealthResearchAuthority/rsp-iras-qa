import { expect, Locator, Page } from '@playwright/test';
import * as sponsorWorkspacePageTestData from '../../../resources/test_data/iras/make_changes/sponsor_workspace_page_data.json';

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

  async getColumnIndex(columnName: string): Promise<number> {
    let columnIndex: number;
    switch (columnName.toLowerCase()) {
      case 'modification id':
        columnIndex = 0;
        break;
      case 'short project title':
        columnIndex = 1;
        break;
      case 'date received':
        columnIndex = 2;
        break;
      case 'date actioned':
        columnIndex = 3;
        break;
      case 'chief investigator':
        columnIndex = 4;
        break;
      case 'status':
        columnIndex = 5;
        break;
      default:
        throw new Error(`${columnName} is not a valid option`);
    }
    return columnIndex;
  }
}
