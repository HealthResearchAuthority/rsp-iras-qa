import { expect, Locator, Page } from '@playwright/test';
import * as projectOverviewPageTestData from '../../../resources/test_data/iras/make_changes/project_overview_page_data.json';
import { confirmStringNotNull } from '../../../utils/UtilFunctions';

//Declare Page Objects
export default class ProjectOverviewPage {
  readonly page: Page;
  readonly projectOverviewPageTestData: typeof projectOverviewPageTestData;
  readonly pageHeading: Locator;
  readonly projectStatusTag: Locator;
  readonly project_details_hint_label: Locator;
  readonly project_details_heading: Locator;
  readonly project_short_title_label: Locator;
  readonly modification_saved_success_message_text: Locator;
  readonly modification_saved_success_message_header_text: Locator;
  readonly information_alert_banner: Locator;
  readonly project_overview_heading: Locator;
  readonly key_project_roles_heading: Locator;
  readonly research_locations_heading: Locator;
  readonly participating_nations_row: Locator;
  readonly nhs_hsc_organisations_row: Locator;
  readonly lead_nation_row: Locator;
  readonly participating_nations: Locator;
  readonly nhs_hsc_organisations: Locator;
  readonly lead_nation: Locator;
  readonly row_value_label: Locator;
  readonly modification_id: Locator;
  readonly modification_type: Locator;
  readonly review_type: Locator;
  readonly category: Locator;
  readonly status: Locator;

  readonly project_details_tab_iras_id_label: Locator;
  readonly project_details_tab_iras_id: Locator;
  readonly project_details_tab_short_project_title_label: Locator;
  readonly project_details_tab_short_project_title: Locator;
  readonly project_team_tab_chief_investigator_label: Locator;
  readonly project_team_tab_chief_investigator: Locator;
  readonly project_team_tab_primary_sponsor_org_label: Locator;
  readonly project_team_tab_primary_sponsor_org: Locator;
  readonly project_team_tab_sponsor_contact_label: Locator;
  readonly project_team_tab_sponsor_contact: Locator;

  //Initialize Page Objects
  constructor(page: Page) {
    this.page = page;
    this.projectOverviewPageTestData = projectOverviewPageTestData;

    //Locators

    this.pageHeading = this.page
      .getByRole('heading')
      .getByText(this.projectOverviewPageTestData.Project_Overview_Page.heading);
    this.projectStatusTag = this.page.locator('.govuk-tag');
    this.project_details_hint_label = this.page
      .getByRole('heading')
      .getByText(this.projectOverviewPageTestData.Project_Overview_Page.project_details_hint_label);
    this.project_details_heading = this.page
      .getByRole('heading')
      .getByText(this.projectOverviewPageTestData.Project_Overview_Page.project_details_heading);
    this.project_short_title_label = this.page.locator('div[class="govuk-grid-row"] p').nth(1);
    this.information_alert_banner = this.page.getByRole('alert');
    this.modification_saved_success_message_header_text = this.page
      .getByTestId('govuk-notification-banner-title')
      .getByText(this.projectOverviewPageTestData.Project_Overview_Page.modification_saved_success_message_header_text);
    this.modification_saved_success_message_text = this.page
      .getByRole('heading')
      .getByText(this.projectOverviewPageTestData.Project_Overview_Page.modification_saved_success_message_text);
    this.project_overview_heading = this.page.locator('.govuk-inset-text');
    this.key_project_roles_heading = this.page
      .getByRole('heading')
      .getByText(this.projectOverviewPageTestData.Project_Overview_Page.key_project_roles_heading);
    this.research_locations_heading = this.page
      .getByRole('heading')
      .getByText(this.projectOverviewPageTestData.Project_Overview_Page.research_locations_heading);
    this.participating_nations_row = this.page.getByText(
      projectOverviewPageTestData.Project_Overview_Page.participating_nations
    );
    this.participating_nations = this.participating_nations_row.locator('..').locator('.govuk-summary-list__value');
    this.nhs_hsc_organisations_row = this.page.getByText(
      projectOverviewPageTestData.Project_Overview_Page.nhs_hsc_organisations
    );
    this.nhs_hsc_organisations = this.nhs_hsc_organisations_row.locator('..').locator('.govuk-summary-list__value');
    this.lead_nation_row = this.page.getByText(projectOverviewPageTestData.Project_Overview_Page.lead_nation);
    this.lead_nation = this.lead_nation_row.locator('..').locator('.govuk-summary-list__value');
    this.row_value_label = this.page.locator('dd');
    this.modification_id = this.page.getByRole('button', {
      name: this.projectOverviewPageTestData.Label_Texts_Post_Approval.modification_id,
      exact: true,
    });
    this.category = this.page.getByRole('button', {
      name: this.projectOverviewPageTestData.Label_Texts_Post_Approval.category,
      exact: true,
    });
    this.modification_type = this.page.getByRole('button', {
      name: this.projectOverviewPageTestData.Label_Texts_Post_Approval.modification_type,
      exact: true,
    });
    this.review_type = this.page.getByRole('button', {
      name: this.projectOverviewPageTestData.Label_Texts_Post_Approval.review_type,
      exact: true,
    });
    this.status = this.page.getByRole('button', {
      name: this.projectOverviewPageTestData.Label_Texts_Post_Approval.status,
      exact: true,
    });

    //tab locators
    this.project_details_tab_iras_id_label = this.page
      .locator('.govuk-summary-list__key')
      .getByText(this.projectOverviewPageTestData.Project_Details_Tab.iras_id_label, { exact: true });
    this.project_details_tab_iras_id = this.project_details_tab_iras_id_label
      .locator('..')
      .locator('.govuk-summary-list__value');
    this.project_details_tab_short_project_title_label = this.page
      .locator('.govuk-summary-list__key')
      .getByText(this.projectOverviewPageTestData.Project_Details_Tab.short_project_title_label, { exact: true });
    this.project_details_tab_short_project_title = this.project_details_tab_short_project_title_label
      .locator('..')
      .locator('.govuk-summary-list__value');
    this.project_team_tab_chief_investigator_label = this.page
      .locator('.govuk-summary-list__key')
      .getByText(this.projectOverviewPageTestData.Project_Team_Tab.chief_investigator_label, { exact: true });
    this.project_team_tab_chief_investigator = this.project_team_tab_chief_investigator_label
      .locator('..')
      .locator('.govuk-summary-list__value');
    this.project_team_tab_primary_sponsor_org_label = this.page
      .locator('.govuk-summary-list__key')
      .getByText(this.projectOverviewPageTestData.Project_Team_Tab.primary_sponsor_org_label, { exact: true });
    this.project_team_tab_primary_sponsor_org = this.project_team_tab_primary_sponsor_org_label
      .locator('..')
      .locator('.govuk-summary-list__value');
    this.project_team_tab_sponsor_contact_label = this.page
      .locator('.govuk-summary-list__key')
      .getByText(this.projectOverviewPageTestData.Project_Team_Tab.sponsor_contact_label, { exact: true });
    this.project_team_tab_sponsor_contact = this.project_team_tab_sponsor_contact_label
      .locator('..')
      .locator('.govuk-summary-list__value');
  }

  //Page Methods
  async assertOnProjectOverviewPage() {
    await expect(this.pageHeading).toBeVisible();
  }

  async gotoSpecificProjectPage(projectName: string) {
    await this.page.goto(this.projectOverviewPageTestData.Project_URL[projectName]);
  }

  async getStatus(row: any) {
    return confirmStringNotNull(await row.getByRole('cell').nth(4).textContent());
  }
}
