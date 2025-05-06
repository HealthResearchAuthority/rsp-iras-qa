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
  readonly short_project_title_enter_link: Locator;
  readonly planned_project_end_date_row: Locator;
  readonly planned_project_end_date_text: Locator;
  readonly planned_project_end_date_change_link: Locator;
  readonly planned_project_end_date_enter_link: Locator;
  readonly chief_investigator_email_row: Locator;
  readonly chief_investigator_email_text: Locator;
  readonly chief_investigator_email_change_link: Locator;
  readonly chief_investigator_email_enter_link: Locator;
  readonly sponsor_contact_email_row: Locator;
  readonly sponsor_contact_email_text: Locator;
  readonly sponsor_contact_email_change_link: Locator;
  readonly sponsor_contact_email_enter_link: Locator;
  readonly nations_participating_row: Locator;
  readonly nations_participating_checkbox: Locator;
  readonly nations_participating_change_link: Locator;
  readonly nations_participating_enter_link: Locator;
  readonly is_nhs_hsc_organisation_row: Locator;
  readonly is_nhs_hsc_organisation_radio: Locator;
  readonly is_nhs_hsc_organisation_change_link: Locator;
  readonly is_nhs_hsc_organisation_enter_link: Locator;
  readonly lead_nation_radio_row: Locator;
  readonly lead_nation_radio: Locator;
  readonly lead_nation_change_link: Locator;
  readonly lead_nation_enter_link: Locator;

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
    this.short_project_title_enter_link = this.short_project_title_text.getByText(
      this.reviewYourAnswersPageTestData.Review_Your_Answers_Page.short_project_title_enter_link
    );
    this.planned_project_end_date_row = this.list_row.filter({
      has: this.page.getByText(this.reviewYourAnswersPageTestData.Review_Your_Answers_Page.project_end_date_label),
    });
    this.planned_project_end_date_text = this.planned_project_end_date_row.getByRole('definition').first();
    this.planned_project_end_date_change_link = this.planned_project_end_date_row.getByText(
      this.linkTextData.Review_Your_Answers_Page.Change
    );
    this.planned_project_end_date_enter_link = this.planned_project_end_date_text.getByText(
      this.reviewYourAnswersPageTestData.Review_Your_Answers_Page.project_end_date_enter_link
    );
    this.chief_investigator_email_row = this.list_row.filter({
      has: this.page.getByText(
        this.reviewYourAnswersPageTestData.Review_Your_Answers_Page.chief_investigator_email_label
      ),
    });
    this.chief_investigator_email_text = this.chief_investigator_email_row.getByRole('definition').first();
    this.chief_investigator_email_change_link = this.chief_investigator_email_row.getByText(
      this.linkTextData.Review_Your_Answers_Page.Change
    );
    this.chief_investigator_email_enter_link = this.chief_investigator_email_text.getByText(
      this.reviewYourAnswersPageTestData.Review_Your_Answers_Page.chief_investigator_email_enter_link
    );
    this.sponsor_contact_email_row = this.list_row.filter({
      has: this.page.getByText(this.reviewYourAnswersPageTestData.Review_Your_Answers_Page.sponsor_contact_email_label),
    });
    this.sponsor_contact_email_text = this.sponsor_contact_email_row.getByRole('definition').first();
    this.sponsor_contact_email_change_link = this.sponsor_contact_email_row.getByText(
      this.linkTextData.Review_Your_Answers_Page.Change
    );
    this.sponsor_contact_email_enter_link = this.sponsor_contact_email_text.getByText(
      this.reviewYourAnswersPageTestData.Review_Your_Answers_Page.sponsor_contact_email_enter_link
    );
    this.nations_participating_row = this.list_row.filter({
      has: this.page.getByText(this.reviewYourAnswersPageTestData.Review_Your_Answers_Page.participating_nations_label),
    });
    this.nations_participating_checkbox = this.nations_participating_row.getByRole('definition').first();
    this.nations_participating_change_link = this.nations_participating_row.getByText(
      this.linkTextData.Review_Your_Answers_Page.Change
    );
    this.nations_participating_enter_link = this.nations_participating_checkbox.getByText(
      this.reviewYourAnswersPageTestData.Review_Your_Answers_Page.nations_participating_enter_link
    );
    this.is_nhs_hsc_organisation_row = this.list_row.filter({
      has: this.page.getByText(this.reviewYourAnswersPageTestData.Review_Your_Answers_Page.nhs_hsc_organisations_label),
    });
    this.is_nhs_hsc_organisation_radio = this.is_nhs_hsc_organisation_row.getByRole('definition').first();
    this.is_nhs_hsc_organisation_change_link = this.is_nhs_hsc_organisation_row.getByText(
      this.linkTextData.Review_Your_Answers_Page.Change
    );
    this.is_nhs_hsc_organisation_enter_link = this.is_nhs_hsc_organisation_radio.getByText(
      this.reviewYourAnswersPageTestData.Review_Your_Answers_Page.is_nhs_hsc_organisation_enter_link
    );
    this.lead_nation_radio_row = this.list_row.filter({
      has: this.page.getByText(this.reviewYourAnswersPageTestData.Review_Your_Answers_Page.lead_nation_label),
    });
    this.lead_nation_radio = this.lead_nation_radio_row.getByRole('definition').first();
    this.lead_nation_change_link = this.lead_nation_radio_row.getByText(
      this.linkTextData.Review_Your_Answers_Page.Change
    );
    this.lead_nation_enter_link = this.lead_nation_radio.getByText(
      this.reviewYourAnswersPageTestData.Review_Your_Answers_Page.lead_nation_enter_link
    );
  }

  //Page Methods
  async assertOnReviewYourAnswersPage() {
    await expect(this.pageHeading).toBeVisible();
  }

  async getPlannedProjectEndDate() {
    const plannedProjectEndDate = await this.planned_project_end_date_text.textContent();
    return plannedProjectEndDate;
  }

  async clickChangeLinks(changeLink: string) {
    switch (changeLink.trim().toLowerCase()) {
      case 'project_title':
        await this.short_project_title_change_link.click();
        break;
      case 'project_end_date':
        await this.planned_project_end_date_change_link.click();
        break;
      case 'chief_investigator':
        await this.chief_investigator_email_change_link.click();
        break;
      case 'sponsor_contact':
        await this.sponsor_contact_email_change_link.click();
        break;

      case 'nations_participating':
        await this.nations_participating_change_link.click();
        break;
      case 'nhs_hsc_organisation':
        await this.is_nhs_hsc_organisation_change_link.click();
        break;
      case 'lead_nation':
        await this.lead_nation_change_link.click();
        break;
      default:
        throw new Error(`${changeLink} is not a valid option`);
    }
  }

  async clickEnterLinks(enterLink: string) {
    switch (enterLink.trim().toLowerCase()) {
      case 'project_title':
        await this.short_project_title_enter_link.click();
        break;
      case 'project_end_date':
        await this.planned_project_end_date_enter_link.click();
        break;
      case 'chief_investigator':
        await this.chief_investigator_email_enter_link.click();
        break;
      case 'sponsor_contact':
        await this.sponsor_contact_email_enter_link.click();
        break;
      case 'nations_participating':
        await this.nations_participating_enter_link.click();
        break;
      case 'nhs_hsc_organisation':
        await this.is_nhs_hsc_organisation_enter_link.click();
        break;
      case 'lead_nation':
        await this.lead_nation_enter_link.click();
        break;
      default:
        throw new Error(`${enterLink} is not a valid option`);
    }
  }
}
