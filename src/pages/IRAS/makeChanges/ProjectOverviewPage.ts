import { expect, Locator, Page } from '@playwright/test';
import * as projectOverviewPageTestData from '../../../resources/test_data/iras/make_changes/project_overview_page_data.json';
import { confirmStringNotNull } from '../../../utils/UtilFunctions';
import * as linkTextData from '../../../resources/test_data/common/link_text_data.json';

//Declare Page Objects
export default class ProjectOverviewPage {
  readonly page: Page;
  readonly projectOverviewPageTestData: typeof projectOverviewPageTestData;
  readonly linkTextData: typeof linkTextData;
  readonly pageHeading: Locator;
  readonly projectStatusTag: Locator;
  readonly project_details_hint_label: Locator;
  readonly project_details_heading: Locator;
  readonly project_short_title_label: Locator;
  readonly modification_saved_success_message_text: Locator;
  readonly modification_saved_success_message_header_text: Locator;
  readonly information_alert_banner: Locator;
  readonly project_overview_heading: Locator;
  readonly project_team_heading: Locator;
  readonly research_locations_heading: Locator;
  readonly post_approvals_heading: Locator;
  readonly view_project_overview_link: Locator;
  readonly tab_row_label: Locator;
  readonly tab_row_value: Locator;
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
  readonly research_locations_tab_participating_nations_label: Locator;
  readonly research_locations_tab_participating_nations: Locator;
  readonly research_locations_tab_nhs_hsc_organisations_label: Locator;
  readonly research_locations_tab_nhs_hsc_organisations: Locator;
  readonly research_locations_tab_lead_nation_label: Locator;
  readonly research_locations_tab_lead_nation: Locator;
  readonly post_approvals_tab_modification_id: Locator;
  readonly post_approvals_tab_modification_type: Locator;
  readonly post_approvals_tab_review_type: Locator;
  readonly post_approvals_tab_category: Locator;
  readonly post_approvals_tab_date_submitted: Locator;
  readonly post_approvals_tab_status: Locator;
  readonly document_type_project_documents: Locator;
  readonly document_name_project_documents: Locator;
  readonly version_project_documents: Locator;
  readonly document_date_project_documents: Locator;
  readonly status_project_documents: Locator;
  readonly modification_id_project_documents: Locator;
  readonly action_project_documents: Locator;
  readonly action_header: Locator;
  readonly advanced_filters_project_documents: Locator;
  readonly search_project_documents: Locator;
  readonly results_count_project_documents: Locator;

