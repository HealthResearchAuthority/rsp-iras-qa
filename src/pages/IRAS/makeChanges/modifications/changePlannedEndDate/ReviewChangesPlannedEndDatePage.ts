import { expect, Locator, Page } from '@playwright/test';
import * as reviewChangesPlannedEndDatePageTestData from '../../../../../resources/test_data/iras/make_changes/modifications/changePlannedEndDate/review_changes_planned_end_date_data.json';

//Declare Page Objects
export default class ChangePlannedEndDateReviewModificationsPage {
  readonly page: Page;
  readonly reviewChangesPlannedEndDatePageTestData: typeof reviewChangesPlannedEndDatePageTestData;
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

  //Initialize Page Objects
  constructor(page: Page) {
    this.page = page;
    this.reviewChangesPlannedEndDatePageTestData = reviewChangesPlannedEndDatePageTestData;

    //Locators
    this.pageHeading = this.page
      .getByRole('heading', { level: 1 })
      .getByText(reviewChangesPlannedEndDatePageTestData.Review_Changes_Page.page_heading_label);

    this.sub_heading_specific_change_label = this.page
      .getByRole('heading', { level: 2 })
      .getByText(reviewChangesPlannedEndDatePageTestData.Review_Changes_Page.sub_heading_specific_change_label);

    this.new_planned_project_end_date_row = this.page.getByText(
      reviewChangesPlannedEndDatePageTestData.Label_Texts_Nhs.new_planned_project_end_date_label
    );
    this.new_planned_project_end_date_text = this.new_planned_project_end_date_row
      .locator('..')
      .locator('.govuk-summary-list__value');

    this.new_planned_project_end_date_change_link = this.new_planned_project_end_date_row
      .locator('..')
      .getByRole('link');

    this.affected_organisation_types_row = this.page.getByText(
      reviewChangesPlannedEndDatePageTestData.Label_Texts_Nhs.affected_organisation_types_label
    );
    this.affected_organisation_types_text = this.affected_organisation_types_row
      .locator('..')
      .locator('.govuk-summary-list__value');

    this.affected_organisation_types_change_link = this.affected_organisation_types_row.locator('..').getByRole('link');
    //This affected_nhs_hsc_locations_label label is incorrect due to CMS changes , once all CMS changes are fixed this label will be updated in data file
    this.affected_nhs_hsc_locations_row = this.page.getByText(
      reviewChangesPlannedEndDatePageTestData.Label_Texts_Nhs.affected_nhs_hsc_locations_label
    );
    this.affected_nhs_hsc_locations_text = this.affected_nhs_hsc_locations_row
      .locator('..')
      .locator('.govuk-summary-list__value');

    this.affected_nhs_hsc_locations_change_link = this.affected_nhs_hsc_locations_row.locator('..').getByRole('link');

    this.affected_non_nhs_hsc_locations_row = this.page.getByText(
      reviewChangesPlannedEndDatePageTestData.Label_Texts_Non_Nhs.affected_non_nhs_hsc_locations_label
    );
    this.affected_non_nhs_hsc_locations_text = this.affected_non_nhs_hsc_locations_row
      .locator('..')
      .locator('.govuk-summary-list__value');

    this.affected_non_nhs_hsc_locations_change_link = this.affected_non_nhs_hsc_locations_row
      .locator('..')
      .getByRole('link');

    this.portion_of_nhs_hsc_organisations_affected_row = this.page.getByText(
      reviewChangesPlannedEndDatePageTestData.Label_Texts_Nhs.portion_of_nhs_hsc_organisations_affected_label
    );
    this.portion_of_nhs_hsc_organisations_affected_text = this.portion_of_nhs_hsc_organisations_affected_row
      .locator('..')
      .locator('.govuk-summary-list__value');

    this.portion_of_nhs_hsc_organisations_affected_change_link = this.portion_of_nhs_hsc_organisations_affected_row
      .locator('..')
      .getByRole('link');

    this.additional_resource_implications_row = this.page.getByText(
      reviewChangesPlannedEndDatePageTestData.Label_Texts_Nhs.additional_resource_implications_label
    );
    this.additional_resource_implications_text = this.additional_resource_implications_row
      .locator('..')
      .locator('.govuk-summary-list__value');

    this.additional_resource_implications_change_link = this.additional_resource_implications_row
      .locator('..')
      .getByRole('link');
  }

  //Page Methods
  async assertOnReviewChangesPlannedEndDatePage() {
    await expect(this.pageHeading).toBeVisible();
    await expect(this.sub_heading_specific_change_label).toBeVisible();
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
      default:
        throw new Error(`${changeLink} is not a valid option`);
    }
  }
}
