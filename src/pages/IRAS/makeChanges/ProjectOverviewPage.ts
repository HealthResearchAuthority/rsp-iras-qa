import { expect, Locator, Page } from '@playwright/test';
import * as projectOverviewPageTestData from '../../../resources/test_data/iras/make_changes/project_overview_page_data.json';

//Declare Page Objects
export default class ProjectOverviewPage {
  readonly page: Page;
  readonly projectOverviewPageTestData: typeof projectOverviewPageTestData;
  readonly pageHeading: Locator;
  readonly project_details_hint_label: Locator;
  readonly project_details_heading: Locator;
  readonly project_short_title_label: Locator;
  readonly modification_saved_success_message_text: Locator;
  readonly modification_saved_success_message_header_text: Locator;
  readonly information_alert_banner: Locator;
  readonly project_overview_heading: Locator;
  readonly project_details_title: Locator;
  readonly project_documents_title: Locator;
  readonly key_project_roles_title: Locator;
  readonly research_locations_title: Locator;
  readonly post_approval_title: Locator;
  readonly project_history_title: Locator;
  readonly project_details_irasid_row: Locator;
  readonly project_details_irasid: Locator;
  readonly project_details_short_project_title_row: Locator;
  readonly project_details_short_project_title: Locator;
  readonly key_project_roles_heading: Locator;
  readonly chief_investigator_row: Locator;
  readonly chief_investigator: Locator;
  readonly primary_sponsor_organisation_row: Locator;
  readonly primary_sponsor_organisation: Locator;
  readonly sponsor_contact_row: Locator;
  readonly sponsor_contact: Locator;
  readonly research_locations_heading: Locator;
  readonly participating_nations_row: Locator;
  readonly nhs_hsc_organisations_row: Locator;
  readonly lead_nation_row: Locator;
  readonly participating_nations: Locator;
  readonly nhs_hsc_organisations: Locator;
  readonly lead_nation: Locator;

  //Initialize Page Objects
  constructor(page: Page) {
    this.page = page;
    this.projectOverviewPageTestData = projectOverviewPageTestData;

    //Locators
    this.pageHeading = this.page
      .getByRole('heading')
      .getByText(this.projectOverviewPageTestData.Project_Overview_Page.heading);
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
    this.project_details_title = this.page.getByRole('link', {
      name: this.projectOverviewPageTestData.Label_Texts.project_details_title,
      exact: true,
    });
    this.project_documents_title = this.page.getByRole('link', {
      name: this.projectOverviewPageTestData.Label_Texts.project_documents_title,
      exact: true,
    });
    this.key_project_roles_title = this.page.getByRole('link', {
      name: this.projectOverviewPageTestData.Label_Texts.key_project_roles_title,
      exact: true,
    });
    this.research_locations_title = this.page.getByRole('link', {
      name: this.projectOverviewPageTestData.Label_Texts.research_locations_title,
      exact: true,
    });
    this.post_approval_title = this.page.getByRole('link', {
      name: this.projectOverviewPageTestData.Label_Texts.post_approval_title,
      exact: true,
    });
    this.project_history_title = this.page.getByRole('link', {
      name: this.projectOverviewPageTestData.Label_Texts.project_history_title,
      exact: true,
    });
    this.project_details_irasid_row = this.page.getByText(
      projectOverviewPageTestData.Project_Overview_Page.project_details_irasid
    );
    this.project_details_irasid = this.project_details_irasid_row.locator('..').locator('.govuk-summary-list__value');
    this.project_details_short_project_title_row = this.page.getByText(
      projectOverviewPageTestData.Project_Overview_Page.project_details_short_project_title
    );
    this.project_details_short_project_title = this.project_details_short_project_title_row
      .locator('..')
      .locator('.govuk-summary-list__value');
    this.key_project_roles_heading = this.page
      .getByRole('heading')
      .getByText(this.projectOverviewPageTestData.Project_Overview_Page.key_project_roles_heading);
    this.research_locations_heading = this.page
      .getByRole('heading')
      .getByText(this.projectOverviewPageTestData.Project_Overview_Page.research_locations_heading);
    this.chief_investigator_row = this.page.getByText(
      projectOverviewPageTestData.Project_Overview_Page.chief_investigator
    );
    this.chief_investigator = this.chief_investigator_row.locator('..').locator('.govuk-summary-list__value');
    this.primary_sponsor_organisation_row = this.page.getByText(
      projectOverviewPageTestData.Project_Overview_Page.primary_sponsor_organisation
    );
    this.primary_sponsor_organisation = this.primary_sponsor_organisation_row
      .locator('..')
      .locator('.govuk-summary-list__value');
    this.sponsor_contact_row = this.page.getByText(projectOverviewPageTestData.Project_Overview_Page.sponsor_contact);
    this.sponsor_contact = this.sponsor_contact_row.locator('..').locator('.govuk-summary-list__value');
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
  }

  //Page Methods
  async assertOnProjectOverviewPage() {
    await expect(this.pageHeading).toBeVisible();
  }
}
