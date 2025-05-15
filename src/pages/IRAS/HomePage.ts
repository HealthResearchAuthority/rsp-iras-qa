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
  readonly projectGuidanceText: Locator;
  readonly loginBtn: Locator;
  readonly workspacesHeading: Locator;
  readonly approvalsLink: Locator;
  readonly cagMembersLink: Locator;
  readonly catLink: Locator;
  readonly memeberManagementLink: Locator;
  readonly myResearchLink: Locator;
  readonly recMembersLink: Locator;
  readonly sponsorLink: Locator;
  readonly systemAdministrationLink: Locator;
  readonly technicalAssuranceLink: Locator;
  readonly technicalAssuranceReviewersLink: Locator;
  /*  readonly approvalsHintLabel: Locator;
  readonly cagMembersHintLabel: Locator;
  readonly catHintLabel: Locator;
  readonly memeberManagementHintLabel: Locator;
  readonly myResearchHintLabel: Locator;
  readonly recMembersHintLabel: Locator;
  readonly sponsorHintLabel: Locator;
  readonly systemAdministrationHintLabel: Locator;
  readonly technicalAssuranceHintLabel: Locator;
  readonly technicalAssuranceReviewersHintLabel: Locator;
*/
  //Initialize Page Objects
  constructor(page: Page) {
    this.page = page;
    this.homePageTestData = homePageTestData;
    this.buttonTextData = buttonTextData;
    this.linkTextData = linkTextData;

    //Locators
    this.mainPageContent = this.page.getByTestId('main-content');
    this.pageHeading = this.page.getByRole('heading').getByText(this.homePageTestData.Home_Page.heading);
    this.projectGuidanceText = this.page.getByText(this.homePageTestData.Home_Page.guidance_text);

    this.workspacesHeading = this.page.getByRole('heading').getByText(this.homePageTestData.Home_Page.workspaceHeading);

    this.loginBtn = this.page
      .locator('.gem-c-button')
      .and(this.page.getByText(this.buttonTextData.Home_Page.Login, { exact: true }));

    this.approvalsLink = this.page.getByRole('link', { name: 'Approvals', exact: true });
    this.cagMembersLink = this.page.getByRole('link', { name: 'CAG members', exact: true });
    this.catLink = this.page.getByRole('link', { name: 'CAT', exact: true });
    this.memeberManagementLink = this.page.getByRole('link', { name: 'Member management', exact: true });
    this.myResearchLink = this.page.getByRole('link', { name: 'My research', exact: true });
    this.recMembersLink = this.page.getByRole('link', { name: 'REC members', exact: true });
    this.sponsorLink = this.page.getByRole('link', { name: 'Sponsor', exact: true });
    this.systemAdministrationLink = this.page.getByRole('link', { name: 'System administration', exact: true });
    this.technicalAssuranceLink = this.page.getByRole('link', { name: 'Technical Assurance', exact: true });
    this.technicalAssuranceReviewersLink = this.page.getByRole('link', {
      name: 'Technical Assurance reviewers',
      exact: true,
    });
  }

  //using method is used to get hint label next to headers
  getFollowingParagraphElement(baseLocator: Locator): Locator {
    return baseLocator.locator('xpath=following-sibling::p[1]');
  }

  //Page Methods
  async goto() {
    await this.page.goto('');
  }

  async assertOnHomePage() {
    await expect(this.pageHeading).toBeVisible();
    await expect(this.projectGuidanceText).toBeVisible();
  }
}
