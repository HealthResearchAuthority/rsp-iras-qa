import { expect, Locator, Page } from '@playwright/test';
import * as projectOverviewPageTestData from '../../../resources/test_data/iras/make_changes/project_overview_page_data.json';
import { confirmStringNotNull } from '../../../utils/UtilFunctions';
import * as linkTextData from '../../../resources/test_data/common/link_text_data.json';
import CommonItemsPage from '../../Common/CommonItemsPage';
import * as dbConfigData from '../../../resources/test_data/common/database/db_config_data.json';
import { connect } from '../../../utils/DbConfig';
import { IResult } from 'mssql';

//Declare Page Objects
export default class ProjectOverviewPage {
  readonly page: Page;
  readonly projectOverviewPageTestData: typeof projectOverviewPageTestData;
  readonly linkTextData: typeof linkTextData;
  readonly pageHeading: Locator;
  readonly projectStatusTag: Locator;
  readonly project_details_hint_label: Locator;
  readonly project_details_heading: Locator;
  readonly project_iras_id_label: Locator;
  readonly project_short_title_label: Locator;
  readonly modification_saved_success_message_text: Locator;
  readonly modification_saved_success_message_header_text: Locator;
  readonly delete_modification_success_message_text: Locator;
  readonly information_alert_banner: Locator;
  readonly project_overview_heading: Locator;
  readonly project_team_heading: Locator;
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
  readonly view_project_overview_link: Locator;
  readonly tab_row_label: Locator;
  readonly tab_row_value: Locator;
  readonly project_details_tab_iras_id_label: Locator;
  readonly project_details_tab_iras_id: Locator;
  readonly project_details_tab_short_project_title_label: Locator;
  readonly project_details_tab_short_project_title: Locator;
  readonly project_team_tab_chief_investigator_label: Locator;
  readonly project_team_tab_chief_investigator: Locator;
  readonly project_team_tab_chief_investigator_first_name_label: Locator;
  readonly project_team_tab_chief_investigator_first_name: Locator;
  readonly project_team_tab_chief_investigator_last_name_label: Locator;
  readonly project_team_tab_chief_investigator_last_name: Locator;
  readonly project_team_tab_chief_investigator_email_label: Locator;
  readonly project_team_tab_chief_investigator_email: Locator;
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
  readonly document_type_project_documents: Locator;
  readonly file_name_project_documents: Locator;
  readonly document_name_project_documents: Locator;
  readonly version_project_documents: Locator;
  readonly document_date_project_documents: Locator;
  readonly status_project_documents: Locator;
  readonly modification_id_project_documents: Locator;
  readonly table_header: Locator;
  readonly advanced_filters_project_documents: Locator;
  readonly search_project_documents: Locator;
  readonly results_count_project_documents: Locator;
  readonly modification_table_data: Locator;
  readonly post_approvals_heading: Locator;
  readonly post_approvals_advanced_filters_modification_type_label: Locator;
  readonly modification_type_fieldset: Locator;
  readonly modification_type_radio: Locator;
  readonly modification_type_radio_chevron: Locator;
  readonly modification_type_hint_label: Locator;
  readonly modification_type_radio_hint_label: Locator;
  readonly post_approvals_advanced_filters_review_type_label: Locator;
  readonly review_type_fieldset: Locator;
  readonly review_type_radio: Locator;
  readonly review_type_radio_chevron: Locator;
  readonly review_type_hint_label: Locator;
  readonly review_type_radio_hint_label: Locator;
  readonly post_approvals_advanced_filters_category_label: Locator;
  readonly category_fieldset: Locator;
  readonly category_radio: Locator;
  readonly category_radio_chevron: Locator;
  readonly category_hint_label: Locator;
  readonly category_radio_hint_label: Locator;
  readonly post_approvals_advanced_filters_status_label: Locator;
  readonly status_fieldset: Locator;
  readonly status_radio: Locator;
  readonly status_radio_chevron: Locator;
  readonly status_hint_label: Locator;
  readonly status_radio_hint_label: Locator;
  readonly date_submitted_from_day_text_chevron: Locator;
  readonly date_submitted_from_date_fieldset: Locator;
  readonly date_submitted_from_date_help_text: Locator;
  readonly date_submitted_to_date_help_text: Locator;
  readonly date_submitted_from_day_text: Locator;
  readonly date_submitted_from_month_dropdown: Locator;
  readonly date_submitted_from_year_text: Locator;
  readonly date_submitted_from_date_error: Locator;
  readonly date_submitted_to_day_text_chevron: Locator;
  readonly date_submitted_to_date_error: Locator;
  readonly date_submitted_to_date_fieldset: Locator;
  readonly date_submitted_to_day_text: Locator;
  readonly date_submitted_to_month_dropdown: Locator;
  readonly date_submitted_to_year_text: Locator;
  readonly date_submitted_to_date_error_message: Locator;
  readonly date_submitted_from_date_error_message: Locator;
  readonly project_details_tab_primary_sponsor_org_label: Locator;
  readonly project_details_tab_primary_sponsor_org: Locator;
  readonly project_details_tab_full_project_title_label: Locator;
  readonly project_details_tab_full_project_title: Locator;
  readonly project_details_tab_planned_project_end_date_label: Locator;
  readonly project_details_tab_planned_project_end_date: Locator;
  readonly tableCell: Locator;
  readonly tableRows: Locator;
  private projectRecordID: string;
  private modificationRecordID: string;

