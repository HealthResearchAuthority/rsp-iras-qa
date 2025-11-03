import { expect, Locator, Page } from '@playwright/test';
import * as reviewBodyProfilePageData from '../../../../../resources/test_data/iras/reviewResearch/userAdministration/manageReviewBodies/review_body_profile_page_data.json';
import * as reviewBodySqlData from '../../../../../resources/test_data/iras/reviewResearch/userAdministration/manageReviewBodies/review_body_sql_data.json';
import * as buttonTextData from '../../../../../resources/test_data/common/button_text_data.json';
import * as linkTextData from '../../../../../resources/test_data/common/link_text_data.json';
import * as dbConfigData from '../../../../../resources/test_data/common/database/db_config_data.json';
import { connect } from '../../../../../utils/DbConfig';
import { IResult } from 'mssql';

//Declare Page Objects
export default class ReviewBodyProfilePage {
  readonly page: Page;
  readonly reviewBodyProfilePageData: typeof reviewBodyProfilePageData;
  readonly reviewBodySqlData: typeof reviewBodySqlData;
  readonly buttonTextData: typeof buttonTextData;
  readonly linkTextData: typeof linkTextData;
  readonly dbConfigData: typeof dbConfigData;
  private _org_name: string;
  private _countries: string[];
  private _email_address: string;
  private _description: string;
  private _new_org_name: string;
  private _new_countries: string[];
  private _new_email_address: string;
  private _new_description: string;
  private _last_updated_date: string;
  private _review_body_id: string;
  readonly back_link: Locator;
  readonly page_heading: Locator;
  readonly row_value_locator: Locator;
  readonly row_change_link_locator: Locator;
  readonly organisation_name_row: Locator;
  readonly organisation_name_value: Locator;
  readonly organisation_name_change_link: Locator;
  readonly country_row: Locator;
  readonly country_value: Locator;
  readonly country_change_link: Locator;
  readonly email_address_row: Locator;
  readonly email_address_value: Locator;
  readonly email_address_change_link: Locator;
  readonly description_row: Locator;
  readonly description_value: Locator;
  readonly description_change_link: Locator;
  readonly create_profile_btn: Locator;
  readonly users_row: Locator;
  readonly users_change_link: Locator;
  readonly row_view_this_review_body_list_of_users_link_locator: Locator;
  readonly view_this_review_body_list_of_users_link: Locator;
  readonly row_view_this_review_body_audit_history_link: Locator;
  readonly view_this_review_body_audit_history_link: Locator;
  readonly audit_row: Locator;
  readonly last_updated_row: Locator;
  readonly last_updated_value: Locator;
  readonly disable_sub_heading: Locator;
  readonly disable_guidance_text: Locator;
  readonly disable_button: Locator;
  readonly enable_button: Locator;
  readonly enable_sub_heading: Locator;
  readonly enable_guidance_text: Locator;

