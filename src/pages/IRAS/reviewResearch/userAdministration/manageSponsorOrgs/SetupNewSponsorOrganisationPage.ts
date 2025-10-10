import { expect, Locator, Page } from '@playwright/test';
import * as setupNewSponsorOrganisationPageTestData from '../../../../../resources/test_data/iras/reviewResearch/userAdministration/manageSponsorOrgs/setup_new_sponsor_organisation_page_data.json';
import * as linkTextData from '../../../../../resources/test_data/common/link_text_data.json';
import CommonItemsPage from '../../../../Common/CommonItemsPage';

//Declare Page Objects
export default class SetupNewSponsorOrganisationPage {
  readonly page: Page;
  readonly setupNewSponsorOrganisationPageTestData: typeof setupNewSponsorOrganisationPageTestData;
  private _org_name: string[];
  private _row_val: Locator;
  private _unique_org_name: string;
  readonly linkTextData: typeof linkTextData;
  readonly pageHeading: Locator;
  readonly select_a_sponsor_organisation_label: Locator;
  readonly select_a_sponsor_organisation_hint_text: Locator;
  readonly sponsor_organisation_text: Locator;
  readonly sponsor_organisation_jsenabled_text: Locator;

  //Initialize Page Objects
  constructor(page: Page) {
    this.page = page;
    this.setupNewSponsorOrganisationPageTestData = setupNewSponsorOrganisationPageTestData;
    this.linkTextData = linkTextData;
    this._org_name = [];
    this._unique_org_name = '';

    //Locators
    this.pageHeading = this.page
      .getByRole('heading')
      .getByText(this.setupNewSponsorOrganisationPageTestData.Setup_New_Sponsor_Organisation_Page.page_heading);
    this.select_a_sponsor_organisation_label = this.page.getByText(
      this.setupNewSponsorOrganisationPageTestData.Setup_New_Sponsor_Organisation_Page
        .select_a_sponsor_organisation_label
    );
    // this.select_a_sponsor_organisation_hint_text = this.page.getByText(
    //   this.setupNewSponsorOrganisationPageTestData.Setup_New_Sponsor_Organisation_Page
    //     .select_a_sponsor_organisation_hint_text
    // );
    this.sponsor_organisation_jsenabled_text = this.page.getByRole('combobox', {
      name: this.setupNewSponsorOrganisationPageTestData.Setup_New_Sponsor_Organisation_Page
        .select_a_sponsor_organisation_hint_text,
    });
    this.sponsor_organisation_text = this.page.getByRole('textbox', {
      name: this.setupNewSponsorOrganisationPageTestData.Setup_New_Sponsor_Organisation_Page
        .select_a_sponsor_organisation_hint_text,
    });
  }

  //Getters & Setters for Private Variables

  async getOrgName(): Promise<string[]> {
    return this._org_name;
  }

  async setOrgName(value: string[]): Promise<void> {
    this._org_name = value;
  }

  async getReviewBodyRow(): Promise<Locator> {
    return this._row_val;
  }

  async setReviewBodyRow(value: Locator): Promise<void> {
    this._row_val = value;
  }

  async getUniqueOrgName(): Promise<string> {
    return this._unique_org_name;
  }

  async setUniqueOrgName(value: string): Promise<void> {
    this._unique_org_name = value;
  }

  //Page Methods

  async goto() {
    await this.page.goto('');
  }
  async assertOnSetupNewSponsorOrganisationsPage() {
    await expect(this.pageHeading).toBeVisible();
    expect
      .soft(await this.page.title())
      .toBe(this.setupNewSponsorOrganisationPageTestData.Setup_New_Sponsor_Organisation_Page.title); // Temporarily commented out due to title mismatch
    await expect.soft(this.select_a_sponsor_organisation_label).toBeVisible();
    // await expect.soft(this.select_a_sponsor_organisation_hint_text).toBeVisible();
  }
  async selectSponsorOrgJsDisabled<PageObject>(
    dataset: JSON,
    key: string,
    commonItemsPage: CommonItemsPage,
    page: PageObject
  ) {
    await commonItemsPage.fillUIComponent(dataset, key, page);
    await commonItemsPage.govUkButton.getByText('Search').click();
    // await this.sponsor_organisation_jsdisabled_search_button.click();
    await this.page.waitForTimeout(2000);
    if (dataset[key] !== '') {
      await this.page.getByRole('radio').first().click();
      // this.sponsor_organisation_jsdisabled_search_results_radio_button =
      // this.sponsor_organisation_fieldset.getByRole('radio');
      // await this.sponsor_organisation_jsdisabled_search_results_radio_button.first().click();
    }
  }
}