  //Initialize Page Objects
  constructor(page: Page) {
    this.page = page;
    this.projectOverviewPageTestData = projectOverviewPageTestData;
    this.linkTextData = linkTextData;

    //Locators

    this.pageHeading = this.page
      .getByRole('heading')
      .getByText(this.projectOverviewPageTestData.Project_Overview_Page.heading);
    this.projectStatusTag = this.page.locator('.govuk-grid-row').locator('.govuk-tag').first();
    this.project_details_hint_label = this.page
      .getByRole('heading')
      .getByText(this.projectOverviewPageTestData.Project_Overview_Page.project_details_hint_label);
    this.project_details_heading = this.page
      .getByRole('heading')
      .getByText(this.projectOverviewPageTestData.Project_Overview_Page.project_details_heading);
    this.project_iras_id_label = this.page.locator('div[class="govuk-inset-text"] p').nth(0);
    this.project_short_title_label = this.page.locator('div[class="govuk-inset-text"] p').nth(1);
    this.information_alert_banner = this.page.getByRole('alert');
    this.modification_saved_success_message_header_text = this.page
      .getByRole('alert')
      .getByRole('heading', {
        name: this.projectOverviewPageTestData.Project_Overview_Page.modification_saved_success_message_header_text,
      });
    this.modification_saved_success_message_text = this.page
      .getByRole('heading')
      .getByText(this.projectOverviewPageTestData.Project_Overview_Page.modification_saved_success_message_text);
    this.delete_modification_success_message_text = this.page
      .getByRole('alert')
      .locator('.govuk-notification-banner__heading');
    this.project_overview_heading = this.page.locator('.govuk-inset-text');
    this.project_team_heading = this.page.getByText(
      this.projectOverviewPageTestData.Project_Overview_Page.project_team_heading
    );
    this.research_locations_heading = this.page
      .locator('.govuk-service-navigation__link')
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
    this.project_details_tab_primary_sponsor_org_label = this.tab_row_label.getByText(
      this.projectOverviewPageTestData.Project_Details_Tab.primary_sponsor_org_label,
      { exact: true }
    );
    this.project_details_tab_primary_sponsor_org = this.project_details_tab_primary_sponsor_org_label
      .locator('..')
      .locator(this.tab_row_value);
    this.project_details_tab_full_project_title_label = this.tab_row_label.getByText(
      this.projectOverviewPageTestData.Project_Details_Tab.full_project_title_label,
      { exact: true }
    );
    this.project_details_tab_full_project_title = this.project_details_tab_full_project_title_label
      .locator('..')
      .locator(this.tab_row_value);
    this.project_details_tab_planned_project_end_date_label = this.tab_row_label.getByText(
      this.projectOverviewPageTestData.Project_Details_Tab.planned_project_end_date_label,
      { exact: true }
    );
    this.project_details_tab_planned_project_end_date = this.project_details_tab_planned_project_end_date_label
      .locator('..')
      .locator(this.tab_row_value);
    this.project_team_tab_chief_investigator_label = this.tab_row_label.getByText(
      this.projectOverviewPageTestData.Project_Team_Tab.chief_investigator_label,
      { exact: true }
    );
    this.project_team_tab_chief_investigator = this.project_team_tab_chief_investigator_label
      .locator('..')
      .locator(this.tab_row_value);
    this.project_team_tab_chief_investigator_first_name_label = this.tab_row_label.getByText(
      this.projectOverviewPageTestData.Project_Team_Tab.first_name_label,
      { exact: true }
    );
    this.project_team_tab_chief_investigator_first_name = this.project_team_tab_chief_investigator_first_name_label
      .locator('..')
      .locator(this.tab_row_value);
    this.project_team_tab_chief_investigator_last_name_label = this.tab_row_label.getByText(
      this.projectOverviewPageTestData.Project_Team_Tab.last_name_label,
      { exact: true }
    );
    this.project_team_tab_chief_investigator_last_name = this.project_team_tab_chief_investigator_last_name_label
      .locator('..')
      .locator(this.tab_row_value);
    this.project_team_tab_chief_investigator_email_label = this.tab_row_label.getByText(
      this.projectOverviewPageTestData.Project_Team_Tab.email_label,
      { exact: true }
    );
    this.project_team_tab_chief_investigator_email = this.project_team_tab_chief_investigator_email_label
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
    this.post_approvals_advanced_filters_modification_type_label = this.page
      .getByRole('heading', { level: 2 })
      .getByText(this.projectOverviewPageTestData.Post_Approval_Page_Label_Texts.modification_type_label, {
        exact: true,
      });
    this.modification_type_fieldset = this.post_approvals_advanced_filters_modification_type_label
      .locator('..')
      .locator('..')
      .locator('.govuk-fieldset')
      .locator('.govuk-form-group', {
        has: this.page.getByText(this.projectOverviewPageTestData.Post_Approval_Page_Label_Texts.radio_hint_label),
      });
    this.modification_type_radio = this.modification_type_fieldset.getByRole('radio');
    this.modification_type_radio_chevron = this.page
      .getByRole('heading', { level: 2 })
      .getByText(this.projectOverviewPageTestData.Post_Approval_Page_Label_Texts.modification_type_label, {
        exact: true,
      });
    this.modification_type_hint_label = this.post_approvals_advanced_filters_modification_type_label
      .locator('..')
      .locator('..')
      .locator('.govuk-fieldset')
      .locator('.govuk-form-group')
      .getByText(this.projectOverviewPageTestData.Post_Approval_Page_Label_Texts.radio_hint_label);
    this.modification_type_radio_hint_label = this.modification_type_fieldset.getByText(
      this.projectOverviewPageTestData.Post_Approval_Page_Label_Texts.radio_hint_label,
      {
        exact: true,
      }
    );
    this.post_approvals_advanced_filters_review_type_label = this.page
      .getByRole('heading', { level: 2 })
      .getByText(this.projectOverviewPageTestData.Post_Approval_Page_Label_Texts.review_type, {
        exact: true,
      });
    this.review_type_fieldset = this.post_approvals_advanced_filters_review_type_label
      .locator('..')
      .locator('..')
      .locator('.govuk-fieldset')
      .locator('.govuk-form-group', {
        has: this.page.getByText(this.projectOverviewPageTestData.Post_Approval_Page_Label_Texts.radio_hint_label),
      });
    this.review_type_radio = this.review_type_fieldset.getByRole('radio');
    this.review_type_radio_chevron = this.page
      .getByRole('heading', { level: 2 })
      .getByText(this.projectOverviewPageTestData.Post_Approval_Page_Label_Texts.review_type, {
        exact: true,
      });
    this.review_type_hint_label = this.post_approvals_advanced_filters_review_type_label
      .locator('..')
      .locator('..')
      .locator('.govuk-fieldset')
      .locator('.govuk-form-group')
      .getByText(this.projectOverviewPageTestData.Post_Approval_Page_Label_Texts.review_type);
    this.review_type_radio_hint_label = this.modification_type_fieldset.getByText(
      this.projectOverviewPageTestData.Post_Approval_Page_Label_Texts.radio_hint_label,
      {
        exact: true,
      }
    );
    this.post_approvals_advanced_filters_category_label = this.page
      .getByRole('heading', { level: 2 })
      .getByText(this.projectOverviewPageTestData.Post_Approval_Page_Label_Texts.category, {
        exact: true,
      });
    this.category_fieldset = this.post_approvals_advanced_filters_category_label
      .locator('..')
      .locator('..')
      .locator('.govuk-fieldset')
      .locator('.govuk-form-group', {
        has: this.page.getByText(this.projectOverviewPageTestData.Post_Approval_Page_Label_Texts.radio_hint_label),
      });
    this.category_radio = this.review_type_fieldset.getByRole('radio');
    this.category_radio_chevron = this.page
      .getByRole('heading', { level: 2 })
      .getByText(this.projectOverviewPageTestData.Post_Approval_Page_Label_Texts.category, {
        exact: true,
      });
    this.category_hint_label = this.post_approvals_advanced_filters_category_label
      .locator('..')
      .locator('..')
      .locator('.govuk-fieldset')
      .locator('.govuk-form-group')
      .getByText(this.projectOverviewPageTestData.Post_Approval_Page_Label_Texts.radio_hint_label);
    this.category_radio_hint_label = this.modification_type_fieldset.getByText(
      this.projectOverviewPageTestData.Post_Approval_Page_Label_Texts.radio_hint_label,
      {
        exact: true,
      }
    );
    this.post_approvals_advanced_filters_status_label = this.page
      .getByRole('heading', { level: 2 })
      .getByText(this.projectOverviewPageTestData.Post_Approval_Page_Label_Texts.status_label, {
        exact: true,
      });
    this.status_fieldset = this.post_approvals_advanced_filters_status_label
      .locator('..')
      .locator('..')
      .locator('.govuk-fieldset')
      .locator('.govuk-form-group', {
        has: this.page.getByText(this.projectOverviewPageTestData.Post_Approval_Page_Label_Texts.radio_hint_label),
      });
    this.status_radio = this.status_fieldset.getByRole('radio');
    this.status_radio_chevron = this.page
      .getByRole('heading', { level: 2 })
      .getByText(this.projectOverviewPageTestData.Post_Approval_Page_Label_Texts.status_label, {
        exact: true,
      });
    this.status_hint_label = this.post_approvals_advanced_filters_status_label
      .locator('..')
      .locator('..')
      .locator('.govuk-fieldset')
      .locator('.govuk-form-group')
      .getByText(this.projectOverviewPageTestData.Post_Approval_Page_Label_Texts.radio_hint_label);
    this.status_radio_hint_label = this.status_fieldset.getByText(
      this.projectOverviewPageTestData.Post_Approval_Page_Label_Texts.radio_hint_label,
      {
        exact: true,
      }
    );
    this.date_submitted_from_day_text_chevron = this.page
      .getByRole('heading')
      .getByText(this.projectOverviewPageTestData.Post_Approval_Page_Label_Texts.date_submitted_label, {
        exact: true,
      });
    this.date_submitted_from_date_fieldset = this.page.locator('.govuk-fieldset').locator('.govuk-form-group', {
      has: this.page.getByText(
        this.projectOverviewPageTestData.Post_Approval_Page_Label_Texts.date_submitted_from_date_hint_text
      ),
    });
    this.date_submitted_from_date_help_text = this.page.locator('#Search_FromDate-hint');
    this.date_submitted_to_date_help_text = this.page.locator('#Search_ToDate-hint');
    this.date_submitted_from_day_text = this.date_submitted_from_date_fieldset
      .locator('.govuk-form-group', {
        has: this.page.getByText(
          this.projectOverviewPageTestData.Post_Approval_Page_Label_Texts.date_submitted_day_label
        ),
      })
      .getByRole('textbox');
    this.date_submitted_from_month_dropdown = this.date_submitted_from_date_fieldset
      .locator('.govuk-form-group', {
        has: this.page.getByText(
          this.projectOverviewPageTestData.Post_Approval_Page_Label_Texts.date_submitted_month_label
        ),
      })
      .getByRole('combobox');
    this.date_submitted_from_year_text = this.date_submitted_from_date_fieldset
      .locator('.govuk-form-group', {
        has: this.page.getByText(
          this.projectOverviewPageTestData.Post_Approval_Page_Label_Texts.date_submitted_year_label
        ),
      })
      .getByRole('textbox');
    this.date_submitted_from_date_error = this.page
      .locator('.govuk-fieldset')
      .locator('.govuk-form-group')
      .filter({
        hasText: this.projectOverviewPageTestData.Post_Approval_Page_Label_Texts.date_submitted_from_date_hint_text,
      })
      .locator('.govuk-error-message');
    this.date_submitted_to_day_text_chevron = this.page
      .getByRole('heading')
      .getByText(this.projectOverviewPageTestData.Post_Approval_Page_Label_Texts.date_submitted_day_label, {
        exact: true,
      });
    this.date_submitted_to_date_error = this.page
      .locator('.govuk-fieldset')
      .locator('.govuk-form-group')
      .filter({
        hasText: this.projectOverviewPageTestData.Post_Approval_Page_Label_Texts.date_submitted_to_date_hint_text,
      })
      .locator('.govuk-error-message');
    this.date_submitted_to_date_fieldset = this.page.locator('.govuk-fieldset').locator('.govuk-form-group', {
      has: this.page.getByText(
        this.projectOverviewPageTestData.Post_Approval_Page_Label_Texts.date_submitted_to_date_hint_text
      ),
    });
    this.date_submitted_to_day_text = this.date_submitted_to_date_fieldset
      .locator('.govuk-form-group', {
        has: this.page.getByText(
          this.projectOverviewPageTestData.Post_Approval_Page_Label_Texts.date_submitted_day_label
        ),
      })
      .getByRole('textbox');
    this.date_submitted_to_month_dropdown = this.date_submitted_to_date_fieldset
      .locator('.govuk-form-group', {
        has: this.page.getByText(
          this.projectOverviewPageTestData.Post_Approval_Page_Label_Texts.date_submitted_month_label
        ),
      })
      .getByRole('combobox');
    this.date_submitted_to_year_text = this.date_submitted_to_date_fieldset
      .locator('.govuk-form-group', {
        has: this.page.getByText(
          this.projectOverviewPageTestData.Post_Approval_Page_Label_Texts.date_submitted_year_label
        ),
      })
      .getByRole('textbox');
    this.status = this.page.getByRole('button', {
      name: this.projectOverviewPageTestData.Post_Approval_Page_Label_Texts.status_label,
      exact: true,
    });
    this.view_project_overview_link = this.page
      .locator('.govuk-body')
      .getByText(this.linkTextData.Project_Overview_Page.View_Project_Overview);
    this.document_type_project_documents = this.page.getByRole('button', {
      name: this.projectOverviewPageTestData.Project_Documents_Tab.document_type_project_documents,
    });
    this.document_name_project_documents = this.page.getByRole('button', {
      name: this.projectOverviewPageTestData.Project_Documents_Tab.document_name_project_documents,
      exact: true,
    });
    this.file_name_project_documents = this.page.getByRole('button', {
      name: this.projectOverviewPageTestData.Project_Documents_Tab.file_name_project_documents,
      exact: true,
    });
    this.version_project_documents = this.page.getByRole('button', {
      name: this.projectOverviewPageTestData.Project_Documents_Tab.version_project_documents,
      exact: true,
    });
    this.document_date_project_documents = this.page.getByRole('button', {
      name: this.projectOverviewPageTestData.Project_Documents_Tab.document_date_project_documents,
      exact: true,
    });
    this.status_project_documents = this.page.getByRole('columnheader', {
      name: this.projectOverviewPageTestData.Project_Documents_Tab.status_project_documents,
      exact: true,
    });
    this.modification_id_project_documents = this.page.getByRole('button', {
      name: this.projectOverviewPageTestData.Project_Documents_Tab.modification_id_project_documents,
      exact: true,
    });
    this.table_header = this.page.locator('th');
    this.results_count_project_documents = this.page.locator('.search-filter-panel__count');
    this.modification_table_data = page.locator('.govuk-table.modifications-tasklist-table td');
    this.date_submitted_to_date_error_message = this.page
      .locator('.govuk-fieldset')
      .locator('.govuk-form-group')
      .filter({
        hasText: this.projectOverviewPageTestData.Post_Approval_Page_Label_Texts.date_submitted_to_date_hint_text,
      })
      .locator('.govuk-error-message');
    this.date_submitted_from_date_error_message = this.page
      .locator('.govuk-fieldset')
      .locator('.govuk-form-group')
      .filter({
        hasText: this.projectOverviewPageTestData.Post_Approval_Page_Label_Texts.date_submitted_from_date_hint_text,
      })
      .locator('.govuk-error-message');
    this.tableCell = this.page.locator('td');
    this.tableRows = this.page.getByRole('table').getByRole('row');
  }

