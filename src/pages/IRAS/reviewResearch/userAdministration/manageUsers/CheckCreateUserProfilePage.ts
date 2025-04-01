import { expect, Locator, Page } from '@playwright/test';
import * as checkCreateUserProfilePageTestData from '../../../../../resources/test_data/iras/reviewResearch/userAdministration/manageUsers/pages/check_create_user_profile_page_data.json';
import * as buttonTextData from '../../../../../resources/test_data/common/button_text_data.json';
import path from 'path';
import * as fse from 'fs-extra';
import CommonItemsPage from '../../../../Common/CommonItemsPage';

//Declare Page Objects
export default class CheckCreateUserProfilePage {
  readonly page: Page;
  readonly checkCreateUserProfilePageTestData: typeof checkCreateUserProfilePageTestData;
  readonly buttonTextData: typeof buttonTextData;
  // readonly selectedBreadCrumbs: Locator;
  readonly back_button: Locator;
  readonly page_heading: Locator;
  readonly subHeading: Locator;
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
    './src/resources/test_data/iras/reviewResearch/userAdministration/manageUsers/pages/create_user_profile_page_data.json';

  //Initialize Page Objects
  constructor(page: Page) {
    this.page = page;
    this.checkCreateUserProfilePageTestData = checkCreateUserProfilePageTestData;

    //Locators
    this.back_button = this.page.getByText('Back');
    this.page_heading = this.page.locator('.govuk-heading-l');
    this.subHeading = this.page.locator('.govuk-heading-l').locator('..').locator('p');
    this.title_label = this.page.locator('(//tr[@class="govuk-table__row"])[1]/td/b');
    this.title_text = this.page.locator('//input[@name="Title"]/..');
    this.title_change_link = this.page.locator('//input[@name="Title"]/../..//button');
    this.first_name_label = this.page.locator('(//tr[@class="govuk-table__row"])[2]/td/b');
    this.first_name_text = this.page.locator('//input[@name="FirstName"]/..');
    this.first_name_change_link = this.page.locator('//input[@name="FirstName"]/../..//button');
    this.last_name_label = this.page.locator('(//tr[@class="govuk-table__row"])[3]/td/b');
    this.last_name_text = this.page.locator('//input[@name="LastName"]/..');
    this.last_name_change_link = this.page.locator('//input[@name="LastName"]/../..//button');
    this.email_address_label = this.page.locator('(//tr[@class="govuk-table__row"])[4]/td/b');
    this.email_address_text = this.page.locator('//input[@name="Email"]/..');
    this.email_address_change_link = this.page.locator('//input[@name="Email"]/../..//button');
    this.telephone_label = this.page.locator('(//tr[@class="govuk-table__row"])[5]/td/b');
    this.telephone_text = this.page.locator('//input[@name="Telephone"]/..');
    this.telephone_change_link = this.page.locator('//input[@name="Telephone"]/../..//button');
    this.organisation_label = this.page.locator('(//tr[@class="govuk-table__row"])[6]/td/b');
    this.organisation_text = this.page.locator('//input[@name="Organisation"]/..');
    this.organisation_change_link = this.page.locator('//input[@name="Organisation"]/../..//button');
    this.job_title_label = this.page.locator('(//tr[@class="govuk-table__row"])[7]/td/b');
    this.job_title_text = this.page.locator('//input[@name="JobTitle"]/..');
    this.job_title_change_link = this.page.locator('//input[@name="JobTitle"]/../..//button');
    this.role_label = this.page.locator('(//tr[@class="govuk-table__row"])[8]/td/b');
    this.role_dropdown = this.page.locator('//input[@name="Role"]/..');
    this.role_change_link = this.page.locator('//input[@name="Role"]/../..//button');
    this.committee_label = this.page.locator('(//tr[@class="govuk-table__row"])[9]/td/b');
    this.committee_dropdown = this.page.locator('//input[@name="Committee"]/..'); //update
    this.committee_change_link = this.page.locator('tr.govuk-table__row:nth-child(9) button.govuk-link-button');
    this.country_label = this.page.locator('(//tr[@class="govuk-table__row"])[10]/td/b');
    this.country_checkbox = this.page.locator('//input[starts-with(@name,"Country")]/..');
    this.country_change_link = this.page.locator('//input[starts-with(@name,"Country")]/../..//button');
    this.access_required_label = this.page.locator('(//tr[@class="govuk-table__row"])[11]/td/b');
    this.access_required_checkbox = this.page.locator('//input[starts-with(@name,"AccessRequired")]/..');
    this.access_required_change_link = this.page.locator('//input[starts-with(@name,"AccessRequired")]/../..//button');
    this.review_body_label = this.page.locator('(//tr[@class="govuk-table__row"])[12]/td/b');
    this.review_body_dropdown = this.page.getByTestId('ReviewBody'); //update
    this.review_body_change_link = this.page.locator('tr.govuk-table__row:nth-child(12) button.govuk-link-button');
    this.create_profile_button = this.page.locator('button[class="govuk-button"]');
  }

  async assertOnCheckCreateUserProfilePage() {
    await expect(this.page_heading).toBeVisible();
    await expect(this.page_heading).toHaveText(
      this.checkCreateUserProfilePageTestData.Check_Create_User_Profile_Page.page_heading
    );
    await expect(this.subHeading).toBeVisible();
    await expect(this.subHeading).toHaveText(
      this.checkCreateUserProfilePageTestData.Check_Create_User_Profile_Page.sub_heading
    );
  }
  async clickOnChangeButtonRoleOperations(fieldKey: string) {
    switch (fieldKey) {
      case 'Title':
        await this.title_change_link.click();
        break;
      case 'First_Name':
        await this.first_name_change_link.click();
        break;
      case 'Last_Name':
        await this.last_name_change_link.click();
        break;
      case 'Email_Address':
        await this.email_address_change_link.click();
        break;
      case 'Telephone':
        await this.telephone_change_link.click();
        break;
      case 'Organisation':
        await this.organisation_change_link.click();
        break;
      case 'Job_Title':
        await this.job_title_change_link.click();
        break;
      case 'Role':
        await this.role_change_link.click();
        break;
      case 'Committee':
        await this.committee_change_link.click();
        break;
      case 'Country':
        await this.country_change_link.click();
        break;
      case 'Access_Required':
        await this.access_required_change_link.click();
        break;
      case 'Review_Body':
        await this.review_body_change_link.click();
        break;
      default:
        throw new Error(`${fieldKey} is not a valid option`);
    }
  }

  async validateSelectedValues<PageObject>(
    dataset: JSON,
    key: string,
    page: PageObject,
    commonItemsPage: CommonItemsPage
  ) {
    const locator: Locator = page[key];
    if (key === 'email_address_text') {
      const filePath = path.resolve(this.pathToTestDataJson);
      const data = await fse.readJson(filePath);
      expect(await commonItemsPage.removeUnwantedChars(await locator.textContent())).toBe(
        data.Create_User_Profile.email_address_unique
      );
    } else if (key === 'country_checkbox' || key === 'access_required_checkbox') {
      expect(await commonItemsPage.removeUnwantedChars(await locator.textContent())).toBe(dataset[key][0]);
    } else {
      expect(await commonItemsPage.removeUnwantedChars(await locator.textContent())).toBe(dataset[key]);
    }
  }
}
