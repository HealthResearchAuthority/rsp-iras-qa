import { expect, Locator, Page } from '@playwright/test';
import * as checkCreateUserProfilePageTestData from '../../../../../resources/test_data/iras/reviewResearch/userAdministration/manageUsers/check_create_user_profile_page_data.json';
import path from 'path';
import * as fse from 'fs-extra';
import { confirmStringNotNull, removeUnwantedWhitespace } from '../../../../../utils/UtilFunctions';

//Declare Page Objects
export default class CheckCreateUserProfilePage {
  readonly page: Page;
  readonly checkCreateUserProfilePageTestData: typeof checkCreateUserProfilePageTestData;
  readonly back_button: Locator;
  readonly page_heading: Locator;
  readonly subHeading: Locator;
  readonly userTableRows: Locator;
  readonly title_label: Locator;
  readonly title_text: Locator;
  readonly title_change_link: Locator;
  readonly first_name_label: Locator;
  readonly first_name_text: Locator;
  readonly first_name_change_link: Locator;
  readonly last_name_label: Locator;
  readonly last_name_text: Locator;
  readonly last_name_change_link: Locator;
  readonly email_address_label: Locator;
  readonly email_address_text: Locator;
  readonly email_address_change_link: Locator;
  readonly telephone_label: Locator;
  readonly telephone_text: Locator;
  readonly telephone_change_link: Locator;
  readonly organisation_label: Locator;
  readonly organisation_text: Locator;
  readonly organisation_change_link: Locator;
  readonly job_title_label: Locator;
  readonly job_title_text: Locator;
  readonly job_title_change_link: Locator;
  readonly role_label: Locator;
  readonly role_dropdown: Locator;
  readonly role_change_link: Locator;
  readonly committee_label: Locator;
  readonly committee_dropdown: Locator;
  readonly committee_change_link: Locator;
  readonly country_label: Locator;
  readonly country_checkbox: Locator;
  readonly country_change_link: Locator;
  readonly access_required_label: Locator;
  readonly access_required_checkbox: Locator;
  readonly access_required_change_link: Locator;
  readonly review_body_label: Locator;
  readonly review_body_dropdown: Locator;
  readonly review_body_change_link: Locator;
  readonly create_profile_button: Locator;
  pathToTestDataJson =
    './src/resources/test_data/iras/reviewResearch/userAdministration/manageUsers/create_user_profile_page_data.json';

