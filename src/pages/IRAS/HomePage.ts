import { expect, Locator, Page } from '@playwright/test';
import * as homePageTestData from '../../resources/test_data/iras/home_page_data.json';
import * as buttonTextData from '../../resources/test_data/common/button_text_data.json';
import * as linkTextData from '../../resources/test_data/common/link_text_data.json';

//Declare Page Objects
export default class HomePage {
  readonly page: Page;
  readonly homePageTestData: typeof homePageTestData;
  readonly buttonTextData: typeof buttonTextData;
  readonly linkTextData: typeof linkTextData;
  readonly mainPageContent: Locator;
  readonly pageHeading: Locator;
  readonly loginBtn: Locator;
  readonly myApplicationsLink: Locator;
  readonly boldGuidanceText: Locator;

  //Initialize Page Objects
  constructor(page: Page) {
    this.page = page;
    this.homePageTestData = homePageTestData;
    this.buttonTextData = buttonTextData;
    this.linkTextData = linkTextData;

    //Locators
    this.mainPageContent = this.page.getByTestId('main-content');
    this.pageHeading = this.page.getByTestId('title');
    this.loginBtn = this.page
      .locator('.gem-c-button')
      .and(this.page.getByText(this.buttonTextData.Home_Page.Login, { exact: true }));
    this.myApplicationsLink = this.mainPageContent.getByText(this.linkTextData.Home_Page.My_Applications, {
      exact: true,
    });
    this.boldGuidanceText = this.mainPageContent
      .getByRole('strong')
      .getByText(this.homePageTestData.Home_Page.bold_guidance_text, {
        exact: true,
      });
  }

  //Page Methods
  async goto() {
    await this.page.goto('');
  }

  async assertOnHomePage() {
    // await expect(this.pageHeading).toBeVisible();
    // await expect(this.pageHeading).toHaveText(this.homePageTestData.Home_Page.heading);
    // await expect(this.myApplicationsLink).toBeVisible();
    await expect(this.boldGuidanceText).toBeVisible();
    expect(await this.page.title()).toBe(this.homePageTestData.Home_Page.title);
  }
}
