import { expect, Locator, Page } from '@playwright/test';
import * as reviewAllChangesPageTestData from '../../../../resources/test_data/iras/reviewResearch/receiveAmendments/review_all_changes_data.json';

//Declare Page Objects
export default class ReviewAllChangesPage {
  readonly page: Page;
  readonly reviewAllChangesPageTestData: typeof reviewAllChangesPageTestData;
  readonly pageHeading: Locator;
  readonly row_label: Locator;
  readonly row_value: Locator;
  readonly iras_id_label: Locator;
  readonly iras_id: Locator;
  readonly short_project_title_label: Locator;
  readonly short_project_title: Locator;
  readonly modification_id_label: Locator;
  readonly modification_id: Locator;
  readonly status_label: Locator;
  readonly status: Locator;
  readonly modification_ranking_heading: Locator;
  readonly modification_ranking_section_card: Locator;
  readonly ranking_modification_type_label: Locator;
  readonly ranking_modification_type: Locator;
  readonly ranking_category_label: Locator;
  readonly ranking_category: Locator;
  readonly ranking_review_type_label: Locator;
  readonly ranking_review_type: Locator;
  readonly changes_heading: Locator;
  readonly changes_section_card: Locator;
  readonly changes_section_card_heading: Locator;
  readonly planned_end_date_label: Locator;
  readonly planned_end_date: Locator;
  readonly which_org_type_affected_label: Locator;
  readonly which_org_type_affected: Locator;
  readonly where_org_affected_label: Locator;
  readonly where_org_affected: Locator;
  readonly will_org_affected_label: Locator;
  readonly will_org_affected: Locator;
  readonly will_require_resources_label: Locator;
  readonly will_require_resources: Locator;
  readonly changes_modification_type_label: Locator;
  readonly changes_modification_type: Locator;
  readonly changes_category_label: Locator;
  readonly changes_category: Locator;
  readonly changes_review_type_label: Locator;
  readonly changes_review_type: Locator;
  readonly sponsor_details_heading: Locator;
  readonly sponsor_details_section_card: Locator;
  readonly sponsor_reference_label: Locator;
  readonly sponsor_reference: Locator;
  readonly sponsor_date_label: Locator;
  readonly sponsor_date: Locator;
  readonly sponsor_summary_of_changes_label: Locator;
  readonly sponsor_summary_of_changes: Locator;
  readonly now_send_to_sponsor_heading: Locator;
  readonly now_send_to_sponsor_hint_label: Locator;
  readonly supporting_documents_document_type_label: Locator;
  readonly supporting_documents_document_name_label: Locator;
  readonly supporting_documents_file_name_label: Locator;
  readonly supporting_documents_document_version_label: Locator;
  readonly supporting_documents_document_date_label: Locator;
  readonly supporting_documents_status_label: Locator;
  readonly supporting_documents_action_label: Locator;

