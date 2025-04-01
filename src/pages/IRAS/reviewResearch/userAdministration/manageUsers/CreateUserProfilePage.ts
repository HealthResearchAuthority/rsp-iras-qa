import { expect, Locator, Page } from '@playwright/test';
import * as createUserProfilePageData from '../../../../../resources/test_data/iras/reviewResearch/userAdministration/manageUsers/pages/create_user_profile_page_data.json';
import * as buttonTextData from '../../../../../resources/test_data/common/button_text_data.json';
import path from 'path';
import * as fse from 'fs-extra';
import CommonItemsPage from '../../../../Common/CommonItemsPage';

//Declare Page Objects
export default class CreateUserProfilePage {
  readonly page: Page;
  readonly createUserProfilePageData: typeof createUserProfilePageData;
  readonly buttonTextData: typeof buttonTextData;
  readonly page_heading: Locator;
  readonly title_textbox_label: Locator;
  readonly title_text: Locator;
  readonly first_name_textbox_label: Locator;
  readonly first_name_text: Locator;
  readonly last_name_textbox_label: Locator;
  readonly last_name_text: Locator;
  readonly email_address_textbox_label: Locator;
  readonly email_address_text: Locator;
  readonly telephone_textbox_label: Locator;
  readonly telephone_text: Locator;
  readonly organisation_textbox_label: Locator;
  readonly organisation_text: Locator;
  readonly job_title_textbox_label: Locator;
  readonly job_title_text: Locator;
  readonly role_dropdown_label: Locator;
  readonly role_dropdown: Locator;
  readonly committee_dropdown_label: Locator;
  readonly committee_dropdown: Locator;
  readonly country_checkbox_label: Locator;
  readonly country_checkbox: Locator;
  readonly access_required_checkbox_label: Locator;
  readonly access_required_checkbox: Locator;
  readonly review_body_dropdown_label: Locator;
  readonly review_body_dropdown: Locator;
  readonly continue_button: Locator;
  pathToTestDataJson =
    './src/resources/test_data/iras/reviewResearch/userAdministration/manageUsers/pages/create_user_profile_page_data.json';

  //Initialize Page Objects
  constructor(page: Page) {
    this.page = page;
    this.createUserProfilePageData = createUserProfilePageData;

    //Locators
    this.page_heading = this.page.locator('.govuk-heading-l');
    this.title_textbox_label = this.page.locator('[class="govuk-label"][for="Title"] b');
    this.title_text = this.page.getByTestId('Title');
    this.first_name_textbox_label = this.page.locator('[class="govuk-label"][for="FirstName"] b');
    this.first_name_text = this.page.getByTestId('FirstName');
    this.last_name_textbox_label = this.page.locator('[class="govuk-label"][for="LastName"] b');
    this.last_name_text = this.page.getByTestId('LastName');
    this.email_address_textbox_label = this.page.locator('[class="govuk-label"][for="Email"] b');
    this.email_address_text = this.page.getByTestId('Email');
    this.telephone_textbox_label = this.page.locator('[class="govuk-label"][for="Telephone"] b');
    this.telephone_text = this.page.getByTestId('Telephone');
    this.organisation_textbox_label = this.page.locator('[class="govuk-label"][for="Organisation"] b');
    this.organisation_text = this.page.getByTestId('Organisation');
    this.job_title_textbox_label = this.page.locator('[class="govuk-label"][for="JobTitle"] b');
    this.job_title_text = this.page.getByTestId('JobTitle');
    this.role_dropdown_label = this.page.locator('[class="govuk-label"][for="Role"] b');
    this.role_dropdown = this.page.getByTestId('Role');
    this.committee_dropdown_label = this.page.locator('[class="govuk-label"][for="Committee"] b');
    this.committee_dropdown = this.page.getByTestId('Committee');
    this.country_checkbox_label = this.page.locator('[class="govuk-label"][for="Country"] b');
    this.country_checkbox = this.page.locator('[name="Country"][type="checkbox"]');
    this.access_required_checkbox_label = this.page.locator('[class="govuk-label"][for="AccessRequired"] b');
    this.access_required_checkbox = this.page.locator('[name="AccessRequired"][type="checkbox"]');
    this.review_body_dropdown_label = this.page.locator('[class="govuk-label"][for="ReviewBody"] b');
    this.review_body_dropdown = this.page.getByTestId('ReviewBody');
    this.continue_button = this.page.locator('.govuk-button[type="submit"]');
  }

  async assertOnCreateUserProfilePage() {
    await expect(this.page_heading).toBeVisible();
    await expect(this.page_heading).toHaveText(this.createUserProfilePageData.Create_User_Profile_Page.page_heading);
  }

  async validateSelectedValuesCreateUser<PageObject>(
    dataset: JSON,
    key: string,
    page: PageObject,
    commonItemsPage: CommonItemsPage
  ) {
    const locator: Locator = page[key];
    const typeAttribute = await locator.first().getAttribute('type');
    if (typeAttribute === 'text' || typeAttribute === 'date' || typeAttribute === 'tel') {
      expect(await commonItemsPage.removeUnwantedChars(await locator.getAttribute('value'))).toBe(dataset[key]);
    } else if (typeAttribute === 'radio') {
      expect(await locator.locator('..').getByLabel(dataset[key], { exact: true }).isChecked());
    } else if (typeAttribute === 'checkbox') {
      for (const checkbox of dataset[key]) {
        expect(await locator.locator('..').getByLabel(checkbox, { exact: true }).isChecked());
      }
    } else if (typeAttribute === 'email') {
      if (key === 'email_address_text') {
        const filePath = path.resolve(this.pathToTestDataJson);
        const data = await fse.readJson(filePath);
        expect(await commonItemsPage.removeUnwantedChars(await locator.getAttribute('value'))).toBe(
          data.Create_User_Profile.email_address_unique
        );
      }
    } else {
      const isSelectTag = await locator.evaluate((el) => el.tagName.toLowerCase() === 'select');
      if (isSelectTag) {
        expect(
          await commonItemsPage.removeUnwantedChars(
            await this.page.locator('select option[selected=selected]').getAttribute('value')
          )
        ).toBe(dataset[key]);
      }
    }
  }
}
