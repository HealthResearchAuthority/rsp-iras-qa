import { expect, Locator, Page } from '@playwright/test';
import * as reviewYourAnswersPageTestData from '../../../resources/test_data/iras/make_changes/review_your_answers_data.json';
import * as linkTextData from '../../../resources/test_data/common/link_text_data.json';

//Declare Page Objects
export default class ReviewYourAnswersPage {
  readonly page: Page;
  readonly reviewYourAnswersPageTestData: typeof reviewYourAnswersPageTestData;
  readonly pageHeading: Locator;
  readonly linkTextData: typeof linkTextData;
  readonly list_row: Locator;
  readonly iras_id_row: Locator;
  readonly iras_id_text: Locator;
  readonly short_project_title_row: Locator;
  readonly short_project_title_text: Locator;
  readonly short_project_title_change_link: Locator;
  readonly planned_project_end_date_row: Locator;
  readonly planned_project_end_date_text: Locator;
  readonly planned_project_end_date_change_link: Locator;
  readonly chief_investigator_email_row: Locator;
  readonly chief_investigator_email_text: Locator;
  readonly chief_investigator_email_change_link: Locator;
  readonly sponsor_contact_email_row: Locator;
  readonly sponsor_contact_email_text: Locator;
  readonly sponsor_contact_email_change_link: Locator;
  readonly nations_participating_row: Locator;
  readonly nations_participating_checkbox: Locator;
  readonly nations_participating_change_link: Locator;
  readonly is_nhs_hsc_organisation_row: Locator;
  readonly is_nhs_hsc_organisation_radio: Locator;
  readonly is_nhs_hsc_organisation_change_link: Locator;
  readonly lead_nation_radio_row: Locator;
  readonly lead_nation_radio: Locator;
  readonly lead_nation_change_link: Locator;

  //Initialize Page Objects
  constructor(page: Page) {
    this.page = page;
    this.reviewYourAnswersPageTestData = reviewYourAnswersPageTestData;
    this.linkTextData = linkTextData;

    //Locators

    this.pageHeading = this.page
      .getByRole('heading')
      .getByText(this.reviewYourAnswersPageTestData.Review_Your_Answers_Page.heading);
    this.list_row = this.page.locator('.govuk-summary-list__row');

    this.iras_id_row = this.list_row.filter({
      has: this.page.getByText(this.reviewYourAnswersPageTestData.Review_Your_Answers_Page.iras_id_label),
    });
    this.iras_id_text = this.iras_id_row.getByRole('definition').first();
    this.short_project_title_row = this.list_row.filter({
      has: this.page.getByText(this.reviewYourAnswersPageTestData.Review_Your_Answers_Page.short_project_label),
    });
    this.short_project_title_text = this.short_project_title_row.getByRole('definition').first();
    this.short_project_title_change_link = this.short_project_title_row.getByText(
      this.linkTextData.Review_Your_Answers_Page.Change
    );
    this.planned_project_end_date_row = this.list_row.filter({
      has: this.page.getByText(this.reviewYourAnswersPageTestData.Review_Your_Answers_Page.project_end_date_label),
    });
    this.planned_project_end_date_text = this.short_project_title_row.getByRole('definition').first();
    this.planned_project_end_date_change_link = this.short_project_title_row.getByText(
      this.linkTextData.Review_Your_Answers_Page.Change
    );
    this.chief_investigator_email_row = this.list_row.filter({
      has: this.page.getByText(
        this.reviewYourAnswersPageTestData.Review_Your_Answers_Page.chief_investigator_email_label
      ),
    });
    this.chief_investigator_email_text = this.short_project_title_row.getByRole('definition').first();
    this.chief_investigator_email_change_link = this.short_project_title_row.getByText(
      this.linkTextData.Review_Your_Answers_Page.Change
    );
    this.sponsor_contact_email_row = this.list_row.filter({
      has: this.page.getByText(this.reviewYourAnswersPageTestData.Review_Your_Answers_Page.sponsor_contact_email_label),
    });
    this.sponsor_contact_email_text = this.short_project_title_row.getByRole('definition').first();
    this.sponsor_contact_email_change_link = this.short_project_title_row.getByText(
      this.linkTextData.Review_Your_Answers_Page.Change
    );
    this.nations_participating_row = this.list_row.filter({
      has: this.page.getByText(this.reviewYourAnswersPageTestData.Review_Your_Answers_Page.participating_nations_label),
    });
    this.nations_participating_checkbox = this.short_project_title_row.getByRole('definition').first();
    this.nations_participating_change_link = this.short_project_title_row.getByText(
      this.linkTextData.Review_Your_Answers_Page.Change
    );
    this.is_nhs_hsc_organisation_row = this.list_row.filter({
      has: this.page.getByText(this.reviewYourAnswersPageTestData.Review_Your_Answers_Page.participating_nations_label),
    });
    this.is_nhs_hsc_organisation_radio = this.short_project_title_row.getByRole('definition').first();
    this.is_nhs_hsc_organisation_change_link = this.short_project_title_row.getByText(
      this.linkTextData.Review_Your_Answers_Page.Change
    );
    this.lead_nation_radio_row = this.list_row.filter({
      has: this.page.getByText(this.reviewYourAnswersPageTestData.Review_Your_Answers_Page.participating_nations_label),
    });
    this.lead_nation_radio = this.short_project_title_row.getByRole('definition').first();
    this.lead_nation_change_link = this.short_project_title_row.getByText(
      this.linkTextData.Review_Your_Answers_Page.Change
    );
  }

  //Page Methods
  async assertOnReviewYourAnswersPage() {
    await expect(this.pageHeading).toBeVisible();
  }
}
