import { expect, Locator, Page } from '@playwright/test';
import * as mySponsorOrgAddUserPageTestData from '../../../../resources/test_data/iras/reviewResearch/sponsorWorkspace/my_organisations_add_user_page_data.json';
import * as commonTestData from '../../../../resources/test_data/common/common_data.json';
import CommonItemsPage from '../../../Common/CommonItemsPage';
import LoginPage from '../../../Common/LoginPage';

//Declare Page Objects
export default class MyOrganisationsAddUserPage {
  readonly page: Page;
  readonly mySponsorOrgAddUserPageTestData: typeof mySponsorOrgAddUserPageTestData;
  readonly commonTestData: typeof commonTestData;
  readonly page_heading: Locator;
  readonly page_caption: Locator;
  readonly mainPageContent: Locator;
  readonly email_address_text: Locator;
  readonly non_registered_user_error_heading: Locator;
  readonly banner: Locator;
  readonly banner_heading: Locator;
  readonly auditHistoryTableHeader: Locator;
  readonly auditHistoryTableBodyRows: Locator;
  readonly tableCell: Locator;
  readonly auditHistoryRecord: {
    sponsorOrgEventDescriptionExpected: string;
    userEmailExpected: string;
    dateTimeOfEventExpected: string;
  }[] = [];

  //Initialize Page Objects
  constructor(page: Page) {
    this.page = page;
    this.mySponsorOrgAddUserPageTestData = mySponsorOrgAddUserPageTestData;
    this.commonTestData = commonTestData;

    //Locators
    this.mainPageContent = this.page.getByTestId('main-content');
    this.page_caption = this.mainPageContent.locator('div.govuk-caption-l');
    this.page_heading = this.mainPageContent.getByRole('heading', { level: 1 });
    this.email_address_text = this.mainPageContent.getByRole('textbox', {
      name: mySponsorOrgAddUserPageTestData.My_Organisations_Add_User_Page.email_search_box_label,
    });
    this.non_registered_user_error_heading = this.page
      .getByRole('heading')
      .getByText(this.mySponsorOrgAddUserPageTestData.My_Organisations_Add_User_Page.non_registered_user_error_heading);
    this.banner = this.page.getByRole('alert');
    this.banner_heading = this.banner.getByRole('heading', {
      level: 2,
      name: mySponsorOrgAddUserPageTestData.My_Organisations_Add_User_Page.Error_Validation.User_Exists_Message
        .banner_heading,
    });
    this.auditHistoryTableHeader = this.page.locator('.govuk-table-users').locator('tr th');
    this.auditHistoryTableBodyRows = this.page.locator('.govuk-table__row');
    this.tableCell = this.page.locator('td');
  }

  async goto(): Promise<void> {
    this.page.goto('');
  }

  set addAuditHistoryRecord(record: {
    sponsorOrgEventDescriptionExpected: string;
    userEmailExpected: string;
    dateTimeOfEventExpected: string;
  }) {
    this.auditHistoryRecord.push(record);
  }

  get getAuditHistoryRecord() {
    return this.auditHistoryRecord;
  }

  async assertOnMySponsorOrgAddUsersPage(sponsor_organisation: string): Promise<void> {
    await expect
      .soft(this.page_caption)
      .toHaveText(this.mySponsorOrgAddUserPageTestData.My_Organisations_Add_User_Page.page_caption);
    await expect
      .soft(
        this.mainPageContent.getByRole('heading', {
          name:
            this.mySponsorOrgAddUserPageTestData.My_Organisations_Add_User_Page.heading_prefix_label +
            sponsor_organisation,
        })
      )
      .toBeVisible();
    await expect
      .soft(
        this.mainPageContent.getByText(
          this.mySponsorOrgAddUserPageTestData.My_Organisations_Add_User_Page.email_text_box_prefix_hint_text +
            sponsor_organisation
        )
      )
      .toBeVisible();
    await expect.soft(this.email_address_text).toBeVisible();
  }

  async assertOnNonRegisteredUserErrorPage(error_message: string): Promise<void> {
    if (error_message === 'Non_Registered_User_Error') {
      await expect.soft(this.non_registered_user_error_heading).toBeVisible();
    } else {
      throw new Error(`Error message "${error_message}" is not recognized.`);
    }
  }

  async toLower(s: string): Promise<string> {
    return s?.toLowerCase?.() ?? s;
  }

  async formatDate(now: Date, sep: string): Promise<string> {
    const date = new Intl.DateTimeFormat('en-GB', {
      day: '2-digit',
      month: 'short',
      year: 'numeric',
    }).format(now);

    const time = new Intl.DateTimeFormat('en-GB', {
      hour: '2-digit',
      minute: '2-digit',
      hour12: false,
    }).format(now);

    return sep === 'space' ? `${date} ${time}` : `${date} at ${time}`;
  }

  async dateSeparatorForWorkspace(workspaceKey: string): Promise<string> {
    return workspaceKey === 'manage_sponsor_org_system_admin_workspace' ? 'space' : 'at';
  }

  async resolveUserEmailLogin(
    loginPage: LoginPage,
    commonItemsPage: CommonItemsPage,
    userDatasetName: string
  ): Promise<string> {
    const name = await this.toLower(userDatasetName);

    if (name !== 'blank_user_details' && name !== 'non_registered_user') {
      return loginPage.loginPageTestData[userDatasetName].username.toLowerCase();
    }

    if (name === 'non_registered_user') {
      return (await commonItemsPage.getFirstUserEmail()).toLowerCase();
    }

    return '';
  }

  async buildAuditHistoryRecord(
    loginPage: LoginPage,
    commonItemsPage: CommonItemsPage,
    eventDescriptionDatasetName: string,
    userDatasetName: string,
    targetUser: string,
    workspaceKey?: string
  ) {
    const eventText =
      this.mySponsorOrgAddUserPageTestData.My_Organisations_Add_User_Page.Audit_History_Events[
        eventDescriptionDatasetName
      ];

    const userEmailLogin = await this.resolveUserEmailLogin(loginPage, commonItemsPage, userDatasetName);

    const userEmail = loginPage.loginPageTestData[targetUser].username.toLowerCase();

    const eventDescription = userEmailLogin + eventText;

    const now = new Date();
    const sep = await this.dateSeparatorForWorkspace(workspaceKey);
    const dateTimeOfEvent = await this.formatDate(now, sep);

    return {
      dateTimeOfEventExpected: dateTimeOfEvent,
      sponsorOrgEventDescriptionExpected: eventDescription,
      userEmailExpected: userEmail,
    };
  }
}
