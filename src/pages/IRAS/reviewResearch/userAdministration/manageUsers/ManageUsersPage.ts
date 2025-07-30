import { expect, Locator, Page } from '@playwright/test';
import * as linkTextData from '../../../../../resources/test_data/common/link_text_data.json';
import * as manageUsersPageTestData from '../../../../../resources/test_data/iras/reviewResearch/userAdministration/manageUsers/manage_users_page_data.json';
import {
  confirmStringNotNull,
  convertTwelveHrToTwentyFourHr,
  returnDataFromJSON,
} from '../../../../../utils/UtilFunctions';
import CreateUserProfilePage from './CreateUserProfilePage';

//Declare Page Objects
export default class ManageUsersPage {
  readonly page: Page;
  readonly manageUsersPageTestData: typeof manageUsersPageTestData;
  readonly linkTextData: typeof linkTextData;
  private _unique_email: string;
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
  readonly last_logged_in_from_list_label: Locator;
  readonly next_button: Locator;
  readonly first_name_column_header_label: Locator;
  readonly last_name_column_header_label: Locator;
  readonly email_address_column_header_label: Locator;
  readonly status_column_header_label: Locator;
  readonly last_logged_in_column_header_label: Locator;
  readonly actions_column_header_label: Locator;
  readonly search_box_label: Locator;
  readonly firstNameFromListLabel: Locator;
  readonly userListRows: Locator;
  readonly userListCell: Locator;
  readonly statusCell: Locator;
  readonly no_results_heading: Locator;
  readonly no_results_guidance_text: Locator;
  readonly listCell: Locator;
  private lastLoggedInDateFull: string;
  private lastLoggedInDateTruncated: string;
  private lastLoggedInHours: number;

  //Initialize Page Objects
  constructor(page: Page) {
    this.page = page;
    this.manageUsersPageTestData = manageUsersPageTestData;
    this._unique_email = '';

    //Locators
    this.page_heading = this.page
      .getByRole('heading')
      .getByText(this.manageUsersPageTestData.Manage_Users_Page.page_heading);
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
    this.search_box_label = this.page.locator('label[for="Search.SearchQuery"]');
    this.search_box = this.page.getByTestId('Search.SearchQuery');
    this.search_button_label = this.page.getByText('Search');
    this.firstNameFromListLabel = this.page.locator('td:nth-child(1)');
    this.next_button = this.page.locator('.govuk-pagination__next a');
    this.userListRows = this.page.locator('tbody').getByRole('row');
    this.userListCell = this.page.getByRole('cell');
    this.statusCell = this.page.getByRole('cell');
    this.first_name_from_list_label = this.page.locator('td').nth(0);
    this.last_name_from_list_label = this.page.locator('td').nth(1);
    this.email_address_from_list_label = this.page.locator('td').nth(2);
    this.status_from_list_label = this.page.locator('td').nth(3);
    this.last_logged_in_from_list_label = this.page.locator('td').nth(4);
    this.no_results_heading = this.page
      .getByRole('heading')
      .getByText(this.manageUsersPageTestData.Manage_Users_Page.no_results_heading, { exact: true });
    this.no_results_guidance_text = this.page
      .getByRole('paragraph')
      .getByText(this.manageUsersPageTestData.Manage_Users_Page.no_results_guidance_text, {
        exact: true,
      });
    this.listCell = this.page.getByRole('cell');
  }

  async assertOnManageUsersPage() {
    await expect(this.page_heading).toBeVisible();
    expect(await this.page.title()).toBe(this.manageUsersPageTestData.Manage_Users_Page.title);
  }

  async goto(pageSize?: string, searchQuery?: string) {
    if (typeof pageSize !== 'undefined' && typeof searchQuery !== 'undefined') {
      await this.page.goto(`admin/users?SearchQuery=${searchQuery}&PageSize=${pageSize}`);
    } else if (typeof pageSize !== 'undefined') {
      await this.page.goto(`admin/users?pageSize=${pageSize}`);
    } else {
      await this.page.goto('admin/users');
    }
    await this.assertOnManageUsersPage();
  }

  async getFirstNamesListFromUI() {
    let hasNextPage = false;
    const firstNames: string[] = [];
    //adding this for loop instead of while loop to limit navigation till first 3 pages only,to reduce time and reduce fakiness
    for (let i = 0; i < 4; i++) {
      const rows = await this.userListRows.all();
      for (const row of rows) {
        const firstName = confirmStringNotNull(await row.locator(this.userListCell).first().textContent());
        firstNames.push(firstName);
      }
      hasNextPage = (await this.next_button.isVisible()) && !(await this.next_button.isDisabled());
      if (hasNextPage) {
        await this.next_button.click();
        await this.page.waitForLoadState('domcontentloaded');
      }
    }
    return firstNames;
  }

  async findUserProfile(userFirstName: string, userLastName: string, userEmail: string, userStatus: string) {
    const searchRecord = userFirstName + '|' + userLastName + '|' + userEmail + '|' + userStatus;
    let foundRecord = false;
    let hasNextPage = true;
    while (hasNextPage && !foundRecord) {
      const rows = await this.userListRows.all();
      for (const row of rows) {
        const columns = await row.locator(this.userListCell).allTextContents();
        const firstFourColumns = columns.slice(0, 4);
        const fullRowData = firstFourColumns.map((col) => col.trim()).join('|');
        if (fullRowData === searchRecord) {
          foundRecord = true;
          return row;
        }
      }
      hasNextPage = (await this.next_button.isVisible()) && !(await this.next_button.isDisabled());
      if (hasNextPage && !foundRecord) {
        await this.next_button.click();
        await this.page.waitForLoadState('domcontentloaded');
      }
    }
    throw new Error(`No matching record found`);
  }

