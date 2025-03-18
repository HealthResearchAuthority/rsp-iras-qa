import { expect, Locator, Page } from '@playwright/test';
import * as manageReviewBodiesPageData from '../../../../../resources/test_data/iras/reviewResearch/userAdministration/manageReviewBodies/pages/manage_review_body_page_data.json';
import * as linkTextData from '../../../../../resources/test_data/common/link_text_data.json';

//Declare Page Objects
export default class ManageReviewBodiesPage {
  readonly page: Page;
  readonly manageReviewBodiesPageData: typeof manageReviewBodiesPageData;
  readonly linkTextData: typeof linkTextData;
  readonly pageHeading: Locator;
  readonly addNewReviewBodyRecordLink: Locator;
  readonly mainPageContent: Locator;

  //Initialize Page Objects
  constructor(page: Page) {
    this.page = page;
    this.manageReviewBodiesPageData = manageReviewBodiesPageData;

    //Locators
    this.pageHeading = this.page.getByTestId('title');
    this.mainPageContent = this.page.getByTestId('main-content');
    this.addNewReviewBodyRecordLink = this.mainPageContent.getByText(
      this.linkTextData.Manage_Review_Bodies_Page.Add_New_Review_Body_Record,
      {
        exact: true,
      }
    );
  }

  //Page Methods
  async goto() {
    await this.page.goto('application/startnewapplication'); // need to update URL here
  }

  async assertOnManageReviewBodiesPage() {
    //need to update code here
    await expect(this.pageHeading).toBeVisible();
    await expect(this.pageHeading).toHaveText(this.manageReviewBodiesPageData.Manage_Review_Body_Page.heading);
  }
}