  //Initialize Page Objects
  constructor(page: Page) {
    this.page = page;
    this.reviewBodyProfilePageData = reviewBodyProfilePageData;
    this.reviewBodySqlData = reviewBodySqlData;
    this.buttonTextData = buttonTextData;
    this.linkTextData = linkTextData;
    this.dbConfigData = dbConfigData;
    this._org_name = '';
    this._countries = [];
    this._email_address = '';
    this._description = '';
    this._last_updated_date = '';
    this._new_org_name = '';
    this._new_countries = [];
    this._new_email_address = '';
    this._new_description = '';
    this._last_updated_date = '';
    this._review_body_id = '';

    //Locators
    this.page_heading = this.page
      .getByRole('heading')
      .getByText(this.reviewBodyProfilePageData.Review_Body_Profile_Page.heading_prefix_label);
    this.back_link = this.page
      .getByRole('link')
      .getByText(this.reviewBodyProfilePageData.Review_Body_Profile_Page.back_link);
    this.row_value_locator = this.page.locator('input');
    this.row_change_link_locator = this.page
      .getByRole('cell')
      .getByText(this.linkTextData.Check_Create_Review_Body_Page.Change, { exact: true });

    this.row_view_this_review_body_list_of_users_link_locator = this.page
      .getByRole('cell')
      .getByText(this.linkTextData.Review_Body_Profile_Page.View_This_Review_Body_List_Of_Users, { exact: true });

    this.row_view_this_review_body_audit_history_link = this.page
      .getByRole('cell')
      .getByText(this.linkTextData.Review_Body_Profile_Page.View_This_Review_Body_Audit_History, { exact: true });

    this.organisation_name_row = this.page.locator('tr', {
      has: this.page
        .getByRole('cell')
        .getByText(this.reviewBodyProfilePageData.Review_Body_Profile_Page.organisation_name_label, {
          exact: true,
        }),
    });
    this.organisation_name_value = this.organisation_name_row.locator('td', { has: this.row_value_locator });
    this.organisation_name_change_link = this.organisation_name_row.locator(this.row_change_link_locator);
    this.country_row = this.page.locator('tr', {
      has: this.page
        .getByRole('cell')
        .getByText(this.reviewBodyProfilePageData.Review_Body_Profile_Page.country_label, {
          exact: true,
        }),
    });
    this.country_value = this.country_row.locator('td', { has: this.row_value_locator });
    this.country_change_link = this.country_row.locator(this.row_change_link_locator);
    this.email_address_row = this.page.locator('tr', {
      has: this.page
        .getByRole('cell')
        .getByText(this.reviewBodyProfilePageData.Review_Body_Profile_Page.email_address_label, {
          exact: true,
        }),
    });
    this.email_address_value = this.email_address_row.locator('td', { has: this.row_value_locator });
    this.email_address_change_link = this.email_address_row.locator(this.row_change_link_locator);
    this.description_row = this.page.locator('tr', {
      has: this.page
        .getByRole('cell')
        .getByText(this.reviewBodyProfilePageData.Review_Body_Profile_Page.description_label, {
          exact: true,
        }),
    });
    this.description_value = this.description_row.locator('td', { has: this.row_value_locator });
    this.description_change_link = this.description_row.locator(this.row_change_link_locator);
    this.users_row = this.page.locator('tr', {
      has: this.page.getByRole('cell').getByText(this.reviewBodyProfilePageData.Review_Body_Profile_Page.users_label, {
        exact: true,
      }),
    });
    this.view_this_review_body_list_of_users_link = this.users_row.locator(
      this.row_view_this_review_body_list_of_users_link_locator
    );
    this.audit_row = this.page.locator('tr', {
      has: this.page.getByRole('cell').getByText(this.reviewBodyProfilePageData.Review_Body_Profile_Page.audit_label, {
        exact: true,
      }),
    });
    this.view_this_review_body_audit_history_link = this.audit_row.locator(
      this.row_view_this_review_body_audit_history_link
    );
    this.last_updated_row = this.page.locator('tr', {
      has: this.page
        .getByRole('cell')
        .getByText(this.reviewBodyProfilePageData.Review_Body_Profile_Page.last_updated_label, {
          exact: true,
        }),
    });
    this.last_updated_value = this.last_updated_row.locator('td', { has: this.row_value_locator });
    this.disable_sub_heading = this.page
      .getByRole('heading')
      .getByText(this.reviewBodyProfilePageData.Review_Body_Profile_Page.disable_sub_heading, { exact: true });
    this.disable_guidance_text = this.page
      .getByRole('paragraph')
      .getByText(this.reviewBodyProfilePageData.Review_Body_Profile_Page.disable_guidance_text, { exact: true });
    this.disable_button = this.page
      .getByRole('button')
      .getByText(this.reviewBodyProfilePageData.Review_Body_Profile_Page.disable_button, { exact: true });
    this.enable_sub_heading = this.page
      .getByRole('heading')
      .getByText(this.reviewBodyProfilePageData.Review_Body_Profile_Page.enable_sub_heading, { exact: true });
    this.enable_guidance_text = this.page
      .getByRole('paragraph')
      .getByText(this.reviewBodyProfilePageData.Review_Body_Profile_Page.enable_guidance_text, { exact: true });
    this.enable_button = this.page
      .getByRole('button')
      .getByText(this.reviewBodyProfilePageData.Review_Body_Profile_Page.enable_button, { exact: true });
  }

  async assertOnReviewbodyProfilePage() {
    await expect(this.page_heading).toBeVisible();
  }

  async goto(reviewBodyId: string) {
    await this.page.goto(`reviewbody/view/${reviewBodyId}`);
  }