  async getRowByUserNameStatus(userName: string, exactMatch: boolean, status: string) {
    const userRows = this.userListRows
      .filter({ has: this.page.locator('td').getByText(`${userName}`, { exact: exactMatch }) })
      .filter({ has: this.statusCell.getByText(status) });
    const noOfRows = await userRows.count();
    const randomIndex = Math.floor(Math.random() * (noOfRows - 1));
    return userRows.nth(randomIndex);
  }

  async findUserByStatus(searchKey: string, userStatus: string) {
    let hasNextPage = true;
    while (hasNextPage) {
      const rows = await this.userListRows.all();
      for (const row of rows) {
        const columns = await row.locator(this.listCell).allTextContents();
        const matchesSearchKey =
          columns[0].trim().includes(searchKey) ||
          columns[1].trim().includes(searchKey) ||
          columns[2].trim().includes(searchKey);
        if (matchesSearchKey && columns[3].trim() === userStatus) {
          return row;
        }
      }
      hasNextPage = (await this.next_button.isVisible()) && !(await this.next_button.isDisabled());
      if (hasNextPage) {
        await this.next_button.click();
        await this.page.waitForLoadState('domcontentloaded');
      }
    }
    throw new Error(`No matching record found`);
  }

  async getUniqueUserRecord(
    datasetName: string,
    status: string,
    createUserProfilePage: CreateUserProfilePage,
    manageUsersPage: ManageUsersPage
  ) {
    const dataset = createUserProfilePage.createUserProfilePageTestData.Create_User_Profile[datasetName];
    const userFirstName = dataset.first_name_text;
    const userLastName = dataset.last_name_text;
    const data = await returnDataFromJSON();
    const userEmail = data.Create_User_Profile.email_address_unique;
    const userStatus = await manageUsersPage.getUserStatus(status);
    await manageUsersPage.goto(manageUsersPage.manageUsersPageTestData.Manage_Users_Page.enlarged_page_size, userEmail);
    const foundRecord = await manageUsersPage.findUserProfile(userFirstName, userLastName, userEmail, userStatus);
    await manageUsersPage.setUniqueEmail(userEmail);
    return foundRecord;
  }

  async getUserStatus(status: string) {
    const datasetStatus = this.manageUsersPageTestData.Manage_Users_Page;
    if (status.toLowerCase() == 'disabled') {
      return datasetStatus.disabled_status;
    } else {
      return datasetStatus.enabled_status;
    }
  }

  async getUserEmail(inputType: string, createUserProfilePage: CreateUserProfilePage): Promise<string> {
    let emailAddress: string;

    if (inputType === 'newly created user') {
      emailAddress = await createUserProfilePage.getUniqueEmail();
    } else {
      emailAddress = inputType;
    }

    return emailAddress;
  }

  async sortLastLoggedInListValues(lastLoggedInVals: string[], sortDirection: string): Promise<string[]> {
    const listAsDates: Date[] = [];
    const sortedListAsStrings: string[] = [];
    const datesTimesMap = lastLoggedInVals.map((vals) => {
      if (!vals) {
        const [day, month, year, time] = '';
        return [year, month, day, time];
      } else {
        const [dates, times] = vals.split('at');
        const [day, month, year] = dates.split(' ');
        const time = convertTwelveHrToTwentyFourHr(times);
        return [year, month, day, time.join(':')];
      }
      //Add last page sort test steps in all sort stories - expect fail due to defect
      //Add regression
      //Re-run access test on MU Page
    });

    for (const entry of datesTimesMap.entries()) {
      const dateEntryString = `${entry[1][0]} ${entry[1][1]} ${entry[1][2]} ${entry[1][3]}`;
      const dateFormattedEntry = new Date(dateEntryString);
      listAsDates.push(dateFormattedEntry);
    }

    if (sortDirection.toLowerCase() == 'descending') {
      listAsDates.sort((a, b) => b.getTime() - a.getTime());
    } else {
      listAsDates.sort((a, b) => a.getTime() - b.getTime());
    }

    for (const date of listAsDates) {
      if (date.toString() == 'Invalid Date') {
        sortedListAsStrings.push('');
      } else {
        sortedListAsStrings.push(
          date
            .toLocaleString('en-GB', {
              day: '2-digit',
              month: 'short',
              year: 'numeric',
              hour: '2-digit',
              minute: '2-digit',
              hourCycle: 'h12',
            })
            .replace(',', ' at')
            .replace(/ (?!.* )/, '')
        );
      }
    }
    return sortedListAsStrings;
  }

  //Getters & Setters for Private Variables
  async getUniqueEmail(): Promise<string> {
    return this._unique_email;
  }

  async setUniqueEmail(value: string): Promise<void> {
    this._unique_email = value;
  }

  setLastLoggedInDateFull(value: string) {
    this.lastLoggedInDateFull = value;
  }

  getLastLoggedInDateFull(): string {
    return this.lastLoggedInDateFull;
  }

  setLastLoggedInDateTruncated(value: string) {
    this.lastLoggedInDateTruncated = value;
  }

  getLastLoggedInDateTruncated(): string {
    return this.lastLoggedInDateTruncated;
  }

  setLastLoggedInHours(value: number) {
    this.lastLoggedInHours = value;
  }

  getLastLoggedInHours(): number {
    return this.lastLoggedInHours;
  }
}
