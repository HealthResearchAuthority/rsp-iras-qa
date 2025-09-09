import { expect, Locator, Page } from '@playwright/test';
import * as selectStudywideReviewerPageData from '../../../../resources/test_data/iras/reviewResearch/receiveAmendments/select_studywide_reviewer_page_data.json';
import * as buttonTextData from '../../../../resources/test_data/common/button_text_data.json';
import * as linkTextData from '../../../../resources/test_data/common/link_text_data.json';

//Declare Page Objects
export default class SelectStudyWideReviewerPage {
  readonly page: Page;
  readonly selectStudywideReviewerPageData: typeof selectStudywideReviewerPageData;
  readonly buttonTextData: typeof buttonTextData;
  readonly linkTextData: typeof linkTextData;
  readonly page_heading: Locator;

  //Initialize Page Objects
  constructor(page: Page) {
    this.page = page;
    this.selectStudywideReviewerPageData = selectStudywideReviewerPageData;
    this.linkTextData = linkTextData;
    this.buttonTextData = buttonTextData;

    //Locators
    this.page_heading = this.page
      .getByRole('heading')
      .getByText(this.selectStudywideReviewerPageData.Select_Study_Wide_Reviewer_Page.page_heading);
  }

  //Page Methods
  async goto() {
    await this.page.goto('');
  }

  async assertOnSelectStudyWideReviewerPage() {
    await expect(this.page_heading).toBeVisible();
    await this.page.waitForLoadState('domcontentloaded');
    expect(await this.page.title()).toBe(this.selectStudywideReviewerPageData.Select_Study_Wide_Reviewer_Page.title);
  }
}
