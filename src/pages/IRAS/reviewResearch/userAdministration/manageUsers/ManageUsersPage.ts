import { expect, Locator, Page } from '@playwright/test';
import * as linkTextData from '../../../../../resources/test_data/common/link_text_data.json';
import * as manageUsersPageTestData from '../../../../../resources/test_data/iras/reviewResearch/userAdministration/manageUsers/manage_users_page_data.json';
import { confirmStringNotNull, returnDataFromJSON, validateDateRange } from '../../../../../utils/UtilFunctions';
import CreateUserProfilePage from './CreateUserProfilePage';
import CommonItemsPage from '../../../../Common/CommonItemsPage';

//Declare Page Objects
export default class ManageUsersPage {
  readonly page: Page;
  readonly manageUsersPageTestData: typeof manageUsersPageTestData;
  readonly linkTextData: typeof linkTextData;
  private _unique_email: string;
  readonly page_heading: Locator;
  readonly search_hint_text: Locator;
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
  readonly country_label: Locator;
  readonly country_fieldset: Locator;
  readonly country_checkbox: Locator;
  readonly status_label: Locator;
  readonly status_fieldset: Locator;
  readonly status_radio: Locator;
  readonly country_checkbox_chevron: Locator;
  readonly status_radio_chevron: Locator;
  readonly country_hint_label: Locator;
  readonly country_selected_hint_label: Locator;
  readonly status_hint_label: Locator;
  readonly date_last_logged_in_from_day_text: Locator;
  readonly date_last_logged_in_from_month_dropdown: Locator;
  readonly date_last_logged_in_from_year_text: Locator;
  readonly date_last_logged_in_to_day_text: Locator;
  readonly date_last_logged_in_to_month_dropdown: Locator;
  readonly date_last_logged_in_to_year_text: Locator;
  readonly date_last_logged_in_from_day_text_chevron: Locator;
  readonly date_last_logged_in_to_day_text_chevron: Locator;
  readonly date_last_logged_in_from_date_fieldset: Locator;
  readonly date_last_logged_in_to_date_fieldset: Locator;
  readonly date_last_logged_in_to_date_error: Locator;
  readonly advanced_filter_chevron: Locator;
  readonly date_last_logged_in_error_message: Locator;
  readonly country_checkbox_selected_hint_label: Locator;
  readonly country_checkbox_hint_label: Locator;
  readonly user_search_text: Locator;
  readonly date_last_logged_in_from_date_help_text: Locator;
  readonly date_last_logged_in_to_date_help_text: Locator;
  readonly role_checkbox_chevron: Locator;
  readonly role_label: Locator;
  readonly role_fieldset: Locator;
  readonly role_checkbox: Locator;
  readonly role_selected_hint_label: Locator;
  readonly role_hint_label: Locator;
  readonly role_checkbox_selected_hint_label: Locator;
  readonly role_checkbox_hint_label: Locator;
  readonly review_body_checkbox_chevron: Locator;
  readonly review_body_label: Locator;
  readonly review_body_fieldset: Locator;
  readonly review_body_checkbox: Locator;
  readonly review_body_selected_hint_label: Locator;
  readonly review_body_hint_label: Locator;
  readonly review_body_checkbox_selected_hint_label: Locator;
  readonly review_body_checkbox_hint_label: Locator;

