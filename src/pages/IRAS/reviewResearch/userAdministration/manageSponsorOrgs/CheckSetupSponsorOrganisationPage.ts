import { expect, Locator, Page } from '@playwright/test';
import * as checkSetupSponsorOrganisationProfilePageData from '../../../../../resources/test_data/iras/reviewResearch/userAdministration/manageSponsorOrgs/check_setup_sponsor_organisation_profile_page_data.json';
import * as buttonTextData from '../../../../../resources/test_data/common/button_text_data.json';
import * as linkTextData from '../../../../../resources/test_data/common/link_text_data.json';

//Declare Page Objects
export default class CheckSetupSponsorOrganisationPage {
  readonly page: Page;
  readonly checkSetupSponsorOrganisationProfilePageData: typeof checkSetupSponsorOrganisationProfilePageData;
  readonly buttonTextData: typeof buttonTextData;
  readonly linkTextData: typeof linkTextData;
  private _org_name: string;
  private _country: string;
  readonly page_heading: Locator;
  readonly guidance_text: Locator;
  readonly row_value_locator: Locator;
  readonly organisation_name_row: Locator;
  readonly organisation_name_value: Locator;
  readonly country_row: Locator;
  readonly country_value: Locator;

  //Initialize Page Objects
  constructor(page: Page) {
    this.page = page;
    this.checkSetupSponsorOrganisationProfilePageData = checkSetupSponsorOrganisationProfilePageData;
    this.buttonTextData = buttonTextData;
    this.linkTextData = linkTextData;
    this._org_name = '';
    this._country = '';

    //Locators
    this.page_heading = this.page
      .getByRole('heading')
      .getByText(
        this.checkSetupSponsorOrganisationProfilePageData.Check_Setup_Sponsor_Organisation_profile_Page.heading,
        { exact: true }
      );
    this.guidance_text = this.page
      .getByRole('paragraph')
      .getByText(
        this.checkSetupSponsorOrganisationProfilePageData.Check_Setup_Sponsor_Organisation_profile_Page.guidance_text,
        { exact: true }
      );
    this.row_value_locator = this.page.locator('input');
    this.organisation_name_row = this.page.locator('tr', {
      has: this.page
        .getByRole('cell')
        .getByText(
          this.checkSetupSponsorOrganisationProfilePageData.Check_Setup_Sponsor_Organisation_profile_Page
            .organisation_name_label,
          {
            exact: true,
          }
        ),
    });
    this.organisation_name_value = this.organisation_name_row.locator('td', { has: this.row_value_locator });
    this.country_row = this.page.locator('tr', {
      has: this.page
        .getByRole('cell')
        .getByText(
          this.checkSetupSponsorOrganisationProfilePageData.Check_Setup_Sponsor_Organisation_profile_Page.country_label,
          {
            exact: true,
          }
        ),
    });
    this.country_value = this.country_row.locator('td', { has: this.row_value_locator });
  }

  //Getters & Setters for Private Variables
  async getOrgName(): Promise<string> {
    return this._org_name;
  }

  async setOrgName(value: string): Promise<void> {
    this._org_name = value;
  }

  async getCountry(): Promise<string> {
    return this._country;
  }

  async setCountry(value: string): Promise<void> {
    this._country = value;
  }

  //Page Methods
  async goto() {
    await this.page.goto('');
  }

  async assertOnCheckSetupSponsorOrganisationPage() {
    await expect.soft(this.page_heading).toBeVisible();
    await expect.soft(this.guidance_text).toBeVisible();
    expect
      .soft(await this.page.title())
      .toBe(this.checkSetupSponsorOrganisationProfilePageData.Check_Setup_Sponsor_Organisation_profile_Page.title);
  }
}