  //Initialize Page Objects
  constructor(page: Page) {
    this.page = page;
    this.reviewAllChangesPageTestData = reviewAllChangesPageTestData;

    //Locators
    this.pageHeading = this.page
      .getByRole('heading')
      .getByText(this.reviewAllChangesPageTestData.Review_All_Changes_Page.heading);
    this.row_label = this.page.locator('.govuk-summary-list__key');
    this.row_value = this.page.locator('.govuk-summary-list__value');
    //Summary Section
    this.iras_id_label = this.row_label.getByText(
      this.reviewAllChangesPageTestData.Review_All_Changes_Page.Summary.iras_id_label,
      { exact: true }
    );
    this.iras_id = this.iras_id_label.locator('..').locator(this.row_value);
    this.short_project_title_label = this.row_label.getByText(
      this.reviewAllChangesPageTestData.Review_All_Changes_Page.Summary.short_project_title_label,
      { exact: true }
    );
    this.short_project_title = this.short_project_title_label.locator('..').locator(this.row_value);
    this.modification_id_label = this.row_label.getByText(
      this.reviewAllChangesPageTestData.Review_All_Changes_Page.Summary.modification_id_label,
      { exact: true }
    );
    this.modification_id = this.modification_id_label.locator('..').locator(this.row_value);
    this.status_label = this.row_label.getByText(
      this.reviewAllChangesPageTestData.Review_All_Changes_Page.Summary.status_label,
      { exact: true }
    );
    this.status = this.status_label.locator('..').locator(this.row_value);
    //Modification Ranking Section
    this.modification_ranking_heading = this.page
      .getByRole('heading')
      .getByText(this.reviewAllChangesPageTestData.Review_All_Changes_Page.modification_ranking_heading);
    this.modification_ranking_section_card = this.page.locator('.govuk-summary-card', {
      has: this.page
        .getByRole('heading')
        .getByText(this.reviewAllChangesPageTestData.Review_All_Changes_Page.modification_ranking_card_heading, {
          exact: true,
        }),
    });
    this.ranking_modification_type_label = this.modification_ranking_section_card.locator(
      this.row_label.getByText(
        this.reviewAllChangesPageTestData.Review_All_Changes_Page.Ranking.ranking_modification_type_label,
        { exact: true }
      )
    );
    this.ranking_modification_type = this.ranking_modification_type_label.locator('..').locator(this.row_value);
    this.ranking_category_label = this.modification_ranking_section_card.locator(
      this.row_label.getByText(
        this.reviewAllChangesPageTestData.Review_All_Changes_Page.Ranking.ranking_category_label,
        {
          exact: true,
        }
      )
    );
    this.ranking_category = this.ranking_category_label.locator('..').locator(this.row_value);
    this.ranking_review_type_label = this.modification_ranking_section_card.locator(
      this.row_label.getByText(
        this.reviewAllChangesPageTestData.Review_All_Changes_Page.Ranking.ranking_review_type_label,
        {
          exact: true,
        }
      )
    );
    this.ranking_review_type = this.ranking_review_type_label.locator('..').locator(this.row_value);
    //Change Section
    this.changes_heading = this.page
      .getByRole('heading')
      .getByText(this.reviewAllChangesPageTestData.Review_All_Changes_Page.changes_heading, { exact: true });
    this.changes_section_card = this.changes_heading.locator('..').locator('.govuk-summary-card');
    this.changes_section_card_heading = this.page
      .locator('.govuk-summary-card__title')
      .getByText(this.reviewAllChangesPageTestData.Review_All_Changes_Page.changes_card_heading);
    this.planned_end_date_label = this.changes_section_card.locator(
      this.row_label.getByText(
        this.reviewAllChangesPageTestData.Review_All_Changes_Page.Changes.planned_end_date_label,
        {
          exact: true,
        }
      )
    );
    this.planned_end_date = this.planned_end_date_label.locator('..').locator(this.row_value);
    this.which_org_type_affected_label = this.changes_section_card.locator(
      this.row_label.getByText(
        this.reviewAllChangesPageTestData.Review_All_Changes_Page.Changes.which_org_type_affected_label,
        {
          exact: true,
        }
      )
    );
    this.which_org_type_affected = this.which_org_type_affected_label.locator('..').locator(this.row_value);
    this.where_org_affected_label = this.changes_section_card.locator(
      this.row_label.getByText(
        this.reviewAllChangesPageTestData.Review_All_Changes_Page.Changes.where_org_affected_label,
        {
          exact: true,
        }
      )
    );
    this.where_org_affected = this.where_org_affected_label.locator('..').locator(this.row_value);
    this.will_org_affected_label = this.changes_section_card.locator(
      this.row_label.getByText(
        this.reviewAllChangesPageTestData.Review_All_Changes_Page.Changes.will_org_affected_label,
        {
          exact: true,
        }
      )
    );
    this.will_org_affected = this.will_org_affected_label.locator('..').locator(this.row_value);
    this.will_require_resources_label = this.changes_section_card.locator(
      this.row_label.getByText(
        this.reviewAllChangesPageTestData.Review_All_Changes_Page.Changes.will_require_resources_label,
        {
          exact: true,
        }
      )
    );
    this.will_require_resources = this.will_require_resources_label.locator('..').locator(this.row_value);
    this.changes_modification_type_label = this.changes_section_card.locator(
      this.row_label.getByText(
        this.reviewAllChangesPageTestData.Review_All_Changes_Page.Changes.changes_modification_type_label,
        {
          exact: true,
        }
      )
    );
    this.changes_modification_type = this.changes_modification_type_label.locator('..').locator(this.row_value);
    this.changes_category_label = this.changes_section_card.locator(
      this.row_label.getByText(
        this.reviewAllChangesPageTestData.Review_All_Changes_Page.Changes.changes_category_label,
        {
          exact: true,
        }
      )
    );
    this.changes_category = this.changes_category_label.locator('..').locator(this.row_value);
    this.changes_review_type_label = this.changes_section_card.locator(
      this.row_label.getByText(
        this.reviewAllChangesPageTestData.Review_All_Changes_Page.Changes.changes_review_type_label,
        {
          exact: true,
        }
      )
    );
    this.changes_review_type = this.changes_review_type_label.locator('..').locator(this.row_value);
    //Sponsor Details Section
    this.sponsor_details_heading = this.page
      .locator('.govuk-heading-m')
      .getByText(this.reviewAllChangesPageTestData.Review_All_Changes_Page.sponsor_details_heading);
    this.sponsor_details_section_card = this.page.locator('.govuk-summary-card', {
      has: this.page
        .getByRole('heading')
        .getByText(this.reviewAllChangesPageTestData.Review_All_Changes_Page.sponsor_details_card_heading, {
          exact: true,
        }),
    });
    this.sponsor_reference_label = this.sponsor_details_section_card.locator(
      this.row_label.getByText(
        this.reviewAllChangesPageTestData.Review_All_Changes_Page.Sponsor.sponsor_reference_label,
        {
          exact: true,
        }
      )
    );
    this.sponsor_reference = this.sponsor_reference_label.locator('..').locator(this.row_value);
    this.sponsor_date_label = this.sponsor_details_section_card.locator(
      this.row_label.getByText(this.reviewAllChangesPageTestData.Review_All_Changes_Page.Sponsor.sponsor_date_label, {
        exact: true,
      })
    );
    this.sponsor_date = this.sponsor_date_label.locator('..').locator(this.row_value);
    this.sponsor_summary_of_changes_label = this.sponsor_details_section_card.locator(
      this.row_label.getByText(
        this.reviewAllChangesPageTestData.Review_All_Changes_Page.Sponsor.sponsor_summary_of_changes_label,
        {
          exact: true,
        }
      )
    );
    this.sponsor_summary_of_changes = this.sponsor_summary_of_changes_label.locator('..').locator(this.row_value);
    this.now_send_to_sponsor_heading = this.page.getByRole('heading', {
      name: reviewAllChangesPageTestData.Review_All_Changes_Page.now_send_to_sponsor_heading,
    });
    this.now_send_to_sponsor_hint_label = this.page
      .getByRole('paragraph')
      .getByText(this.reviewAllChangesPageTestData.Review_All_Changes_Page.now_send_to_sponsor_hint_label);
    //Supporting documents Section
    this.supporting_documents_document_type_label = this.page.getByRole('button', {
      name: this.reviewAllChangesPageTestData.Review_All_Changes_Page.supporting_documents_table.supporting_documents_document_type_label.trim(),
    });
    this.supporting_documents_document_name_label = this.page.getByRole('button', {
      name: this.reviewAllChangesPageTestData.Review_All_Changes_Page.supporting_documents_table.supporting_documents_document_name_label.trim(),
    });
    this.supporting_documents_file_name_label = this.page.getByRole('button', {
      name: this.reviewAllChangesPageTestData.Review_All_Changes_Page.supporting_documents_table.supporting_documents_file_name_label.trim(),
    });
    this.supporting_documents_document_version_label = this.page.getByRole('button', {
      name: this.reviewAllChangesPageTestData.Review_All_Changes_Page.supporting_documents_table.supporting_documents_document_version_label.trim(),
    });
    this.supporting_documents_document_date_label = this.page.getByRole('button', {
      name: this.reviewAllChangesPageTestData.Review_All_Changes_Page.supporting_documents_table.supporting_documents_document_date_label.trim(),
    });
    this.supporting_documents_status_label = this.page.getByRole('button', {
      name: this.reviewAllChangesPageTestData.Review_All_Changes_Page.supporting_documents_table.supporting_documents_status_label.trim(),
    });
    this.supporting_documents_action_label = this.page.getByRole('button', {
      name: this.reviewAllChangesPageTestData.Review_All_Changes_Page.supporting_documents_table.supporting_documents_action_label.trim(),
    });
  }

  //Page Methods
  async gotoReviewAllChangesPage(modificationName: string) {
    await this.page.goto(
      `modifications/reviewallchanges?${this.reviewAllChangesPageTestData.Modification_Url[modificationName]}`
    );
  }

  async assertOnReviewAllChangesPage() {
    await expect(this.pageHeading).toBeVisible();
    expect(await this.page.title()).toBe(this.reviewAllChangesPageTestData.Review_All_Changes_Page.title);
  }
}
