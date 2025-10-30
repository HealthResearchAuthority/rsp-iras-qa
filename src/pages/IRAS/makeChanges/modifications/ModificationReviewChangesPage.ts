import { expect, Locator, Page } from '@playwright/test';
import * as modificationReviewChangesPageTestData from '../../../../resources/test_data/iras/make_changes/modifications/modification_review_changes_data.json';

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
  readonly select_change_row: Locator;
  readonly select_change: Locator;
  readonly select_change_change_link: Locator;
  readonly which_reference_do_you_need_to_change_checkboxes_row: Locator;
  readonly which_reference_do_you_need_to_change_checkboxes: Locator;
  readonly which_reference_do_you_need_to_change_checkboxes_change_link: Locator;
  readonly isrctn_reference_number_textbox_row: Locator;
  readonly isrctn_reference_number_textbox: Locator;
  readonly isrctn_reference_number_textbox_change_link: Locator;
  readonly nct_reference_number_textbox_row: Locator;
  readonly nct_reference_number_textbox: Locator;
  readonly nct_reference_number_textbox_change_link: Locator;
  readonly funder_name_textbox_row: Locator;
  readonly funder_name_textbox: Locator;
  readonly funder_name_textbox_change_link: Locator;
  readonly funder_reference_number_textbox_row: Locator;
  readonly funder_reference_number_textbox: Locator;
  readonly funder_reference_number_textbox_change_link: Locator;
  readonly other_reference_number_textbox_row: Locator;
  readonly other_reference_number_textbox: Locator;
  readonly other_reference_number_textbox_change_link: Locator;
  readonly what_other_is_textbox_row: Locator;
  readonly what_other_is_textbox: Locator;
  readonly what_other_is_textbox_change_link: Locator;
  readonly new_short_project_title_text_row: Locator;
  readonly new_short_project_title_text: Locator;
  readonly new_short_project_title_text_change_link: Locator;
  readonly new_full_project_title_text_row: Locator;
  readonly new_full_project_title_text: Locator;
  readonly new_full_project_title_text_change_link: Locator;

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

    this.select_change_row = this.page.getByText(
      modificationReviewChangesPageTestData.Review_Changes_Page.select_change_label
    );

    this.select_change = this.select_change_row.locator('..').locator('.govuk-summary-list__value');
    this.select_change_change_link = this.select_change_row.locator('..').getByRole('link');

    this.which_reference_do_you_need_to_change_checkboxes_row = this.page.getByText(
      modificationReviewChangesPageTestData.Review_Changes_Page.which_reference_do_you_need_to_change_label
    );

    this.which_reference_do_you_need_to_change_checkboxes = this.which_reference_do_you_need_to_change_checkboxes_row
      .locator('..')
      .locator('.govuk-summary-list__value');
    this.which_reference_do_you_need_to_change_checkboxes_change_link =
      this.which_reference_do_you_need_to_change_checkboxes_row.locator('..').getByRole('link');

    this.isrctn_reference_number_textbox_row = this.page.getByText(
      modificationReviewChangesPageTestData.Review_Changes_Page.isrctn_reference_number_label
    );

    this.isrctn_reference_number_textbox = this.isrctn_reference_number_textbox_row
      .locator('..')
      .locator('.govuk-summary-list__value');
    this.isrctn_reference_number_textbox_change_link = this.isrctn_reference_number_textbox_row
      .locator('..')
      .getByRole('link');

    this.nct_reference_number_textbox_row = this.page.getByText(
      modificationReviewChangesPageTestData.Review_Changes_Page.nct_reference_number_label
    );

    this.nct_reference_number_textbox = this.nct_reference_number_textbox_row
      .locator('..')
      .locator('.govuk-summary-list__value');
    this.nct_reference_number_textbox_change_link = this.nct_reference_number_textbox_row
      .locator('..')
      .getByRole('link');

    this.funder_name_textbox_row = this.page.getByText(
      modificationReviewChangesPageTestData.Review_Changes_Page.funder_name_label
    );

    this.funder_name_textbox = this.funder_name_textbox_row.locator('..').locator('.govuk-summary-list__value');
    this.funder_name_textbox_change_link = this.funder_name_textbox_row.locator('..').getByRole('link');

    this.funder_reference_number_textbox_row = this.page.getByText(
      modificationReviewChangesPageTestData.Review_Changes_Page.funder_reference_number_label
    );

    this.funder_reference_number_textbox = this.funder_reference_number_textbox_row
      .locator('..')
      .locator('.govuk-summary-list__value');
    this.funder_reference_number_textbox_change_link = this.funder_reference_number_textbox_row
      .locator('..')
      .getByRole('link');

    this.other_reference_number_textbox_row = this.page.getByText(
      modificationReviewChangesPageTestData.Review_Changes_Page.other_reference_number_label
    );

    this.other_reference_number_textbox = this.other_reference_number_textbox_row
      .locator('..')
      .locator('.govuk-summary-list__value');
    this.other_reference_number_textbox_change_link = this.other_reference_number_textbox_row
      .locator('..')
      .getByRole('link');

    this.what_other_is_textbox_row = this.page.getByText(
      modificationReviewChangesPageTestData.Review_Changes_Page.what_other_is_label
    );

    this.what_other_is_textbox = this.what_other_is_textbox_row.locator('..').locator('.govuk-summary-list__value');
    this.what_other_is_textbox_change_link = this.what_other_is_textbox_row.locator('..').getByRole('link');

    this.new_short_project_title_text_row = this.page.getByText(
      modificationReviewChangesPageTestData.Review_Changes_Page.new_short_project_title_label
    );

    this.new_short_project_title_text = this.new_short_project_title_text_row
      .locator('..')
      .locator('.govuk-summary-list__value');
    this.new_short_project_title_text_change_link = this.new_short_project_title_text_row
      .locator('..')
      .getByRole('link');

    this.new_full_project_title_text_row = this.page.getByText(
      modificationReviewChangesPageTestData.Review_Changes_Page.new_full_project_title_label
    );

    this.new_full_project_title_text = this.new_full_project_title_text_row
      .locator('..')
      .locator('.govuk-summary-list__value');
    this.new_full_project_title_text_change_link = this.new_full_project_title_text_row.locator('..').getByRole('link');
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
      case 'select_change':
        await this.select_change_change_link.click();
        break;
      case 'which_reference':
        await this.which_reference_do_you_need_to_change_checkboxes_change_link.click();
        break;
      case 'isrctn_reference_number':
        await this.isrctn_reference_number_textbox_change_link.click();
        break;
      case 'nct_reference_number':
        await this.nct_reference_number_textbox_change_link.click();
        break;
      case 'funder_name':
        await this.funder_name_textbox_change_link.click();
        break;
      case 'funder_reference_number':
        await this.funder_reference_number_textbox_change_link.click();
        break;
      case 'other_reference_number':
        await this.other_reference_number_textbox_change_link.click();
        break;
      case 'what_other_is':
        await this.what_other_is_textbox_change_link.click();
        break;
      case 'new_short_project_title':
        await this.new_short_project_title_text_change_link.click();
        break;
      case 'new_full_project_title':
        await this.new_full_project_title_text_change_link.click();
        break;
      default:
        throw new Error(`${changeLink} is not a valid option`);
    }
  }
}