  //Getters & Setters for Private Variables
  async getOrgName(): Promise<string> {
    return this._org_name;
  }

  async setOrgName(value: string): Promise<void> {
    this._org_name = value;
  }

  async getCountries(): Promise<string[]> {
    return this._countries;
  }

  async setCountries(value: string[]): Promise<void> {
    this._countries = value;
  }

  async getEmail(): Promise<string> {
    return this._email_address;
  }

  async setEmail(value: string): Promise<void> {
    this._email_address = value;
  }

  async getDescription(): Promise<string> {
    return this._description;
  }

  async setDescription(value: string): Promise<void> {
    this._description = value;
  }
  async getNewOrgName(): Promise<string> {
    return this._new_org_name;
  }

  async setNewOrgName(value: string): Promise<void> {
    this._new_org_name = value;
  }

  async getNewCountries(): Promise<string[]> {
    return this._new_countries;
  }

  async setNewCountries(value: string[]): Promise<void> {
    this._new_countries = value;
  }

  async getNewEmail(): Promise<string> {
    return this._new_email_address;
  }

  async setNewEmail(value: string): Promise<void> {
    this._new_email_address = value;
  }

  async getNewDescription(): Promise<string> {
    return this._new_description;
  }

  async setNewDescription(value: string): Promise<void> {
    this._new_description = value;
  }

  async getLastUpdatedDate(): Promise<string> {
    return this._last_updated_date;
  }

  async setLastUpdatedDate(value: string): Promise<void> {
    this._last_updated_date = value;
  }

  async getReviewBodyId(): Promise<string> {
    return this._review_body_id;
  }

  async setReviewBodyId(value: string): Promise<void> {
    this._review_body_id = value;
  }

  async setAllReviewBodyValues(sqlQueryResult: IResult<any>): Promise<void> {
    console.dir(sqlQueryResult);
    const regex = new RegExp(/[\\[\]\\"]/g);
    await this.setReviewBodyId(sqlQueryResult.recordset[0].Id);
    await this.setOrgName(sqlQueryResult.recordset[0].RegulatoryBodyName);
    await this.setEmail(sqlQueryResult.recordset[0].EmailAddress);
    await this.setCountries(sqlQueryResult.recordset[0].Countries.replace(regex, '').split(','));
    if (sqlQueryResult.recordset[0].Description === null) {
      await this.setDescription('');
    } else {
      await this.setDescription(sqlQueryResult.recordset[0].Description);
    }
    if (sqlQueryResult.recordset[0].UpdatedDate === null) {
      await this.setLastUpdatedDate('');
    } else {
      await this.setLastUpdatedDate(sqlQueryResult.recordset[0].UpdatedDate);
    }
  }

  // SQL STATEMENTS //
  async sqlGetSingleRandomReviewBodyByStatus(status: string): Promise<void> {
    const isActive = this.reviewBodySqlData[status];
    const sqlConnection = await connect(dbConfigData.Application_Service);
    const queryResult = await sqlConnection.query(
      `SELECT TOP 1 * FROM RegulatoryBodies WHERE IsActive = ${isActive} ORDER BY NEWID()`
    );
    await this.setAllReviewBodyValues(queryResult);
    await sqlConnection.close();
  }

  async sqlGetSingleRandomReviewBodyByTypeStatus(inOperator: string, status: string): Promise<void> {
    const isActive = this.reviewBodySqlData[status];
    const engRevBody = this.reviewBodySqlData.Non_Test_Review_Bodies.England;
    const nIRevBody = this.reviewBodySqlData.Non_Test_Review_Bodies.Northern_Ireland;
    const scoRevBody = this.reviewBodySqlData.Non_Test_Review_Bodies.Scotland;
    const walRevBody = this.reviewBodySqlData.Non_Test_Review_Bodies.Wales;
    const sqlConnection = await connect(dbConfigData.Application_Service);
    const queryResult = await sqlConnection.query(
      `SELECT TOP 1 * FROM RegulatoryBodies WHERE IsActive = ${isActive} 
      AND RegulatoryBodyName ${inOperator} ('${engRevBody}', '${nIRevBody}', 
      '${scoRevBody}', '${walRevBody}')
      ORDER BY NEWID()`
    );
    await this.setAllReviewBodyValues(queryResult);
    await sqlConnection.close();
  }
}
