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
  readonly first_name_column_header: Locator;
  readonly last_name_column_header: Locator;
  readonly email_address_column_header: Locator;
  readonly status_column_header: Locator;
  readonly last_logged_in_column_header: Locator;
  readonly actions_column_header: Locator;
  readonly view_edit_link: Locator;
  readonly find_user_title: Locator;
  readonly search_box: Locator;
  readonly search_button_label: Locator;
  readonly first_name_from_list_label: Locator;
  readonly users_list_rows: Locator;
  readonly last_name_from_list_label: Locator;
  readonly email_address_from_list_label: Locator;
  readonly status_from_list_label: Locator;
  readonly next_button: Locator;

  //Initialize Page Objects
  constructor(page: Page) {
    this.page = page;
    this.manageUsersPageData = manageUsersPageData;

    //Locators
    this.users_list_rows = this.page.locator('table tbody tr');
    this.page_heading = this.page.locator('.govuk-heading-l');
    this.back_button = this.page.getByText('Back');
    this.first_name_from_list_label = this.page.locator('td:nth-child(1)');
    this.last_name_from_list_label = this.page.locator('td:nth-child(2)');
    this.email_address_from_list_label = this.page.locator('td:nth-child(3)');
    this.status_from_list_label = this.page.locator('td:nth-child(4)');
  }

  async assertOnManageUsersPage() {
    await expect(this.page_heading).toBeVisible();
    await expect(this.page_heading).toHaveText(this.manageUsersPageData.Manage_Users_Page.page_heading);
  }

  async searchAndClickUserProfile(userFirstName: string, userLastName: string, userEmail: string, userStatus: string) {
    let dataFound = false;
    while (!dataFound) {
      const rowCount = await this.users_list_rows.count();
      for (let i = 0; i < rowCount; i++) {
        const firstNameText = await this.users_list_rows.nth(i).locator(this.first_name_from_list_label).textContent();
        const lastNameText = await this.users_list_rows.nth(i).locator(this.last_name_from_list_label).textContent();
        const emailText = await this.users_list_rows.nth(i).locator(this.email_address_from_list_label).textContent();
        const statusText = await this.users_list_rows.nth(i).locator(this.status_from_list_label).textContent();
        if (
          firstNameText?.trim() === userFirstName &&
          lastNameText?.trim() === userLastName &&
          emailText?.trim() === userEmail &&
          statusText?.trim() === userStatus
        ) {
          await this.users_list_rows.nth(i).getByText('View/Edit').click();
          dataFound = true;
          break;
        }
      }

      if (!dataFound) {
        const nextButton = this.page.locator('.govuk-pagination__next');
        if ((await nextButton.count()) > 0) {
          await nextButton.click();
          await this.page.waitForSelector('table tbody tr');
        } else {
          throw new Error('Reached the last page, data not found.');
          break;
        }
      }
    }
  }
}
