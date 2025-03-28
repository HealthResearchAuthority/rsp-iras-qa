import { expect, Locator, Page } from '@playwright/test';
import * as manageUsersPageData from '../../../../../resources/test_data/iras/reviewResearch/userAdministration/manageUsers/pages/manage_users_page_data.json';
import * as linkTextData from '../../../../../resources/test_data/common/link_text_data.json';

//Declare Page Objects
export default class ManageUsersPage {
  readonly page: Page;
  readonly manageUsersPageData: typeof manageUsersPageData;
  readonly linkTextData: typeof linkTextData;
  readonly page_heading: Locator;
  readonly back_button: Locator;
  readonly add_new_users_record_link: Locator;
  readonly first_name_column_header_label: Locator;
  readonly last_name_column_header_label: Locator;
  readonly email_address_column_header_label: Locator;
  readonly status_column_header_label: Locator;
  readonly last_logged_in_column_header_label: Locator;
  readonly actions_column_header_label: Locator;
  readonly view_edit_link: Locator;
  readonly search_box_label: Locator;
  readonly search_box: Locator;
  readonly search_button_label: Locator;
  readonly firstNameFromListLabel: Locator;
  readonly users_list_rows: Locator;
  readonly next_button: Locator;

  //Initialize Page Objects
  constructor(page: Page) {
    this.page = page;
    this.manageUsersPageData = manageUsersPageData;

    //Locators
    this.page_heading = this.page.locator('.govuk-heading-l');
    // this.view_edit_link = this.page.locator('(//a[@class="govuk-link" and text()="View/Edit"])[1]');
    this.view_edit_link = this.page.getByText('View/Edit').first();
    this.users_list_rows = this.page.locator('table tbody tr');
    this.back_button = this.page.getByText('Back');
    this.add_new_users_record_link = this.page.getByText('Add a new user profile record');
    this.first_name_column_header_label = this.page.locator(
      '[class$="govuk-table-users"] [class^="govuk-table__header"]:nth-child(1)'
    );
    this.last_name_column_header_label = this.page.locator(
      '[class$="govuk-table-users"] [class^="govuk-table__header"]:nth-child(2)'
    );
    this.email_address_column_header_label = this.page.locator(
      '[class$="govuk-table-users"] [class^="govuk-table__header"]:nth-child(3)'
    );
    this.status_column_header_label = this.page.locator(
      '[class$="govuk-table-users"] [class^="govuk-table__header"]:nth-child(4)'
    );
    this.last_logged_in_column_header_label = this.page.locator(
      '[class$="govuk-table-users"] [class^="govuk-table__header"]:nth-child(5)'
    );
    this.actions_column_header_label = this.page.locator(
      '[class$="govuk-table-users"] [class^="govuk-table__header"]:nth-child(6)'
    );
    this.search_box_label = this.page.locator('label[for="SearchUser"]');
    this.search_box = this.page.getByTestId('SearchUser');
    this.search_button_label = this.page.getByText('Search');
    this.firstNameFromListLabel = this.page.locator('td:nth-child(1)');
    // add next button pagination
    this.next_button = this.page.locator('.govuk-pagination__next a');
  }

  async assertOnManageUsersPage() {
    await expect(this.page_heading).toBeVisible();
    await expect(this.page_heading).toHaveText(this.manageUsersPageData.Manage_Users_Page.page_heading);
  }
  async checkAlphabeticalSorting(fieldNameIndex: number) {
    let hasNextPage = true;
    const firstNames: string[] = [];
    while (hasNextPage) {
      const rows = await this.page.locator('.govuk-table__row').all();
      for (const row of rows) {
        const columns = await row.locator('.govuk-table__cell').allTextContents();
        const firstFourColumns = columns.slice(0, 4);
        const firstName = firstFourColumns[fieldNameIndex]?.trim() || '';
        firstNames.push(firstName);
      }
      hasNextPage = (await this.next_button.isVisible()) && !(await this.next_button.isDisabled());
      if (hasNextPage) {
        await this.next_button.click();
        await this.page.waitForLoadState('domcontentloaded');
      }
    }
    const sortedFirstNames = [...firstNames].sort((a, b) => a.localeCompare(b, 'en', { sensitivity: 'base' }));
    expect(firstNames).toEqual(sortedFirstNames);
  }
  async findUserProfile(userFirstName: string, userLastName: string, userEmail: string, userStatus: string) {
    const searchRecord = userFirstName + '|' + userLastName + '|' + userEmail + '|' + userStatus;
    let foundRecord = false;
    let hasNextPage = true;
    let count: number = 0;
    while (hasNextPage) {
      const rows = await this.page.locator('.govuk-table__row').all();
      for (const row of rows) {
        const columns = await row.locator('.govuk-table__cell').allTextContents();
        const firstFourColumns = columns.slice(0, 4);
        const fullRowData = firstFourColumns.map((col) => col.trim()).join('|');
        if (fullRowData === searchRecord) {
          foundRecord = true;
          count = count + 1;
          console.log(`Data found: ${searchRecord}`);
        }
      }
      hasNextPage = (await this.next_button.isVisible()) && !(await this.next_button.isDisabled());
      if (hasNextPage) {
        await this.next_button.click();
        await this.page.waitForLoadState('domcontentloaded');
      }
    }
    expect(foundRecord).toBeTruthy();
    expect(count).toBe(1);
  }
  async findUserProfile1(userFirstName: string, userLastName: string, userEmail: string, userStatus: string) {
    let dataFound = false;
    while (!dataFound) {
      // Capture all rows in the table using locator
      //const rows = this.page.locator('table tbody tr');
      const rowCount = await this.users_list_rows.count();
      for (let i = 0; i < rowCount; i++) {
        // Get the text content of the first name, last name, and email columns (adjust the selectors as needed)
        const firstNameText = await this.users_list_rows.nth(i).locator(this.firstNameFromListLabel).textContent();
        const lastNameText = await this.users_list_rows.nth(i).locator('td:nth-child(2)').textContent();
        const emailText = await this.users_list_rows.nth(i).locator('td:nth-child(3)').textContent();
        const statusText = await this.users_list_rows.nth(i).locator('td:nth-child(4)').textContent();

        // Check if all three values match
        if (
          firstNameText?.trim() === userFirstName &&
          lastNameText?.trim() === userLastName &&
          emailText?.trim() === userEmail &&
          statusText?.trim() === userStatus
        ) {
          console.log(`Data found: ${firstNameText}, ${lastNameText}, ${emailText},${statusText}`);
          // Click the "View" button in the same row
          //And I search and click on View_edit link
          await this.users_list_rows.nth(i).getByText('View/Edit').click();
          dataFound = true;
          break;
        }
      }

      if (!dataFound) {
        // Check if the "Next" button is available using locator
        const nextButton = this.page.locator('.govuk-pagination__next');

        if ((await nextButton.count()) > 0) {
          // Click the "Next" button
          await nextButton.click();
          // Wait for the next page to load
          await this.page.waitForSelector('table tbody tr');
        } else {
          console.log('Reached the last page, data not found.');
          break;
        }
      }
    }
    expect(dataFound).toBeTruthy();
  }
}
