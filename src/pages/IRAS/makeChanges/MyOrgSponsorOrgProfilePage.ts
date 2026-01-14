import { expect, Locator, Page } from '@playwright/test';
import * as myOrgSponsorOrgProfilePageTestData from '../../../resources/test_data/iras/make_changes/my_org_sponsor_org_profile_page_data.json';
import * as linkTextData from '../../../resources/test_data/common/link_text_data.json';

//Declare Page Objects
export default class MyOrgSponsorOrgProfilePage {
  readonly page: Page;
  readonly myOrgSponsorOrgProfilePageTestData: typeof myOrgSponsorOrgProfilePageTestData;
  readonly linkTextData: typeof linkTextData;
  private _org_name: string;
  private _rtsId: string;
  readonly pageHeading: Locator;
  readonly pageLabel: Locator;
  readonly activeTab: Locator;

  //Initialize Page Objects
  constructor(page: Page) {
    this.page = page;
    this.myOrgSponsorOrgProfilePageTestData = myOrgSponsorOrgProfilePageTestData;
    this.linkTextData = linkTextData;
    this._org_name = '';
    this._rtsId = '';

    //Locators
    this.pageHeading = this.page.getByRole('heading');
    this.pageLabel = this.page.getByText(
      this.myOrgSponsorOrgProfilePageTestData.My_Org_SponsorOrg_Profile_Page.pageLabel,
      {
        exact: true,
      }
    );
    this.activeTab = this.page.locator('li.govuk-service-navigation__item--active');
  }

  //Getters & Setters for Private Variables
  async getOrgName(): Promise<string> {
    return this._org_name;
  }

  async setOrgName(value: string): Promise<void> {
    this._org_name = value;
  }

  async getRtsId(): Promise<string> {
    return this._rtsId;
  }

  async setRtsId(value: string): Promise<void> {
    this._rtsId = value;
  }

  //Page Methods
  async goto(rtsId: string) {
    await this.page.goto(`sponsorworkspace/myorganisationprofile?rtsId=${rtsId}`);
  }

  async assertOnMyOrgSponsorOrgProfilePage(expSponOrgName: string) {
    await expect.soft(this.pageLabel).toBeVisible();
    await expect.soft(this.pageHeading.getByText(expSponOrgName)).toBeVisible();
  }
}
