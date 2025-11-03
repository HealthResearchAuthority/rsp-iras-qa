import { expect, Locator, Page } from '@playwright/test';
import * as searchAddUserSonsorOrgPageTestData from '../../../../../resources/test_data/iras/reviewResearch/userAdministration/manageSponsorOrgs/search_add_a_new_user_sponsor_organisation_page_data.json';
import * as linkTextData from '../../../../../resources/test_data/common/link_text_data.json';

//Declare Page Objects
export default class SearchAddUserSponsorOrganisationPage {
  readonly page: Page;
  readonly searchAddUserSonsorOrgPageTestData: typeof searchAddUserSonsorOrgPageTestData;
  readonly linkTextData: typeof linkTextData;
  readonly page_heading: Locator;
  readonly page_description: Locator;
  readonly search_guidance_text: Locator;
  readonly search_input_text: Locator;

  //Initialize Page Objects
  constructor(page: Page) {
    this.page = page;
    this.searchAddUserSonsorOrgPageTestData = searchAddUserSonsorOrgPageTestData;
    this.linkTextData = linkTextData;

    //Locators
    this.page_heading = this.page
      .getByRole('heading')
      .getByText(this.searchAddUserSonsorOrgPageTestData.Add_A_New_User_Page.page_heading, {
        exact: true,
      });
    this.page_description = this.page
      .getByRole('paragraph')
      .getByText(this.searchAddUserSonsorOrgPageTestData.Add_A_New_User_Page.page_description, {
        exact: true,
      });
    this.search_guidance_text = this.page.getByText(
      this.searchAddUserSonsorOrgPageTestData.Add_A_New_User_Page.search_guidance_text,
      {
        exact: true,
      }
    );
    this.search_input_text = this.page.getByRole('textbox', {
      name: this.searchAddUserSonsorOrgPageTestData.Add_A_New_User_Page.search_input_label,
    });
  }

  async assertOnSearchAddUserSponsorOrganisationPage() {
    // expect.soft(await this.page.title()).toBe(this.searchAddUserSonsorOrgPageTestData.Add_A_New_User_Page.title);
    await expect.soft(this.page_heading).toBeVisible();
    await expect.soft(this.page_description).toBeVisible();
    await expect.soft(this.search_guidance_text).toBeVisible();
    await expect.soft(this.search_input_text).toBeVisible();
  }
}
