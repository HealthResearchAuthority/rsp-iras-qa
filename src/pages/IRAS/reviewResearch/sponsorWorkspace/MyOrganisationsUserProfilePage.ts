import { expect, Locator, Page } from '@playwright/test';
import * as myOrganisationsUserProfilePageTestData from '../../../../resources/test_data/iras/reviewResearch/sponsorWorkspace/my_organisations_user_profile_page_data.json';

//Declare Page Objects
export default class MyOrganisationsUserProfilePage {
  readonly page: Page;
  readonly myOrganisationsUserProfilePageTestData: typeof myOrganisationsUserProfilePageTestData;
  readonly page_caption: Locator;

  //Initialize Page Objects
  constructor(page: Page) {
    this.page = page;
    this.myOrganisationsUserProfilePageTestData = myOrganisationsUserProfilePageTestData;

    //Locators
    this.page_caption = this.page.getByText(
      this.myOrganisationsUserProfilePageTestData.My_Organisations_User_Profile_Page.page_caption,
      {
        exact: true,
      }
    );
  }

  async assertOnMySponsorOrgUserProfilePage(): Promise<void> {
    await expect.soft(this.page_caption).toBeVisible();
  }
}
