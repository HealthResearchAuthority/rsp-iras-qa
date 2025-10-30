import { expect, Locator, Page } from '@playwright/test';
import * as manageSponsorOrganisationsPageTestData from '../../../../../resources/test_data/iras/reviewResearch/userAdministration/manageSponsorOrgs/manage_sponsor_organisations_page_data.json';
import * as linkTextData from '../../../../../resources/test_data/common/link_text_data.json';
import CheckSetupSponsorOrganisationPage from './CheckSetupSponsorOrganisationPage';
import CommonItemsPage from '../../../../Common/CommonItemsPage';

//Declare Page Objects
export default class ManageSponsorOrganisationsPage {
  readonly page: Page;
  readonly manageSponsorOrganisationsPageTestData: typeof manageSponsorOrganisationsPageTestData;
  private _row_val: Locator;
  readonly linkTextData: typeof linkTextData;
  readonly pageHeading: Locator;
  readonly addNewReviewBodyRecordLink: Locator;
  readonly mainPageContent: Locator;
  readonly review_bodies_list_rows: Locator;
  readonly organisation_name_from_list: Locator;
  readonly status_from_list: Locator;
  readonly actionsLink: Locator;
  readonly statusCell: Locator;
  readonly orgListRows: Locator;
  readonly no_results_heading: Locator;
  readonly no_results_guidance_text: Locator;
  readonly listRows: Locator;
  readonly listCell: Locator;
  readonly next_button: Locator;
  readonly tableRows: Locator;
  readonly country_checkbox: Locator;
  readonly status_radio: Locator;
  readonly country_checkbox_chevron: Locator;
  readonly status_radio_chevron: Locator;
  readonly country_hint_label: Locator;
  readonly country_selected_hint_label: Locator;
  readonly status_hint_label: Locator;
  readonly review_body_search_text: Locator;
  readonly search_hint_text: Locator;
  readonly sponsor_organisation_added_success_message_header_text: Locator;
  readonly sponsor_organisation_added_success_message_text: Locator;
  readonly sponsor_organisation_disabled_success_message_header_text: Locator;
  readonly sponsor_organisation_disabled_success_message_text: Locator;
  readonly sponsor_organisation_enabled_success_message_header_text: Locator;
  readonly sponsor_organisation_enabled_success_message_text: Locator;
  readonly information_alert_banner: Locator;

  //Initialize Page Objects
  constructor(page: Page) {
    this.page = page;
    this.manageSponsorOrganisationsPageTestData = manageSponsorOrganisationsPageTestData;
    this.linkTextData = linkTextData;

    //Locators
    this.pageHeading = this.page
      .getByRole('heading')
      .getByText(this.manageSponsorOrganisationsPageTestData.Manage_Sponsor_Organisations_Page.heading);
    this.mainPageContent = this.page.getByTestId('main-content');
    this.addNewReviewBodyRecordLink = this.mainPageContent.getByText(
      this.linkTextData.Manage_Review_Bodies_Page.Add_New_Review_Body_Record,
      {
        exact: true,
      }
    );
    this.review_bodies_list_rows = this.page.locator('table tbody tr');
    this.organisation_name_from_list = this.page.locator('td:nth-child(1)');
    this.status_from_list = this.page.locator('td:nth-child(3)');
    this.actionsLink = this.page
      .getByRole('link')
      .getByText(this.manageSponsorOrganisationsPageTestData.Manage_Sponsor_Organisations_Page.actions_link, {
        exact: true,
      });
    this.statusCell = this.page.getByRole('cell').nth(2);
    this.orgListRows = this.page.getByRole('table').getByRole('row');
    this.listRows = this.page.locator('tbody').getByRole('row');
    this.listCell = this.page.getByRole('cell');
    this.next_button = this.page.locator('.govuk-pagination__next a');
    this.tableRows = this.page.getByRole('table').getByRole('row');
    this.country_checkbox_chevron = this.page
      .getByRole('heading', { level: 2 })
      .getByText(this.manageSponsorOrganisationsPageTestData.Manage_Sponsor_Organisations_Page.country_label, {
        exact: true,
      });
    this.status_radio_chevron = this.page
      .getByRole('heading', { level: 2 })
      .getByText(this.manageSponsorOrganisationsPageTestData.Manage_Sponsor_Organisations_Page.status_label, {
        exact: true,
      });
    this.country_checkbox = page.getByRole('checkbox');
    this.status_radio = page.getByRole('radio');
    this.page.getByRole('checkbox');
    this.country_selected_hint_label = page.getByTestId('country-hint');
    this.country_hint_label = page.getByTestId('Search.Country');
    this.status_hint_label = page.getByTestId('Search.Status');
    this.review_body_search_text = this.page.getByLabel(
      this.manageSponsorOrganisationsPageTestData.Manage_Sponsor_Organisations_Page
        .sponsor_organisation_search_box_label,
      {
        exact: true,
      }
    );
    this.search_hint_text = this.page.getByText(
      this.manageSponsorOrganisationsPageTestData.Manage_Sponsor_Organisations_Page.search_hint_text
    );
    this.sponsor_organisation_added_success_message_header_text = this.page
      .getByTestId('govuk-notification-banner-title')
      .getByText(
        this.manageSponsorOrganisationsPageTestData.Manage_Sponsor_Organisations_Page
          .sponsor_organisation_added_success_message_header_text
      );
    this.sponsor_organisation_added_success_message_text = this.page
      .getByRole('heading')
      .getByText(
        this.manageSponsorOrganisationsPageTestData.Manage_Sponsor_Organisations_Page
          .sponsor_organisation_added_success_message_text
      );
    this.information_alert_banner = this.page.getByRole('alert');
    this.sponsor_organisation_disabled_success_message_header_text = this.page
      .getByTestId('govuk-notification-banner-title')
      .getByText(
        this.manageSponsorOrganisationsPageTestData.Manage_Sponsor_Organisations_Page
          .sponsor_organisation_disabled_success_message_header_text
      );
    this.sponsor_organisation_disabled_success_message_text = this.page
      .getByRole('heading')
      .getByText(
        this.manageSponsorOrganisationsPageTestData.Manage_Sponsor_Organisations_Page
          .sponsor_organisation_disabled_success_message_text
      );
    this.sponsor_organisation_enabled_success_message_header_text = this.page
      .getByTestId('govuk-notification-banner-title')
      .getByText(
        this.manageSponsorOrganisationsPageTestData.Manage_Sponsor_Organisations_Page
          .sponsor_organisation_enabled_success_message_header_text
      );
    this.sponsor_organisation_enabled_success_message_text = this.page
      .getByRole('heading')
      .getByText(
        this.manageSponsorOrganisationsPageTestData.Manage_Sponsor_Organisations_Page
          .sponsor_organisation_enabled_success_message_text
      );
  }