  public getProjectRecordID(): string {
    return this.projectRecordID;
  }

  public getModificationRecordID(): string {
    return this.modificationRecordID;
  }

  //Page Methods
  async assertOnProjectOverviewPage() {
    await expect.soft(this.pageHeading).toBeVisible();
  }

  async getStatus(row: any) {
    return confirmStringNotNull(await row.getByRole('cell').nth(5).textContent());
  }

  async getAllModificationTableData() {
    return await this.modification_table_data.allTextContents();
  }

  async getProjectColumnIndex(columnName: string): Promise<number> {
    let columnIndex: number;
    if (columnName.toLowerCase() == 'file name') {
      columnIndex = 2;
    }
    return columnIndex;
  }

  async findModification(
    commonItemsPage: CommonItemsPage,
    modificationID: string,
    options?: {
      status?: string;
    }
  ) {
    let hasNextPage = true;
    while (hasNextPage) {
      const rows = await commonItemsPage.tableBodyRows.all();
      for (const row of rows) {
        const match =
          options?.status && (await this.isMatchingRowForStatus(commonItemsPage, row, modificationID, options.status));
        if (match) return row;
      }
      hasNextPage = await commonItemsPage.shouldGoToNextPage();
      if (hasNextPage) await commonItemsPage.goToNextPage();
    }
    expect.soft(false, `No matching record found for modificationID: ${modificationID}`).toBe(true);
  }