  //Initialize Page Objects
  constructor(page: Page) {
    this.page = page;
    this.checkCreateUserProfilePageTestData = checkCreateUserProfilePageTestData;

    //Locators
    this.back_button = this.page.getByText('Back');
    this.page_heading = this.page
      .getByRole('heading')
      .getByText(this.checkCreateUserProfilePageTestData.Check_Create_User_Profile_Page.page_heading);
    this.subHeading = this.page_heading.locator('..').locator('p');
    this.userTableRows = this.page.getByRole('table').getByRole('row');
    this.title_label = this.userTableRows.getByRole('cell').getByText('Title', { exact: true });
    this.title_text = this.userTableRows.getByRole('cell').getByTestId('Title').locator('..');
    this.title_change_link = this.title_text.locator('..').getByText('Change');
    this.first_name_label = this.userTableRows.getByRole('cell').getByText('First name', { exact: true });
    this.first_name_text = this.userTableRows.getByRole('cell').getByTestId('FirstName').locator('..');
    this.first_name_change_link = this.first_name_text.locator('..').getByText('Change');
    this.last_name_label = this.userTableRows.getByRole('cell').getByText('Last name', { exact: true });
    this.last_name_text = this.userTableRows.getByRole('cell').getByTestId('LastName').locator('..');
    this.last_name_change_link = this.last_name_text.locator('..').getByText('Change');
    this.email_address_label = this.userTableRows.getByRole('cell').getByText('Email address', { exact: true });
    this.email_address_text = this.userTableRows.getByRole('cell').getByTestId('Email').locator('..');
    this.email_address_change_link = this.email_address_text.locator('..').getByText('Change');
    this.telephone_label = this.userTableRows.getByRole('cell').getByText('Telephone', { exact: true });
    this.telephone_text = this.userTableRows.getByRole('cell').getByTestId('Telephone').locator('..');
    this.telephone_change_link = this.telephone_text.locator('..').getByText('Change');
    this.organisation_label = this.userTableRows.getByRole('cell').getByText('Organisation', { exact: true });
    this.organisation_text = this.userTableRows.getByRole('cell').getByTestId('Organisation').locator('..');
    this.organisation_change_link = this.organisation_text.locator('..').getByText('Change');
    this.job_title_label = this.userTableRows.getByRole('cell').getByText('Job title', { exact: true });
    this.job_title_text = this.userTableRows.getByRole('cell').getByTestId('JobTitle').locator('..');
    this.job_title_change_link = this.job_title_text.locator('..').getByText('Change');
    this.role_label = this.userTableRows.getByRole('cell').getByText('Role', { exact: true });
    this.role_dropdown = this.userTableRows.getByRole('cell').getByTestId('Role').locator('..');
    this.role_change_link = this.role_dropdown.locator('..').getByText('Change');
    this.committee_label = this.userTableRows.getByRole('cell').getByText('Committee', { exact: true });
    this.committee_dropdown = this.userTableRows.getByRole('cell').getByTestId('Committee').locator('..'); //update later when the Committee is available
    this.committee_change_link = this.page.locator('tr.govuk-table__row:nth-child(9) button.govuk-link-button'); //update later when the Committee is available
    this.country_label = this.userTableRows.getByRole('cell').getByText('Country', { exact: true });
    this.country_checkbox = this.userTableRows.getByRole('cell').locator('[id^="Country"]').locator('..');
    this.country_change_link = this.country_checkbox.locator('..').getByText('Change');
    this.access_required_label = this.userTableRows.getByRole('cell').getByText('Access Required', { exact: true });
    this.access_required_checkbox = this.userTableRows
      .getByRole('cell')
      .locator('[id^="AccessRequired"]')
      .locator('..');
    this.access_required_change_link = this.access_required_checkbox.locator('..').getByText('Change');
    this.review_body_label = this.userTableRows.getByRole('cell').getByText('Review body', { exact: true });
    this.review_body_dropdown = this.userTableRows.getByRole('cell').getByTestId('ReviewBody').locator('..'); //update later when the review body is available
    this.review_body_change_link = this.page.locator('tr.govuk-table__row:nth-child(12) button.govuk-link-button'); //update later when the review body is available
    this.create_profile_button = this.page.locator('button[class="govuk-button"]');
  }

  async assertOnCheckCreateUserProfilePage() {
    await expect(this.page_heading).toBeVisible();
    await expect(this.subHeading).toBeVisible();
    await expect(this.subHeading).toHaveText(
      this.checkCreateUserProfilePageTestData.Check_Create_User_Profile_Page.sub_heading
    );
  }
  async clickOnChangeButtonRoleOperations(fieldKey: string) {
    const locatorName = fieldKey.toLowerCase() + '_change_link';
    await this[locatorName].click();
  }

  async validateSelectedValues<PageObject>(dataset: JSON, key: string, page: PageObject) {
    const locator: Locator = page[key];
    if (key === 'email_address_text') {
      const filePath = path.resolve(this.pathToTestDataJson);
      const data = await fse.readJson(filePath);
      expect(await removeUnwantedWhitespace(confirmStringNotNull(await locator.textContent()))).toBe(
        data.Create_User_Profile.email_address_unique
      );
    } else if (key === 'country_checkbox' || key === 'access_required_checkbox') {
      expect(await removeUnwantedWhitespace(confirmStringNotNull(await locator.textContent()))).toBe(dataset[key][0]);
    } else {
      expect(await removeUnwantedWhitespace(confirmStringNotNull(await locator.textContent()))).toBe(dataset[key]);
    }
  }
}
