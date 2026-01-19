import { expect, Locator, Page } from '@playwright/test';
import * as myOrganisationsEditUserProfilePageTestData from '../../../../resources/test_data/iras/reviewResearch/sponsorWorkspace/my_organisations_edit_user_profile_page_data.json';

//Declare Page Objects
export default class MyOrganisationsEditUserProfilePage {
  readonly page: Page;
  readonly myOrganisationsEditUserProfilePageTestData: typeof myOrganisationsEditUserProfilePageTestData;
  readonly page_heading: Locator;
  readonly main_page_content: Locator;
  readonly profile_heading: Locator;
  readonly title_label: Locator;
  readonly title_row: Locator;
  readonly title_value: Locator;
  readonly first_name_label: Locator;
  readonly first_name_row: Locator;
  readonly first_name_value: Locator;
  readonly last_name_label: Locator;
  readonly last_name_row: Locator;
  readonly last_name_value: Locator;
  readonly email_label: Locator;
  readonly email_row: Locator;
  readonly email_value: Locator;
  readonly telephone_label: Locator;
  readonly telephone_row: Locator;
  readonly telephone_value: Locator;
  readonly organisation_label: Locator;
  readonly organisation_row: Locator;
  readonly organisation_value: Locator;
  readonly job_title_label: Locator;
  readonly job_title_row: Locator;
  readonly job_title_value: Locator;
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

    this.title_label = this.page
      .getByRole('cell')
      .getByText(
        this.myOrganisationsEditUserProfilePageTestData.My_Organisations_Edit_User_Profile_Page.Row_Labels.title_label,
        { exact: true }
      );
    this.title_row = this.page.getByRole('row').filter({ has: this.title_label });
    this.title_value = this.title_row.getByRole('cell').nth(1);
    this.first_name_label = this.page
      .getByRole('cell')
      .getByText(
        this.myOrganisationsEditUserProfilePageTestData.My_Organisations_Edit_User_Profile_Page.Row_Labels
          .first_name_label,
        { exact: true }
      );
    this.first_name_row = this.page.getByRole('row').filter({ has: this.first_name_label });
    this.first_name_value = this.first_name_row.getByRole('cell').nth(1);
    this.last_name_label = this.page
      .getByRole('cell')
      .getByText(
        this.myOrganisationsEditUserProfilePageTestData.My_Organisations_Edit_User_Profile_Page.Row_Labels
          .last_name_label,
        { exact: true }
      );
    this.last_name_row = this.page.getByRole('row').filter({ has: this.last_name_label });
    this.last_name_value = this.last_name_row.getByRole('cell').nth(1);
    this.email_label = this.page
      .getByRole('cell')
      .getByText(
        this.myOrganisationsEditUserProfilePageTestData.My_Organisations_Edit_User_Profile_Page.Row_Labels.email_label,
        { exact: true }
      );
    this.email_row = this.page.getByRole('row').filter({ has: this.email_label });
    this.email_value = this.email_row.getByRole('cell').nth(1);
    this.telephone_label = this.page
      .getByRole('cell')
      .getByText(
        this.myOrganisationsEditUserProfilePageTestData.My_Organisations_Edit_User_Profile_Page.Row_Labels
          .telephone_label,
        { exact: true }
      );
    this.telephone_row = this.page.getByRole('row').filter({ has: this.telephone_label });
    this.telephone_value = this.telephone_row.getByRole('cell').nth(1);
    this.organisation_label = this.page
      .getByRole('cell')
      .getByText(
        this.myOrganisationsEditUserProfilePageTestData.My_Organisations_Edit_User_Profile_Page.Row_Labels
          .organisation_label,
        { exact: true }
      );
    this.organisation_row = this.page.getByRole('row').filter({ has: this.organisation_label });
    this.organisation_value = this.organisation_row.getByRole('cell').nth(1);
    this.job_title_label = this.page
      .getByRole('cell')
      .getByText(
        this.myOrganisationsEditUserProfilePageTestData.My_Organisations_Edit_User_Profile_Page.Row_Labels
          .job_title_label,
        { exact: true }
      );
    this.job_title_row = this.page.getByRole('row').filter({ has: this.job_title_label });
    this.job_title_value = this.job_title_row.getByRole('cell').nth(1);

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
