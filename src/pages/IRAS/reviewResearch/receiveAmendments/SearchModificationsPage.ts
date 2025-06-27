import { expect, Locator, Page } from '@playwright/test';
import * as linkTextData from '../../../../resources/test_data/common/link_text_data.json';
import * as searchModificationsPageTestData from '../../../../resources/test_data/iras/reviewResearch/receiveAmendments/search_modifications_page_data.json';

//Declare Page Objects
export default class SearchModificationsPage {
  readonly page: Page;
  readonly searchModificationsPageTestData: typeof searchModificationsPageTestData;
  readonly linkTextData: typeof linkTextData;
  readonly page_heading: Locator;
  readonly back_button: Locator;
  readonly search_box: Locator;
  readonly search_button_label: Locator;
  readonly next_button: Locator;
  readonly search_box_label: Locator;
  readonly firstNameFromListLabel: Locator;
  readonly no_results_heading: Locator;
  readonly no_results_guidance_text: Locator;
  readonly listCell: Locator;

  //Initialize Page Objects
  constructor(page: Page) {
    this.page = page;
    this.searchModificationsPageTestData = searchModificationsPageTestData;

    //Locators
    this.page_heading = this.page
      .getByRole('heading')
      .getByText(this.searchModificationsPageTestData.Search_Modifications_Page.page_heading);
    this.back_button = this.page.getByText('Back');
    this.search_box_label = this.page.locator('label[for="SearchQuery"]');
    this.search_box = this.page.getByTestId('SearchQuery');
    this.search_button_label = this.page.getByText('Search');
    this.firstNameFromListLabel = this.page.locator('td:nth-child(1)');
    this.next_button = this.page.locator('.govuk-pagination__next a');
    this.no_results_heading = this.page
      .getByRole('heading')
      .getByText(this.searchModificationsPageTestData.Search_Modifications_Page.no_results_heading, { exact: true });
    this.no_results_guidance_text = this.page
      .getByRole('paragraph')
      .getByText(this.searchModificationsPageTestData.Search_Modifications_Page.no_results_guidance_text, {
        exact: true,
      });
    this.listCell = this.page.getByRole('cell');
  }

  //Getters & Setters for Private Variables

  async assertOnSearchModificationsPage() {
    await expect(this.page_heading).toBeVisible();
    expect(await this.page.title()).toBe(this.searchModificationsPageTestData.Search_Modifications_Page.title);
  }

  async goto(pageSize?: string, searchQuery?: string) {
    if (typeof pageSize !== 'undefined' && typeof searchQuery !== 'undefined') {
      await this.page.goto(`admin/users?SearchQuery=${searchQuery}&PageSize=${pageSize}`);
    } else if (typeof pageSize !== 'undefined') {
      await this.page.goto(`admin/users?pageSize=${pageSize}`);
    } else {
      await this.page.goto('admin/users');
    }
    await this.assertOnSearchModificationsPage();
  }
}
