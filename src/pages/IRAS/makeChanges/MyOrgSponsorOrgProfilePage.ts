import { expect, Locator, Page } from '@playwright/test';
import * as myOrgSponsorOrgProfilePageTestData from '../../../resources/test_data/iras/make_changes/my_org_sponsor_org_profile_page_data.json';

//Declare Page Objects
export default class MyOrgSponsorOrgProfilePage {
  readonly page: Page;
  readonly myOrgSponsorOrgProfilePageTestData: typeof myOrgSponsorOrgProfilePageTestData;
  readonly myOrgSponsorOrgProfilePage: typeof MyOrgSponsorOrgProfilePage;
  readonly pageHeading: Locator;
  readonly pageLabel: Locator;

  //Initialize Page Objects
  constructor(page: Page) {
    this.page = page;
    this.myOrgSponsorOrgProfilePageTestData = myOrgSponsorOrgProfilePageTestData;

    //Locators
    this.pageHeading = this.page.getByRole('heading');
    this.pageLabel = this.page
      .getByRole('generic')
      .getByText(this.myOrgSponsorOrgProfilePageTestData.My_Org_SponsorOrg_Profile_Page.pageLabel);
  }

  //Page Methods
  async assertOnMyOrgSponsorOrgProfilePage(expSponOrgName) {
    await expect
      .soft(
        this.page.getByText(this.myOrgSponsorOrgProfilePageTestData.My_Org_SponsorOrg_Profile_Page.pageLabel, {
          exact: true,
        })
      )
      .toBeVisible();
    await expect.soft(this.pageHeading.getByText(expSponOrgName)).toBeVisible();
  }
}
