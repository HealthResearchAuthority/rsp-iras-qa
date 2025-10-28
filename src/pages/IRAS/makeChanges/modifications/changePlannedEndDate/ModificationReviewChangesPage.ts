import { expect, Locator, Page } from '@playwright/test';
import * as modificationReviewChangesPageTestData from '../../../../../resources/test_data/iras/make_changes/modifications/changePlannedEndDate/modification_review_changes_data.json';

//Declare Page Objects
export default class ModificationReviewChangesPage {
  readonly page: Page;
  readonly modificationReviewChangesPageTestData: typeof modificationReviewChangesPageTestData;
  readonly pageHeading: Locator;
  readonly sub_heading_specific_change_label: Locator;
  readonly new_planned_project_end_date_row: Locator;
  readonly new_planned_project_end_date_text: Locator;
  readonly new_planned_project_end_date_change_link: Locator;
  readonly affected_organisation_types_row: Locator;
  readonly affected_organisation_types_text: Locator;
  readonly affected_organisation_types_change_link: Locator;
  readonly affected_nhs_hsc_locations_row: Locator;
  readonly affected_nhs_hsc_locations_text: Locator;
  readonly affected_nhs_hsc_locations_change_link: Locator;
  readonly portion_of_nhs_hsc_organisations_affected_row: Locator;
  readonly portion_of_nhs_hsc_organisations_affected_text: Locator;
  readonly portion_of_nhs_hsc_organisations_affected_change_link: Locator;
  readonly additional_resource_implications_row: Locator;
  readonly additional_resource_implications_text: Locator;
  readonly additional_resource_implications_change_link: Locator;
  readonly affected_non_nhs_hsc_locations_row: Locator;
  readonly affected_non_nhs_hsc_locations_text: Locator;
  readonly affected_non_nhs_hsc_locations_change_link: Locator;
  readonly changes_free_text_row: Locator;
  readonly changes_free_text: Locator;
  readonly changes_free_text_change_link: Locator;
  readonly select_details_to_change_row: Locator;
  readonly select_details_to_change_value: Locator;
  readonly select_details_to_change_change_link: Locator;
  readonly chief_investigator_email_row: Locator;
  readonly chief_investigator_email_value: Locator;
  readonly chief_investigator_email_change_link: Locator;
  readonly sponsor_contact_email_row: Locator;
  readonly sponsor_contact_email_value: Locator;
  readonly sponsor_contact_email_change_link: Locator;
  readonly name_text_row: Locator;
  readonly name_text_value: Locator;
  readonly name_text_change_link: Locator;
  readonly email_text_row: Locator;
  readonly email_text_value: Locator;
  readonly email_text_change_link: Locator;

