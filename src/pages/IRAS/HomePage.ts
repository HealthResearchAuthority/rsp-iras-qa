import { expect, Locator, Page } from '@playwright/test';
import * as homePageTestData from '../../resources/test_data/iras/home_page_data.json';
import * as buttonTextData from '../../resources/test_data/common/button_text_data.json';
import * as linkTextData from '../../resources/test_data/common/link_text_data.json';
import { confirmStringNotNull } from '../../utils/UtilFunctions';

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
  readonly myWorkspacesHeading: Locator;
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
  readonly approvals_hint_label: Locator;
  readonly cag_members_hint_label: Locator;
  readonly cat_hint_label: Locator;
  readonly memeber_management_hint_label: Locator;
  readonly my_research_hint_label: Locator;
  readonly rec_members_hint_label: Locator;
  readonly sponsor_hint_label: Locator;
  readonly system_administration_hint_label: Locator;
  readonly technical_assurance_hint_label: Locator;
  readonly technical_assurance_reviewers_hint_label: Locator;
  readonly workspaceLinks: Locator;

  //Initialize Page Objects
  constructor(page: Page) {
    this.page = page;
    this.homePageTestData = homePageTestData;
    this.buttonTextData = buttonTextData;
    this.linkTextData = linkTextData;

    //Locators
    this.mainPageContent = this.page.getByTestId('main-content');
    this.pageHeading = this.page.getByRole('heading').getByText(this.homePageTestData.Home_Page.heading);
    this.projectGuidanceText = this.page
      .getByRole('paragraph')
      .getByText(this.homePageTestData.Home_Page.guidance_text);
    this.myWorkspacesHeading = this.page
      .getByRole('heading')
      .getByText(this.homePageTestData.Home_Page.workspaceHeading);

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

    this.approvals_hint_label = this.getFollowingParagraphElement(this.approvalsLink);
    this.cag_members_hint_label = this.getFollowingParagraphElement(this.cagMembersLink);
    this.cat_hint_label = this.getFollowingParagraphElement(this.catLink);
    this.memeber_management_hint_label = this.getFollowingParagraphElement(this.memeberManagementLink);
    this.my_research_hint_label = this.getFollowingParagraphElement(this.myResearchLink);
    this.rec_members_hint_label = this.getFollowingParagraphElement(this.recMembersLink);
    this.sponsor_hint_label = this.getFollowingParagraphElement(this.sponsorLink);
    this.system_administration_hint_label = this.getFollowingParagraphElement(this.systemAdministrationLink);
    this.technical_assurance_hint_label = this.getFollowingParagraphElement(this.technicalAssuranceLink);
    this.technical_assurance_reviewers_hint_label = this.getFollowingParagraphElement(
      this.technicalAssuranceReviewersLink
    );
    this.workspaceLinks = this.page.locator('.hra-card').getByRole('link');
  }

  //using method is used to get hint label next to headers
  getFollowingParagraphElement(baseLocator: Locator): Locator {
    return baseLocator.locator('..').locator('p').first();
  }

  //Page Methods
  async goto() {
    await this.page.goto('');
  }

  async assertOnHomePage() {
    await expect(this.pageHeading).toBeVisible();
    await expect(this.myWorkspacesHeading).toBeVisible();
    await expect(this.projectGuidanceText).toBeVisible();
  }

  async getMyWorkspaceLinksNames() {
    const topMenuBarLinksValues: string[] = [];
    for (const val of await this.workspaceLinks.allTextContents()) {
      topMenuBarLinksValues.push(confirmStringNotNull(val));
    }
    return topMenuBarLinksValues;
  }
}
