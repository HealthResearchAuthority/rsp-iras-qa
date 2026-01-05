import { expect, Locator, Page } from '@playwright/test';
import * as myOrgSponsorOrgProfilePageTestData from '../../../resources/test_data/iras/make_changes/my_org_sponsor_org_profile_page_data.json';
import * as linkTextData from '../../../resources/test_data/common/link_text_data.json';

//Declare Page Objects
export default class MyOrgSponsorOrgProfilePage {
  readonly page: Page;
  readonly myOrgSponsorOrgProfilePageTestData: typeof myOrgSponsorOrgProfilePageTestData;
  readonly myOrgSponsorOrgProfilePage: typeof MyOrgSponsorOrgProfilePage;
  readonly linkTextData: typeof linkTextData;
  readonly mainPageContent: Locator;
  readonly pageHeading: Locator;

  //Initialize Page Objects
  constructor(page: Page) {
    this.page = page;
    this.myOrgSponsorOrgProfilePageTestData = myOrgSponsorOrgProfilePageTestData;

    //Locators
    this.mainPageContent = this.page.getByTestId('main-content');
    this.pageHeading = this.page
      .getByRole('heading')
      .getByText(this.myOrgSponsorOrgProfilePageTestData.My_Org_SponsorOrg_Profile_Page.pageHeading);
  }

  //Page Methods
  async assertOnMyOrgSponsorOrgProfilePage() {
    await expect.soft(this.pageHeading).toBeVisible();
  }
}