  //Initialize Page Objects
  constructor(page: Page) {
    this.page = page;
    this.projectOverviewPageTestData = projectOverviewPageTestData;
    this.linkTextData = linkTextData;

    //Locators

    this.pageHeading = this.page
      .getByRole('heading')
      .getByText(this.projectOverviewPageTestData.Project_Overview_Page.heading);
    this.projectStatusTag = this.page.locator('.govuk-grid-row').locator('.govuk-tag');
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
    this.project_team_heading = this.page
      .getByRole('heading')
      .getByText(this.projectOverviewPageTestData.Project_Overview_Page.project_team_heading);
    this.research_locations_heading = this.page
      .getByRole('heading')
      .getByText(this.projectOverviewPageTestData.Project_Overview_Page.research_locations_heading);
    this.post_approvals_heading = this.page
      .getByRole('heading')
      .getByText(this.projectOverviewPageTestData.Project_Overview_Page.research_locations_heading);
    this.view_project_overview_link = this.page
      .locator('.govuk-body')
      .getByText(this.linkTextData.Project_Overview_Page.View_Project_Overview);

    //tab locators
    this.tab_row_label = this.page.locator('.govuk-summary-list__key');
    this.tab_row_value = this.page.locator('.govuk-summary-list__value');
    this.project_details_tab_iras_id_label = this.tab_row_label.getByText(
      this.projectOverviewPageTestData.Project_Details_Tab.iras_id_label,
      { exact: true }
    );
    this.project_details_tab_iras_id = this.project_details_tab_iras_id_label.locator('..').locator(this.tab_row_value);
    this.project_details_tab_short_project_title_label = this.tab_row_label.getByText(
      this.projectOverviewPageTestData.Project_Details_Tab.short_project_title_label,
      { exact: true }
    );
    this.project_details_tab_short_project_title = this.project_details_tab_short_project_title_label
      .locator('..')
      .locator(this.tab_row_value);
    this.project_team_tab_chief_investigator_label = this.tab_row_label.getByText(
      this.projectOverviewPageTestData.Project_Team_Tab.chief_investigator_label,
      { exact: true }
    );
    this.project_team_tab_chief_investigator = this.project_team_tab_chief_investigator_label
      .locator('..')
      .locator(this.tab_row_value);
    this.project_team_tab_primary_sponsor_org_label = this.tab_row_label.getByText(
      this.projectOverviewPageTestData.Project_Team_Tab.primary_sponsor_org_label,
      { exact: true }
    );
    this.project_team_tab_primary_sponsor_org = this.project_team_tab_primary_sponsor_org_label
      .locator('..')
      .locator(this.tab_row_value);
    this.project_team_tab_sponsor_contact_label = this.tab_row_label.getByText(
      this.projectOverviewPageTestData.Project_Team_Tab.sponsor_contact_label,
      { exact: true }
    );
    this.project_team_tab_sponsor_contact = this.project_team_tab_sponsor_contact_label
      .locator('..')
      .locator(this.tab_row_value);
    this.research_locations_tab_participating_nations_label = this.tab_row_label.getByText(
      this.projectOverviewPageTestData.Research_Locations_Tab.participating_nations_label,
      { exact: true }
    );
    this.research_locations_tab_participating_nations = this.research_locations_tab_participating_nations_label
      .locator('..')
      .locator(this.tab_row_value);
    this.research_locations_tab_nhs_hsc_organisations_label = this.tab_row_label.getByText(
      this.projectOverviewPageTestData.Research_Locations_Tab.nhs_hsc_organisations_label,
      { exact: true }
    );
    this.research_locations_tab_nhs_hsc_organisations = this.research_locations_tab_nhs_hsc_organisations_label
      .locator('..')
      .locator(this.tab_row_value);
    this.research_locations_tab_lead_nation_label = this.tab_row_label.getByText(
      this.projectOverviewPageTestData.Research_Locations_Tab.lead_nation_label,
      { exact: true }
    );
    this.research_locations_tab_lead_nation = this.research_locations_tab_lead_nation_label
      .locator('..')
      .locator(this.tab_row_value);
    this.post_approvals_tab_modification_id = this.page.getByRole('button', {
      name: this.projectOverviewPageTestData.Post_Approval_Tab.post_approvals_tab_modification_id,
      exact: true,
    });
    this.post_approvals_tab_modification_type = this.page.getByRole('button', {
      name: this.projectOverviewPageTestData.Post_Approval_Tab.post_approvals_tab_modification_type,
      exact: true,
    });
    this.post_approvals_tab_review_type = this.page.getByRole('button', {
      name: this.projectOverviewPageTestData.Post_Approval_Tab.post_approvals_tab_review_type,
      exact: true,
    });
    this.post_approvals_tab_category = this.page.getByRole('button', {
      name: this.projectOverviewPageTestData.Post_Approval_Tab.post_approvals_tab_category,
      exact: true,
    });
    this.post_approvals_tab_date_submitted = this.page.getByRole('button', {
      name: this.projectOverviewPageTestData.Post_Approval_Tab.post_approvals_tab_date_submitted,
      exact: true,
    });
    this.post_approvals_tab_status = this.page.getByRole('button', {
      name: this.projectOverviewPageTestData.Post_Approval_Tab.post_approvals_tab_status,
      exact: true,
    });
    this.view_project_overview_link = this.page
      .locator('.govuk-body')
      .getByText(this.linkTextData.Project_Overview_Page.View_Project_Overview);
    this.document_type_project_documents = this.page.getByRole('button', {
      name: this.projectOverviewPageTestData.Project_Documents_Tab.document_type_project_documents.trim(),
    });
    this.document_name_project_documents = this.page.getByRole('button', {
      name: this.projectOverviewPageTestData.Project_Documents_Tab.document_name_project_documents.trim(),
      exact: true,
    });
    this.version_project_documents = this.page.getByRole('button', {
      name: this.projectOverviewPageTestData.Project_Documents_Tab.version_project_documents,
      exact: true,
    });
    this.document_date_project_documents = this.page.getByRole('button', {
      name: this.projectOverviewPageTestData.Project_Documents_Tab.document_date_project_documents.trim(),
      exact: true,
    });
    this.status_project_documents = this.page.getByRole('button', {
      name: this.projectOverviewPageTestData.Project_Documents_Tab.status_project_documents,
      exact: true,
    });
    this.modification_id_project_documents = this.page.getByRole('button', {
      name: this.projectOverviewPageTestData.Project_Documents_Tab.modification_id_project_documents.trim(),
      exact: true,
    });
    this.action_header = this.page.locator('th');
    this.action_project_documents = this.action_header.getByText(
      this.projectOverviewPageTestData.Project_Documents_Tab.action_project_documents
    );
    this.search_project_documents = this.page.getByRole('button', {
      name: this.projectOverviewPageTestData.Project_Documents_Tab.search_project_documents.trim(),
      exact: true,
    });
    this.advanced_filters_project_documents = this.page
      .locator('.search-filter-panel__button-inner')
      .getByText(this.projectOverviewPageTestData.Project_Documents_Tab.advanced_filters_project_documents);
    this.results_count_project_documents = this.page.locator('.search-filter-panel__count');
  }

  //Page Methods
  async assertOnProjectOverviewPage() {
    await expect.soft(this.pageHeading).toBeVisible();
  }

  async gotoSpecificProjectPage(projectName: string) {
    await this.page.goto(this.projectOverviewPageTestData.Project_URL[projectName]);
  }

  async getStatus(row: any) {
    return confirmStringNotNull(await row.getByRole('cell').nth(5).textContent());
  }
}