  //Initialize Page Objects
  constructor(page: Page) {
    this.page = page;
    this.manageUsersPageTestData = manageUsersPageTestData;
    this._unique_email = '';

    //Locators
    this.page_heading = this.page
      .getByRole('heading')
      .getByText(this.manageUsersPageTestData.Manage_Users_Page.page_heading);
    this.search_hint_text = this.page.getByText(this.manageUsersPageTestData.Manage_Users_Page.search_hint_text);
    this.user_search_text = this.page.getByLabel(this.manageUsersPageTestData.Manage_Users_Page.user_search_box_label, {
      exact: true,
    });
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

    this.advanced_filter_chevron = this.page.getByRole('button', {
      name: this.manageUsersPageTestData.Manage_Users_Page.Label_Texts_Manage_Users_List.advanced_filter_label,
    });
    this.country_checkbox_chevron = this.page
      .getByRole('heading', { level: 2 })
      .getByText(this.manageUsersPageTestData.Manage_Users_Page.Label_Texts_Manage_Users_List.country_label, {
        exact: true,
      });
    this.status_radio_chevron = this.page
      .getByRole('heading', { level: 2 })
      .getByText(this.manageUsersPageTestData.Manage_Users_Page.Label_Texts_Manage_Users_List.status_label, {
        exact: true,
      });
    this.country_label = this.page
      .getByRole('heading', { level: 2 })
      .getByText(this.manageUsersPageTestData.Manage_Users_Page.Label_Texts_Manage_Users_List.country_label, {
        exact: true,
      });
    this.country_fieldset = this.country_label
      .locator('..')
      .locator('..')
      .locator('.govuk-fieldset')
      .locator('.govuk-form-group', {
        has: this.page.getByText(
          this.manageUsersPageTestData.Manage_Users_Page.Advanced_Filters_Hint_Labels.country_hint_label
        ),
      });
    this.country_checkbox = this.country_fieldset.getByRole('checkbox');
    this.status_label = this.page
      .getByRole('heading', { level: 2 })
      .getByText(this.manageUsersPageTestData.Manage_Users_Page.Label_Texts_Manage_Users_List.status_label, {
        exact: true,
      });
    this.status_fieldset = this.status_label
      .locator('..')
      .locator('..')
      .locator('.govuk-fieldset')
      .locator('.govuk-form-group', {
        has: this.page.getByText(
          this.manageUsersPageTestData.Manage_Users_Page.Advanced_Filters_Hint_Labels.status_hint_label
        ),
      });
    this.status_radio = this.status_fieldset.getByRole('radio');
    this.country_selected_hint_label = this.country_label
      .locator('..')
      .locator('..')
      .locator('.govuk-fieldset')
      .locator('.govuk-form-group')
      .getByText(
        this.manageUsersPageTestData.Manage_Users_Page.Advanced_Filters_Hint_Labels.country_selected_hint_label
      );

    this.country_hint_label = this.country_label
      .locator('..')
      .locator('..')
      .locator('.govuk-fieldset')
      .locator('.govuk-form-group')
      .getByText(this.manageUsersPageTestData.Manage_Users_Page.Advanced_Filters_Hint_Labels.country_hint_label);

    this.status_hint_label = this.status_label
      .locator('..')
      .locator('..')
      .locator('.govuk-fieldset')
      .locator('.govuk-form-group')
      .getByText(this.manageUsersPageTestData.Manage_Users_Page.Advanced_Filters_Hint_Labels.status_hint_label);
    this.date_last_logged_in_from_day_text_chevron = this.page
      .getByRole('heading')
      .getByText(
        this.manageUsersPageTestData.Manage_Users_Page.Label_Texts_Manage_Users_List.date_last_logged_in_label,
        {
          exact: true,
        }
      );
    this.date_last_logged_in_to_day_text_chevron = this.page
      .getByRole('heading')
      .getByText(
        this.manageUsersPageTestData.Manage_Users_Page.Label_Texts_Manage_Users_List.date_last_logged_in_label,
        {
          exact: true,
        }
      );

    this.date_last_logged_in_from_date_fieldset = this.page.locator('.govuk-fieldset').locator('.govuk-form-group', {
      has: this.page.getByText(
        this.manageUsersPageTestData.Manage_Users_Page.Label_Texts_Manage_Users_List
          .date_last_logged_in_from_date_hint_text
      ),
    });

    this.date_last_logged_in_from_day_text = this.date_last_logged_in_from_date_fieldset
      .locator('.govuk-form-group', {
        has: this.page.getByText(
          this.manageUsersPageTestData.Manage_Users_Page.Label_Texts_Manage_Users_List.date_last_logged_in_day_label
        ),
      })
      .getByRole('textbox');
    this.date_last_logged_in_from_month_dropdown = this.date_last_logged_in_from_date_fieldset
      .locator('.govuk-form-group', {
        has: this.page.getByText(
          this.manageUsersPageTestData.Manage_Users_Page.Label_Texts_Manage_Users_List.date_last_logged_in_month_label
        ),
      })
      .getByRole('combobox');
    this.date_last_logged_in_from_year_text = this.date_last_logged_in_from_date_fieldset
      .locator('.govuk-form-group', {
        has: this.page.getByText(
          this.manageUsersPageTestData.Manage_Users_Page.Label_Texts_Manage_Users_List.date_last_logged_in_year_label
        ),
      })
      .getByRole('textbox');
    this.date_last_logged_in_to_date_error = this.page
      .locator('.govuk-fieldset')
      .locator('.govuk-form-group')
      .filter({
        hasText:
          this.manageUsersPageTestData.Manage_Users_Page.Label_Texts_Manage_Users_List
            .date_last_logged_in_to_date_hint_text,
      })
      .locator('.govuk-error-message');
    this.date_last_logged_in_to_date_fieldset = this.page.locator('.govuk-fieldset').locator('.govuk-form-group', {
      has: this.page.getByText(
        this.manageUsersPageTestData.Manage_Users_Page.Label_Texts_Manage_Users_List
          .date_last_logged_in_to_date_hint_text
      ),
    });
    this.date_last_logged_in_to_day_text = this.date_last_logged_in_to_date_fieldset
      .locator('.govuk-form-group', {
        has: this.page.getByText(
          this.manageUsersPageTestData.Manage_Users_Page.Label_Texts_Manage_Users_List.date_last_logged_in_day_label
        ),
      })
      .getByRole('textbox');
    this.date_last_logged_in_to_month_dropdown = this.date_last_logged_in_to_date_fieldset
      .locator('.govuk-form-group', {
        has: this.page.getByText(
          this.manageUsersPageTestData.Manage_Users_Page.Label_Texts_Manage_Users_List.date_last_logged_in_month_label
        ),
      })
      .getByRole('combobox');
    this.date_last_logged_in_to_year_text = this.date_last_logged_in_to_date_fieldset
      .locator('.govuk-form-group', {
        has: this.page.getByText(
          this.manageUsersPageTestData.Manage_Users_Page.Label_Texts_Manage_Users_List.date_last_logged_in_year_label
        ),
      })
      .getByRole('textbox');

    this.date_last_logged_in_error_message = this.page
      .locator('.govuk-error-message')
      .getByText(manageUsersPageTestData.Error_Message_Field_Dataset.Field_Error_Date_Last_Logged_In);
    this.country_checkbox_selected_hint_label = this.country_checkbox_chevron
      .locator('..')
      .locator('..')
      .locator('.govuk-fieldset')
      .locator('.govuk-form-group')
      .getByText(
        this.manageUsersPageTestData.Manage_Users_Page.Label_Texts_Manage_Users_List.selected_checkboxes_hint_label
      );
    this.country_checkbox_hint_label = this.country_checkbox_chevron
      .locator('..')
      .locator('..')
      .locator('.govuk-fieldset')
      .locator('.govuk-form-group')
      .getByText(this.manageUsersPageTestData.Manage_Users_Page.Advanced_Filters_Hint_Labels.country_hint_label, {
        exact: true,
      });
    this.date_last_logged_in_from_date_help_text = this.page.locator('#Search_FromDate-hint');
    this.date_last_logged_in_to_date_help_text = this.page.locator('#Search_ToDate-hint');
    this.role_checkbox_chevron = this.page
      .getByRole('heading', { level: 2 })
      .getByText(this.manageUsersPageTestData.Manage_Users_Page.Label_Texts_Manage_Users_List.role_label, {
        exact: true,
      });
    this.role_label = this.page
      .getByRole('heading', { level: 2 })
      .getByText(this.manageUsersPageTestData.Manage_Users_Page.Label_Texts_Manage_Users_List.role_label, {
        exact: true,
      });
    this.role_fieldset = this.role_label
      .locator('..')
      .locator('..')
      .locator('.govuk-fieldset')
      .locator('.govuk-form-group', {
        has: this.page.getByText(
          this.manageUsersPageTestData.Manage_Users_Page.Advanced_Filters_Hint_Labels.role_hint_label
        ),
      });
    this.role_checkbox = this.role_fieldset.getByRole('checkbox');
    this.role_selected_hint_label = this.role_label
      .locator('..')
      .locator('..')
      .locator('.govuk-fieldset')
      .locator('.govuk-form-group')
      .getByText(this.manageUsersPageTestData.Manage_Users_Page.Advanced_Filters_Hint_Labels.role_selected_hint_label);

    this.role_hint_label = this.role_label
      .locator('..')
      .locator('..')
      .locator('.govuk-fieldset')
      .locator('.govuk-form-group')
      .getByText(this.manageUsersPageTestData.Manage_Users_Page.Advanced_Filters_Hint_Labels.role_hint_label);
    this.role_checkbox_selected_hint_label = this.role_checkbox_chevron
      .locator('..')
      .locator('..')
      .locator('.govuk-fieldset')
      .locator('.govuk-form-group')
      .getByText(
        this.manageUsersPageTestData.Manage_Users_Page.Label_Texts_Manage_Users_List.selected_checkboxes_hint_label
      );
    this.role_checkbox_hint_label = this.role_checkbox_chevron
      .locator('..')
      .locator('..')
      .locator('.govuk-fieldset')
      .locator('.govuk-form-group')
      .getByText(this.manageUsersPageTestData.Manage_Users_Page.Advanced_Filters_Hint_Labels.role_hint_label, {
        exact: true,
      });
    this.review_body_checkbox_chevron = this.page
      .getByRole('heading', { level: 2 })
      .getByText(this.manageUsersPageTestData.Manage_Users_Page.Label_Texts_Manage_Users_List.review_body_label, {
        exact: true,
      });
    this.review_body_label = this.page
      .getByRole('heading', { level: 2 })
      .getByText(this.manageUsersPageTestData.Manage_Users_Page.Label_Texts_Manage_Users_List.review_body_label, {
        exact: true,
      });
    this.review_body_fieldset = this.review_body_label
      .locator('..')
      .locator('..')
      .locator('.govuk-fieldset')
      .locator('.govuk-form-group', {
        has: this.page.getByText(
          this.manageUsersPageTestData.Manage_Users_Page.Advanced_Filters_Hint_Labels.review_body_hint_label
        ),
      });
    this.review_body_checkbox = this.review_body_fieldset.getByRole('checkbox');
    this.review_body_selected_hint_label = this.review_body_label
      .locator('..')
      .locator('..')
      .locator('.govuk-fieldset')
      .locator('.govuk-form-group')
      .getByText(
        this.manageUsersPageTestData.Manage_Users_Page.Advanced_Filters_Hint_Labels.review_body_selected_hint_label
      );

    this.review_body_hint_label = this.review_body_label
      .locator('..')
      .locator('..')
      .locator('.govuk-fieldset')
      .locator('.govuk-form-group')
      .getByText(this.manageUsersPageTestData.Manage_Users_Page.Advanced_Filters_Hint_Labels.review_body_hint_label);
    this.review_body_checkbox_selected_hint_label = this.review_body_checkbox_chevron
      .locator('..')
      .locator('..')
      .locator('.govuk-fieldset')
      .locator('.govuk-form-group')
      .getByText(
        this.manageUsersPageTestData.Manage_Users_Page.Label_Texts_Manage_Users_List.selected_checkboxes_hint_label
      );
    this.review_body_checkbox_hint_label = this.review_body_checkbox_chevron
      .locator('..')
      .locator('..')
      .locator('.govuk-fieldset')
      .locator('.govuk-form-group')
      .getByText(this.manageUsersPageTestData.Manage_Users_Page.Advanced_Filters_Hint_Labels.review_body_hint_label, {
        exact: true,
      });
  }