  async isMatchingRowForStatus(
    commonItemsPage: CommonItemsPage,
    row: any,
    modificationID: string,
    status?: string
  ): Promise<boolean> {
    const columns = row.locator(this.tableCell);
    const idText = (await columns.nth(0).innerText()).trim();
    const statusText = (await columns.nth(5).innerText()).trim();
    return idText === modificationID && (status ? statusText === status : true);
  }

  async getColumnIndexProjectApproval(columnName: string): Promise<number> {
    let columnIndex: number;
    switch (columnName.toLowerCase()) {
      case 'modification id':
        columnIndex = 0;
        break;
      case 'modification type':
        columnIndex = 1;
        break;
      case 'review type':
        columnIndex = 2;
        break;
      case 'category':
        columnIndex = 3;
        break;
      case 'date submitted':
        columnIndex = 4;
        break;
      case 'status':
        columnIndex = 5;
        break;
      default:
        throw new Error(`${columnName} is not a valid option`);
    }
    return columnIndex;
  }

  async getProjectAuditLog(): Promise<Map<string, string[]>> {
    const dateTimeValues: string[] = [];
    const eventDescriptionValues: string[] = [];
    const modificationIdValues: string[] = [];
    const userEmailValues: string[] = [];
    const rowCount = await this.tableRows.count();
    for (let index = 1; index < rowCount; index++) {
      const columns = this.tableRows.nth(index).getByRole('cell');
      const dateTimeValue = confirmStringNotNull(await columns.nth(0).textContent());
      dateTimeValues.push(dateTimeValue);
      const eventDescriptionValue = confirmStringNotNull(await columns.nth(1).textContent());
      eventDescriptionValues.push(eventDescriptionValue);
      const modificationIdValue = confirmStringNotNull(await columns.nth(2).textContent());
      modificationIdValues.push(modificationIdValue);
      const userEmailValue = confirmStringNotNull(await columns.nth(3).textContent());
      userEmailValues.push(userEmailValue);
    }
    const auditProjectMap = new Map([
      ['dateTimeValue', dateTimeValues],
      ['eventDescriptionValue', eventDescriptionValues],
      ['modificationIdValue', modificationIdValues],
      ['userEmailValue', userEmailValues],
    ]);
    return auditProjectMap;
  }
  async goto(projectRecordId: string) {
    await this.page.goto(`projectoverview/projectdocuments?projectRecordId=${projectRecordId}&backRoute=app%3AWelcome`);
  }
  async setAllProjectDocumentsValues(sqlQueryResult: IResult<any>): Promise<void> {
    this.projectRecordID = sqlQueryResult.recordset[0].ProjectRecordId;
    this.modificationRecordID = sqlQueryResult.recordset[0].ModificationIdentifier;
  }

  async sqlGetProjectDocumentsRecordByStatus(status: string): Promise<void> {
    const sqlConnection = await connect(dbConfigData.Application_Service);
    const queryResult = await sqlConnection.query(
      `select top 1 ModificationDocuments.[FileName], ModificationDocuments.Status, ProjectModifications.ProjectRecordId, ProjectModifications.ModificationIdentifier from ProjectModifications, ModificationDocuments where ProjectModifications.ProjectRecordId = ModificationDocuments.ProjectRecordId and ProjectModifications.[Status] = '${status}' ORDER BY NEWID()`
    );
    await sqlConnection.close();
    if (queryResult.recordset.length == 0) {
      throw new Error(`No suitable modification found in the system with ${status} status`);
    } else {
      await this.setAllProjectDocumentsValues(queryResult);
    }
  }
}
