import { expect, Locator, Page } from '@playwright/test';
import * as checkConfirmAddUserSponsorOrgPageTestData from '../../../../resources/test_data/iras/reviewResearch/sponsorWorkspace/check_and_confirm_add_user_sponsor_organisation_page_data.json';
import { confirmStringNotNull } from '../../../../utils/UtilFunctions';

//Declare Page Objects
export default class CheckConfirmUserToAddToSponsorOrganisationPage {
  readonly page: Page;
  readonly checkConfirmAddUserSponsorOrgPageTestData: typeof checkConfirmAddUserSponsorOrgPageTestData;
  private _user_email: string;
  readonly page_heading: Locator;
  readonly page_guidance_text: Locator;
  readonly user_details_table: Locator;
  readonly user_details_table_labels: Locator;
  readonly user_details_table_row: Locator;
  // readonly user_title_row: Locator;
  // readonly user_title_value: Locator;
  // readonly user_first_name_row: Locator;
  // readonly user_first_name_value: Locator;
  // readonly user_last_name_row: Locator;
  // readonly user_last_name_value: Locator;
  readonly user_email_row: Locator;
  readonly user_email_value: Locator;
  readonly mainPageContent: Locator;
  // readonly user_telephone_row: Locator;
  // readonly user_telephone_value: Locator;
  // readonly user_organisation_row: Locator;
  // readonly user_organisation_value: Locator;
  // readonly user_job_title_row: Locator;
  // readonly user_job_title_value: Locator;
  readonly user_role_row: Locator;
  readonly user_role_value: Locator;
  readonly user_authoriser_row: Locator;
  readonly user_authoriser_value: Locator;
  readonly page_caption: Locator;

  //Initialize Page Objects
  constructor(page: Page) {
    this.page = page;
    this.checkConfirmAddUserSponsorOrgPageTestData = checkConfirmAddUserSponsorOrgPageTestData;
    this._user_email = '';

    //Locators
    this.mainPageContent = this.page.getByTestId('main-content');
    this.page_caption = this.mainPageContent
      .locator('div.govuk-caption-l')
      .or(this.mainPageContent.locator('div.govuk-label'));
    this.page_heading = this.page
      .getByRole('heading')
      .getByText(
        this.checkConfirmAddUserSponsorOrgPageTestData.Check_And_Confirm_User_To_Add_To_Sponsor_Organisation_Page
          .page_heading,
        {
          exact: true,
        }
      );
    this.page_guidance_text = this.mainPageContent
      .getByRole('paragraph')
      .or(this.mainPageContent.locator('label.govuk-label'));
    this.user_details_table = this.page.getByRole('table').locator('tbody');
    this.user_details_table_labels = this.user_details_table.getByRole('cell').locator('b');
    this.user_details_table_row = this.user_details_table.getByRole('row');

    // this.user_title_row = this.user_details_table_row.filter({
    //   hasText:
    //     this.checkConfirmAddUserSponsorOrgPageTestData.Check_And_Confirm_User_To_Add_To_Sponsor_Organisation_Page
    //       .user_details_table_labels[0],
    // });
    // this.user_title_value = this.user_title_row.getByRole('cell').nth(1);
    // this.user_first_name_row = this.user_details_table_row.filter({
    //   hasText:
    //     this.checkConfirmAddUserSponsorOrgPageTestData.Check_And_Confirm_User_To_Add_To_Sponsor_Organisation_Page
    //       .user_details_table_labels[1],
    // });
    // this.user_first_name_value = this.user_first_name_row.getByRole('cell').nth(1);
    // this.user_last_name_row = this.user_details_table_row.filter({
    //   hasText:
    //     this.checkConfirmAddUserSponsorOrgPageTestData.Check_And_Confirm_User_To_Add_To_Sponsor_Organisation_Page
    //       .user_details_table_labels[2],
    // });
    // this.user_last_name_value = this.user_last_name_row.getByRole('cell').nth(1);
    this.user_email_row = this.user_details_table_row.filter({
      hasText:
        this.checkConfirmAddUserSponsorOrgPageTestData.Check_And_Confirm_User_To_Add_To_Sponsor_Organisation_Page
          .user_details_table_labels[0],
    });
    this.user_email_value = this.user_email_row.getByRole('cell').nth(1);
    // this.user_telephone_row = this.user_details_table_row.filter({
    //   hasText:
    //     this.checkConfirmAddUserSponsorOrgPageTestData.Check_And_Confirm_User_To_Add_To_Sponsor_Organisation_Page
    //       .user_details_table_labels[4],
    // });
    // this.user_telephone_value = this.user_telephone_row.getByRole('cell').nth(1);
    // this.user_organisation_row = this.user_details_table_row.filter({
    //   hasText:
    //     this.checkConfirmAddUserSponsorOrgPageTestData.Check_And_Confirm_User_To_Add_To_Sponsor_Organisation_Page
    //       .user_details_table_labels[5],
    // });
    // this.user_organisation_value = this.user_organisation_row.getByRole('cell').nth(1);
    // this.user_job_title_row = this.user_details_table_row.filter({
    //   hasText:
    //     this.checkConfirmAddUserSponsorOrgPageTestData.Check_And_Confirm_User_To_Add_To_Sponsor_Organisation_Page
    //       .user_details_table_labels[6],
    // });
    // this.user_job_title_value = this.user_job_title_row.getByRole('cell').nth(1);
    this.user_role_row = this.user_details_table_row.filter({
      hasText:
        this.checkConfirmAddUserSponsorOrgPageTestData.Check_And_Confirm_User_To_Add_To_Sponsor_Organisation_Page
          .user_details_table_labels[1],
    });
    this.user_role_value = this.user_role_row.getByRole('cell').nth(1);
    this.user_authoriser_row = this.user_details_table_row.filter({
      hasText:
        this.checkConfirmAddUserSponsorOrgPageTestData.Check_And_Confirm_User_To_Add_To_Sponsor_Organisation_Page
          .user_details_table_labels[2],
    });
    this.user_authoriser_value = this.user_authoriser_row.getByRole('cell').nth(1);
  }
  //Getters & Setters for Private Variables

  async getUserEmail(): Promise<string> {
    return this._user_email;
  }
  async setUserEmail(value: string): Promise<void> {
    this._user_email = value;
  }

  async assertOnCheckConfirmUserSponsorOrganisationPage() {
    // this will be uncommented when KNOWN_DEFECT-RSP-5531 is fixed
    // expect
    //   .soft(await this.page.title())
    //   .toBe(this.checkAddUserSponsorOrgPageTestData.Check_And_Confirm_User_To_Add_To_Sponsor_Organisation_Page.title);
    await expect
      .soft(this.page_caption)
      .toHaveText(
        this.checkConfirmAddUserSponsorOrgPageTestData.Check_And_Confirm_User_To_Add_To_Sponsor_Organisation_Page
          .check_confirm_add_user_role_sponsor_workspace_page_caption
      );
    await expect.soft(this.page_heading).toBeVisible();
    // await expect.soft(this.page_guidance_text).toBeVisible();
    await expect
      .soft(this.page_guidance_text)
      .toContainText(
        this.checkConfirmAddUserSponsorOrgPageTestData.Check_And_Confirm_User_To_Add_To_Sponsor_Organisation_Page
          .page_guidance_prefix_text
      );
    await this.setUserEmail(confirmStringNotNull(await this.user_email_value.textContent()));
  }
}