  //Getters & Setters for Private Variables

  async getSponsorOrgRow(): Promise<Locator> {
    return this._row_val;
  }

  async setSponsorOrgRow(value: Locator): Promise<void> {
    this._row_val = value;
  }

  //Page Methods

  async goto() {
    await this.page.goto('sponsororganisations');
  }
  async assertOnManageSponsorOrganisationsPage() {
    await expect.soft(this.pageHeading).toBeVisible();
    expect
      .soft(await this.page.title())
      .toBe(this.manageSponsorOrganisationsPageTestData.Manage_Sponsor_Organisations_Page.title);
    await expect.soft(this.search_hint_text).toBeVisible();
  }

  async getSponsorStatus(status: string) {
    if (status.toLowerCase() == 'disabled') {
      return this.manageSponsorOrganisationsPageTestData.Manage_Sponsor_Organisations_Page.disabled_status;
    } else {
      return this.manageSponsorOrganisationsPageTestData.Manage_Sponsor_Organisations_Page.enabled_status;
    }
  }

  async getSponsorOrgName(
    inputType: string,
    checkSetupSponsorOrganisationPage: CheckSetupSponsorOrganisationPage,
    commonItemsPage: CommonItemsPage
  ): Promise<string> {
    let sponsorOrgName: string;
    switch (inputType) {
      case 'previously added sponsor organisation':
        sponsorOrgName = await commonItemsPage.getSearchKey();
        break;
      case 'newly added sponsor organisation':
        sponsorOrgName = await checkSetupSponsorOrganisationPage.getOrgName();
        break;
      default:
        sponsorOrgName = inputType;
    }
    return sponsorOrgName;
  }

  async findSponsorOrg(commonItemsPage: CommonItemsPage, sponsorOrgName: string, sponsorOrgStatus?: string) {
    let hasNextPage = true;
    while (hasNextPage) {
      const rows = await this.listRows.all();
      for (const row of rows) {
        const match = await this.isMatchingRow(commonItemsPage, row, sponsorOrgName, sponsorOrgStatus);
        if (match) {
          return row;
        }
      }
      hasNextPage = await commonItemsPage.shouldGoToNextPage();
      if (hasNextPage) {
        await commonItemsPage.goToNextPage();
      }
    }
    throw new Error(`No matching record found`);
  }
  async isMatchingRow(
    commonItemsPage: CommonItemsPage,
    row: any,
    sponsorOrgName: string,
    sponsorOrgStatus?: string
  ): Promise<boolean> {
    if (sponsorOrgName === 'QA Automation') {
      const columns = await row.locator(this.listCell).allTextContents();
      return columns[0].trim().includes(sponsorOrgName) && columns[2].trim() === sponsorOrgStatus;
    } else {
      const searchRecord = await commonItemsPage.buildSearchRecord(sponsorOrgName, sponsorOrgStatus);
      const fullRowData = await commonItemsPage.getRowData(row, sponsorOrgStatus);
      return fullRowData === searchRecord;
    }
  }
}