  //Getters & Setters for Private Variables
  async getUniqueEmail(): Promise<string> {
    return this._unique_email;
  }

  async setUniqueEmail(value: string): Promise<void> {
    this._unique_email = value;
  }

  async assertOnManageUsersPage() {
    await expect(this.page_heading).toBeVisible();
    expect(await this.page.title()).toBe(this.manageUsersPageTestData.Manage_Users_Page.title);
    await expect(this.search_hint_text).toBeVisible();
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
    manageUsersPage: ManageUsersPage,
    commonItemsPage: CommonItemsPage
  ) {
    const dataset = createUserProfilePage.createUserProfilePageTestData.Create_User_Profile[datasetName];
    const userFirstName = dataset.first_name_text;
    const userLastName = dataset.last_name_text;
    const data = await returnDataFromJSON();
    const userEmail = data.Create_User_Profile.email_address_unique;
    const userStatus = await manageUsersPage.getUserStatus(status);
    if (!(await commonItemsPage.clear_all_filters_link.isVisible())) {
      await manageUsersPage.goto(
        manageUsersPage.manageUsersPageTestData.Manage_Users_Page.enlarged_page_size,
        userEmail
      );
    }
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

  async getUserEmail(inputType: string, createUserProfilePage: CreateUserProfilePage): Promise<string> {
    let emailAddress: string;

    if (inputType === 'newly created user') {
      emailAddress = await createUserProfilePage.getUniqueEmail();
    } else {
      emailAddress = inputType;
    }

    return emailAddress;
  }

  async clickFilterChevronUsers<PageObject>(dataset: JSON, key: string, page: PageObject) {
    const button = page[`${key}_chevron`];
    const fromDate = dataset['date_last_logged_in_from_day_text'];
    const isToDateKey = key === 'date_last_logged_in_to_day_text';
    const shouldClick = !isToDateKey || (isToDateKey && (fromDate === '' || fromDate === undefined));
    if (button && shouldClick) {
      await button.click();
    }
  }

  async validateFilters(statusActual: string, lastLoggedInDateActual: string, filterDataset: any) {
    for (const key in filterDataset) {
      if (Object.hasOwn(filterDataset, key)) {
        if (key === 'status_radio') {
          const statusExpected = filterDataset[key];
          expect(statusActual.toLowerCase().includes(statusExpected.toLowerCase()));
        }
        if (
          key.includes('date_last_logged_in_from_year_text') ||
          (key.includes('date_last_logged_in_to_year_text') && lastLoggedInDateActual !== null)
        ) {
          const filterFromDate = `${filterDataset['date_last_logged_in_from_day_text']} ${filterDataset['date_last_logged_in_from_month_dropdown']} ${filterDataset['date_last_logged_in_from_year_text']}`;
          const filterToDate = `${filterDataset['date_last_logged_in_to_day_text']} ${filterDataset['date_last_logged_in_to_month_dropdown']} ${filterDataset['date_last_logged_in_to_year_text']}`;
          if (filterFromDate !== '' && filterToDate !== '') {
            await this.validateDateFilter(filterFromDate, filterToDate, lastLoggedInDateActual);
          }
        }
      }
    }
  }

  async getRowDataAdvancedFiltersSearch(row: any) {
    return {
      firstName: confirmStringNotNull(await row.getByRole('cell').nth(0).textContent()),
      lastName: confirmStringNotNull(await row.getByRole('cell').nth(1).textContent()),
      emailAddress: confirmStringNotNull(await row.getByRole('cell').nth(2).textContent()),
      status: confirmStringNotNull(await row.getByRole('cell').nth(3).textContent()),
      lastLoggedInDate: confirmStringNotNull(await row.getByRole('cell').nth(4).textContent()),
    };
  }

  async validateDateFilter(filterFromDate: string, filterToDate: string, lastLoggedInDateActual: string) {
    const lastLoggedInDateActualOnlyDate = lastLoggedInDateActual.substring(0, 11);
    const isLastLoggedInDateInValidRange = await validateDateRange(
      lastLoggedInDateActualOnlyDate,
      filterFromDate,
      filterToDate
    );
    expect(isLastLoggedInDateInValidRange).toBe(true);
  }

  async validateSearchInput(
    searchDatasetName: any,
    searchCriteriaDataset: any,
    firstName: any,
    lastName: any,
    emailAddress: any
  ) {
    if (searchDatasetName == 'Existing_QA_User_First_Name') {
      const firstNameExpected = searchCriteriaDataset['search_input_text'];
      expect(firstName.toLowerCase().includes(firstNameExpected.toLowerCase()));
    } else if (searchDatasetName == 'Existing_QA_User_Last_Name') {
      const lastNameExpected = searchCriteriaDataset['search_input_text'];
      expect(lastName.toLowerCase().includes(lastNameExpected.toLowerCase()));
    } else if (searchDatasetName == 'Existing_QA_User_Email') {
      const emailAddressExpected = searchCriteriaDataset['search_input_text'];
      expect(emailAddress.toLowerCase().includes(emailAddressExpected.toLowerCase()));
    }
  }

  async validateResults(
    commonItemsPage: any,
    searchCriteriaDataset: any,
    filterDataset: any,
    searchDatasetName: any,
    validateSearch: boolean = true
  ) {
    for (let pageIndex = 1; pageIndex < 4; pageIndex++) {
      const rowCount = await commonItemsPage.tableRows.count();
      for (let rowIndex = 1; rowIndex < rowCount; rowIndex++) {
        const row = commonItemsPage.tableRows.nth(rowIndex);
        const { firstName, lastName, emailAddress, status, lastLoggedInDate } =
          await this.getRowDataAdvancedFiltersSearch(row);
        if (validateSearch && searchCriteriaDataset['search_input_text'] !== '') {
          this.validateSearchInput(searchDatasetName, searchCriteriaDataset, firstName, lastName, emailAddress);
        }
        this.validateFilters(status, lastLoggedInDate, filterDataset);
      }
      const hasNextPage =
        (await commonItemsPage.pagination_next_link.isVisible()) &&
        !(await commonItemsPage.pagination_next_link.isDisabled());
      if (hasNextPage) {
        await commonItemsPage.pagination_next_link.click();
      }
    }
  }
}