  //Initialize Page Objects
  constructor(page: Page) {
    this.page = page;
    this.modificationReviewChangesPageTestData = modificationReviewChangesPageTestData;

    //Locators
    this.pageHeading = this.page
      .getByRole('heading', { level: 1 })
      .getByText(modificationReviewChangesPageTestData.Review_Changes_Page.page_heading_label);

    this.sub_heading_specific_change_label = this.page
      .getByRole('heading', { level: 2 })
      .getByText(modificationReviewChangesPageTestData.Review_Changes_Page.sub_heading_specific_change_label);

    this.new_planned_project_end_date_row = this.page.getByText(
      modificationReviewChangesPageTestData.Label_Texts_Nhs.new_planned_project_end_date_label
    );
    this.new_planned_project_end_date_text = this.new_planned_project_end_date_row
      .locator('..')
      .locator('.govuk-summary-list__value');

    this.new_planned_project_end_date_change_link = this.new_planned_project_end_date_row
      .locator('..')
      .getByRole('link');

    this.affected_organisation_types_row = this.page.getByText(
      modificationReviewChangesPageTestData.Label_Texts_Nhs.affected_organisation_types_label
    );
    this.affected_organisation_types_text = this.affected_organisation_types_row
      .locator('..')
      .locator('.govuk-summary-list__value');

    this.affected_organisation_types_change_link = this.affected_organisation_types_row.locator('..').getByRole('link');
    //This affected_nhs_hsc_locations_label label is incorrect due to CMS changes , once all CMS changes are fixed this label will be updated in data file
    this.affected_nhs_hsc_locations_row = this.page.getByText(
      modificationReviewChangesPageTestData.Label_Texts_Nhs.affected_nhs_hsc_locations_label
    );
    this.affected_nhs_hsc_locations_text = this.affected_nhs_hsc_locations_row
      .locator('..')
      .locator('.govuk-summary-list__value');

    this.affected_nhs_hsc_locations_change_link = this.affected_nhs_hsc_locations_row.locator('..').getByRole('link');

    this.affected_non_nhs_hsc_locations_row = this.page.getByText(
      modificationReviewChangesPageTestData.Label_Texts_Non_Nhs.affected_non_nhs_hsc_locations_label
    );
    this.affected_non_nhs_hsc_locations_text = this.affected_non_nhs_hsc_locations_row
      .locator('..')
      .locator('.govuk-summary-list__value');

    this.affected_non_nhs_hsc_locations_change_link = this.affected_non_nhs_hsc_locations_row
      .locator('..')
      .getByRole('link');

    this.portion_of_nhs_hsc_organisations_affected_row = this.page.getByText(
      modificationReviewChangesPageTestData.Label_Texts_Nhs.portion_of_nhs_hsc_organisations_affected_label
    );
    this.portion_of_nhs_hsc_organisations_affected_text = this.portion_of_nhs_hsc_organisations_affected_row
      .locator('..')
      .locator('.govuk-summary-list__value');

    this.portion_of_nhs_hsc_organisations_affected_change_link = this.portion_of_nhs_hsc_organisations_affected_row
      .locator('..')
      .getByRole('link');

    this.additional_resource_implications_row = this.page.getByText(
      modificationReviewChangesPageTestData.Label_Texts_Nhs.additional_resource_implications_label
    );
    this.additional_resource_implications_text = this.additional_resource_implications_row
      .locator('..')
      .locator('.govuk-summary-list__value');

    this.additional_resource_implications_change_link = this.additional_resource_implications_row
      .locator('..')
      .getByRole('link');
    this.changes_free_text_row = this.page.getByText(
      modificationReviewChangesPageTestData.Label_Texts_Nhs.details_describing_this_change_label
    );
    this.changes_free_text = this.changes_free_text_row.locator('..').locator('.govuk-summary-list__value');

    this.changes_free_text_change_link = this.changes_free_text_row.locator('..').getByRole('link');
    this.select_details_to_change_row = this.page.getByText(
      modificationReviewChangesPageTestData.Review_Changes_Page.select_details_to_change
    );
    this.select_details_to_change_value = this.select_details_to_change_row
      .locator('..')
      .locator('.govuk-summary-list__value');
    this.select_details_to_change_change_link = this.select_details_to_change_row.locator('..').getByRole('link');
    this.chief_investigator_email_row = this.page.getByText(
      modificationReviewChangesPageTestData.Review_Changes_Page.chief_investigator_email
    );
    this.chief_investigator_email_value = this.chief_investigator_email_row
      .locator('..')
      .locator('.govuk-summary-list__value');
    this.chief_investigator_email_change_link = this.chief_investigator_email_row.locator('..').getByRole('link');
    this.sponsor_contact_email_row = this.page.getByText(
      modificationReviewChangesPageTestData.Review_Changes_Page.sponsor_contact_email
    );
    this.sponsor_contact_email_value = this.sponsor_contact_email_row
      .locator('..')
      .locator('.govuk-summary-list__value');
    this.sponsor_contact_email_change_link = this.sponsor_contact_email_row.locator('..').getByRole('link');
    this.name_text_row = this.page.getByText(modificationReviewChangesPageTestData.Review_Changes_Page.name_text);
    this.name_text_value = this.name_text_row.locator('..').locator('.govuk-summary-list__value');
    this.name_text_change_link = this.name_text_row.locator('..').getByRole('link');
    this.email_text_row = this.page.getByText(modificationReviewChangesPageTestData.Review_Changes_Page.email_text, {
      exact: true,
    });
    this.email_text_value = this.email_text_row.locator('..').locator('.govuk-summary-list__value');
    this.email_text_change_link = this.email_text_row.locator('..').getByRole('link');
  }

  //Page Methods
  async assertOnModificationReviewChangesPage() {
    await expect(this.pageHeading).toBeVisible();
  }
  async assertOnReviewChangesSpecificChangePage(specificChange: string) {
    await expect.soft(this.pageHeading).toBeVisible();
    await expect.soft(this.page.getByRole('heading', { level: 2 }).getByText(specificChange)).toBeVisible();
  }

  async clickChangeLinks(changeLink: string) {
    switch (changeLink.trim().toLowerCase()) {
      case 'new_planned_end_date':
        await this.new_planned_project_end_date_change_link.click();
        break;
      case 'affected_organisation_types':
        await this.affected_organisation_types_change_link.click();
        break;
      case 'affected_nhs_hsc_locations':
        await this.affected_nhs_hsc_locations_change_link.click();
        break;
      case 'affected_non_nhs_hsc_locations':
        await this.affected_non_nhs_hsc_locations_change_link.click();
        break;
      case 'portion_of_nhs_hsc_organisations':
        await this.portion_of_nhs_hsc_organisations_affected_change_link.click();
        break;
      case 'additional_resource_implications':
        await this.additional_resource_implications_change_link.click();
        break;
      case 'changes_free_text':
        await this.changes_free_text_change_link.click();
        break;
      case 'select_contact_details_to_change':
        await this.select_details_to_change_change_link.click();
        break;
      case 'chief_investigator_email':
        await this.chief_investigator_email_change_link.click();
        break;
      case 'sponsor_contact_email':
        await this.sponsor_contact_email_change_link.click();
        break;
      case 'name_text':
        await this.name_text_change_link.click();
        break;
      case 'email_text':
        await this.email_text_change_link.click();
        break;
      default:
        throw new Error(`${changeLink} is not a valid option`);
    }
  }
}
