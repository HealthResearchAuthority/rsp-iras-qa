import { expect, Locator, Page } from '@playwright/test';
import * as checkAddUserSponsorOrgPageTestData from '../../../../../resources/test_data/iras/reviewResearch/userAdministration/manageSponsorOrgs/check_add_user_sponsor_organisation_page_data.json';

//Declare Page Objects
export default class CheckAddUserSponsorOrganisationPage {
  readonly page: Page;
  readonly checkAddUserSponsorOrgPageTestData: typeof checkAddUserSponsorOrgPageTestData;
  private _user_email: string;
  readonly page_heading: Locator;
  readonly page_guidance_text: Locator;
  readonly user_details_table: Locator;
  readonly user_details_table_labels: Locator;
  readonly user_details_table_row: Locator;
  readonly user_first_name_row: Locator;
  readonly user_first_name_value: Locator;
  readonly user_last_name_row: Locator;
  readonly user_last_name_value: Locator;
  readonly user_email_row: Locator;
  readonly user_email_value: Locator;
  readonly mainPageContent: Locator;

  //Initialize Page Objects
  constructor(page: Page) {
    this.page = page;
    this.checkAddUserSponsorOrgPageTestData = checkAddUserSponsorOrgPageTestData;
    this._user_email = '';

    //Locators
    this.mainPageContent = this.page.getByTestId('main-content');
    this.page_heading = this.page
      .getByRole('heading')
      .getByText(this.checkAddUserSponsorOrgPageTestData.Check_Add_User_Sponsor_Organisation_Page.page_heading, {
        exact: true,
      });
    this.page_guidance_text = this.mainPageContent.getByRole('paragraph');
    this.user_details_table = this.page.getByRole('table').locator('tbody');
    this.user_details_table_labels = this.user_details_table.getByRole('cell').locator('b');
    this.user_details_table_row = this.user_details_table.getByRole('row');
    this.user_first_name_row = this.user_details_table_row.filter({
      hasText:
        this.checkAddUserSponsorOrgPageTestData.Check_Add_User_Sponsor_Organisation_Page.user_details_table_labels[1],
    });
    this.user_first_name_value = this.user_first_name_row.getByRole('cell').nth(1);
    this.user_last_name_row = this.user_details_table_row.filter({
      hasText:
        this.checkAddUserSponsorOrgPageTestData.Check_Add_User_Sponsor_Organisation_Page.user_details_table_labels[2],
    });
    this.user_last_name_value = this.user_last_name_row.getByRole('cell').nth(1);
    this.user_email_row = this.user_details_table_row.filter({
      hasText:
        this.checkAddUserSponsorOrgPageTestData.Check_Add_User_Sponsor_Organisation_Page.user_details_table_labels[3],
    });
    this.user_email_value = this.user_email_row.getByRole('cell').nth(1);
  }
  //Getters & Setters for Private Variables

  async getUserEmail(): Promise<string> {
    return this._user_email;
  }
  async setUserEmail(value: string): Promise<void> {
    this._user_email = value;
  }

  async assertOnCheckAddUserSponsorOrganisationPage() {
    // this will be uncommented when KNOWN_DEFECT-RSP-5531 is fixed
    // expect
    //   .soft(await this.page.title())
    //   .toBe(this.checkAddUserSponsorOrgPageTestData.Check_Add_User_Sponsor_Organisation_Page.title);
    await expect.soft(this.page_heading).toBeVisible();
    // await expect.soft(this.page_guidance_text).toBeVisible();
    await expect
      .soft(this.mainPageContent.getByRole('paragraph'))
      .toContainText(
        this.checkAddUserSponsorOrgPageTestData.Check_Add_User_Sponsor_Organisation_Page.page_guidance_prefix_text
      );
  }
}
