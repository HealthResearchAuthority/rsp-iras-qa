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
  }

  //Page Methods

  async goto() {
    await this.page.goto('');
  }
  async assertOnSetupNewSponsorOrganisationsPage() {
    await expect.soft(this.pageHeading).toBeVisible();
    expect
      .soft(await this.page.title())
      .toBe(this.setupNewSponsorOrganisationPageTestData.Setup_New_Sponsor_Organisation_Page.title);
  }
  async selectSponsorOrgJsDisabled(dataset: JSON | Record<string, any>, key: string, commonItemsPage: CommonItemsPage) {
    await commonItemsPage.fillUIComponent(dataset, key, commonItemsPage);
    await commonItemsPage.govUkButton.getByText('Search').click();
    await this.page.waitForTimeout(2000);
    if (dataset[key] !== '') {
      await this.page.getByRole('radio').first().click();
    }
  }
}
