import { expect, Locator, Page } from '@playwright/test';
import * as myOrganisationsEditUserProfilePageTestData from '../../../../resources/test_data/iras/reviewResearch/sponsorWorkspace/my_organisations_edit_user_profile_page_data.json';

//Declare Page Objects
export default class MyOrganisationsEditUserProfilePage {
  readonly page: Page;
  readonly myOrganisationsEditUserProfilePageTestData: typeof myOrganisationsEditUserProfilePageTestData;
  readonly page_heading: Locator;
  readonly main_page_content: Locator;
  readonly profile_heading: Locator;
  readonly details_heading: Locator;
  readonly role_fieldset: Locator;
  readonly role_radio: Locator;
  readonly authoriser_fieldset: Locator;
  readonly authoriser_radio: Locator;

  //Initialize Page Objects
  constructor(page: Page) {
    this.page = page;
    this.myOrganisationsEditUserProfilePageTestData = myOrganisationsEditUserProfilePageTestData;

    //Locators
    this.page_heading = this.page
      .getByRole('heading')
      .getByText(this.myOrganisationsEditUserProfilePageTestData.My_Organisations_Edit_User_Profile_Page.page_heading);
    this.main_page_content = this.page.getByTestId('main-content');
    this.profile_heading = this.page
      .getByRole('heading')
      .getByText(
        this.myOrganisationsEditUserProfilePageTestData.My_Organisations_Edit_User_Profile_Page.profile_heading
      );
    this.details_heading = this.page
      .getByRole('heading')
      .getByText(
        this.myOrganisationsEditUserProfilePageTestData.My_Organisations_Edit_User_Profile_Page.details_heading
      );
    this.role_fieldset = this.main_page_content.locator('.govuk-fieldset', {
      hasText: this.myOrganisationsEditUserProfilePageTestData.My_Organisations_Edit_User_Profile_Page.role_label,
    });
    this.role_radio = this.role_fieldset.getByRole('radio');
    this.authoriser_fieldset = this.main_page_content.locator('.govuk-fieldset', {
      hasText: this.myOrganisationsEditUserProfilePageTestData.My_Organisations_Edit_User_Profile_Page.authoriser_label,
    });
    this.authoriser_radio = this.authoriser_fieldset.getByRole('radio');
  }

  //Page Methods

  async assertOnMySponsorOrgEditUserProfilePage(): Promise<void> {
    await expect.soft(this.page_heading).toBeVisible();
    await expect.soft(this.details_heading).toBeVisible();
    await expect.soft(this.profile_heading).toBeVisible();
  }
}
