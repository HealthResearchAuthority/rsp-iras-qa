import { expect, Locator, Page } from '@playwright/test';
import * as participatingOrganisationsPageTestData from '../../../../resources/test_data/iras/make_changes/modifications/participating_organisations_data.json';
import * as buttonTextData from '../../../../resources/test_data/common/button_text_data.json';
import * as linkTextData from '../../../../resources/test_data/common/link_text_data.json';
import * as commonTestData from '../../../../resources/test_data/common/common_data.json';

//Declare Page Objects
export default class MakeChangeParticipatingOrganisationsPage {
  readonly page: Page;
  readonly participatingOrganisationsPageTestData: typeof participatingOrganisationsPageTestData;
  readonly buttonTextData: typeof buttonTextData;
  readonly linkTextData: typeof linkTextData;
  readonly commonTestData: typeof commonTestData;
  readonly short_project_title_heading: Locator;
  readonly pageHeading: Locator; // update locator name
  readonly iras_id_row: Locator;
  readonly iras_id_text: Locator;
  readonly short_project_title_text_row: Locator;
  readonly short_project_title_text: Locator;
  readonly modification_id_text_row: Locator;
  readonly modification_id_text: Locator;
  readonly participating_organisations_text: Locator;
  readonly participating_organisations_search_button: Locator;
  readonly advanced_filter_link: Locator;
  readonly remove_this_change_link: Locator;

  //Initialize Page Objects
  constructor(page: Page) {
    this.page = page;
    this.participatingOrganisationsPageTestData = participatingOrganisationsPageTestData;
    this.linkTextData = linkTextData;
    this.buttonTextData = buttonTextData;
    this.commonTestData = commonTestData;

    //Locators
    this.pageHeading = this.page.locator('.govuk-heading-l');
    this.iras_id_row = this.page.getByText(participatingOrganisationsPageTestData.Label_Texts.iras_id_label);
    this.iras_id_text = this.iras_id_row.locator('..').locator('.govuk-summary-list__value');
    this.short_project_title_text_row = this.page.getByText(
      this.participatingOrganisationsPageTestData.Label_Texts.short_project_title_label
    );
    this.short_project_title_text = this.short_project_title_text_row
      .locator('..')
      .locator('.govuk-summary-list__value');
    this.modification_id_text_row = this.page.getByText(
      this.participatingOrganisationsPageTestData.Label_Texts.modification_id_label
    );
    this.modification_id_text = this.modification_id_text_row.locator('..').locator('.govuk-summary-list__value');
    this.participating_organisations_text = this.page.getByTestId('SearchTerm');

    // When search function implemented on this page the below locator need to be removed to handle in common functions
    this.participating_organisations_search_button = this.page.getByRole('button', {
      name: this.buttonTextData.Participating_Organisations_Page.Search,
      exact: true,
    });
    this.advanced_filter_link = this.page.getByRole('link', {
      name: this.linkTextData.Participating_Organisations_Page.Advanced_Filter,
      exact: true,
    });
    this.remove_this_change_link = this.page.getByRole('link', {
      name: this.linkTextData.Participating_Organisations_Page.Remove_This_Change,
      exact: true,
    });
  }

  //Page Methods
  async assertOnParticipatingOrganisationsPage() {
    await expect(this.pageHeading).toBeVisible();
  }
}
