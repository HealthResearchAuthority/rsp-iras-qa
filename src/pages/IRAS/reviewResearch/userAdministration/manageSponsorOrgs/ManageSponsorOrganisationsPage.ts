import { expect, Locator, Page } from '@playwright/test';
import * as manageSponsorOrganisationsPageTestData from '../../../../../resources/test_data/iras/reviewResearch/userAdministration/manageSponsorOrgs/manage_sponsor_organisations_page_data.json';
import * as linkTextData from '../../../../../resources/test_data/common/link_text_data.json';
import CheckSetupSponsorOrganisationPage from './CheckSetupSponsorOrganisationPage';
import CommonItemsPage from '../../../../Common/CommonItemsPage';
import * as dbConfigData from '../../../../../resources/test_data/common/database/db_config_data.json';
import { connect } from '../../../../../utils/DbConfig';
import path from 'node:path';
import * as fse from 'fs-extra';
import { returnDataFromJSON } from '../../../../../utils/UtilFunctions';
const pathToTestDataJson =
  './src/resources/test_data/iras/reviewResearch/userAdministration/manageSponsorOrgs/setup_new_sponsor_organisation_page_data.json';

//Declare Page Objects
export default class ManageSponsorOrganisationsPage {
  readonly page: Page;
  readonly manageSponsorOrganisationsPageTestData: typeof manageSponsorOrganisationsPageTestData;
  private _sponsor_row_val: Locator;
  readonly linkTextData: typeof linkTextData;
  readonly pageHeading: Locator;
  readonly mainPageContent: Locator;
  readonly sponsor_organisation_added_success_message_header_text: Locator;
  readonly sponsor_organisation_added_success_message_text: Locator;
  readonly sponsor_organisation_disabled_success_message_header_text: Locator;
  readonly sponsor_organisation_disabled_success_message_text: Locator;
  readonly sponsor_organisation_enabled_success_message_header_text: Locator;
  readonly sponsor_organisation_enabled_success_message_text: Locator;
  readonly information_alert_banner: Locator;
  readonly listRows: Locator;
  readonly listCell: Locator;
  readonly search_hint_text: Locator;
  readonly actionsLink: Locator;
  readonly search_input_text: Locator;

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
    this.listRows = this.page.locator('tbody').getByRole('row');
    this.listCell = this.page.getByRole('cell');
    this.actionsLink = this.page
      .getByRole('link')
      .getByText(this.manageSponsorOrganisationsPageTestData.Manage_Sponsor_Organisations_Page.actions_link, {
        exact: true,
      });
    this.search_hint_text = this.page.getByText(
      this.manageSponsorOrganisationsPageTestData.Manage_Sponsor_Organisations_Page.search_hint_text
    );
    this.search_input_text = this.page.getByRole('textbox', {
      name: this.manageSponsorOrganisationsPageTestData.Manage_Sponsor_Organisations_Page
        .sponsor_organisation_search_box_label,
    });
    this.sponsor_organisation_added_success_message_header_text = this.page
      .getByRole('heading')
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
      .getByRole('heading')
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
      .getByRole('heading')
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
    return this._sponsor_row_val;
  }

  async setSponsorOrgRow(value: Locator): Promise<void> {
    this._sponsor_row_val = value;
  }

  //Page Methods

  async goto() {
    await this.page.goto('sponsororganisations');
  }
  async assertOnManageSponsorOrganisationsPage() {
    await expect.soft(this.pageHeading).toBeVisible();
    // this will be uncommented when KNOWN_DEFECT-RSP-5531 is fixed
    // expect
    //   .soft(await this.page.title())
    //   .toBe(this.manageSponsorOrganisationsPageTestData.Manage_Sponsor_Organisations_Page.title);
    await expect.soft(this.search_hint_text).toBeVisible();
    await expect.soft(this.search_input_text).toBeVisible();
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

  // SQL STATEMENTS //

  async sqlGetSponsorRtsIds() {
    const sqlConnection = await connect(dbConfigData.Application_Service);
    const queryResult = await sqlConnection.query(
      `SELECT RtsId FROM SponsorOrganisationsUsers GROUP BY RtsId HAVING COUNT(SponsorRole) > 20;`
    );
    await sqlConnection.close();
    return queryResult.recordset.map((row) => row.RtsId);
  }

  async sqlGetOrganisationIdsFromRTS() {
    const sqlConnection = await connect(dbConfigData.Rts_Service);
    const queryResult = await sqlConnection.query(
      `SELECT Org.Id FROM OrganisationRole OrgRole INNER JOIN Organisation Org ON OrgRole.OrganisationId = Org.Id where OrgRole.id = '${manageSponsorOrganisationsPageTestData.Manage_Sponsor_Organisations_Page.clinical_research_sponsor_role_id}' and OrgRole.Status = 'Active'`
    );
    await sqlConnection.close();
    return queryResult.recordset.map((row) => row.Id);
  }

  async sqlGetOrganisationNameFromRTSById(sponsor_id: string) {
    const sqlConnection = await connect(dbConfigData.Rts_Service);
    const queryResult = await sqlConnection.query(`SELECT Name FROM Organisation WHERE Id = '${sponsor_id}'`);
    await sqlConnection.close();
    return queryResult.recordset.map((row) => row.Name);
  }

  async sqlGetOrganisationIdFromRTSByName(sponsor_name: string) {
    const sqlConnection = await connect(dbConfigData.Rts_Service);
    const queryResult = await sqlConnection.query(
      `SELECT Org.Id FROM OrganisationRole OrgRole INNER JOIN Organisation Org ON OrgRole.OrganisationId = Org.Id where OrgRole.id = '${manageSponsorOrganisationsPageTestData.Manage_Sponsor_Organisations_Page.clinical_research_sponsor_role_id}' and Org.Name='${sponsor_name}' and OrgRole.Status = 'Active';`
    );
    await sqlConnection.close();
    return queryResult.recordset.map((row) => row.Id);
  }

  async sqlDeleteSponsorOrgById(rts_id: string): Promise<void> {
    const sqlConnection = await connect(dbConfigData.Application_Service);
    const queryResult = await sqlConnection.query(`SELECT Id FROM SponsorOrganisations WHERE RTSId = '${rts_id}'`);
    if (queryResult.recordset.length > 0) {
      await sqlConnection.query(`DELETE FROM SponsorOrganisations WHERE RtsId = '${rts_id}'`);
      await sqlConnection.query(`DELETE FROM SponsorOrganisationsAuditTrail WHERE RtsId = '${rts_id}'`);
      await sqlConnection.query(`DELETE FROM SponsorOrganisationsUsers WHERE RtsId = '${rts_id}'`);
    }
    await sqlConnection.close();
  }

  async findUnmatchedOrganisations() {
    const sponsorIds = new Set(await this.sqlGetSponsorRtsIds());
    const organisationIds = await this.sqlGetOrganisationIdsFromRTS();
    const unmatched = organisationIds.filter((id) => !sponsorIds.has(id));
    return unmatched[0];
  }

  async findExistingSponsorOrganisations() {
    const sponsorId = new Set(await this.sqlGetSponsorRtsIds()).values().next().value;
    const organisationName = await this.sqlGetOrganisationNameFromRTSById(sponsorId);
    return organisationName[0];
  }

  async saveExistingSponsorOrganisation(existingSponsorOrgName: string) {
    const filePath = path.resolve(pathToTestDataJson);
    await this.updateExistingSponsorOrgNameTestDataJson(filePath, existingSponsorOrgName);
  }

  async updateExistingSponsorOrgNameTestDataJson(filePath: string, updateVal: string) {
    (async () => {
      try {
        const data = await returnDataFromJSON(filePath);
        data.Existing_Sponsor_Organisation.Existing_Sponsor_Organisation_One.sponsor_organisation_text = updateVal;
        await fse.writeJson(filePath, data, { spaces: 2 });
      } catch (error) {
        throw new Error(`${error} Error updating existing sponsor organisation name to testdata json file:`);
      }
    })();
  }
}
